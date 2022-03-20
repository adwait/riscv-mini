// See LICENSE for license details.

package mini

import chisel3._
import chisel3.util.Valid
import config.{Field, Parameters}

class CoreTopIO(implicit val p : Parameters) extends Bundle with CoreParams {
  val io_icache_req_valid = Output(Bool())
  val io_icache_req_bits_addr = Output(UInt(32.W))
  val io_icache_req_bits_data = Output(UInt(32.W))
  val io_icache_req_bits_mask = Output(UInt(4.W))
  val io_icache_resp_valid = Input(Bool())
  val io_icache_resp_bits_data = Input(UInt(32.W))
  val host  = new HostIO

  val sigIO = new CoreTopAbstractSignalIO
}

class CoreTopAbstractSignalIO(implicit val p : Parameters) extends Bundle with CoreParams {
  val lft_tile_imm = Output(UInt(p(XLEN).W))
  val lft_tile_regfile = Output(UInt((32*p(XLEN)).W))
  val lft_tile_reg_rd1_addr_in = Output(UInt(5.W))
  val lft_tile_reg_rd2_addr_in = Output(UInt(5.W))
  val lft_tile_reg_rd1_data_out = Output(UInt(p(XLEN).W))
  val lft_tile_reg_rd2_data_out = Output(UInt(p(XLEN).W))
  val lft_tile_reg_wr_addr_in = Output(UInt(5.W))
  val lft_tile_reg_wr_data_in = Output(UInt(32.W))
  val lft_tile_alu_data_out = Output(UInt(32.W))
  val lft_tile_npc = Output(UInt())
  val lft_tile_pc = Output(UInt())
  val lft_tile_fe_pc = Output(UInt())
  val lft_tile_ew_pc = Output(UInt())
  val lft_tile_inst = Output(UInt())
  val lft_tile_fe_inst = Output(UInt())
}

class FakeDCache(implicit val p : Parameters) extends Module with CoreParams {
  val io = IO(new CacheIO)
  val mem = Mem(10, UInt(8.W))
  val addrMsb = io.req.bits.addr(31,2)
  io.resp.valid := true.B
  io.resp.bits.data :=
    mem.read(addrMsb ## 3.U(2.W)) ##
    mem.read(addrMsb ## 2.U(2.W)) ##
    mem.read(addrMsb ## 1.U(2.W)) ##
    mem.read(addrMsb ## 0.U(2.W))
  when(io.req.bits.mask(3)) {
    mem.write(addrMsb ## 3.U(2.W), io.req.bits.data(31,24))
  }
  when(io.req.bits.mask(2)) {
    mem.write(addrMsb ## 2.U(2.W), io.req.bits.data(23,16))
  }
  when(io.req.bits.mask(1)) {
    mem.write(addrMsb ## 1.U(2.W), io.req.bits.data(15,8))
  }
  when(io.req.bits.mask(0)) {
    mem.write(addrMsb ## 0.U(2.W), io.req.bits.data(7,0))
  }
}

class CoreTop(coreParams : Parameters) extends Module {
  implicit val p = coreParams
  val core = Module(new Core)
  val dcache = Module(new FakeDCache)
  val io = IO(new CoreTopIO)

  val cycle_counter = RegInit(0.U(p(CTRLEN).W))

  // Host <=> Core
  io.host <> core.io.host
  // DCache <=> Core
  core.io.dcache <> dcache.io
  // Provide barebones instruction cache interface
  io.io_icache_req_valid <> core.io.icache.req.valid
  io.io_icache_req_bits_addr <> core.io.icache.req.bits.addr
  io.io_icache_req_bits_data <> core.io.icache.req.bits.data
  core.io.icache.req.bits.mask <> io.io_icache_req_bits_mask
  core.io.icache.resp.valid <> io.io_icache_resp_valid
  core.io.icache.resp.bits.data  <> io.io_icache_resp_bits_data

  // Core Annotations
  core.io.annoIO.cycle_counter := cycle_counter
  // counter
  cycle_counter := cycle_counter + 1.U

  // =====================
  // Raised signals
  // =====================
  // val lft_tile_imm              = Wire(UInt(p(XLEN).W))
  // val lft_tile_regfile          = Wire(UInt((32*p(XLEN)).W))
  // val lft_tile_reg_rd1_addr_in  = Wire(UInt(5.W))
  // val lft_tile_reg_rd2_addr_in  = Wire(UInt(5.W))
  // val lft_tile_reg_rd1_data_out = Wire(UInt(p(XLEN).W))
  // val lft_tile_reg_rd2_data_out = Wire(UInt(p(XLEN).W))
  // val lft_tile_reg_wr_addr_in   = Wire(UInt(5.W))
  // val lft_tile_reg_wr_data_in   = Wire(UInt(32.W))
  // val lft_tile_alu_data_out     = Wire(UInt(32.W))
  // val lft_tile_pc               = Wire(UInt())
  // val lft_tile_fe_pc            = Wire(UInt())
  // val lft_tile_ew_pc            = Wire(UInt())
  // val lft_tile_fe_inst          = Wire(UInt())

  // dontTouch(lft_tile_imm)
  // dontTouch(lft_tile_regfile)
  // dontTouch(lft_tile_reg_rd1_addr_in)
  // dontTouch(lft_tile_reg_rd2_addr_in)
  // dontTouch(lft_tile_reg_rd1_data_out)
  // dontTouch(lft_tile_reg_rd2_data_out)
  // dontTouch(lft_tile_reg_wr_addr_in)
  // dontTouch(lft_tile_reg_wr_data_in)
  // dontTouch(lft_tile_alu_data_out)
  // dontTouch(lft_tile_pc)
  // dontTouch(lft_tile_fe_pc)
  // dontTouch(lft_tile_ew_pc)
  // dontTouch(lft_tile_fe_inst)

  io.sigIO.lft_tile_imm := core.io.sigIO.lft_tile_imm
  io.sigIO.lft_tile_regfile := core.io.sigIO.lft_tile_regfile
  io.sigIO.lft_tile_reg_rd1_addr_in := core.io.sigIO.lft_tile_reg_rd1_addr_in
  io.sigIO.lft_tile_reg_rd2_addr_in := core.io.sigIO.lft_tile_reg_rd2_addr_in
  io.sigIO.lft_tile_reg_rd1_data_out := core.io.sigIO.lft_tile_reg_rd1_data_out
  io.sigIO.lft_tile_reg_rd2_data_out := core.io.sigIO.lft_tile_reg_rd2_data_out
  io.sigIO.lft_tile_reg_wr_addr_in := core.io.sigIO.lft_tile_reg_wr_addr_in
  io.sigIO.lft_tile_reg_wr_data_in := core.io.sigIO.lft_tile_reg_wr_data_in
  io.sigIO.lft_tile_alu_data_out := core.io.sigIO.lft_tile_alu_data_out
  io.sigIO.lft_tile_npc := core.io.sigIO.lft_tile_npc
  io.sigIO.lft_tile_pc := core.io.sigIO.lft_tile_pc
  io.sigIO.lft_tile_fe_pc := core.io.sigIO.lft_tile_fe_pc
  io.sigIO.lft_tile_ew_pc := core.io.sigIO.lft_tile_ew_pc
  io.sigIO.lft_tile_inst := core.io.sigIO.lft_tile_inst
  io.sigIO.lft_tile_fe_inst := core.io.sigIO.lft_tile_fe_inst
  
  // =====================
}