module BrCondArea(
  input  [31:0] io_rs1,
  input  [31:0] io_rs2,
  input  [2:0]  io_br_type,
  output        io_taken
);
  wire [31:0] diff = io_rs1 - io_rs2; // @[BrCond.scala 37:21]
  wire  neq = |diff; // @[BrCond.scala 38:18]
  wire  eq = ~neq; // @[BrCond.scala 39:12]
  wire  isSameSign = io_rs1[31] == io_rs2[31]; // @[BrCond.scala 40:37]
  wire  lt = isSameSign ? diff[31] : io_rs1[31]; // @[BrCond.scala 41:15]
  wire  ltu = isSameSign ? diff[31] : io_rs2[31]; // @[BrCond.scala 42:16]
  wire  ge = ~lt; // @[BrCond.scala 43:12]
  wire  geu = ~ltu; // @[BrCond.scala 44:13]
  wire  _io_taken_T_3 = io_br_type == 3'h6 & neq; // @[BrCond.scala 47:31]
  wire  _io_taken_T_4 = io_br_type == 3'h3 & eq | _io_taken_T_3; // @[BrCond.scala 46:36]
  wire  _io_taken_T_6 = io_br_type == 3'h2 & lt; // @[BrCond.scala 48:31]
  wire  _io_taken_T_7 = _io_taken_T_4 | _io_taken_T_6; // @[BrCond.scala 47:39]
  wire  _io_taken_T_9 = io_br_type == 3'h5 & ge; // @[BrCond.scala 49:31]
  wire  _io_taken_T_10 = _io_taken_T_7 | _io_taken_T_9; // @[BrCond.scala 48:38]
  wire  _io_taken_T_12 = io_br_type == 3'h1 & ltu; // @[BrCond.scala 50:32]
  wire  _io_taken_T_13 = _io_taken_T_10 | _io_taken_T_12; // @[BrCond.scala 49:38]
  wire  _io_taken_T_15 = io_br_type == 3'h4 & geu; // @[BrCond.scala 51:32]
  assign io_taken = _io_taken_T_13 | _io_taken_T_15; // @[BrCond.scala 50:40]
endmodule
