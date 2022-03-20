// See LICENSE for license details.

package mini

import chisel3._
import chisel3.util._
import config.Parameters

object Const {
  val PC_START = 0x200
  val PC_EVEC = 0x100
}

class DatapathAnnoIO(implicit val p: Parameters) extends Bundle {
  val cycle_counter = Input(UInt(p(CTRLEN).W))

  val pc = Output(UInt(p(XLEN).W))
  val fe_pc = Output(UInt(p(XLEN).W))
  val ew_pc = Output(UInt(p(XLEN).W))
}

class DatapathOrderInfoIO(implicit val p : Parameters) extends Bundle {
  val ts__decode_rs_addr = Output(Vec(p(NInst), UInt(p(CTRLEN).W)))
  val valid__decode_rs_addr = Output(Vec(p(NInst), Bool()))
}


class DatapathAbstractSignalsIO(implicit val p: Parameters) extends Bundle {
  val lft_tile_imm              = Output(UInt(p(XLEN).W))
  val lft_tile_regfile          = Output(UInt((32*p(XLEN)).W))
  val lft_tile_reg_rd1_addr_in  = Output(UInt(5.W))
  val lft_tile_reg_rd2_addr_in  = Output(UInt(5.W))
  val lft_tile_reg_rd1_data_out = Output(UInt(p(XLEN).W))
  val lft_tile_reg_rd2_data_out = Output(UInt(p(XLEN).W))
  val lft_tile_reg_wr_addr_in   = Output(UInt(5.W))
  val lft_tile_reg_wr_data_in   = Output(UInt(32.W))
  val lft_tile_alu_data_out     = Output(UInt(32.W))
  val lft_tile_npc              = Output(UInt())
  val lft_tile_pc               = Output(UInt())
  val lft_tile_fe_pc            = Output(UInt())
  val lft_tile_ew_pc            = Output(UInt())
  val lft_tile_inst             = Output(UInt())
  val lft_tile_fe_inst          = Output(UInt())
}

class DatapathIO(implicit p: Parameters) extends CoreBundle()(p) {
  val host = new HostIO
  val icache = Flipped(new CacheIO)
  val dcache = Flipped(new CacheIO)
  val ctrl = Flipped(new ControlSignals)

  val annoIO = new DatapathAnnoIO
  val sigIO = new DatapathAbstractSignalsIO
}

class Datapath(implicit val p: Parameters) extends Module with CoreParams {
  val io = IO(new DatapathIO)
  val csr = Module(new CSR)
  val regFile = Module(new RegFile)
  val alu = p(BuildALU)(p)
  val immGen = p(BuildImmGen)(p)
  val brCond = p(BuildBrCond)(p)

  import Control._

  /** *** Fetch / Execute Registers ****
    */
  val fe_inst = RegInit(Instructions.NOP)
  val fe_pc = Reg(UInt())

  /** *** Execute / Write Back Registers ****
    */
  val ew_inst = RegInit(Instructions.NOP)
  val ew_pc = Reg(UInt())
  val ew_alu = Reg(UInt())
  val csr_in = Reg(UInt())

  /** **** Control signals ****
    */
  val st_type = Reg(io.ctrl.st_type.cloneType)
  val ld_type = Reg(io.ctrl.ld_type.cloneType)
  val wb_sel = Reg(io.ctrl.wb_sel.cloneType)
  val wb_en = Reg(Bool())
  val csr_cmd = Reg(io.ctrl.csr_cmd.cloneType)
  val illegal = Reg(Bool())
  val pc_check = Reg(Bool())

  /** **** Fetch ****
    */
  val started = RegNext(reset.asBool)
  val stall = !io.icache.resp.valid || !io.dcache.resp.valid
  val pc = RegInit(Const.PC_START.U(xlen.W) - 4.U(xlen.W))
  val npc = Mux(
    stall,
    pc,
    Mux(
      csr.io.expt,
      csr.io.evec,
      Mux(
        io.ctrl.pc_sel === PC_EPC,
        csr.io.epc,
        Mux(
          io.ctrl.pc_sel === PC_ALU || brCond.io.taken,
          alu.io.sum >> 1.U << 1.U,
          Mux(io.ctrl.pc_sel === PC_0, pc, pc + 4.U)
        )
      )
    )
  )
  val inst =
    Mux(started || io.ctrl.inst_kill || brCond.io.taken || csr.io.expt, Instructions.NOP, io.icache.resp.bits.data)
  pc := npc
  io.icache.req.bits.addr := npc
  io.icache.req.bits.data := 0.U
  io.icache.req.bits.mask := 0.U
  io.icache.req.valid := !stall
  io.icache.abort := false.B

  dontTouch(inst)

  // Pipelining
  when(!stall) {
    fe_pc := pc
    fe_inst := inst
  }

  /** **** Execute ****
    */
  // Decode
  io.ctrl.inst := fe_inst

  // regFile read
  val rd_addr = fe_inst(11, 7)
  val rs1_addr = fe_inst(19, 15)
  val rs2_addr = fe_inst(24, 20)
  regFile.io.raddr1 := rs1_addr
  regFile.io.raddr2 := rs2_addr

  // gen immediates
  immGen.io.inst := fe_inst
  immGen.io.sel := io.ctrl.imm_sel
  // Pass anno harness along
  immGen.io.annoIO.cycle_counter := io.annoIO.cycle_counter
  immGen.io.annoIO.pc := pc

  // bypass
  val wb_rd_addr = ew_inst(11, 7)
  val rs1hazard = wb_en && rs1_addr.orR && (rs1_addr === wb_rd_addr)
  val rs2hazard = wb_en && rs2_addr.orR && (rs2_addr === wb_rd_addr)
  val rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
  val rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)

  // ALU operations
  alu.io.A := Mux(io.ctrl.A_sel === A_RS1, rs1, fe_pc)
  alu.io.B := Mux(io.ctrl.B_sel === B_RS2, rs2, immGen.io.out)
  alu.io.alu_op := io.ctrl.alu_op

  // Branch condition calc
  brCond.io.rs1 := rs1
  brCond.io.rs2 := rs2
  brCond.io.br_type := io.ctrl.br_type

  // D$ access
  val daddr = Mux(stall, ew_alu, alu.io.sum) >> 2.U << 2.U
  val woffset = (alu.io.sum(1) << 4.U).asUInt | (alu.io.sum(0) << 3.U).asUInt
  io.dcache.req.valid := !stall && (io.ctrl.st_type.orR || io.ctrl.ld_type.orR)
  io.dcache.req.bits.addr := daddr
  io.dcache.req.bits.data := rs2 << woffset
  io.dcache.req.bits.mask := MuxLookup(
    Mux(stall, st_type, io.ctrl.st_type),
    "b0000".U,
    Seq(ST_SW -> "b1111".U, ST_SH -> ("b11".U << alu.io.sum(1, 0)), ST_SB -> ("b1".U << alu.io.sum(1, 0)))
  )

  // Pipelining
  when(reset.asBool || !stall && csr.io.expt) {
    st_type := 0.U
    ld_type := 0.U
    wb_en := false.B
    csr_cmd := 0.U
    illegal := false.B
    pc_check := false.B
  }.elsewhen(!stall && !csr.io.expt) {
    ew_pc := fe_pc
    ew_inst := fe_inst
    ew_alu := alu.io.out
    csr_in := Mux(io.ctrl.imm_sel === IMM_Z, immGen.io.out, rs1)
    st_type := io.ctrl.st_type
    ld_type := io.ctrl.ld_type
    wb_sel := io.ctrl.wb_sel
    wb_en := io.ctrl.wb_en
    csr_cmd := io.ctrl.csr_cmd
    illegal := io.ctrl.illegal
    pc_check := io.ctrl.pc_sel === PC_ALU
  }

  // Load
  val loffset = (ew_alu(1) << 4.U).asUInt | (ew_alu(0) << 3.U).asUInt
  val lshift = io.dcache.resp.bits.data >> loffset
  val load = MuxLookup(
    ld_type,
    io.dcache.resp.bits.data.zext,
    Seq(
      LD_LH -> lshift(15, 0).asSInt,
      LD_LB -> lshift(7, 0).asSInt,
      LD_LHU -> lshift(15, 0).zext,
      LD_LBU -> lshift(7, 0).zext
    )
  )

  // CSR access
  csr.io.stall := stall
  csr.io.in := csr_in
  csr.io.cmd := csr_cmd
  csr.io.inst := ew_inst
  csr.io.pc := ew_pc
  csr.io.addr := ew_alu
  csr.io.illegal := illegal
  csr.io.pc_check := pc_check
  csr.io.ld_type := ld_type
  csr.io.st_type := st_type
  io.host <> csr.io.host

  // Regfile Write
  val regWrite =
    MuxLookup(wb_sel, ew_alu.zext, Seq(WB_MEM -> load, WB_PC4 -> (ew_pc + 4.U).zext, WB_CSR -> csr.io.out.zext)).asUInt

  regFile.io.wen := wb_en && !stall && !csr.io.expt
  regFile.io.waddr := wb_rd_addr
  regFile.io.wdata := regWrite

  // Abort store when there's an exception
  io.dcache.abort := csr.io.expt

  // Feedup PC values
  io.annoIO.pc := pc
  io.annoIO.fe_pc := fe_pc
  io.annoIO.ew_pc := ew_pc

  // Abstract signal harnessing
  io.sigIO.lft_tile_imm               <> immGen.io.out  
  io.sigIO.lft_tile_regfile           <> regFile.io.sigIO.lft_tile_regfile
  io.sigIO.lft_tile_reg_rd1_addr_in   := rs1_addr
  io.sigIO.lft_tile_reg_rd2_addr_in   := rs2_addr
  io.sigIO.lft_tile_reg_rd1_data_out  := rs1
  io.sigIO.lft_tile_reg_rd2_data_out  := rs2
  io.sigIO.lft_tile_reg_wr_addr_in    := wb_rd_addr
  io.sigIO.lft_tile_reg_wr_data_in    := regWrite
  io.sigIO.lft_tile_alu_data_out      := alu.io.out
  io.sigIO.lft_tile_npc               := npc
  io.sigIO.lft_tile_pc                := pc
  io.sigIO.lft_tile_fe_pc             := fe_pc
  io.sigIO.lft_tile_ew_pc             := ew_pc
  io.sigIO.lft_tile_inst              := inst
  io.sigIO.lft_tile_fe_inst           := fe_inst


  // val nInst = p(NInst)
  if (p(OrderInfo)) {
    val ts__decode_rs_addr    = Reg(UInt(p(CTRLEN).W))
    val ic__decode_rs_addr    = Reg(UInt(p(XLEN).W))
    val valid__decode_rs_addr = RegInit(false.B)
    val ts__decode_i_imm      = Reg(UInt(p(CTRLEN).W))
    val ic__decode_i_imm      = Reg(UInt(p(XLEN).W))
    val valid__decode_i_imm   = RegInit(false.B)
    dontTouch(ts__decode_rs_addr)
    dontTouch(valid__decode_rs_addr)
    dontTouch(ic__decode_rs_addr)
    dontTouch(ts__decode_i_imm)
    dontTouch(valid__decode_i_imm)
    dontTouch(ic__decode_i_imm)

    // io.orderIO.ts__decode_rs_addr := ts__decode_rs_addr
    // io.orderIO.valid__decode_rs_addr := valid__decode_rs_addr
    // io.orderIO.ic__decode_rs_addr := ic__decode_rs_addr

    // io.orderIO.ts__decode_i_imm := ts__decode_i_imm
    // io.orderIO.valid__decode_i_imm := valid__decode_i_imm
    // io.orderIO.ic__decode_i_imm := ic__decode_i_imm

    //   when (true.B) {
    //     ts__decode_rs_addr        := io.annoIO.cycle_counter
    //     ic__decode_rs_addr        := fe_pc
    //     valid__decode_rs_addr(0)  := true.B
    //   }.otherwise {
    //     valid__decode_rs_addr(0)  := false.B
    //   }
  }


  if (p(AnnoInfo)) {
    printf("# =======\n")
    printf("uop_begin('module:datapath', 'feed__inst__mem_addr_wr_in', ic=%d, t=%d)\n", fe_pc, io.annoIO.cycle_counter)
    printf("write('io.dcache.req.bits.addr', 0x%x)\n", daddr)
    printf("uop_end()\n")
    printf("# =======\n")
  }
  if (p(AnnoInfo)) {
    printf("# =======\n")
    printf("uop_begin('module:datapath', 'regs_read', ic=%d, t=%d)\n", fe_pc, io.annoIO.cycle_counter)
    printf("# anno(rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)\n")
    printf("# anno(rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)\n")
    printf("read('regs[%d]', 0x%x)\n", regFile.io.raddr1, rs1)
    printf("read('regs[%d]', 0x%x)\n", regFile.io.raddr2, rs2)
    printf("uop_end()\n")
    printf("# =======\n")
  }
  if (p(AnnoInfo)) {
    printf("# =======\n")
    printf("uop_begin('module:datapath', 'decode_rs_addr', ic=%d, t=%d)\n", fe_pc, io.annoIO.cycle_counter)
    printf("write('rs1_addr', 0x%x)\n", fe_inst(19, 15))
    printf("write('rs2_addr', 0x%x)\n", fe_inst(24, 20))
    printf("uop_end()\n")
    printf("# =======\n")
  }
  if (p(AnnoInfo)) {
    printf("# =======\n")
    printf("uop_begin('module:datapath', 'decode_rd_addr', ic=%d, t=%d)\n", fe_pc, io.annoIO.cycle_counter)
    printf("write('rd_addr', 0x%x)\n", fe_inst(11, 7))
    printf("uop_end()\n")
    printf("# =======\n")
  }
  if (p(AnnoInfo)) {
    when (regFile.io.wen) {
      printf("# =======\n")
      printf("uop_begin('module:datapath', 'regs_write', ic=%d, t=%d)\n", ew_pc, io.annoIO.cycle_counter)
      printf("# 'regFile.io.waddr := wb_rd_addr\n")
      printf("# 'regFile.io.wdata := regWrite\n")
      printf("write('regs[%d]', 0x%x)\n", wb_rd_addr, regFile.io.wdata)
      printf("uop_end()\n")
      printf("# =======\n")
    }
  }
  
  if (p(Trace)) {
    printf(
      "PC: %x, INST: %x, REG[%d] <- %x\n",
      ew_pc,
      ew_inst,
      Mux(regFile.io.wen, wb_rd_addr, 0.U),
      Mux(regFile.io.wen, regFile.io.wdata, 0.U)
    )
  }
}
