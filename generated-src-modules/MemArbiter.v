module MemArbiter(
  input         clock,
  input         reset,
  output        io_icache_ar_ready,
  input         io_icache_ar_valid,
  input  [31:0] io_icache_ar_bits_addr,
  input         io_icache_r_ready,
  output        io_icache_r_valid,
  output [63:0] io_icache_r_bits_data,
  output        io_dcache_aw_ready,
  input         io_dcache_aw_valid,
  input  [31:0] io_dcache_aw_bits_addr,
  output        io_dcache_w_ready,
  input         io_dcache_w_valid,
  input  [63:0] io_dcache_w_bits_data,
  input         io_dcache_w_bits_last,
  input         io_dcache_b_ready,
  output        io_dcache_b_valid,
  output        io_dcache_ar_ready,
  input         io_dcache_ar_valid,
  input  [31:0] io_dcache_ar_bits_addr,
  input         io_dcache_r_ready,
  output        io_dcache_r_valid,
  output [63:0] io_dcache_r_bits_data,
  input         io_nasti_aw_ready,
  output        io_nasti_aw_valid,
  output [31:0] io_nasti_aw_bits_addr,
  input         io_nasti_w_ready,
  output        io_nasti_w_valid,
  output [63:0] io_nasti_w_bits_data,
  output        io_nasti_w_bits_last,
  output        io_nasti_b_ready,
  input         io_nasti_b_valid,
  input         io_nasti_ar_ready,
  output        io_nasti_ar_valid,
  output [31:0] io_nasti_ar_bits_addr,
  output        io_nasti_r_ready,
  input         io_nasti_r_valid,
  input  [63:0] io_nasti_r_bits_data,
  input         io_nasti_r_bits_last
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[Tile.scala 21:22]
  wire  _io_nasti_aw_valid_T = state == 3'h0; // @[Tile.scala 25:52]
  wire  _io_nasti_w_valid_T = state == 3'h3; // @[Tile.scala 31:50]
  wire  _io_dcache_b_valid_T = state == 3'h4; // @[Tile.scala 37:50]
  wire  _io_nasti_ar_valid_T_1 = ~io_nasti_aw_valid; // @[Tile.scala 49:5]
  wire  _io_nasti_ar_valid_T_2 = (io_icache_ar_valid | io_dcache_ar_valid) & _io_nasti_ar_valid_T_1; // @[Tile.scala 48:67]
  wire  _io_icache_r_valid_T = state == 3'h1; // @[Tile.scala 56:50]
  wire  _io_dcache_r_valid_T = state == 3'h2; // @[Tile.scala 57:50]
  wire  _io_nasti_r_ready_T_3 = io_dcache_r_ready & _io_dcache_r_valid_T; // @[Tile.scala 59:23]
  wire  _T_1 = io_dcache_aw_ready & io_dcache_aw_valid; // @[Decoupled.scala 50:35]
  wire  _T_2 = io_dcache_ar_ready & io_dcache_ar_valid; // @[Decoupled.scala 50:35]
  wire  _T_3 = io_icache_ar_ready & io_icache_ar_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_0 = _T_3 ? 3'h1 : state; // @[Tile.scala 67:37 68:15 21:22]
  wire  _T_5 = io_nasti_r_ready & io_nasti_r_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_3 = _T_5 & io_nasti_r_bits_last ? 3'h0 : state; // @[Tile.scala 72:53 73:15 21:22]
  wire  _T_11 = io_dcache_w_ready & io_dcache_w_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_5 = _T_11 & io_dcache_w_bits_last ? 3'h4 : state; // @[Tile.scala 82:55 83:15 21:22]
  wire  _T_14 = io_nasti_b_ready & io_nasti_b_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_6 = _T_14 ? 3'h0 : state; // @[Tile.scala 87:29 88:15 21:22]
  wire [2:0] _GEN_7 = 3'h4 == state ? _GEN_6 : state; // @[Tile.scala 61:17 21:22]
  wire [2:0] _GEN_8 = 3'h3 == state ? _GEN_5 : _GEN_7; // @[Tile.scala 61:17]
  assign io_icache_ar_ready = io_dcache_ar_ready & ~io_dcache_ar_valid; // @[Tile.scala 51:44]
  assign io_icache_r_valid = io_nasti_r_valid & state == 3'h1; // @[Tile.scala 56:41]
  assign io_icache_r_bits_data = io_nasti_r_bits_data; // @[Tile.scala 54:20]
  assign io_dcache_aw_ready = io_nasti_aw_ready & _io_nasti_aw_valid_T; // @[Tile.scala 26:43]
  assign io_dcache_w_ready = io_nasti_w_ready & _io_nasti_w_valid_T; // @[Tile.scala 32:41]
  assign io_dcache_b_valid = io_nasti_b_valid & state == 3'h4; // @[Tile.scala 37:41]
  assign io_dcache_ar_ready = io_nasti_ar_ready & _io_nasti_ar_valid_T_1 & _io_nasti_aw_valid_T; // @[Tile.scala 50:65]
  assign io_dcache_r_valid = io_nasti_r_valid & state == 3'h2; // @[Tile.scala 57:41]
  assign io_dcache_r_bits_data = io_nasti_r_bits_data; // @[Tile.scala 55:20]
  assign io_nasti_aw_valid = io_dcache_aw_valid & state == 3'h0; // @[Tile.scala 25:43]
  assign io_nasti_aw_bits_addr = io_dcache_aw_bits_addr; // @[Tile.scala 24:20]
  assign io_nasti_w_valid = io_dcache_w_valid & state == 3'h3; // @[Tile.scala 31:41]
  assign io_nasti_w_bits_data = io_dcache_w_bits_data; // @[Tile.scala 30:19]
  assign io_nasti_w_bits_last = io_dcache_w_bits_last; // @[Tile.scala 30:19]
  assign io_nasti_b_ready = io_dcache_b_ready & _io_dcache_b_valid_T; // @[Tile.scala 38:41]
  assign io_nasti_ar_valid = _io_nasti_ar_valid_T_2 & _io_nasti_aw_valid_T; // @[Tile.scala 49:24]
  assign io_nasti_ar_bits_addr = io_dcache_ar_valid ? io_dcache_ar_bits_addr : io_icache_ar_bits_addr; // @[Tile.scala 44:8]
  assign io_nasti_r_ready = io_icache_r_ready & _io_icache_r_valid_T | _io_nasti_r_ready_T_3; // @[Tile.scala 58:68]
  always @(posedge clock) begin
    if (reset) begin // @[Tile.scala 21:22]
      state <= 3'h0; // @[Tile.scala 21:22]
    end else if (3'h0 == state) begin // @[Tile.scala 61:17]
      if (_T_1) begin // @[Tile.scala 63:31]
        state <= 3'h3; // @[Tile.scala 64:15]
      end else if (_T_2) begin // @[Tile.scala 65:37]
        state <= 3'h2; // @[Tile.scala 66:15]
      end else begin
        state <= _GEN_0;
      end
    end else if (3'h1 == state) begin // @[Tile.scala 61:17]
      state <= _GEN_3;
    end else if (3'h2 == state) begin // @[Tile.scala 61:17]
      state <= _GEN_3;
    end else begin
      state <= _GEN_8;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
