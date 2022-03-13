// See LICENSE for license details.

package mini

import chisel3._
import chisel3.experimental.BaseModule
import chisel3.util._
import config.Parameters
import junctions._

class MemArbAnnoIO(implicit val p: Parameters) extends Bundle {
  val cycle_counter = Input(UInt(p(CTRLEN).W))
  val fe_pc = Input(UInt(p(XLEN).W))
  val ew_pc = Input(UInt(p(XLEN).W))
}

class MemArbiterIO(implicit val p: Parameters) extends Bundle {
  val icache = Flipped(new NastiIO)
  val dcache = Flipped(new NastiIO)
  val nasti = new NastiIO

  val annoIO = new MemArbAnnoIO
}

class MemArbiter(implicit p: Parameters) extends Module {
  val io = IO(new MemArbiterIO)

  val s_IDLE :: s_ICACHE_READ :: s_DCACHE_READ :: s_DCACHE_WRITE :: s_DCACHE_ACK :: Nil = Enum(5)
  val state = RegInit(s_IDLE)

  // Write Address
  io.nasti.aw.bits := io.dcache.aw.bits
  io.nasti.aw.valid := io.dcache.aw.valid && state === s_IDLE
  io.dcache.aw.ready := io.nasti.aw.ready && state === s_IDLE
  io.icache.aw := DontCare

  // Write Data
  io.nasti.w.bits := io.dcache.w.bits
  io.nasti.w.valid := io.dcache.w.valid && state === s_DCACHE_WRITE
  io.dcache.w.ready := io.nasti.w.ready && state === s_DCACHE_WRITE
  io.icache.w := DontCare

  // Write Ack
  io.dcache.b.bits := io.nasti.b.bits
  io.dcache.b.valid := io.nasti.b.valid && state === s_DCACHE_ACK
  io.nasti.b.ready := io.dcache.b.ready && state === s_DCACHE_ACK
  io.icache.b := DontCare

  // Read Address
  io.nasti.ar.bits := NastiReadAddressChannel(
    Mux(io.dcache.ar.valid, io.dcache.ar.bits.id, io.icache.ar.bits.id),
    Mux(io.dcache.ar.valid, io.dcache.ar.bits.addr, io.icache.ar.bits.addr),
    Mux(io.dcache.ar.valid, io.dcache.ar.bits.size, io.icache.ar.bits.size),
    Mux(io.dcache.ar.valid, io.dcache.ar.bits.len, io.icache.ar.bits.len)
  )
  io.nasti.ar.valid := (io.icache.ar.valid || io.dcache.ar.valid) &&
    !io.nasti.aw.valid && state === s_IDLE
  io.dcache.ar.ready := io.nasti.ar.ready && !io.nasti.aw.valid && state === s_IDLE
  io.icache.ar.ready := io.dcache.ar.ready && !io.dcache.ar.valid

  // Read Data
  io.icache.r.bits := io.nasti.r.bits
  io.dcache.r.bits := io.nasti.r.bits
  io.icache.r.valid := io.nasti.r.valid && state === s_ICACHE_READ
  io.dcache.r.valid := io.nasti.r.valid && state === s_DCACHE_READ
  io.nasti.r.ready := io.icache.r.ready && state === s_ICACHE_READ ||
    io.dcache.r.ready && state === s_DCACHE_READ

  if (p(AnnoInfo)) {
    printf("# =======\n")
    printf("uop_begin('module:memarbiter', 'ctrl_state', ic=%d, t=%d)\n", 0.B, io.annoIO.cycle_counter)
    printf("write('state', %d)\n", state)
    printf("uop_end()\n")
    printf("# =======\n")
  }

  switch(state) {
    is(s_IDLE) {
      when(io.dcache.aw.fire) {
        state := s_DCACHE_WRITE
      }.elsewhen(io.dcache.ar.fire) {
        state := s_DCACHE_READ
      }.elsewhen(io.icache.ar.fire) {
        state := s_ICACHE_READ
      }
    }
    is(s_ICACHE_READ) {
      when(io.nasti.r.fire && io.nasti.r.bits.last) {
        state := s_IDLE
      }
    }
    is(s_DCACHE_READ) {
      when(io.nasti.r.fire && io.nasti.r.bits.last) {
        state := s_IDLE
      }
      if (p(AnnoInfo)) {
        printf("# =======\n")
        printf("uop_begin('module:memarbiter', 'cache_read_resp', ic=%d, t=%d)\n", io.annoIO.fe_pc, io.annoIO.cycle_counter)
        printf("write('io.dcache.r.valid', %b)\n", io.nasti.r.valid && state === s_DCACHE_READ)
        printf("write('io.dcache.r.bits', 0x%x)\n", io.nasti.r.bits.data)
        printf("uop_end()\n")
        printf("# =======\n")
      }
    }
    is(s_DCACHE_WRITE) {
      when(io.dcache.w.fire && io.dcache.w.bits.last) {
        state := s_DCACHE_ACK
      }
      if (p(AnnoInfo)) {
        printf("# =======\n")
        printf("uop_begin('module:memarbiter', 'cache_write_req', ic=%d, t=%d)\n", io.annoIO.ew_pc, io.annoIO.cycle_counter)
        printf("write('io.nasti.w.valid', %b)\n", io.dcache.w.valid && state === s_DCACHE_WRITE)
        printf("write('io.nasti.w.bits', 0x%x)\n", io.dcache.w.bits.data)
        printf("uop_end()\n")
        printf("# =======\n")
      }
    }
    is(s_DCACHE_ACK) {
      when(io.nasti.b.fire) {
        state := s_IDLE
      }
    }
  }
}

class TileIO(implicit val p: Parameters) extends Bundle {
  val host = new HostIO
  val nasti = new NastiIO
}

trait TileBase extends BaseModule {
  def io:    TileIO
  def clock: Clock
  def reset: Reset
}

class Tile(tileParams: Parameters) extends Module with TileBase {
  implicit val p = tileParams
  val io = IO(new TileIO)
  val core = Module(new Core)
  val icache = Module(new Cache)
  val dcache = Module(new Cache)
  val arb = Module(new MemArbiter)

  val cycle_counter = RegInit(0.U(p(CTRLEN).W))

  io.host <> core.io.host
  core.io.icache <> icache.io.cpu
  core.io.dcache <> dcache.io.cpu
  arb.io.icache <> icache.io.nasti
  arb.io.dcache <> dcache.io.nasti
  io.nasti <> arb.io.nasti

  icache.io.annoIO.is_dcache := false.B
  icache.io.annoIO.fe_pc <> core.io.annoIO.fe_pc
  icache.io.annoIO.ew_pc <> core.io.annoIO.ew_pc
  icache.io.annoIO.cycle_counter := cycle_counter

  dcache.io.annoIO.is_dcache := true.B
  dcache.io.annoIO.fe_pc <> core.io.annoIO.fe_pc
  dcache.io.annoIO.ew_pc <> core.io.annoIO.ew_pc
  dcache.io.annoIO.cycle_counter := cycle_counter

  arb.io.annoIO.fe_pc <> core.io.annoIO.fe_pc
  arb.io.annoIO.ew_pc <> core.io.annoIO.ew_pc
  arb.io.annoIO.cycle_counter := cycle_counter

  core.io.annoIO.cycle_counter := cycle_counter

  cycle_counter := cycle_counter + 1.U

  val lft_tile_imm              = Wire(UInt(p(XLEN).W))
  val lft_tile_regfile          = Wire(UInt((32*p(XLEN)).W))
  val lft_tile_reg_rd1_addr_in  = Wire(UInt(5.W))
  val lft_tile_reg_rd2_addr_in  = Wire(UInt(5.W))
  val lft_tile_reg_rd1_data_out = Wire(UInt(p(XLEN).W))
  val lft_tile_reg_rd2_data_out = Wire(UInt(p(XLEN).W))
  val lft_tile_reg_wr_addr_in   = Wire(UInt(5.W))
  val lft_tile_reg_wr_data_in   = Wire(UInt(32.W))
  val lft_tile_alu_data_out     = Wire(UInt(32.W))
  val lft_tile_pc               = Wire(UInt())
  val lft_tile_fe_pc            = Wire(UInt())
  val lft_tile_ew_pc            = Wire(UInt())
  val lft_tile_fe_inst          = Wire(UInt())

  dontTouch(lft_tile_imm)
  dontTouch(lft_tile_regfile)
  dontTouch(lft_tile_reg_rd1_addr_in)
  dontTouch(lft_tile_reg_rd2_addr_in)
  dontTouch(lft_tile_reg_rd1_data_out)
  dontTouch(lft_tile_reg_rd2_data_out)
  dontTouch(lft_tile_reg_wr_addr_in)
  dontTouch(lft_tile_reg_wr_data_in)
  dontTouch(lft_tile_alu_data_out)
  dontTouch(lft_tile_pc)
  dontTouch(lft_tile_fe_pc)
  dontTouch(lft_tile_ew_pc)
  dontTouch(lft_tile_fe_inst)

  lft_tile_imm := core.io.sigIO.lft_tile_imm
  lft_tile_regfile := core.io.sigIO.lft_tile_regfile
  lft_tile_reg_rd1_addr_in := core.io.sigIO.lft_tile_reg_rd1_addr_in
  lft_tile_reg_rd2_addr_in := core.io.sigIO.lft_tile_reg_rd2_addr_in
  lft_tile_reg_rd1_data_out := core.io.sigIO.lft_tile_reg_rd1_data_out
  lft_tile_reg_rd2_data_out := core.io.sigIO.lft_tile_reg_rd2_data_out
  lft_tile_reg_wr_addr_in := core.io.sigIO.lft_tile_reg_wr_addr_in
  lft_tile_reg_wr_data_in := core.io.sigIO.lft_tile_reg_wr_data_in
  lft_tile_alu_data_out := core.io.sigIO.lft_tile_alu_data_out
  lft_tile_pc := core.io.sigIO.lft_tile_pc
  lft_tile_fe_pc := core.io.sigIO.lft_tile_fe_pc
  lft_tile_ew_pc := core.io.sigIO.lft_tile_ew_pc
  lft_tile_fe_inst := core.io.sigIO.lft_tile_fe_inst


  if (p(AnnoInfo)) {
    printf(
      "clock_step('module:tile', %d)\n", cycle_counter
    )
  }

}
