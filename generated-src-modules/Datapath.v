module Datapath(
  input         clock,
  input         reset,
  input         io_host_fromhost_valid,
  input  [31:0] io_host_fromhost_bits,
  output [31:0] io_host_tohost,
  output        io_icache_req_valid,
  output [31:0] io_icache_req_bits_addr,
  input         io_icache_resp_valid,
  input  [31:0] io_icache_resp_bits_data,
  output        io_dcache_abort,
  output        io_dcache_req_valid,
  output [31:0] io_dcache_req_bits_addr,
  output [31:0] io_dcache_req_bits_data,
  output [3:0]  io_dcache_req_bits_mask,
  input         io_dcache_resp_valid,
  input  [31:0] io_dcache_resp_bits_data,
  output [31:0] io_ctrl_inst,
  input  [1:0]  io_ctrl_pc_sel,
  input         io_ctrl_inst_kill,
  input         io_ctrl_A_sel,
  input         io_ctrl_B_sel,
  input  [2:0]  io_ctrl_imm_sel,
  input  [3:0]  io_ctrl_alu_op,
  input  [2:0]  io_ctrl_br_type,
  input  [1:0]  io_ctrl_st_type,
  input  [2:0]  io_ctrl_ld_type,
  input  [1:0]  io_ctrl_wb_sel,
  input         io_ctrl_wb_en,
  input  [2:0]  io_ctrl_csr_cmd,
  input         io_ctrl_illegal
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [63:0] _RAND_14;
`endif // RANDOMIZE_REG_INIT
  wire  csr_clock; // @[Datapath.scala 23:19]
  wire  csr_reset; // @[Datapath.scala 23:19]
  wire  csr_io_stall; // @[Datapath.scala 23:19]
  wire [2:0] csr_io_cmd; // @[Datapath.scala 23:19]
  wire [31:0] csr_io_in; // @[Datapath.scala 23:19]
  wire [31:0] csr_io_out; // @[Datapath.scala 23:19]
  wire [31:0] csr_io_pc; // @[Datapath.scala 23:19]
  wire [31:0] csr_io_addr; // @[Datapath.scala 23:19]
  wire [31:0] csr_io_inst; // @[Datapath.scala 23:19]
  wire  csr_io_illegal; // @[Datapath.scala 23:19]
  wire [1:0] csr_io_st_type; // @[Datapath.scala 23:19]
  wire [2:0] csr_io_ld_type; // @[Datapath.scala 23:19]
  wire  csr_io_pc_check; // @[Datapath.scala 23:19]
  wire  csr_io_expt; // @[Datapath.scala 23:19]
  wire [31:0] csr_io_evec; // @[Datapath.scala 23:19]
  wire [31:0] csr_io_epc; // @[Datapath.scala 23:19]
  wire  csr_io_host_fromhost_valid; // @[Datapath.scala 23:19]
  wire [31:0] csr_io_host_fromhost_bits; // @[Datapath.scala 23:19]
  wire [31:0] csr_io_host_tohost; // @[Datapath.scala 23:19]
  wire  regFile_clock; // @[Datapath.scala 24:23]
  wire [4:0] regFile_io_raddr1; // @[Datapath.scala 24:23]
  wire [4:0] regFile_io_raddr2; // @[Datapath.scala 24:23]
  wire [31:0] regFile_io_rdata1; // @[Datapath.scala 24:23]
  wire [31:0] regFile_io_rdata2; // @[Datapath.scala 24:23]
  wire  regFile_io_wen; // @[Datapath.scala 24:23]
  wire [4:0] regFile_io_waddr; // @[Datapath.scala 24:23]
  wire [31:0] regFile_io_wdata; // @[Datapath.scala 24:23]
  wire [31:0] alu_io_A; // @[Config.scala 14:52]
  wire [31:0] alu_io_B; // @[Config.scala 14:52]
  wire [3:0] alu_io_alu_op; // @[Config.scala 14:52]
  wire [31:0] alu_io_out; // @[Config.scala 14:52]
  wire [31:0] alu_io_sum; // @[Config.scala 14:52]
  wire [31:0] immGen_io_inst; // @[Config.scala 15:52]
  wire [2:0] immGen_io_sel; // @[Config.scala 15:52]
  wire [31:0] immGen_io_out; // @[Config.scala 15:52]
  wire [31:0] brCond_io_rs1; // @[Config.scala 16:52]
  wire [31:0] brCond_io_rs2; // @[Config.scala 16:52]
  wire [2:0] brCond_io_br_type; // @[Config.scala 16:52]
  wire  brCond_io_taken; // @[Config.scala 16:52]
  reg [31:0] fe_inst; // @[Datapath.scala 33:24]
  reg [32:0] fe_pc; // @[Datapath.scala 34:18]
  reg [31:0] ew_inst; // @[Datapath.scala 38:24]
  reg [32:0] ew_pc; // @[Datapath.scala 39:18]
  reg [31:0] ew_alu; // @[Datapath.scala 40:19]
  reg [31:0] csr_in; // @[Datapath.scala 41:19]
  reg [1:0] st_type; // @[Datapath.scala 45:20]
  reg [2:0] ld_type; // @[Datapath.scala 46:20]
  reg [1:0] wb_sel; // @[Datapath.scala 47:19]
  reg  wb_en; // @[Datapath.scala 48:18]
  reg [2:0] csr_cmd; // @[Datapath.scala 49:20]
  reg  illegal; // @[Datapath.scala 50:20]
  reg  pc_check; // @[Datapath.scala 51:21]
  reg  started; // @[Datapath.scala 55:24]
  wire  stall = ~io_icache_resp_valid | ~io_dcache_resp_valid; // @[Datapath.scala 56:37]
  wire [31:0] _pc_T_1 = 32'h200 - 32'h4; // @[Datapath.scala 57:45]
  reg [32:0] pc; // @[Datapath.scala 57:19]
  wire  _npc_T = io_ctrl_pc_sel == 2'h3; // @[Datapath.scala 65:24]
  wire  _npc_T_1 = io_ctrl_pc_sel == 2'h1; // @[Datapath.scala 68:26]
  wire  _npc_T_2 = io_ctrl_pc_sel == 2'h1 | brCond_io_taken; // @[Datapath.scala 68:37]
  wire [31:0] _npc_T_3 = {{1'd0}, alu_io_sum[31:1]}; // @[Datapath.scala 69:22]
  wire [32:0] _npc_T_4 = {_npc_T_3, 1'h0}; // @[Datapath.scala 69:29]
  wire [32:0] _npc_T_7 = pc + 33'h4; // @[Datapath.scala 70:47]
  wire [32:0] _npc_T_8 = io_ctrl_pc_sel == 2'h2 ? pc : _npc_T_7; // @[Datapath.scala 70:14]
  wire [32:0] _npc_T_9 = _npc_T_2 ? _npc_T_4 : _npc_T_8; // @[Datapath.scala 67:12]
  wire [32:0] _npc_T_10 = _npc_T ? {{1'd0}, csr_io_epc} : _npc_T_9; // @[Datapath.scala 64:10]
  wire [32:0] _npc_T_11 = csr_io_expt ? {{1'd0}, csr_io_evec} : _npc_T_10; // @[Datapath.scala 61:8]
  wire [32:0] npc = stall ? pc : _npc_T_11; // @[Datapath.scala 58:16]
  wire  _io_icache_req_valid_T = ~stall; // @[Datapath.scala 81:26]
  wire [4:0] rs1_addr = fe_inst[19:15]; // @[Datapath.scala 97:25]
  wire [4:0] rs2_addr = fe_inst[24:20]; // @[Datapath.scala 98:25]
  wire [4:0] wb_rd_addr = ew_inst[11:7]; // @[Datapath.scala 107:27]
  wire  rs1hazard = wb_en & |rs1_addr & rs1_addr == wb_rd_addr; // @[Datapath.scala 108:41]
  wire  rs2hazard = wb_en & |rs2_addr & rs2_addr == wb_rd_addr; // @[Datapath.scala 109:41]
  wire  _rs1_T = wb_sel == 2'h0; // @[Datapath.scala 110:24]
  wire [31:0] rs1 = wb_sel == 2'h0 & rs1hazard ? ew_alu : regFile_io_rdata1; // @[Datapath.scala 110:16]
  wire [31:0] rs2 = _rs1_T & rs2hazard ? ew_alu : regFile_io_rdata2; // @[Datapath.scala 111:16]
  wire [32:0] _alu_io_A_T_1 = io_ctrl_A_sel ? {{1'd0}, rs1} : fe_pc; // @[Datapath.scala 114:18]
  wire [31:0] _daddr_T = stall ? ew_alu : alu_io_sum; // @[Datapath.scala 124:18]
  wire [31:0] _daddr_T_1 = {{2'd0}, _daddr_T[31:2]}; // @[Datapath.scala 124:46]
  wire [33:0] _GEN_26 = {_daddr_T_1, 2'h0}; // @[Datapath.scala 124:53]
  wire [34:0] daddr = {{1'd0}, _GEN_26}; // @[Datapath.scala 124:53]
  wire [4:0] _GEN_27 = {alu_io_sum[1], 4'h0}; // @[Datapath.scala 125:32]
  wire [7:0] _woffset_T_1 = {{3'd0}, _GEN_27}; // @[Datapath.scala 125:32]
  wire [3:0] _woffset_T_3 = {alu_io_sum[0], 3'h0}; // @[Datapath.scala 125:64]
  wire [7:0] _GEN_28 = {{4'd0}, _woffset_T_3}; // @[Datapath.scala 125:47]
  wire [7:0] woffset = _woffset_T_1 | _GEN_28; // @[Datapath.scala 125:47]
  wire [286:0] _GEN_0 = {{255'd0}, rs2}; // @[Datapath.scala 128:34]
  wire [286:0] _io_dcache_req_bits_data_T = _GEN_0 << woffset; // @[Datapath.scala 128:34]
  wire [1:0] _io_dcache_req_bits_mask_T = stall ? st_type : io_ctrl_st_type; // @[Datapath.scala 130:8]
  wire [4:0] _io_dcache_req_bits_mask_T_2 = 5'h3 << alu_io_sum[1:0]; // @[Datapath.scala 132:47]
  wire [3:0] _io_dcache_req_bits_mask_T_4 = 4'h1 << alu_io_sum[1:0]; // @[Datapath.scala 132:86]
  wire [3:0] _io_dcache_req_bits_mask_T_6 = 2'h1 == _io_dcache_req_bits_mask_T ? 4'hf : 4'h0; // @[Mux.scala 81:58]
  wire [4:0] _io_dcache_req_bits_mask_T_8 = 2'h2 == _io_dcache_req_bits_mask_T ? _io_dcache_req_bits_mask_T_2 : {{1
    'd0}, _io_dcache_req_bits_mask_T_6}; // @[Mux.scala 81:58]
  wire [4:0] _io_dcache_req_bits_mask_T_10 = 2'h3 == _io_dcache_req_bits_mask_T ? {{1'd0}, _io_dcache_req_bits_mask_T_4}
     : _io_dcache_req_bits_mask_T_8; // @[Mux.scala 81:58]
  wire  _T_6 = ~csr_io_expt; // @[Datapath.scala 143:24]
  wire [4:0] _GEN_29 = {ew_alu[1], 4'h0}; // @[Datapath.scala 158:28]
  wire [7:0] _loffset_T_1 = {{3'd0}, _GEN_29}; // @[Datapath.scala 158:28]
  wire [3:0] _loffset_T_3 = {ew_alu[0], 3'h0}; // @[Datapath.scala 158:56]
  wire [7:0] _GEN_30 = {{4'd0}, _loffset_T_3}; // @[Datapath.scala 158:43]
  wire [7:0] loffset = _loffset_T_1 | _GEN_30; // @[Datapath.scala 158:43]
  wire [31:0] lshift = io_dcache_resp_bits_data >> loffset; // @[Datapath.scala 159:41]
  wire [32:0] _load_T = {1'b0,$signed(io_dcache_resp_bits_data)}; // @[Datapath.scala 162:30]
  wire [15:0] _load_T_2 = lshift[15:0]; // @[Datapath.scala 164:30]
  wire [7:0] _load_T_4 = lshift[7:0]; // @[Datapath.scala 165:29]
  wire [16:0] _load_T_6 = {1'b0,$signed(lshift[15:0])}; // @[Datapath.scala 166:31]
  wire [8:0] _load_T_8 = {1'b0,$signed(lshift[7:0])}; // @[Datapath.scala 167:30]
  wire [32:0] _load_T_10 = 3'h2 == ld_type ? $signed({{17{_load_T_2[15]}},_load_T_2}) : $signed(_load_T); // @[Mux.scala 81:58]
  wire [32:0] _load_T_12 = 3'h3 == ld_type ? $signed({{25{_load_T_4[7]}},_load_T_4}) : $signed(_load_T_10); // @[Mux.scala 81:58]
  wire [32:0] _load_T_14 = 3'h4 == ld_type ? $signed({{16{_load_T_6[16]}},_load_T_6}) : $signed(_load_T_12); // @[Mux.scala 81:58]
  wire [32:0] load = 3'h5 == ld_type ? $signed({{24{_load_T_8[8]}},_load_T_8}) : $signed(_load_T_14); // @[Mux.scala 81:58]
  wire [32:0] _regWrite_T = {1'b0,$signed(ew_alu)}; // @[Datapath.scala 186:30]
  wire [32:0] _regWrite_T_2 = ew_pc + 33'h4; // @[Datapath.scala 186:73]
  wire [33:0] _regWrite_T_3 = {1'b0,$signed(_regWrite_T_2)}; // @[Datapath.scala 186:80]
  wire [32:0] _regWrite_T_4 = {1'b0,$signed(csr_io_out)}; // @[Datapath.scala 186:107]
  wire [32:0] _regWrite_T_6 = 2'h1 == wb_sel ? $signed(load) : $signed(_regWrite_T); // @[Mux.scala 81:58]
  wire [33:0] _regWrite_T_8 = 2'h2 == wb_sel ? $signed(_regWrite_T_3) : $signed({{1{_regWrite_T_6[32]}},_regWrite_T_6}); // @[Mux.scala 81:58]
  wire [33:0] regWrite = 2'h3 == wb_sel ? $signed({{1{_regWrite_T_4[32]}},_regWrite_T_4}) : $signed(_regWrite_T_8); // @[Datapath.scala 186:114]
  CSR csr ( // @[Datapath.scala 23:19]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_stall(csr_io_stall),
    .io_cmd(csr_io_cmd),
    .io_in(csr_io_in),
    .io_out(csr_io_out),
    .io_pc(csr_io_pc),
    .io_addr(csr_io_addr),
    .io_inst(csr_io_inst),
    .io_illegal(csr_io_illegal),
    .io_st_type(csr_io_st_type),
    .io_ld_type(csr_io_ld_type),
    .io_pc_check(csr_io_pc_check),
    .io_expt(csr_io_expt),
    .io_evec(csr_io_evec),
    .io_epc(csr_io_epc),
    .io_host_fromhost_valid(csr_io_host_fromhost_valid),
    .io_host_fromhost_bits(csr_io_host_fromhost_bits),
    .io_host_tohost(csr_io_host_tohost)
  );
  RegFile regFile ( // @[Datapath.scala 24:23]
    .clock(regFile_clock),
    .io_raddr1(regFile_io_raddr1),
    .io_raddr2(regFile_io_raddr2),
    .io_rdata1(regFile_io_rdata1),
    .io_rdata2(regFile_io_rdata2),
    .io_wen(regFile_io_wen),
    .io_waddr(regFile_io_waddr),
    .io_wdata(regFile_io_wdata)
  );
  ALUArea alu ( // @[Config.scala 14:52]
    .io_A(alu_io_A),
    .io_B(alu_io_B),
    .io_alu_op(alu_io_alu_op),
    .io_out(alu_io_out),
    .io_sum(alu_io_sum)
  );
  ImmGenWire immGen ( // @[Config.scala 15:52]
    .io_inst(immGen_io_inst),
    .io_sel(immGen_io_sel),
    .io_out(immGen_io_out)
  );
  BrCondArea brCond ( // @[Config.scala 16:52]
    .io_rs1(brCond_io_rs1),
    .io_rs2(brCond_io_rs2),
    .io_br_type(brCond_io_br_type),
    .io_taken(brCond_io_taken)
  );
  assign io_host_tohost = csr_io_host_tohost; // @[Datapath.scala 182:11]
  assign io_icache_req_valid = ~stall; // @[Datapath.scala 81:26]
  assign io_icache_req_bits_addr = npc[31:0]; // @[Datapath.scala 78:27]
  assign io_dcache_abort = csr_io_expt; // @[Datapath.scala 193:19]
  assign io_dcache_req_valid = _io_icache_req_valid_T & (|io_ctrl_st_type | |io_ctrl_ld_type); // @[Datapath.scala 126:33]
  assign io_dcache_req_bits_addr = daddr[31:0]; // @[Datapath.scala 127:27]
  assign io_dcache_req_bits_data = _io_dcache_req_bits_data_T[31:0]; // @[Datapath.scala 128:27]
  assign io_dcache_req_bits_mask = _io_dcache_req_bits_mask_T_10[3:0]; // @[Datapath.scala 129:27]
  assign io_ctrl_inst = fe_inst; // @[Datapath.scala 93:16]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_stall = ~io_icache_resp_valid | ~io_dcache_resp_valid; // @[Datapath.scala 56:37]
  assign csr_io_cmd = csr_cmd; // @[Datapath.scala 174:14]
  assign csr_io_in = csr_in; // @[Datapath.scala 173:13]
  assign csr_io_pc = ew_pc[31:0]; // @[Datapath.scala 176:13]
  assign csr_io_addr = ew_alu; // @[Datapath.scala 177:15]
  assign csr_io_inst = ew_inst; // @[Datapath.scala 175:15]
  assign csr_io_illegal = illegal; // @[Datapath.scala 178:18]
  assign csr_io_st_type = st_type; // @[Datapath.scala 181:18]
  assign csr_io_ld_type = ld_type; // @[Datapath.scala 180:18]
  assign csr_io_pc_check = pc_check; // @[Datapath.scala 179:19]
  assign csr_io_host_fromhost_valid = io_host_fromhost_valid; // @[Datapath.scala 182:11]
  assign csr_io_host_fromhost_bits = io_host_fromhost_bits; // @[Datapath.scala 182:11]
  assign regFile_clock = clock;
  assign regFile_io_raddr1 = fe_inst[19:15]; // @[Datapath.scala 97:25]
  assign regFile_io_raddr2 = fe_inst[24:20]; // @[Datapath.scala 98:25]
  assign regFile_io_wen = wb_en & _io_icache_req_valid_T & _T_6; // @[Datapath.scala 188:37]
  assign regFile_io_waddr = ew_inst[11:7]; // @[Datapath.scala 107:27]
  assign regFile_io_wdata = regWrite[31:0]; // @[Datapath.scala 190:20]
  assign alu_io_A = _alu_io_A_T_1[31:0]; // @[Datapath.scala 114:12]
  assign alu_io_B = io_ctrl_B_sel ? rs2 : immGen_io_out; // @[Datapath.scala 115:18]
  assign alu_io_alu_op = io_ctrl_alu_op; // @[Datapath.scala 116:17]
  assign immGen_io_inst = fe_inst; // @[Datapath.scala 103:18]
  assign immGen_io_sel = io_ctrl_imm_sel; // @[Datapath.scala 104:17]
  assign brCond_io_rs1 = wb_sel == 2'h0 & rs1hazard ? ew_alu : regFile_io_rdata1; // @[Datapath.scala 110:16]
  assign brCond_io_rs2 = _rs1_T & rs2hazard ? ew_alu : regFile_io_rdata2; // @[Datapath.scala 111:16]
  assign brCond_io_br_type = io_ctrl_br_type; // @[Datapath.scala 121:21]
  always @(posedge clock) begin
    if (reset) begin // @[Datapath.scala 33:24]
      fe_inst <= 32'h13; // @[Datapath.scala 33:24]
    end else if (_io_icache_req_valid_T) begin // @[Datapath.scala 85:16]
      if (started | io_ctrl_inst_kill | brCond_io_taken | csr_io_expt) begin // @[Datapath.scala 76:8]
        fe_inst <= 32'h13;
      end else begin
        fe_inst <= io_icache_resp_bits_data;
      end
    end
    if (_io_icache_req_valid_T) begin // @[Datapath.scala 85:16]
      fe_pc <= pc; // @[Datapath.scala 86:11]
    end
    if (reset) begin // @[Datapath.scala 38:24]
      ew_inst <= 32'h13; // @[Datapath.scala 38:24]
    end else if (!(reset | _io_icache_req_valid_T & csr_io_expt)) begin // @[Datapath.scala 136:47]
      if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 143:38]
        ew_inst <= fe_inst; // @[Datapath.scala 145:13]
      end
    end
    if (!(reset | _io_icache_req_valid_T & csr_io_expt)) begin // @[Datapath.scala 136:47]
      if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 143:38]
        ew_pc <= fe_pc; // @[Datapath.scala 144:11]
      end
    end
    if (!(reset | _io_icache_req_valid_T & csr_io_expt)) begin // @[Datapath.scala 136:47]
      if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 143:38]
        ew_alu <= alu_io_out; // @[Datapath.scala 146:12]
      end
    end
    if (!(reset | _io_icache_req_valid_T & csr_io_expt)) begin // @[Datapath.scala 136:47]
      if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 143:38]
        if (io_ctrl_imm_sel == 3'h6) begin // @[Datapath.scala 147:18]
          csr_in <= immGen_io_out;
        end else if (wb_sel == 2'h0 & rs1hazard) begin // @[Datapath.scala 110:16]
          csr_in <= ew_alu;
        end else begin
          csr_in <= regFile_io_rdata1;
        end
      end
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 136:47]
      st_type <= 2'h0; // @[Datapath.scala 137:13]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 143:38]
      st_type <= io_ctrl_st_type; // @[Datapath.scala 148:13]
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 136:47]
      ld_type <= 3'h0; // @[Datapath.scala 138:13]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 143:38]
      ld_type <= io_ctrl_ld_type; // @[Datapath.scala 149:13]
    end
    if (!(reset | _io_icache_req_valid_T & csr_io_expt)) begin // @[Datapath.scala 136:47]
      if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 143:38]
        wb_sel <= io_ctrl_wb_sel; // @[Datapath.scala 150:12]
      end
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 136:47]
      wb_en <= 1'h0; // @[Datapath.scala 139:11]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 143:38]
      wb_en <= io_ctrl_wb_en; // @[Datapath.scala 151:11]
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 136:47]
      csr_cmd <= 3'h0; // @[Datapath.scala 140:13]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 143:38]
      csr_cmd <= io_ctrl_csr_cmd; // @[Datapath.scala 152:13]
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 136:47]
      illegal <= 1'h0; // @[Datapath.scala 141:13]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 143:38]
      illegal <= io_ctrl_illegal; // @[Datapath.scala 153:13]
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 136:47]
      pc_check <= 1'h0; // @[Datapath.scala 142:14]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 143:38]
      pc_check <= _npc_T_1; // @[Datapath.scala 154:14]
    end
    started <= reset; // @[Datapath.scala 55:31]
    if (reset) begin // @[Datapath.scala 57:19]
      pc <= {{1'd0}, _pc_T_1}; // @[Datapath.scala 57:19]
    end else if (!(stall)) begin // @[Datapath.scala 58:16]
      if (csr_io_expt) begin // @[Datapath.scala 61:8]
        pc <= {{1'd0}, csr_io_evec};
      end else if (_npc_T) begin // @[Datapath.scala 64:10]
        pc <= {{1'd0}, csr_io_epc};
      end else begin
        pc <= _npc_T_9;
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  fe_inst = _RAND_0[31:0];
  _RAND_1 = {2{`RANDOM}};
  fe_pc = _RAND_1[32:0];
  _RAND_2 = {1{`RANDOM}};
  ew_inst = _RAND_2[31:0];
  _RAND_3 = {2{`RANDOM}};
  ew_pc = _RAND_3[32:0];
  _RAND_4 = {1{`RANDOM}};
  ew_alu = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  csr_in = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  st_type = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  ld_type = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  wb_sel = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  wb_en = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  csr_cmd = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  illegal = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  pc_check = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  started = _RAND_13[0:0];
  _RAND_14 = {2{`RANDOM}};
  pc = _RAND_14[32:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
