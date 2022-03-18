// See LICENSE for license details.

package mini

import chisel3.stage.ChiselGeneratorAnnotation
import firrtl.options.TargetDirAnnotation

object MainCoreOnly extends App {
  val params = (new MiniConfig).toInstance

  val targetDirectory = args.head

  new chisel3.stage.ChiselStage().execute(
    args,
    Seq(
      ChiselGeneratorAnnotation(() => new CoreTop(params)),
      TargetDirAnnotation(targetDirectory)
    )
  )
}
