// See LICENSE for license details.

package mini

import chisel3._
import chisel3.util.Valid
import config.{Field, Parameters}

case object XLEN extends Field[Int]
case object Trace extends Field[Boolean]
case object CTRLEN extends Field[Int]
case object AnnoInfo extends Field[Boolean]
case object BuildALU extends Field[Parameters => ALU]
case object BuildImmGen extends Field[Parameters => ImmGen]
case object BuildBrCond extends Field[Parameters => BrCond]

abstract trait CoreParams {
  implicit val p: Parameters
  val xlen = p(XLEN)
}

abstract class CoreBundle(implicit val p: Parameters) extends Bundle with CoreParams

class HostIO(implicit p: Parameters) extends CoreBundle()(p) {
  val fromhost = Flipped(Valid(UInt(xlen.W)))
  val tohost = Output(UInt(xlen.W))
}

class CoreAnnoIO(implicit val p: Parameters) extends Bundle {
  val cycle_counter = Input(UInt(p(CTRLEN).W))

  val pc = Output(UInt(p(XLEN).W))
  val fe_pc = Output(UInt(p(XLEN).W))
  val ew_pc = Output(UInt(p(XLEN).W))
}

class CoreIO(implicit p: Parameters) extends CoreBundle()(p) {
  val host = new HostIO
  val icache = Flipped((new CacheIO))
  val dcache = Flipped((new CacheIO))

  val annoIO = new CoreAnnoIO
}

class Core(implicit val p: Parameters) extends Module with CoreParams {
  val io = IO(new CoreIO)
  val dpath = Module(new Datapath)
  val ctrl = Module(new Control)

  io.host <> dpath.io.host
  dpath.io.icache <> io.icache
  dpath.io.dcache <> io.dcache
  dpath.io.ctrl <> ctrl.io

  io.annoIO.cycle_counter <> dpath.io.annoIO.cycle_counter
  io.annoIO.pc <> dpath.io.annoIO.pc
  io.annoIO.fe_pc <> dpath.io.annoIO.fe_pc
  io.annoIO.ew_pc <> dpath.io.annoIO.ew_pc
}
