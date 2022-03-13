// See LICENSE for license details.

package mini

import chisel3._
import chisel3.util._
import config.Parameters

class RegFileAbstractSignalIO(implicit p : Parameters) extends Bundle {
  val lft_tile_regfile = Output(UInt((32*p(XLEN)).W))
}

class RegFileIO(implicit p: Parameters) extends CoreBundle()(p) {
  val raddr1 = Input(UInt(5.W))
  val raddr2 = Input(UInt(5.W))
  val rdata1 = Output(UInt(xlen.W))
  val rdata2 = Output(UInt(xlen.W))
  val wen = Input(Bool())
  val waddr = Input(UInt(5.W))
  val wdata = Input(UInt(xlen.W))

  val sigIO = new RegFileAbstractSignalIO
}

class RegFile(implicit val p: Parameters) extends Module with CoreParams {
  val io = IO(new RegFileIO)
  val regs = Mem(32, UInt(xlen.W))
  io.rdata1 := Mux(io.raddr1.orR, regs(io.raddr1), 0.U)
  io.rdata2 := Mux(io.raddr2.orR, regs(io.raddr2), 0.U)
  when(io.wen & io.waddr.orR) {
    regs(io.waddr) := io.wdata
  }

  // val local_regs = Wire(Vec(32*32, Bool()))

  // for (i <- 0 until 31) yield {
  io.sigIO.lft_tile_regfile := Cat(regs(31) , regs(30) , regs(29) , regs(28) , regs(27) , regs(26) , regs(25) , regs(24) , regs(23) , regs(22) , regs(21) , regs(20) , regs(19) , regs(18) , regs(17) , regs(16) , regs(15) , regs(14) , regs(13) , regs(12) , regs(11) , regs(10) , regs(9) , regs(8) , regs(7) , regs(6) , regs(5) , regs(4) , regs(3) , regs(2) , regs(1) , regs(0))

  // }
}
