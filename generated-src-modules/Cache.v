module Cache(
  input         clock,
  input         reset,
  input         io_cpu_abort,
  input         io_cpu_req_valid,
  input  [31:0] io_cpu_req_bits_addr,
  input  [31:0] io_cpu_req_bits_data,
  input  [3:0]  io_cpu_req_bits_mask,
  output        io_cpu_resp_valid,
  output [31:0] io_cpu_resp_bits_data,
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
  input  [63:0] io_nasti_r_bits_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_48;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [255:0] _RAND_52;
  reg [255:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [127:0] _RAND_61;
  reg [63:0] _RAND_62;
  reg [63:0] _RAND_63;
`endif // RANDOMIZE_REG_INIT
  reg [19:0] metaMem_tag [0:255]; // @[Cache.scala 62:28]
  wire  metaMem_tag_rmeta_en; // @[Cache.scala 62:28]
  wire [7:0] metaMem_tag_rmeta_addr; // @[Cache.scala 62:28]
  wire [19:0] metaMem_tag_rmeta_data; // @[Cache.scala 62:28]
  wire [19:0] metaMem_tag_MPORT_data; // @[Cache.scala 62:28]
  wire [7:0] metaMem_tag_MPORT_addr; // @[Cache.scala 62:28]
  wire  metaMem_tag_MPORT_mask; // @[Cache.scala 62:28]
  wire  metaMem_tag_MPORT_en; // @[Cache.scala 62:28]
  reg  metaMem_tag_rmeta_en_pipe_0;
  reg [7:0] metaMem_tag_rmeta_addr_pipe_0;
  reg [7:0] dataMem_0_0 [0:255]; // @[Cache.scala 63:45]
  wire  dataMem_0_0_rdata_MPORT_en; // @[Cache.scala 63:45]
  wire [7:0] dataMem_0_0_rdata_MPORT_addr; // @[Cache.scala 63:45]
  wire [7:0] dataMem_0_0_rdata_MPORT_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_0_0_MPORT_1_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_0_0_MPORT_1_addr; // @[Cache.scala 63:45]
  wire  dataMem_0_0_MPORT_1_mask; // @[Cache.scala 63:45]
  wire  dataMem_0_0_MPORT_1_en; // @[Cache.scala 63:45]
  reg  dataMem_0_0_rdata_MPORT_en_pipe_0;
  reg [7:0] dataMem_0_0_rdata_MPORT_addr_pipe_0;
  reg [7:0] dataMem_0_1 [0:255]; // @[Cache.scala 63:45]
  wire  dataMem_0_1_rdata_MPORT_en; // @[Cache.scala 63:45]
  wire [7:0] dataMem_0_1_rdata_MPORT_addr; // @[Cache.scala 63:45]
  wire [7:0] dataMem_0_1_rdata_MPORT_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_0_1_MPORT_1_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_0_1_MPORT_1_addr; // @[Cache.scala 63:45]
  wire  dataMem_0_1_MPORT_1_mask; // @[Cache.scala 63:45]
  wire  dataMem_0_1_MPORT_1_en; // @[Cache.scala 63:45]
  reg  dataMem_0_1_rdata_MPORT_en_pipe_0;
  reg [7:0] dataMem_0_1_rdata_MPORT_addr_pipe_0;
  reg [7:0] dataMem_0_2 [0:255]; // @[Cache.scala 63:45]
  wire  dataMem_0_2_rdata_MPORT_en; // @[Cache.scala 63:45]
  wire [7:0] dataMem_0_2_rdata_MPORT_addr; // @[Cache.scala 63:45]
  wire [7:0] dataMem_0_2_rdata_MPORT_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_0_2_MPORT_1_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_0_2_MPORT_1_addr; // @[Cache.scala 63:45]
  wire  dataMem_0_2_MPORT_1_mask; // @[Cache.scala 63:45]
  wire  dataMem_0_2_MPORT_1_en; // @[Cache.scala 63:45]
  reg  dataMem_0_2_rdata_MPORT_en_pipe_0;
  reg [7:0] dataMem_0_2_rdata_MPORT_addr_pipe_0;
  reg [7:0] dataMem_0_3 [0:255]; // @[Cache.scala 63:45]
  wire  dataMem_0_3_rdata_MPORT_en; // @[Cache.scala 63:45]
  wire [7:0] dataMem_0_3_rdata_MPORT_addr; // @[Cache.scala 63:45]
  wire [7:0] dataMem_0_3_rdata_MPORT_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_0_3_MPORT_1_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_0_3_MPORT_1_addr; // @[Cache.scala 63:45]
  wire  dataMem_0_3_MPORT_1_mask; // @[Cache.scala 63:45]
  wire  dataMem_0_3_MPORT_1_en; // @[Cache.scala 63:45]
  reg  dataMem_0_3_rdata_MPORT_en_pipe_0;
  reg [7:0] dataMem_0_3_rdata_MPORT_addr_pipe_0;
  reg [7:0] dataMem_1_0 [0:255]; // @[Cache.scala 63:45]
  wire  dataMem_1_0_rdata_MPORT_1_en; // @[Cache.scala 63:45]
  wire [7:0] dataMem_1_0_rdata_MPORT_1_addr; // @[Cache.scala 63:45]
  wire [7:0] dataMem_1_0_rdata_MPORT_1_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_1_0_MPORT_2_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_1_0_MPORT_2_addr; // @[Cache.scala 63:45]
  wire  dataMem_1_0_MPORT_2_mask; // @[Cache.scala 63:45]
  wire  dataMem_1_0_MPORT_2_en; // @[Cache.scala 63:45]
  reg  dataMem_1_0_rdata_MPORT_1_en_pipe_0;
  reg [7:0] dataMem_1_0_rdata_MPORT_1_addr_pipe_0;
  reg [7:0] dataMem_1_1 [0:255]; // @[Cache.scala 63:45]
  wire  dataMem_1_1_rdata_MPORT_1_en; // @[Cache.scala 63:45]
  wire [7:0] dataMem_1_1_rdata_MPORT_1_addr; // @[Cache.scala 63:45]
  wire [7:0] dataMem_1_1_rdata_MPORT_1_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_1_1_MPORT_2_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_1_1_MPORT_2_addr; // @[Cache.scala 63:45]
  wire  dataMem_1_1_MPORT_2_mask; // @[Cache.scala 63:45]
  wire  dataMem_1_1_MPORT_2_en; // @[Cache.scala 63:45]
  reg  dataMem_1_1_rdata_MPORT_1_en_pipe_0;
  reg [7:0] dataMem_1_1_rdata_MPORT_1_addr_pipe_0;
  reg [7:0] dataMem_1_2 [0:255]; // @[Cache.scala 63:45]
  wire  dataMem_1_2_rdata_MPORT_1_en; // @[Cache.scala 63:45]
  wire [7:0] dataMem_1_2_rdata_MPORT_1_addr; // @[Cache.scala 63:45]
  wire [7:0] dataMem_1_2_rdata_MPORT_1_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_1_2_MPORT_2_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_1_2_MPORT_2_addr; // @[Cache.scala 63:45]
  wire  dataMem_1_2_MPORT_2_mask; // @[Cache.scala 63:45]
  wire  dataMem_1_2_MPORT_2_en; // @[Cache.scala 63:45]
  reg  dataMem_1_2_rdata_MPORT_1_en_pipe_0;
  reg [7:0] dataMem_1_2_rdata_MPORT_1_addr_pipe_0;
  reg [7:0] dataMem_1_3 [0:255]; // @[Cache.scala 63:45]
  wire  dataMem_1_3_rdata_MPORT_1_en; // @[Cache.scala 63:45]
  wire [7:0] dataMem_1_3_rdata_MPORT_1_addr; // @[Cache.scala 63:45]
  wire [7:0] dataMem_1_3_rdata_MPORT_1_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_1_3_MPORT_2_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_1_3_MPORT_2_addr; // @[Cache.scala 63:45]
  wire  dataMem_1_3_MPORT_2_mask; // @[Cache.scala 63:45]
  wire  dataMem_1_3_MPORT_2_en; // @[Cache.scala 63:45]
  reg  dataMem_1_3_rdata_MPORT_1_en_pipe_0;
  reg [7:0] dataMem_1_3_rdata_MPORT_1_addr_pipe_0;
  reg [7:0] dataMem_2_0 [0:255]; // @[Cache.scala 63:45]
  wire  dataMem_2_0_rdata_MPORT_2_en; // @[Cache.scala 63:45]
  wire [7:0] dataMem_2_0_rdata_MPORT_2_addr; // @[Cache.scala 63:45]
  wire [7:0] dataMem_2_0_rdata_MPORT_2_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_2_0_MPORT_3_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_2_0_MPORT_3_addr; // @[Cache.scala 63:45]
  wire  dataMem_2_0_MPORT_3_mask; // @[Cache.scala 63:45]
  wire  dataMem_2_0_MPORT_3_en; // @[Cache.scala 63:45]
  reg  dataMem_2_0_rdata_MPORT_2_en_pipe_0;
  reg [7:0] dataMem_2_0_rdata_MPORT_2_addr_pipe_0;
  reg [7:0] dataMem_2_1 [0:255]; // @[Cache.scala 63:45]
  wire  dataMem_2_1_rdata_MPORT_2_en; // @[Cache.scala 63:45]
  wire [7:0] dataMem_2_1_rdata_MPORT_2_addr; // @[Cache.scala 63:45]
  wire [7:0] dataMem_2_1_rdata_MPORT_2_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_2_1_MPORT_3_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_2_1_MPORT_3_addr; // @[Cache.scala 63:45]
  wire  dataMem_2_1_MPORT_3_mask; // @[Cache.scala 63:45]
  wire  dataMem_2_1_MPORT_3_en; // @[Cache.scala 63:45]
  reg  dataMem_2_1_rdata_MPORT_2_en_pipe_0;
  reg [7:0] dataMem_2_1_rdata_MPORT_2_addr_pipe_0;
  reg [7:0] dataMem_2_2 [0:255]; // @[Cache.scala 63:45]
  wire  dataMem_2_2_rdata_MPORT_2_en; // @[Cache.scala 63:45]
  wire [7:0] dataMem_2_2_rdata_MPORT_2_addr; // @[Cache.scala 63:45]
  wire [7:0] dataMem_2_2_rdata_MPORT_2_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_2_2_MPORT_3_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_2_2_MPORT_3_addr; // @[Cache.scala 63:45]
  wire  dataMem_2_2_MPORT_3_mask; // @[Cache.scala 63:45]
  wire  dataMem_2_2_MPORT_3_en; // @[Cache.scala 63:45]
  reg  dataMem_2_2_rdata_MPORT_2_en_pipe_0;
  reg [7:0] dataMem_2_2_rdata_MPORT_2_addr_pipe_0;
  reg [7:0] dataMem_2_3 [0:255]; // @[Cache.scala 63:45]
  wire  dataMem_2_3_rdata_MPORT_2_en; // @[Cache.scala 63:45]
  wire [7:0] dataMem_2_3_rdata_MPORT_2_addr; // @[Cache.scala 63:45]
  wire [7:0] dataMem_2_3_rdata_MPORT_2_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_2_3_MPORT_3_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_2_3_MPORT_3_addr; // @[Cache.scala 63:45]
  wire  dataMem_2_3_MPORT_3_mask; // @[Cache.scala 63:45]
  wire  dataMem_2_3_MPORT_3_en; // @[Cache.scala 63:45]
  reg  dataMem_2_3_rdata_MPORT_2_en_pipe_0;
  reg [7:0] dataMem_2_3_rdata_MPORT_2_addr_pipe_0;
  reg [7:0] dataMem_3_0 [0:255]; // @[Cache.scala 63:45]
  wire  dataMem_3_0_rdata_MPORT_3_en; // @[Cache.scala 63:45]
  wire [7:0] dataMem_3_0_rdata_MPORT_3_addr; // @[Cache.scala 63:45]
  wire [7:0] dataMem_3_0_rdata_MPORT_3_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_3_0_MPORT_4_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_3_0_MPORT_4_addr; // @[Cache.scala 63:45]
  wire  dataMem_3_0_MPORT_4_mask; // @[Cache.scala 63:45]
  wire  dataMem_3_0_MPORT_4_en; // @[Cache.scala 63:45]
  reg  dataMem_3_0_rdata_MPORT_3_en_pipe_0;
  reg [7:0] dataMem_3_0_rdata_MPORT_3_addr_pipe_0;
  reg [7:0] dataMem_3_1 [0:255]; // @[Cache.scala 63:45]
  wire  dataMem_3_1_rdata_MPORT_3_en; // @[Cache.scala 63:45]
  wire [7:0] dataMem_3_1_rdata_MPORT_3_addr; // @[Cache.scala 63:45]
  wire [7:0] dataMem_3_1_rdata_MPORT_3_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_3_1_MPORT_4_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_3_1_MPORT_4_addr; // @[Cache.scala 63:45]
  wire  dataMem_3_1_MPORT_4_mask; // @[Cache.scala 63:45]
  wire  dataMem_3_1_MPORT_4_en; // @[Cache.scala 63:45]
  reg  dataMem_3_1_rdata_MPORT_3_en_pipe_0;
  reg [7:0] dataMem_3_1_rdata_MPORT_3_addr_pipe_0;
  reg [7:0] dataMem_3_2 [0:255]; // @[Cache.scala 63:45]
  wire  dataMem_3_2_rdata_MPORT_3_en; // @[Cache.scala 63:45]
  wire [7:0] dataMem_3_2_rdata_MPORT_3_addr; // @[Cache.scala 63:45]
  wire [7:0] dataMem_3_2_rdata_MPORT_3_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_3_2_MPORT_4_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_3_2_MPORT_4_addr; // @[Cache.scala 63:45]
  wire  dataMem_3_2_MPORT_4_mask; // @[Cache.scala 63:45]
  wire  dataMem_3_2_MPORT_4_en; // @[Cache.scala 63:45]
  reg  dataMem_3_2_rdata_MPORT_3_en_pipe_0;
  reg [7:0] dataMem_3_2_rdata_MPORT_3_addr_pipe_0;
  reg [7:0] dataMem_3_3 [0:255]; // @[Cache.scala 63:45]
  wire  dataMem_3_3_rdata_MPORT_3_en; // @[Cache.scala 63:45]
  wire [7:0] dataMem_3_3_rdata_MPORT_3_addr; // @[Cache.scala 63:45]
  wire [7:0] dataMem_3_3_rdata_MPORT_3_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_3_3_MPORT_4_data; // @[Cache.scala 63:45]
  wire [7:0] dataMem_3_3_MPORT_4_addr; // @[Cache.scala 63:45]
  wire  dataMem_3_3_MPORT_4_mask; // @[Cache.scala 63:45]
  wire  dataMem_3_3_MPORT_4_en; // @[Cache.scala 63:45]
  reg  dataMem_3_3_rdata_MPORT_3_en_pipe_0;
  reg [7:0] dataMem_3_3_rdata_MPORT_3_addr_pipe_0;
  reg [2:0] state; // @[Cache.scala 58:22]
  reg [255:0] v; // @[Cache.scala 60:18]
  reg [255:0] d; // @[Cache.scala 61:18]
  reg [31:0] addr_reg; // @[Cache.scala 65:21]
  reg [31:0] cpu_data; // @[Cache.scala 66:21]
  reg [3:0] cpu_mask; // @[Cache.scala 67:21]
  wire  _T = io_nasti_r_ready & io_nasti_r_valid; // @[Decoupled.scala 50:35]
  reg  read_count; // @[Counter.scala 62:40]
  wire  read_wrap_out = _T & read_count; // @[Counter.scala 120:{16,23}]
  wire  _T_1 = io_nasti_w_ready & io_nasti_w_valid; // @[Decoupled.scala 50:35]
  reg  write_count; // @[Counter.scala 62:40]
  wire  write_wrap_out = _T_1 & write_count; // @[Counter.scala 120:{16,23}]
  wire  is_idle = state == 3'h0; // @[Cache.scala 74:23]
  wire  is_read = state == 3'h1; // @[Cache.scala 75:23]
  wire  is_write = state == 3'h2; // @[Cache.scala 76:24]
  wire  is_alloc = state == 3'h6 & read_wrap_out; // @[Cache.scala 77:37]
  reg  is_alloc_reg; // @[Cache.scala 78:29]
  wire [7:0] idx_reg = addr_reg[11:4]; // @[Cache.scala 88:25]
  wire [255:0] _hit_T = v >> idx_reg; // @[Cache.scala 97:11]
  wire [19:0] tag_reg = addr_reg[31:12]; // @[Cache.scala 87:25]
  wire  hit = _hit_T[0] & metaMem_tag_rmeta_data == tag_reg; // @[Cache.scala 97:21]
  wire  _wen_T = hit | is_alloc_reg; // @[Cache.scala 81:30]
  wire  _wen_T_3 = is_write & (hit | is_alloc_reg) & ~io_cpu_abort; // @[Cache.scala 81:47]
  wire  wen = is_write & (hit | is_alloc_reg) & ~io_cpu_abort | is_alloc; // @[Cache.scala 81:64]
  wire  _ren_T_2 = ~wen & (is_idle | is_read); // @[Cache.scala 82:18]
  reg  ren_reg; // @[Cache.scala 83:24]
  wire [1:0] off_reg = addr_reg[3:2]; // @[Cache.scala 89:25]
  wire [63:0] rdata_lo_4 = {dataMem_1_3_rdata_MPORT_1_data,dataMem_1_2_rdata_MPORT_1_data,dataMem_1_1_rdata_MPORT_1_data
    ,dataMem_1_0_rdata_MPORT_1_data,dataMem_0_3_rdata_MPORT_data,dataMem_0_2_rdata_MPORT_data,
    dataMem_0_1_rdata_MPORT_data,dataMem_0_0_rdata_MPORT_data}; // @[Cat.scala 31:58]
  wire [127:0] rdata = {dataMem_3_3_rdata_MPORT_3_data,dataMem_3_2_rdata_MPORT_3_data,dataMem_3_1_rdata_MPORT_3_data,
    dataMem_3_0_rdata_MPORT_3_data,dataMem_2_3_rdata_MPORT_2_data,dataMem_2_2_rdata_MPORT_2_data,
    dataMem_2_1_rdata_MPORT_2_data,dataMem_2_0_rdata_MPORT_2_data,rdata_lo_4}; // @[Cat.scala 31:58]
  reg [127:0] rdata_buf; // @[Reg.scala 16:16]
  wire [127:0] _GEN_12 = ren_reg ? rdata : rdata_buf; // @[Reg.scala 16:16 17:{18,22}]
  reg [63:0] refill_buf_0; // @[Cache.scala 94:23]
  reg [63:0] refill_buf_1; // @[Cache.scala 94:23]
  wire [127:0] _read_T = {refill_buf_1,refill_buf_0}; // @[Cache.scala 95:43]
  wire [127:0] read = is_alloc_reg ? _read_T : _GEN_12; // @[Cache.scala 95:17]
  wire [31:0] _GEN_14 = 2'h1 == off_reg ? read[63:32] : read[31:0]; // @[Cache.scala 100:{25,25}]
  wire [31:0] _GEN_15 = 2'h2 == off_reg ? read[95:64] : _GEN_14; // @[Cache.scala 100:{25,25}]
  wire  _io_cpu_resp_valid_T_2 = |cpu_mask; // @[Cache.scala 101:79]
  wire  _wmask_T = ~is_alloc; // @[Cache.scala 112:19]
  wire [3:0] _wmask_T_1 = {off_reg,2'h0}; // @[Cat.scala 31:58]
  wire [18:0] _GEN_1 = {{15'd0}, cpu_mask}; // @[Cache.scala 112:40]
  wire [18:0] _wmask_T_2 = _GEN_1 << _wmask_T_1; // @[Cache.scala 112:40]
  wire [19:0] _wmask_T_3 = {1'b0,$signed(_wmask_T_2)}; // @[Cache.scala 112:80]
  wire [19:0] wmask = ~is_alloc ? $signed(_wmask_T_3) : $signed(-20'sh1); // @[Cache.scala 112:18]
  wire [127:0] _wdata_T_2 = {cpu_data,cpu_data,cpu_data,cpu_data}; // @[Cat.scala 31:58]
  wire [127:0] _wdata_T_3 = {io_nasti_r_bits_data,refill_buf_0}; // @[Cat.scala 31:58]
  wire [127:0] wdata = _wmask_T ? _wdata_T_2 : _wdata_T_3; // @[Cache.scala 113:18]
  wire [255:0] _v_T = 256'h1 << idx_reg; // @[Cache.scala 120:18]
  wire [255:0] _v_T_1 = v | _v_T; // @[Cache.scala 120:18]
  wire [255:0] _d_T_2 = d | _v_T; // @[Cache.scala 121:18]
  wire [255:0] _d_T_3 = ~d; // @[Cache.scala 121:18]
  wire [255:0] _d_T_4 = _d_T_3 | _v_T; // @[Cache.scala 121:18]
  wire [255:0] _d_T_5 = ~_d_T_4; // @[Cache.scala 121:18]
  wire [27:0] _io_nasti_ar_bits_T = {tag_reg,idx_reg}; // @[Cat.scala 31:58]
  wire [31:0] _GEN_146 = {_io_nasti_ar_bits_T, 4'h0}; // @[Cache.scala 135:28]
  wire [34:0] _io_nasti_ar_bits_T_1 = {{3'd0}, _GEN_146}; // @[Cache.scala 135:28]
  wire [27:0] _io_nasti_aw_bits_T = {metaMem_tag_rmeta_data,idx_reg}; // @[Cat.scala 31:58]
  wire [31:0] _GEN_147 = {_io_nasti_aw_bits_T, 4'h0}; // @[Cache.scala 147:30]
  wire [34:0] _io_nasti_aw_bits_T_1 = {{3'd0}, _GEN_147}; // @[Cache.scala 147:30]
  wire [255:0] _is_dirty_T_2 = d >> idx_reg; // @[Cache.scala 163:33]
  wire  is_dirty = _hit_T[0] & _is_dirty_T_2[0]; // @[Cache.scala 163:29]
  wire [2:0] _state_T_1 = |io_cpu_req_bits_mask ? 3'h2 : 3'h1; // @[Cache.scala 167:21]
  wire [2:0] _GEN_106 = io_cpu_req_valid ? _state_T_1 : 3'h0; // @[Cache.scala 172:32 173:17 175:17]
  wire  _io_nasti_ar_valid_T = ~is_dirty; // @[Cache.scala 179:30]
  wire  _T_25 = io_nasti_aw_ready & io_nasti_aw_valid; // @[Decoupled.scala 50:35]
  wire  _T_26 = io_nasti_ar_ready & io_nasti_ar_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_107 = _T_26 ? 3'h6 : state; // @[Cache.scala 182:38 183:17 58:22]
  wire [2:0] _GEN_108 = _T_25 ? 3'h3 : _GEN_107; // @[Cache.scala 180:32 181:17]
  wire  _GEN_110 = hit ? 1'h0 : is_dirty; // @[Cache.scala 171:17 151:21 178:27]
  wire  _GEN_111 = hit ? 1'h0 : ~is_dirty; // @[Cache.scala 171:17 139:21 179:27]
  wire [2:0] _GEN_114 = _wen_T | io_cpu_abort ? 3'h0 : _GEN_108; // @[Cache.scala 188:49 189:15]
  wire  _GEN_115 = _wen_T | io_cpu_abort ? 1'h0 : is_dirty; // @[Cache.scala 151:21 188:49 191:27]
  wire  _GEN_116 = _wen_T | io_cpu_abort ? 1'h0 : _io_nasti_ar_valid_T; // @[Cache.scala 139:21 188:49 192:27]
  wire [2:0] _GEN_117 = write_wrap_out ? 3'h4 : state; // @[Cache.scala 202:28 203:15 58:22]
  wire  _T_34 = io_nasti_b_ready & io_nasti_b_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_118 = _T_34 ? 3'h5 : state; // @[Cache.scala 208:29 209:15 58:22]
  wire [2:0] _state_T_5 = _io_cpu_resp_valid_T_2 ? 3'h2 : 3'h0; // @[Cache.scala 220:21]
  wire [2:0] _GEN_120 = read_wrap_out ? _state_T_5 : state; // @[Cache.scala 219:27 220:15 58:22]
  wire [2:0] _GEN_121 = 3'h6 == state ? _GEN_120 : state; // @[Cache.scala 164:17 58:22]
  wire [2:0] _GEN_123 = 3'h5 == state ? _GEN_107 : _GEN_121; // @[Cache.scala 164:17]
  wire [2:0] _GEN_125 = 3'h4 == state ? _GEN_118 : _GEN_123; // @[Cache.scala 164:17]
  wire  _GEN_126 = 3'h4 == state ? 1'h0 : 3'h5 == state; // @[Cache.scala 164:17 139:21]
  wire [2:0] _GEN_128 = 3'h3 == state ? _GEN_117 : _GEN_125; // @[Cache.scala 164:17]
  wire  _GEN_129 = 3'h3 == state ? 1'h0 : 3'h4 == state; // @[Cache.scala 164:17 160:20]
  wire  _GEN_130 = 3'h3 == state ? 1'h0 : _GEN_126; // @[Cache.scala 164:17 139:21]
  wire  _GEN_132 = 3'h2 == state & _GEN_115; // @[Cache.scala 164:17 151:21]
  wire  _GEN_133 = 3'h2 == state ? _GEN_116 : _GEN_130; // @[Cache.scala 164:17]
  wire  _GEN_134 = 3'h2 == state ? 1'h0 : 3'h3 == state; // @[Cache.scala 164:17 158:20]
  wire  _GEN_135 = 3'h2 == state ? 1'h0 : _GEN_129; // @[Cache.scala 164:17 160:20]
  wire  _GEN_137 = 3'h1 == state ? _GEN_110 : _GEN_132; // @[Cache.scala 164:17]
  wire  _GEN_138 = 3'h1 == state ? _GEN_111 : _GEN_133; // @[Cache.scala 164:17]
  wire  _GEN_139 = 3'h1 == state ? 1'h0 : _GEN_134; // @[Cache.scala 164:17 158:20]
  wire  _GEN_140 = 3'h1 == state ? 1'h0 : _GEN_135; // @[Cache.scala 164:17 160:20]
  assign metaMem_tag_rmeta_en = metaMem_tag_rmeta_en_pipe_0;
  assign metaMem_tag_rmeta_addr = metaMem_tag_rmeta_addr_pipe_0;
  assign metaMem_tag_rmeta_data = metaMem_tag[metaMem_tag_rmeta_addr]; // @[Cache.scala 62:28]
  assign metaMem_tag_MPORT_data = addr_reg[31:12];
  assign metaMem_tag_MPORT_addr = addr_reg[11:4];
  assign metaMem_tag_MPORT_mask = 1'h1;
  assign metaMem_tag_MPORT_en = wen & is_alloc;
  assign dataMem_0_0_rdata_MPORT_en = dataMem_0_0_rdata_MPORT_en_pipe_0;
  assign dataMem_0_0_rdata_MPORT_addr = dataMem_0_0_rdata_MPORT_addr_pipe_0;
  assign dataMem_0_0_rdata_MPORT_data = dataMem_0_0[dataMem_0_0_rdata_MPORT_addr]; // @[Cache.scala 63:45]
  assign dataMem_0_0_MPORT_1_data = wdata[7:0];
  assign dataMem_0_0_MPORT_1_addr = addr_reg[11:4];
  assign dataMem_0_0_MPORT_1_mask = wmask[0];
  assign dataMem_0_0_MPORT_1_en = _wen_T_3 | is_alloc;
  assign dataMem_0_1_rdata_MPORT_en = dataMem_0_1_rdata_MPORT_en_pipe_0;
  assign dataMem_0_1_rdata_MPORT_addr = dataMem_0_1_rdata_MPORT_addr_pipe_0;
  assign dataMem_0_1_rdata_MPORT_data = dataMem_0_1[dataMem_0_1_rdata_MPORT_addr]; // @[Cache.scala 63:45]
  assign dataMem_0_1_MPORT_1_data = wdata[15:8];
  assign dataMem_0_1_MPORT_1_addr = addr_reg[11:4];
  assign dataMem_0_1_MPORT_1_mask = wmask[1];
  assign dataMem_0_1_MPORT_1_en = _wen_T_3 | is_alloc;
  assign dataMem_0_2_rdata_MPORT_en = dataMem_0_2_rdata_MPORT_en_pipe_0;
  assign dataMem_0_2_rdata_MPORT_addr = dataMem_0_2_rdata_MPORT_addr_pipe_0;
  assign dataMem_0_2_rdata_MPORT_data = dataMem_0_2[dataMem_0_2_rdata_MPORT_addr]; // @[Cache.scala 63:45]
  assign dataMem_0_2_MPORT_1_data = wdata[23:16];
  assign dataMem_0_2_MPORT_1_addr = addr_reg[11:4];
  assign dataMem_0_2_MPORT_1_mask = wmask[2];
  assign dataMem_0_2_MPORT_1_en = _wen_T_3 | is_alloc;
  assign dataMem_0_3_rdata_MPORT_en = dataMem_0_3_rdata_MPORT_en_pipe_0;
  assign dataMem_0_3_rdata_MPORT_addr = dataMem_0_3_rdata_MPORT_addr_pipe_0;
  assign dataMem_0_3_rdata_MPORT_data = dataMem_0_3[dataMem_0_3_rdata_MPORT_addr]; // @[Cache.scala 63:45]
  assign dataMem_0_3_MPORT_1_data = wdata[31:24];
  assign dataMem_0_3_MPORT_1_addr = addr_reg[11:4];
  assign dataMem_0_3_MPORT_1_mask = wmask[3];
  assign dataMem_0_3_MPORT_1_en = _wen_T_3 | is_alloc;
  assign dataMem_1_0_rdata_MPORT_1_en = dataMem_1_0_rdata_MPORT_1_en_pipe_0;
  assign dataMem_1_0_rdata_MPORT_1_addr = dataMem_1_0_rdata_MPORT_1_addr_pipe_0;
  assign dataMem_1_0_rdata_MPORT_1_data = dataMem_1_0[dataMem_1_0_rdata_MPORT_1_addr]; // @[Cache.scala 63:45]
  assign dataMem_1_0_MPORT_2_data = wdata[39:32];
  assign dataMem_1_0_MPORT_2_addr = addr_reg[11:4];
  assign dataMem_1_0_MPORT_2_mask = wmask[4];
  assign dataMem_1_0_MPORT_2_en = _wen_T_3 | is_alloc;
  assign dataMem_1_1_rdata_MPORT_1_en = dataMem_1_1_rdata_MPORT_1_en_pipe_0;
  assign dataMem_1_1_rdata_MPORT_1_addr = dataMem_1_1_rdata_MPORT_1_addr_pipe_0;
  assign dataMem_1_1_rdata_MPORT_1_data = dataMem_1_1[dataMem_1_1_rdata_MPORT_1_addr]; // @[Cache.scala 63:45]
  assign dataMem_1_1_MPORT_2_data = wdata[47:40];
  assign dataMem_1_1_MPORT_2_addr = addr_reg[11:4];
  assign dataMem_1_1_MPORT_2_mask = wmask[5];
  assign dataMem_1_1_MPORT_2_en = _wen_T_3 | is_alloc;
  assign dataMem_1_2_rdata_MPORT_1_en = dataMem_1_2_rdata_MPORT_1_en_pipe_0;
  assign dataMem_1_2_rdata_MPORT_1_addr = dataMem_1_2_rdata_MPORT_1_addr_pipe_0;
  assign dataMem_1_2_rdata_MPORT_1_data = dataMem_1_2[dataMem_1_2_rdata_MPORT_1_addr]; // @[Cache.scala 63:45]
  assign dataMem_1_2_MPORT_2_data = wdata[55:48];
  assign dataMem_1_2_MPORT_2_addr = addr_reg[11:4];
  assign dataMem_1_2_MPORT_2_mask = wmask[6];
  assign dataMem_1_2_MPORT_2_en = _wen_T_3 | is_alloc;
  assign dataMem_1_3_rdata_MPORT_1_en = dataMem_1_3_rdata_MPORT_1_en_pipe_0;
  assign dataMem_1_3_rdata_MPORT_1_addr = dataMem_1_3_rdata_MPORT_1_addr_pipe_0;
  assign dataMem_1_3_rdata_MPORT_1_data = dataMem_1_3[dataMem_1_3_rdata_MPORT_1_addr]; // @[Cache.scala 63:45]
  assign dataMem_1_3_MPORT_2_data = wdata[63:56];
  assign dataMem_1_3_MPORT_2_addr = addr_reg[11:4];
  assign dataMem_1_3_MPORT_2_mask = wmask[7];
  assign dataMem_1_3_MPORT_2_en = _wen_T_3 | is_alloc;
  assign dataMem_2_0_rdata_MPORT_2_en = dataMem_2_0_rdata_MPORT_2_en_pipe_0;
  assign dataMem_2_0_rdata_MPORT_2_addr = dataMem_2_0_rdata_MPORT_2_addr_pipe_0;
  assign dataMem_2_0_rdata_MPORT_2_data = dataMem_2_0[dataMem_2_0_rdata_MPORT_2_addr]; // @[Cache.scala 63:45]
  assign dataMem_2_0_MPORT_3_data = wdata[71:64];
  assign dataMem_2_0_MPORT_3_addr = addr_reg[11:4];
  assign dataMem_2_0_MPORT_3_mask = wmask[8];
  assign dataMem_2_0_MPORT_3_en = _wen_T_3 | is_alloc;
  assign dataMem_2_1_rdata_MPORT_2_en = dataMem_2_1_rdata_MPORT_2_en_pipe_0;
  assign dataMem_2_1_rdata_MPORT_2_addr = dataMem_2_1_rdata_MPORT_2_addr_pipe_0;
  assign dataMem_2_1_rdata_MPORT_2_data = dataMem_2_1[dataMem_2_1_rdata_MPORT_2_addr]; // @[Cache.scala 63:45]
  assign dataMem_2_1_MPORT_3_data = wdata[79:72];
  assign dataMem_2_1_MPORT_3_addr = addr_reg[11:4];
  assign dataMem_2_1_MPORT_3_mask = wmask[9];
  assign dataMem_2_1_MPORT_3_en = _wen_T_3 | is_alloc;
  assign dataMem_2_2_rdata_MPORT_2_en = dataMem_2_2_rdata_MPORT_2_en_pipe_0;
  assign dataMem_2_2_rdata_MPORT_2_addr = dataMem_2_2_rdata_MPORT_2_addr_pipe_0;
  assign dataMem_2_2_rdata_MPORT_2_data = dataMem_2_2[dataMem_2_2_rdata_MPORT_2_addr]; // @[Cache.scala 63:45]
  assign dataMem_2_2_MPORT_3_data = wdata[87:80];
  assign dataMem_2_2_MPORT_3_addr = addr_reg[11:4];
  assign dataMem_2_2_MPORT_3_mask = wmask[10];
  assign dataMem_2_2_MPORT_3_en = _wen_T_3 | is_alloc;
  assign dataMem_2_3_rdata_MPORT_2_en = dataMem_2_3_rdata_MPORT_2_en_pipe_0;
  assign dataMem_2_3_rdata_MPORT_2_addr = dataMem_2_3_rdata_MPORT_2_addr_pipe_0;
  assign dataMem_2_3_rdata_MPORT_2_data = dataMem_2_3[dataMem_2_3_rdata_MPORT_2_addr]; // @[Cache.scala 63:45]
  assign dataMem_2_3_MPORT_3_data = wdata[95:88];
  assign dataMem_2_3_MPORT_3_addr = addr_reg[11:4];
  assign dataMem_2_3_MPORT_3_mask = wmask[11];
  assign dataMem_2_3_MPORT_3_en = _wen_T_3 | is_alloc;
  assign dataMem_3_0_rdata_MPORT_3_en = dataMem_3_0_rdata_MPORT_3_en_pipe_0;
  assign dataMem_3_0_rdata_MPORT_3_addr = dataMem_3_0_rdata_MPORT_3_addr_pipe_0;
  assign dataMem_3_0_rdata_MPORT_3_data = dataMem_3_0[dataMem_3_0_rdata_MPORT_3_addr]; // @[Cache.scala 63:45]
  assign dataMem_3_0_MPORT_4_data = wdata[103:96];
  assign dataMem_3_0_MPORT_4_addr = addr_reg[11:4];
  assign dataMem_3_0_MPORT_4_mask = wmask[12];
  assign dataMem_3_0_MPORT_4_en = _wen_T_3 | is_alloc;
  assign dataMem_3_1_rdata_MPORT_3_en = dataMem_3_1_rdata_MPORT_3_en_pipe_0;
  assign dataMem_3_1_rdata_MPORT_3_addr = dataMem_3_1_rdata_MPORT_3_addr_pipe_0;
  assign dataMem_3_1_rdata_MPORT_3_data = dataMem_3_1[dataMem_3_1_rdata_MPORT_3_addr]; // @[Cache.scala 63:45]
  assign dataMem_3_1_MPORT_4_data = wdata[111:104];
  assign dataMem_3_1_MPORT_4_addr = addr_reg[11:4];
  assign dataMem_3_1_MPORT_4_mask = wmask[13];
  assign dataMem_3_1_MPORT_4_en = _wen_T_3 | is_alloc;
  assign dataMem_3_2_rdata_MPORT_3_en = dataMem_3_2_rdata_MPORT_3_en_pipe_0;
  assign dataMem_3_2_rdata_MPORT_3_addr = dataMem_3_2_rdata_MPORT_3_addr_pipe_0;
  assign dataMem_3_2_rdata_MPORT_3_data = dataMem_3_2[dataMem_3_2_rdata_MPORT_3_addr]; // @[Cache.scala 63:45]
  assign dataMem_3_2_MPORT_4_data = wdata[119:112];
  assign dataMem_3_2_MPORT_4_addr = addr_reg[11:4];
  assign dataMem_3_2_MPORT_4_mask = wmask[14];
  assign dataMem_3_2_MPORT_4_en = _wen_T_3 | is_alloc;
  assign dataMem_3_3_rdata_MPORT_3_en = dataMem_3_3_rdata_MPORT_3_en_pipe_0;
  assign dataMem_3_3_rdata_MPORT_3_addr = dataMem_3_3_rdata_MPORT_3_addr_pipe_0;
  assign dataMem_3_3_rdata_MPORT_3_data = dataMem_3_3[dataMem_3_3_rdata_MPORT_3_addr]; // @[Cache.scala 63:45]
  assign dataMem_3_3_MPORT_4_data = wdata[127:120];
  assign dataMem_3_3_MPORT_4_addr = addr_reg[11:4];
  assign dataMem_3_3_MPORT_4_mask = wmask[15];
  assign dataMem_3_3_MPORT_4_en = _wen_T_3 | is_alloc;
  assign io_cpu_resp_valid = is_idle | is_read & hit | is_alloc_reg & ~(|cpu_mask); // @[Cache.scala 101:50]
  assign io_cpu_resp_bits_data = 2'h3 == off_reg ? read[127:96] : _GEN_15; // @[Cache.scala 100:{25,25}]
  assign io_nasti_aw_valid = 3'h0 == state ? 1'h0 : _GEN_137; // @[Cache.scala 164:17 151:21]
  assign io_nasti_aw_bits_addr = _io_nasti_aw_bits_T_1[31:0]; // @[nasti.scala 156:18 158:13]
  assign io_nasti_w_valid = 3'h0 == state ? 1'h0 : _GEN_139; // @[Cache.scala 164:17 158:20]
  assign io_nasti_w_bits_data = write_count ? read[127:64] : read[63:0]; // @[nasti.scala 201:{12,12}]
  assign io_nasti_w_bits_last = _T_1 & write_count; // @[Counter.scala 120:{16,23}]
  assign io_nasti_b_ready = 3'h0 == state ? 1'h0 : _GEN_140; // @[Cache.scala 164:17 160:20]
  assign io_nasti_ar_valid = 3'h0 == state ? 1'h0 : _GEN_138; // @[Cache.scala 164:17 139:21]
  assign io_nasti_ar_bits_addr = _io_nasti_ar_bits_T_1[31:0]; // @[nasti.scala 174:18 176:13]
  assign io_nasti_r_ready = state == 3'h6; // @[Cache.scala 141:29]
  always @(posedge clock) begin
    if (metaMem_tag_MPORT_en & metaMem_tag_MPORT_mask) begin
      metaMem_tag[metaMem_tag_MPORT_addr] <= metaMem_tag_MPORT_data; // @[Cache.scala 62:28]
    end
    metaMem_tag_rmeta_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      metaMem_tag_rmeta_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_0_0_MPORT_1_en & dataMem_0_0_MPORT_1_mask) begin
      dataMem_0_0[dataMem_0_0_MPORT_1_addr] <= dataMem_0_0_MPORT_1_data; // @[Cache.scala 63:45]
    end
    dataMem_0_0_rdata_MPORT_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_0_0_rdata_MPORT_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_0_1_MPORT_1_en & dataMem_0_1_MPORT_1_mask) begin
      dataMem_0_1[dataMem_0_1_MPORT_1_addr] <= dataMem_0_1_MPORT_1_data; // @[Cache.scala 63:45]
    end
    dataMem_0_1_rdata_MPORT_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_0_1_rdata_MPORT_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_0_2_MPORT_1_en & dataMem_0_2_MPORT_1_mask) begin
      dataMem_0_2[dataMem_0_2_MPORT_1_addr] <= dataMem_0_2_MPORT_1_data; // @[Cache.scala 63:45]
    end
    dataMem_0_2_rdata_MPORT_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_0_2_rdata_MPORT_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_0_3_MPORT_1_en & dataMem_0_3_MPORT_1_mask) begin
      dataMem_0_3[dataMem_0_3_MPORT_1_addr] <= dataMem_0_3_MPORT_1_data; // @[Cache.scala 63:45]
    end
    dataMem_0_3_rdata_MPORT_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_0_3_rdata_MPORT_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_1_0_MPORT_2_en & dataMem_1_0_MPORT_2_mask) begin
      dataMem_1_0[dataMem_1_0_MPORT_2_addr] <= dataMem_1_0_MPORT_2_data; // @[Cache.scala 63:45]
    end
    dataMem_1_0_rdata_MPORT_1_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_1_0_rdata_MPORT_1_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_1_1_MPORT_2_en & dataMem_1_1_MPORT_2_mask) begin
      dataMem_1_1[dataMem_1_1_MPORT_2_addr] <= dataMem_1_1_MPORT_2_data; // @[Cache.scala 63:45]
    end
    dataMem_1_1_rdata_MPORT_1_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_1_1_rdata_MPORT_1_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_1_2_MPORT_2_en & dataMem_1_2_MPORT_2_mask) begin
      dataMem_1_2[dataMem_1_2_MPORT_2_addr] <= dataMem_1_2_MPORT_2_data; // @[Cache.scala 63:45]
    end
    dataMem_1_2_rdata_MPORT_1_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_1_2_rdata_MPORT_1_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_1_3_MPORT_2_en & dataMem_1_3_MPORT_2_mask) begin
      dataMem_1_3[dataMem_1_3_MPORT_2_addr] <= dataMem_1_3_MPORT_2_data; // @[Cache.scala 63:45]
    end
    dataMem_1_3_rdata_MPORT_1_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_1_3_rdata_MPORT_1_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_2_0_MPORT_3_en & dataMem_2_0_MPORT_3_mask) begin
      dataMem_2_0[dataMem_2_0_MPORT_3_addr] <= dataMem_2_0_MPORT_3_data; // @[Cache.scala 63:45]
    end
    dataMem_2_0_rdata_MPORT_2_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_2_0_rdata_MPORT_2_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_2_1_MPORT_3_en & dataMem_2_1_MPORT_3_mask) begin
      dataMem_2_1[dataMem_2_1_MPORT_3_addr] <= dataMem_2_1_MPORT_3_data; // @[Cache.scala 63:45]
    end
    dataMem_2_1_rdata_MPORT_2_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_2_1_rdata_MPORT_2_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_2_2_MPORT_3_en & dataMem_2_2_MPORT_3_mask) begin
      dataMem_2_2[dataMem_2_2_MPORT_3_addr] <= dataMem_2_2_MPORT_3_data; // @[Cache.scala 63:45]
    end
    dataMem_2_2_rdata_MPORT_2_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_2_2_rdata_MPORT_2_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_2_3_MPORT_3_en & dataMem_2_3_MPORT_3_mask) begin
      dataMem_2_3[dataMem_2_3_MPORT_3_addr] <= dataMem_2_3_MPORT_3_data; // @[Cache.scala 63:45]
    end
    dataMem_2_3_rdata_MPORT_2_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_2_3_rdata_MPORT_2_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_3_0_MPORT_4_en & dataMem_3_0_MPORT_4_mask) begin
      dataMem_3_0[dataMem_3_0_MPORT_4_addr] <= dataMem_3_0_MPORT_4_data; // @[Cache.scala 63:45]
    end
    dataMem_3_0_rdata_MPORT_3_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_3_0_rdata_MPORT_3_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_3_1_MPORT_4_en & dataMem_3_1_MPORT_4_mask) begin
      dataMem_3_1[dataMem_3_1_MPORT_4_addr] <= dataMem_3_1_MPORT_4_data; // @[Cache.scala 63:45]
    end
    dataMem_3_1_rdata_MPORT_3_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_3_1_rdata_MPORT_3_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_3_2_MPORT_4_en & dataMem_3_2_MPORT_4_mask) begin
      dataMem_3_2[dataMem_3_2_MPORT_4_addr] <= dataMem_3_2_MPORT_4_data; // @[Cache.scala 63:45]
    end
    dataMem_3_2_rdata_MPORT_3_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_3_2_rdata_MPORT_3_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (dataMem_3_3_MPORT_4_en & dataMem_3_3_MPORT_4_mask) begin
      dataMem_3_3[dataMem_3_3_MPORT_4_addr] <= dataMem_3_3_MPORT_4_data; // @[Cache.scala 63:45]
    end
    dataMem_3_3_rdata_MPORT_3_en_pipe_0 <= _ren_T_2 & io_cpu_req_valid;
    if (_ren_T_2 & io_cpu_req_valid) begin
      dataMem_3_3_rdata_MPORT_3_addr_pipe_0 <= io_cpu_req_bits_addr[11:4];
    end
    if (reset) begin // @[Cache.scala 58:22]
      state <= 3'h0; // @[Cache.scala 58:22]
    end else if (3'h0 == state) begin // @[Cache.scala 164:17]
      if (io_cpu_req_valid) begin // @[Cache.scala 166:30]
        if (|io_cpu_req_bits_mask) begin // @[Cache.scala 167:21]
          state <= 3'h2;
        end else begin
          state <= 3'h1;
        end
      end
    end else if (3'h1 == state) begin // @[Cache.scala 164:17]
      if (hit) begin // @[Cache.scala 171:17]
        state <= _GEN_106;
      end else begin
        state <= _GEN_108;
      end
    end else if (3'h2 == state) begin // @[Cache.scala 164:17]
      state <= _GEN_114;
    end else begin
      state <= _GEN_128;
    end
    if (reset) begin // @[Cache.scala 60:18]
      v <= 256'h0; // @[Cache.scala 60:18]
    end else if (wen) begin // @[Cache.scala 119:13]
      v <= _v_T_1; // @[Cache.scala 120:7]
    end
    if (reset) begin // @[Cache.scala 61:18]
      d <= 256'h0; // @[Cache.scala 61:18]
    end else if (wen) begin // @[Cache.scala 119:13]
      if (_wmask_T) begin // @[Cache.scala 121:18]
        d <= _d_T_2;
      end else begin
        d <= _d_T_5;
      end
    end
    if (io_cpu_resp_valid) begin // @[Cache.scala 103:27]
      addr_reg <= io_cpu_req_bits_addr; // @[Cache.scala 104:14]
    end
    if (io_cpu_resp_valid) begin // @[Cache.scala 103:27]
      cpu_data <= io_cpu_req_bits_data; // @[Cache.scala 105:14]
    end
    if (io_cpu_resp_valid) begin // @[Cache.scala 103:27]
      cpu_mask <= io_cpu_req_bits_mask; // @[Cache.scala 106:14]
    end
    if (reset) begin // @[Counter.scala 62:40]
      read_count <= 1'h0; // @[Counter.scala 62:40]
    end else if (_T) begin // @[Counter.scala 120:16]
      read_count <= read_count + 1'h1; // @[Counter.scala 78:15]
    end
    if (reset) begin // @[Counter.scala 62:40]
      write_count <= 1'h0; // @[Counter.scala 62:40]
    end else if (_T_1) begin // @[Counter.scala 120:16]
      write_count <= write_count + 1'h1; // @[Counter.scala 78:15]
    end
    is_alloc_reg <= state == 3'h6 & read_wrap_out; // @[Cache.scala 77:37]
    ren_reg <= ~wen & (is_idle | is_read) & io_cpu_req_valid; // @[Cache.scala 82:42]
    if (ren_reg) begin // @[Reg.scala 17:18]
      rdata_buf <= rdata; // @[Reg.scala 17:22]
    end
    if (_T) begin // @[Cache.scala 142:25]
      if (~read_count) begin // @[Cache.scala 142:50]
        refill_buf_0 <= io_nasti_r_bits_data; // @[Cache.scala 142:50]
      end
    end
    if (_T) begin // @[Cache.scala 142:25]
      if (read_count) begin // @[Cache.scala 142:50]
        refill_buf_1 <= io_nasti_r_bits_data; // @[Cache.scala 142:50]
      end
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    metaMem_tag[initvar] = _RAND_0[19:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_0[initvar] = _RAND_3[7:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_1[initvar] = _RAND_6[7:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_2[initvar] = _RAND_9[7:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_0_3[initvar] = _RAND_12[7:0];
  _RAND_15 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_0[initvar] = _RAND_15[7:0];
  _RAND_18 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_1[initvar] = _RAND_18[7:0];
  _RAND_21 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_2[initvar] = _RAND_21[7:0];
  _RAND_24 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_1_3[initvar] = _RAND_24[7:0];
  _RAND_27 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_0[initvar] = _RAND_27[7:0];
  _RAND_30 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_1[initvar] = _RAND_30[7:0];
  _RAND_33 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_2[initvar] = _RAND_33[7:0];
  _RAND_36 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_2_3[initvar] = _RAND_36[7:0];
  _RAND_39 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_0[initvar] = _RAND_39[7:0];
  _RAND_42 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_1[initvar] = _RAND_42[7:0];
  _RAND_45 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_2[initvar] = _RAND_45[7:0];
  _RAND_48 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    dataMem_3_3[initvar] = _RAND_48[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  metaMem_tag_rmeta_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  metaMem_tag_rmeta_addr_pipe_0 = _RAND_2[7:0];
  _RAND_4 = {1{`RANDOM}};
  dataMem_0_0_rdata_MPORT_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  dataMem_0_0_rdata_MPORT_addr_pipe_0 = _RAND_5[7:0];
  _RAND_7 = {1{`RANDOM}};
  dataMem_0_1_rdata_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  dataMem_0_1_rdata_MPORT_addr_pipe_0 = _RAND_8[7:0];
  _RAND_10 = {1{`RANDOM}};
  dataMem_0_2_rdata_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  dataMem_0_2_rdata_MPORT_addr_pipe_0 = _RAND_11[7:0];
  _RAND_13 = {1{`RANDOM}};
  dataMem_0_3_rdata_MPORT_en_pipe_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  dataMem_0_3_rdata_MPORT_addr_pipe_0 = _RAND_14[7:0];
  _RAND_16 = {1{`RANDOM}};
  dataMem_1_0_rdata_MPORT_1_en_pipe_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  dataMem_1_0_rdata_MPORT_1_addr_pipe_0 = _RAND_17[7:0];
  _RAND_19 = {1{`RANDOM}};
  dataMem_1_1_rdata_MPORT_1_en_pipe_0 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  dataMem_1_1_rdata_MPORT_1_addr_pipe_0 = _RAND_20[7:0];
  _RAND_22 = {1{`RANDOM}};
  dataMem_1_2_rdata_MPORT_1_en_pipe_0 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  dataMem_1_2_rdata_MPORT_1_addr_pipe_0 = _RAND_23[7:0];
  _RAND_25 = {1{`RANDOM}};
  dataMem_1_3_rdata_MPORT_1_en_pipe_0 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  dataMem_1_3_rdata_MPORT_1_addr_pipe_0 = _RAND_26[7:0];
  _RAND_28 = {1{`RANDOM}};
  dataMem_2_0_rdata_MPORT_2_en_pipe_0 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  dataMem_2_0_rdata_MPORT_2_addr_pipe_0 = _RAND_29[7:0];
  _RAND_31 = {1{`RANDOM}};
  dataMem_2_1_rdata_MPORT_2_en_pipe_0 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  dataMem_2_1_rdata_MPORT_2_addr_pipe_0 = _RAND_32[7:0];
  _RAND_34 = {1{`RANDOM}};
  dataMem_2_2_rdata_MPORT_2_en_pipe_0 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  dataMem_2_2_rdata_MPORT_2_addr_pipe_0 = _RAND_35[7:0];
  _RAND_37 = {1{`RANDOM}};
  dataMem_2_3_rdata_MPORT_2_en_pipe_0 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  dataMem_2_3_rdata_MPORT_2_addr_pipe_0 = _RAND_38[7:0];
  _RAND_40 = {1{`RANDOM}};
  dataMem_3_0_rdata_MPORT_3_en_pipe_0 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  dataMem_3_0_rdata_MPORT_3_addr_pipe_0 = _RAND_41[7:0];
  _RAND_43 = {1{`RANDOM}};
  dataMem_3_1_rdata_MPORT_3_en_pipe_0 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  dataMem_3_1_rdata_MPORT_3_addr_pipe_0 = _RAND_44[7:0];
  _RAND_46 = {1{`RANDOM}};
  dataMem_3_2_rdata_MPORT_3_en_pipe_0 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  dataMem_3_2_rdata_MPORT_3_addr_pipe_0 = _RAND_47[7:0];
  _RAND_49 = {1{`RANDOM}};
  dataMem_3_3_rdata_MPORT_3_en_pipe_0 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  dataMem_3_3_rdata_MPORT_3_addr_pipe_0 = _RAND_50[7:0];
  _RAND_51 = {1{`RANDOM}};
  state = _RAND_51[2:0];
  _RAND_52 = {8{`RANDOM}};
  v = _RAND_52[255:0];
  _RAND_53 = {8{`RANDOM}};
  d = _RAND_53[255:0];
  _RAND_54 = {1{`RANDOM}};
  addr_reg = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  cpu_data = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  cpu_mask = _RAND_56[3:0];
  _RAND_57 = {1{`RANDOM}};
  read_count = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  write_count = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  is_alloc_reg = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  ren_reg = _RAND_60[0:0];
  _RAND_61 = {4{`RANDOM}};
  rdata_buf = _RAND_61[127:0];
  _RAND_62 = {2{`RANDOM}};
  refill_buf_0 = _RAND_62[63:0];
  _RAND_63 = {2{`RANDOM}};
  refill_buf_1 = _RAND_63[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
