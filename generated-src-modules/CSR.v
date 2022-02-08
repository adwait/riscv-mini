module CSR(
  input         clock,
  input         reset,
  input         io_stall,
  input  [2:0]  io_cmd,
  input  [31:0] io_in,
  output [31:0] io_out,
  input  [31:0] io_pc,
  input  [31:0] io_addr,
  input  [31:0] io_inst,
  input         io_illegal,
  input  [1:0]  io_st_type,
  input  [2:0]  io_ld_type,
  input         io_pc_check,
  output        io_expt,
  output [31:0] io_evec,
  output [31:0] io_epc,
  input         io_host_fromhost_valid,
  input  [31:0] io_host_fromhost_bits,
  output [31:0] io_host_tohost
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
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
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
`endif // RANDOMIZE_REG_INIT
  wire [11:0] csr_addr = io_inst[31:20]; // @[CSR.scala 125:25]
  wire [4:0] rs1_addr = io_inst[19:15]; // @[CSR.scala 126:25]
  reg [31:0] time_; // @[CSR.scala 129:21]
  reg [31:0] timeh; // @[CSR.scala 130:22]
  reg [31:0] cycle; // @[CSR.scala 131:22]
  reg [31:0] cycleh; // @[CSR.scala 132:23]
  reg [31:0] instret; // @[CSR.scala 133:24]
  reg [31:0] instreth; // @[CSR.scala 134:25]
  reg [1:0] PRV; // @[CSR.scala 146:20]
  reg [1:0] PRV1; // @[CSR.scala 147:21]
  reg  IE; // @[CSR.scala 150:19]
  reg  IE1; // @[CSR.scala 151:20]
  wire [31:0] mstatus = {22'h0,3'h0,1'h0,PRV1,IE1,PRV,IE}; // @[Cat.scala 31:58]
  reg  MTIP; // @[CSR.scala 167:21]
  reg  MTIE; // @[CSR.scala 170:21]
  reg  MSIP; // @[CSR.scala 173:21]
  reg  MSIE; // @[CSR.scala 176:21]
  wire [31:0] mip = {24'h0,MTIP,1'h0,2'h0,MSIP,1'h0,2'h0}; // @[Cat.scala 31:58]
  wire [31:0] mie = {24'h0,MTIE,1'h0,2'h0,MSIE,1'h0,2'h0}; // @[Cat.scala 31:58]
  reg [31:0] mtimecmp; // @[CSR.scala 182:21]
  reg [31:0] mscratch; // @[CSR.scala 184:21]
  reg [31:0] mepc; // @[CSR.scala 186:17]
  reg [31:0] mcause; // @[CSR.scala 187:19]
  reg [31:0] mbadaddr; // @[CSR.scala 188:21]
  reg [31:0] mtohost; // @[CSR.scala 190:24]
  reg [31:0] mfromhost; // @[CSR.scala 191:22]
  wire [31:0] _GEN_0 = io_host_fromhost_valid ? io_host_fromhost_bits : mfromhost; // @[CSR.scala 193:32 194:15 191:22]
  wire  _io_out_T_1 = 12'hc00 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_3 = 12'hc01 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_5 = 12'hc02 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_7 = 12'hc80 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_9 = 12'hc81 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_11 = 12'hc82 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_13 = 12'h900 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_15 = 12'h901 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_17 = 12'h902 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_19 = 12'h980 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_21 = 12'h981 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_23 = 12'h982 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_25 = 12'hf00 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_27 = 12'hf01 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_29 = 12'hf10 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_31 = 12'h301 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_33 = 12'h302 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_35 = 12'h304 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_37 = 12'h321 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_39 = 12'h701 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_41 = 12'h741 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_43 = 12'h340 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_45 = 12'h341 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_47 = 12'h342 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_49 = 12'h343 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_51 = 12'h344 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_53 = 12'h780 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_55 = 12'h781 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_out_T_57 = 12'h300 == csr_addr; // @[Lookup.scala 31:38]
  wire [31:0] _io_out_T_58 = _io_out_T_57 ? mstatus : 32'h0; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_59 = _io_out_T_55 ? mfromhost : _io_out_T_58; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_60 = _io_out_T_53 ? mtohost : _io_out_T_59; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_61 = _io_out_T_51 ? mip : _io_out_T_60; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_62 = _io_out_T_49 ? mbadaddr : _io_out_T_61; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_63 = _io_out_T_47 ? mcause : _io_out_T_62; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_64 = _io_out_T_45 ? mepc : _io_out_T_63; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_65 = _io_out_T_43 ? mscratch : _io_out_T_64; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_66 = _io_out_T_41 ? timeh : _io_out_T_65; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_67 = _io_out_T_39 ? time_ : _io_out_T_66; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_68 = _io_out_T_37 ? mtimecmp : _io_out_T_67; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_69 = _io_out_T_35 ? mie : _io_out_T_68; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_70 = _io_out_T_33 ? 32'h0 : _io_out_T_69; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_71 = _io_out_T_31 ? 32'h100 : _io_out_T_70; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_72 = _io_out_T_29 ? 32'h0 : _io_out_T_71; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_73 = _io_out_T_27 ? 32'h0 : _io_out_T_72; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_74 = _io_out_T_25 ? 32'h100100 : _io_out_T_73; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_75 = _io_out_T_23 ? instreth : _io_out_T_74; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_76 = _io_out_T_21 ? timeh : _io_out_T_75; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_77 = _io_out_T_19 ? cycleh : _io_out_T_76; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_78 = _io_out_T_17 ? instret : _io_out_T_77; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_79 = _io_out_T_15 ? time_ : _io_out_T_78; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_80 = _io_out_T_13 ? cycle : _io_out_T_79; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_81 = _io_out_T_11 ? instreth : _io_out_T_80; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_82 = _io_out_T_9 ? timeh : _io_out_T_81; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_83 = _io_out_T_7 ? cycleh : _io_out_T_82; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_84 = _io_out_T_5 ? instret : _io_out_T_83; // @[Lookup.scala 34:39]
  wire [31:0] _io_out_T_85 = _io_out_T_3 ? time_ : _io_out_T_84; // @[Lookup.scala 34:39]
  wire  privValid = csr_addr[9:8] <= PRV; // @[CSR.scala 231:34]
  wire  privInst = io_cmd == 3'h4; // @[CSR.scala 232:25]
  wire  _isEcall_T_2 = privInst & ~csr_addr[0]; // @[CSR.scala 233:26]
  wire  _isEcall_T_4 = ~csr_addr[8]; // @[CSR.scala 233:45]
  wire  isEcall = privInst & ~csr_addr[0] & ~csr_addr[8]; // @[CSR.scala 233:42]
  wire  isEbreak = privInst & csr_addr[0] & _isEcall_T_4; // @[CSR.scala 234:42]
  wire  isEret = _isEcall_T_2 & csr_addr[8]; // @[CSR.scala 235:41]
  wire  csrValid = _io_out_T_1 | _io_out_T_3 | _io_out_T_5 | _io_out_T_7 | _io_out_T_9 | _io_out_T_11 | _io_out_T_13 |
    _io_out_T_15 | _io_out_T_17 | _io_out_T_19 | _io_out_T_21 | _io_out_T_23 | _io_out_T_25 | _io_out_T_27 |
    _io_out_T_29 | _io_out_T_31 | _io_out_T_33 | _io_out_T_35 | _io_out_T_37 | _io_out_T_39 | _io_out_T_41 |
    _io_out_T_43 | _io_out_T_45 | _io_out_T_47 | _io_out_T_49 | _io_out_T_51 | _io_out_T_53 | _io_out_T_55 |
    _io_out_T_57; // @[CSR.scala 236:58]
  wire  csrRO = &csr_addr[11:10] | csr_addr == 12'h301 | csr_addr == 12'h302; // @[CSR.scala 237:63]
  wire  wen = io_cmd == 3'h1 | io_cmd[1] & |rs1_addr; // @[CSR.scala 238:30]
  wire [31:0] _wdata_T = io_out | io_in; // @[CSR.scala 244:24]
  wire [31:0] _wdata_T_1 = ~io_in; // @[CSR.scala 245:26]
  wire [31:0] _wdata_T_2 = io_out & _wdata_T_1; // @[CSR.scala 245:24]
  wire [31:0] _wdata_T_4 = 3'h1 == io_cmd ? io_in : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _wdata_T_6 = 3'h2 == io_cmd ? _wdata_T : _wdata_T_4; // @[Mux.scala 81:58]
  wire [31:0] wdata = 3'h3 == io_cmd ? _wdata_T_2 : _wdata_T_6; // @[Mux.scala 81:58]
  wire  iaddrInvalid = io_pc_check & io_addr[1]; // @[CSR.scala 248:34]
  wire  _laddrInvalid_T_1 = |io_addr[1:0]; // @[CSR.scala 252:40]
  wire  _laddrInvalid_T_7 = 3'h2 == io_ld_type ? io_addr[0] : 3'h1 == io_ld_type & _laddrInvalid_T_1; // @[Mux.scala 81:58]
  wire  laddrInvalid = 3'h4 == io_ld_type ? io_addr[0] : _laddrInvalid_T_7; // @[Mux.scala 81:58]
  wire  saddrInvalid = 2'h2 == io_st_type ? io_addr[0] : 2'h1 == io_st_type & _laddrInvalid_T_1; // @[Mux.scala 81:58]
  wire  _io_expt_T_6 = ~privValid; // @[CSR.scala 257:39]
  wire  _io_expt_T_8 = |io_cmd[1:0] & (~csrValid | ~privValid); // @[CSR.scala 257:22]
  wire  _io_expt_T_9 = io_illegal | iaddrInvalid | laddrInvalid | saddrInvalid | _io_expt_T_8; // @[CSR.scala 256:73]
  wire  _io_expt_T_13 = privInst & _io_expt_T_6; // @[CSR.scala 258:15]
  wire  _io_expt_T_14 = _io_expt_T_9 | wen & csrRO | _io_expt_T_13; // @[CSR.scala 257:67]
  wire [7:0] _io_evec_T = {PRV, 6'h0}; // @[CSR.scala 259:27]
  wire [31:0] _GEN_260 = {{24'd0}, _io_evec_T}; // @[CSR.scala 259:20]
  wire [31:0] _time_T_1 = time_ + 32'h1; // @[CSR.scala 263:16]
  wire [31:0] _timeh_T_1 = timeh + 32'h1; // @[CSR.scala 264:36]
  wire [31:0] _GEN_1 = &time_ ? _timeh_T_1 : timeh; // @[CSR.scala 264:19 130:22 264:27]
  wire [31:0] _cycle_T_1 = cycle + 32'h1; // @[CSR.scala 265:18]
  wire [31:0] _cycleh_T_1 = cycleh + 32'h1; // @[CSR.scala 266:39]
  wire [31:0] _GEN_2 = &cycle ? _cycleh_T_1 : cycleh; // @[CSR.scala 266:20 132:23 266:29]
  wire  _isInstRet_T_5 = ~io_stall; // @[CSR.scala 267:88]
  wire  isInstRet = io_inst != 32'h13 & (~io_expt | isEcall | isEbreak) & ~io_stall; // @[CSR.scala 267:85]
  wire [31:0] _instret_T_1 = instret + 32'h1; // @[CSR.scala 268:40]
  wire [31:0] _GEN_3 = isInstRet ? _instret_T_1 : instret; // @[CSR.scala 268:19 133:24 268:29]
  wire [31:0] _instreth_T_1 = instreth + 32'h1; // @[CSR.scala 269:58]
  wire [31:0] _GEN_4 = isInstRet & &instret ? _instreth_T_1 : instreth; // @[CSR.scala 134:25 269:{35,46}]
  wire [31:0] _mepc_T_1 = {io_pc[31:2], 2'h0}; // @[CSR.scala 273:26]
  wire [3:0] _GEN_261 = {{2'd0}, PRV}; // @[CSR.scala 283:38]
  wire [3:0] _mcause_T_1 = 4'h8 + _GEN_261; // @[CSR.scala 283:38]
  wire [1:0] _mcause_T_2 = isEbreak ? 2'h3 : 2'h2; // @[CSR.scala 283:48]
  wire [3:0] _mcause_T_3 = isEcall ? _mcause_T_1 : {{2'd0}, _mcause_T_2}; // @[CSR.scala 283:16]
  wire [3:0] _mcause_T_4 = saddrInvalid ? 4'h6 : _mcause_T_3; // @[CSR.scala 280:14]
  wire [3:0] _mcause_T_5 = laddrInvalid ? 4'h4 : _mcause_T_4; // @[CSR.scala 277:12]
  wire [3:0] _mcause_T_6 = iaddrInvalid ? 4'h0 : _mcause_T_5; // @[CSR.scala 274:20]
  wire [31:0] _mepc_T_2 = {{2'd0}, wdata[31:2]}; // @[CSR.scala 316:58]
  wire [33:0] _GEN_263 = {_mepc_T_2, 2'h0}; // @[CSR.scala 316:65]
  wire [34:0] _mepc_T_3 = {{1'd0}, _GEN_263}; // @[CSR.scala 316:65]
  wire [31:0] _mcause_T_7 = wdata & 32'h8000000f; // @[CSR.scala 317:62]
  wire [31:0] _GEN_6 = csr_addr == 12'h982 ? wdata : _GEN_4; // @[CSR.scala 326:{47,58}]
  wire [31:0] _GEN_7 = csr_addr == 12'h981 ? wdata : _GEN_1; // @[CSR.scala 325:{44,52}]
  wire [31:0] _GEN_8 = csr_addr == 12'h981 ? _GEN_4 : _GEN_6; // @[CSR.scala 325:44]
  wire [31:0] _GEN_9 = csr_addr == 12'h980 ? wdata : _GEN_2; // @[CSR.scala 324:{45,54}]
  wire [31:0] _GEN_10 = csr_addr == 12'h980 ? _GEN_1 : _GEN_7; // @[CSR.scala 324:45]
  wire [31:0] _GEN_11 = csr_addr == 12'h980 ? _GEN_4 : _GEN_8; // @[CSR.scala 324:45]
  wire [31:0] _GEN_12 = csr_addr == 12'h902 ? wdata : _GEN_3; // @[CSR.scala 323:{46,56}]
  wire [31:0] _GEN_13 = csr_addr == 12'h902 ? _GEN_2 : _GEN_9; // @[CSR.scala 323:46]
  wire [31:0] _GEN_14 = csr_addr == 12'h902 ? _GEN_1 : _GEN_10; // @[CSR.scala 323:46]
  wire [31:0] _GEN_15 = csr_addr == 12'h902 ? _GEN_4 : _GEN_11; // @[CSR.scala 323:46]
  wire [31:0] _GEN_16 = csr_addr == 12'h901 ? wdata : _time_T_1; // @[CSR.scala 322:{43,50} 263:8]
  wire [31:0] _GEN_17 = csr_addr == 12'h901 ? _GEN_3 : _GEN_12; // @[CSR.scala 322:43]
  wire [31:0] _GEN_18 = csr_addr == 12'h901 ? _GEN_2 : _GEN_13; // @[CSR.scala 322:43]
  wire [31:0] _GEN_19 = csr_addr == 12'h901 ? _GEN_1 : _GEN_14; // @[CSR.scala 322:43]
  wire [31:0] _GEN_20 = csr_addr == 12'h901 ? _GEN_4 : _GEN_15; // @[CSR.scala 322:43]
  wire [31:0] _GEN_21 = csr_addr == 12'h900 ? wdata : _cycle_T_1; // @[CSR.scala 321:{44,52} 265:9]
  wire [31:0] _GEN_22 = csr_addr == 12'h900 ? _time_T_1 : _GEN_16; // @[CSR.scala 321:44 263:8]
  wire [31:0] _GEN_23 = csr_addr == 12'h900 ? _GEN_3 : _GEN_17; // @[CSR.scala 321:44]
  wire [31:0] _GEN_24 = csr_addr == 12'h900 ? _GEN_2 : _GEN_18; // @[CSR.scala 321:44]
  wire [31:0] _GEN_25 = csr_addr == 12'h900 ? _GEN_1 : _GEN_19; // @[CSR.scala 321:44]
  wire [31:0] _GEN_26 = csr_addr == 12'h900 ? _GEN_4 : _GEN_20; // @[CSR.scala 321:44]
  wire [31:0] _GEN_27 = csr_addr == 12'h781 ? wdata : _GEN_0; // @[CSR.scala 320:{47,59}]
  wire [31:0] _GEN_28 = csr_addr == 12'h781 ? _cycle_T_1 : _GEN_21; // @[CSR.scala 320:47 265:9]
  wire [31:0] _GEN_29 = csr_addr == 12'h781 ? _time_T_1 : _GEN_22; // @[CSR.scala 320:47 263:8]
  wire [31:0] _GEN_30 = csr_addr == 12'h781 ? _GEN_3 : _GEN_23; // @[CSR.scala 320:47]
  wire [31:0] _GEN_31 = csr_addr == 12'h781 ? _GEN_2 : _GEN_24; // @[CSR.scala 320:47]
  wire [31:0] _GEN_32 = csr_addr == 12'h781 ? _GEN_1 : _GEN_25; // @[CSR.scala 320:47]
  wire [31:0] _GEN_33 = csr_addr == 12'h781 ? _GEN_4 : _GEN_26; // @[CSR.scala 320:47]
  wire [31:0] _GEN_34 = csr_addr == 12'h780 ? wdata : mtohost; // @[CSR.scala 190:24 319:{45,55}]
  wire [31:0] _GEN_35 = csr_addr == 12'h780 ? _GEN_0 : _GEN_27; // @[CSR.scala 319:45]
  wire [31:0] _GEN_36 = csr_addr == 12'h780 ? _cycle_T_1 : _GEN_28; // @[CSR.scala 319:45 265:9]
  wire [31:0] _GEN_37 = csr_addr == 12'h780 ? _time_T_1 : _GEN_29; // @[CSR.scala 319:45 263:8]
  wire [31:0] _GEN_38 = csr_addr == 12'h780 ? _GEN_3 : _GEN_30; // @[CSR.scala 319:45]
  wire [31:0] _GEN_39 = csr_addr == 12'h780 ? _GEN_2 : _GEN_31; // @[CSR.scala 319:45]
  wire [31:0] _GEN_40 = csr_addr == 12'h780 ? _GEN_1 : _GEN_32; // @[CSR.scala 319:45]
  wire [31:0] _GEN_41 = csr_addr == 12'h780 ? _GEN_4 : _GEN_33; // @[CSR.scala 319:45]
  wire [31:0] _GEN_42 = csr_addr == 12'h343 ? wdata : mbadaddr; // @[CSR.scala 188:21 318:{46,57}]
  wire [31:0] _GEN_43 = csr_addr == 12'h343 ? mtohost : _GEN_34; // @[CSR.scala 190:24 318:46]
  wire [31:0] _GEN_44 = csr_addr == 12'h343 ? _GEN_0 : _GEN_35; // @[CSR.scala 318:46]
  wire [31:0] _GEN_45 = csr_addr == 12'h343 ? _cycle_T_1 : _GEN_36; // @[CSR.scala 318:46 265:9]
  wire [31:0] _GEN_46 = csr_addr == 12'h343 ? _time_T_1 : _GEN_37; // @[CSR.scala 318:46 263:8]
  wire [31:0] _GEN_47 = csr_addr == 12'h343 ? _GEN_3 : _GEN_38; // @[CSR.scala 318:46]
  wire [31:0] _GEN_48 = csr_addr == 12'h343 ? _GEN_2 : _GEN_39; // @[CSR.scala 318:46]
  wire [31:0] _GEN_49 = csr_addr == 12'h343 ? _GEN_1 : _GEN_40; // @[CSR.scala 318:46]
  wire [31:0] _GEN_50 = csr_addr == 12'h343 ? _GEN_4 : _GEN_41; // @[CSR.scala 318:46]
  wire [31:0] _GEN_51 = csr_addr == 12'h342 ? _mcause_T_7 : mcause; // @[CSR.scala 187:19 317:{44,53}]
  wire [31:0] _GEN_52 = csr_addr == 12'h342 ? mbadaddr : _GEN_42; // @[CSR.scala 188:21 317:44]
  wire [31:0] _GEN_53 = csr_addr == 12'h342 ? mtohost : _GEN_43; // @[CSR.scala 190:24 317:44]
  wire [31:0] _GEN_54 = csr_addr == 12'h342 ? _GEN_0 : _GEN_44; // @[CSR.scala 317:44]
  wire [31:0] _GEN_55 = csr_addr == 12'h342 ? _cycle_T_1 : _GEN_45; // @[CSR.scala 317:44 265:9]
  wire [31:0] _GEN_56 = csr_addr == 12'h342 ? _time_T_1 : _GEN_46; // @[CSR.scala 317:44 263:8]
  wire [31:0] _GEN_57 = csr_addr == 12'h342 ? _GEN_3 : _GEN_47; // @[CSR.scala 317:44]
  wire [31:0] _GEN_58 = csr_addr == 12'h342 ? _GEN_2 : _GEN_48; // @[CSR.scala 317:44]
  wire [31:0] _GEN_59 = csr_addr == 12'h342 ? _GEN_1 : _GEN_49; // @[CSR.scala 317:44]
  wire [31:0] _GEN_60 = csr_addr == 12'h342 ? _GEN_4 : _GEN_50; // @[CSR.scala 317:44]
  wire [34:0] _GEN_61 = csr_addr == 12'h341 ? _mepc_T_3 : {{3'd0}, mepc}; // @[CSR.scala 186:17 316:{42,49}]
  wire [31:0] _GEN_62 = csr_addr == 12'h341 ? mcause : _GEN_51; // @[CSR.scala 187:19 316:42]
  wire [31:0] _GEN_63 = csr_addr == 12'h341 ? mbadaddr : _GEN_52; // @[CSR.scala 188:21 316:42]
  wire [31:0] _GEN_64 = csr_addr == 12'h341 ? mtohost : _GEN_53; // @[CSR.scala 190:24 316:42]
  wire [31:0] _GEN_65 = csr_addr == 12'h341 ? _GEN_0 : _GEN_54; // @[CSR.scala 316:42]
  wire [31:0] _GEN_66 = csr_addr == 12'h341 ? _cycle_T_1 : _GEN_55; // @[CSR.scala 316:42 265:9]
  wire [31:0] _GEN_67 = csr_addr == 12'h341 ? _time_T_1 : _GEN_56; // @[CSR.scala 316:42 263:8]
  wire [31:0] _GEN_68 = csr_addr == 12'h341 ? _GEN_3 : _GEN_57; // @[CSR.scala 316:42]
  wire [31:0] _GEN_69 = csr_addr == 12'h341 ? _GEN_2 : _GEN_58; // @[CSR.scala 316:42]
  wire [31:0] _GEN_70 = csr_addr == 12'h341 ? _GEN_1 : _GEN_59; // @[CSR.scala 316:42]
  wire [31:0] _GEN_71 = csr_addr == 12'h341 ? _GEN_4 : _GEN_60; // @[CSR.scala 316:42]
  wire [31:0] _GEN_72 = csr_addr == 12'h340 ? wdata : mscratch; // @[CSR.scala 184:21 315:{46,57}]
  wire [34:0] _GEN_73 = csr_addr == 12'h340 ? {{3'd0}, mepc} : _GEN_61; // @[CSR.scala 186:17 315:46]
  wire [31:0] _GEN_74 = csr_addr == 12'h340 ? mcause : _GEN_62; // @[CSR.scala 187:19 315:46]
  wire [31:0] _GEN_75 = csr_addr == 12'h340 ? mbadaddr : _GEN_63; // @[CSR.scala 188:21 315:46]
  wire [31:0] _GEN_76 = csr_addr == 12'h340 ? mtohost : _GEN_64; // @[CSR.scala 190:24 315:46]
  wire [31:0] _GEN_77 = csr_addr == 12'h340 ? _GEN_0 : _GEN_65; // @[CSR.scala 315:46]
  wire [31:0] _GEN_78 = csr_addr == 12'h340 ? _cycle_T_1 : _GEN_66; // @[CSR.scala 315:46 265:9]
  wire [31:0] _GEN_79 = csr_addr == 12'h340 ? _time_T_1 : _GEN_67; // @[CSR.scala 315:46 263:8]
  wire [31:0] _GEN_80 = csr_addr == 12'h340 ? _GEN_3 : _GEN_68; // @[CSR.scala 315:46]
  wire [31:0] _GEN_81 = csr_addr == 12'h340 ? _GEN_2 : _GEN_69; // @[CSR.scala 315:46]
  wire [31:0] _GEN_82 = csr_addr == 12'h340 ? _GEN_1 : _GEN_70; // @[CSR.scala 315:46]
  wire [31:0] _GEN_83 = csr_addr == 12'h340 ? _GEN_4 : _GEN_71; // @[CSR.scala 315:46]
  wire [31:0] _GEN_84 = csr_addr == 12'h321 ? wdata : mtimecmp; // @[CSR.scala 182:21 314:{46,57}]
  wire [31:0] _GEN_85 = csr_addr == 12'h321 ? mscratch : _GEN_72; // @[CSR.scala 184:21 314:46]
  wire [34:0] _GEN_86 = csr_addr == 12'h321 ? {{3'd0}, mepc} : _GEN_73; // @[CSR.scala 186:17 314:46]
  wire [31:0] _GEN_87 = csr_addr == 12'h321 ? mcause : _GEN_74; // @[CSR.scala 187:19 314:46]
  wire [31:0] _GEN_88 = csr_addr == 12'h321 ? mbadaddr : _GEN_75; // @[CSR.scala 188:21 314:46]
  wire [31:0] _GEN_89 = csr_addr == 12'h321 ? mtohost : _GEN_76; // @[CSR.scala 190:24 314:46]
  wire [31:0] _GEN_90 = csr_addr == 12'h321 ? _GEN_0 : _GEN_77; // @[CSR.scala 314:46]
  wire [31:0] _GEN_91 = csr_addr == 12'h321 ? _cycle_T_1 : _GEN_78; // @[CSR.scala 314:46 265:9]
  wire [31:0] _GEN_92 = csr_addr == 12'h321 ? _time_T_1 : _GEN_79; // @[CSR.scala 314:46 263:8]
  wire [31:0] _GEN_93 = csr_addr == 12'h321 ? _GEN_3 : _GEN_80; // @[CSR.scala 314:46]
  wire [31:0] _GEN_94 = csr_addr == 12'h321 ? _GEN_2 : _GEN_81; // @[CSR.scala 314:46]
  wire [31:0] _GEN_95 = csr_addr == 12'h321 ? _GEN_1 : _GEN_82; // @[CSR.scala 314:46]
  wire [31:0] _GEN_96 = csr_addr == 12'h321 ? _GEN_4 : _GEN_83; // @[CSR.scala 314:46]
  wire [31:0] _GEN_97 = csr_addr == 12'h741 ? wdata : _GEN_95; // @[CSR.scala 313:{44,52}]
  wire [31:0] _GEN_98 = csr_addr == 12'h741 ? mtimecmp : _GEN_84; // @[CSR.scala 182:21 313:44]
  wire [31:0] _GEN_99 = csr_addr == 12'h741 ? mscratch : _GEN_85; // @[CSR.scala 184:21 313:44]
  wire [34:0] _GEN_100 = csr_addr == 12'h741 ? {{3'd0}, mepc} : _GEN_86; // @[CSR.scala 186:17 313:44]
  wire [31:0] _GEN_101 = csr_addr == 12'h741 ? mcause : _GEN_87; // @[CSR.scala 187:19 313:44]
  wire [31:0] _GEN_102 = csr_addr == 12'h741 ? mbadaddr : _GEN_88; // @[CSR.scala 188:21 313:44]
  wire [31:0] _GEN_103 = csr_addr == 12'h741 ? mtohost : _GEN_89; // @[CSR.scala 190:24 313:44]
  wire [31:0] _GEN_104 = csr_addr == 12'h741 ? _GEN_0 : _GEN_90; // @[CSR.scala 313:44]
  wire [31:0] _GEN_105 = csr_addr == 12'h741 ? _cycle_T_1 : _GEN_91; // @[CSR.scala 313:44 265:9]
  wire [31:0] _GEN_106 = csr_addr == 12'h741 ? _time_T_1 : _GEN_92; // @[CSR.scala 313:44 263:8]
  wire [31:0] _GEN_107 = csr_addr == 12'h741 ? _GEN_3 : _GEN_93; // @[CSR.scala 313:44]
  wire [31:0] _GEN_108 = csr_addr == 12'h741 ? _GEN_2 : _GEN_94; // @[CSR.scala 313:44]
  wire [31:0] _GEN_109 = csr_addr == 12'h741 ? _GEN_4 : _GEN_96; // @[CSR.scala 313:44]
  wire [31:0] _GEN_110 = csr_addr == 12'h701 ? wdata : _GEN_106; // @[CSR.scala 312:{43,50}]
  wire [31:0] _GEN_111 = csr_addr == 12'h701 ? _GEN_1 : _GEN_97; // @[CSR.scala 312:43]
  wire [31:0] _GEN_112 = csr_addr == 12'h701 ? mtimecmp : _GEN_98; // @[CSR.scala 182:21 312:43]
  wire [31:0] _GEN_113 = csr_addr == 12'h701 ? mscratch : _GEN_99; // @[CSR.scala 184:21 312:43]
  wire [34:0] _GEN_114 = csr_addr == 12'h701 ? {{3'd0}, mepc} : _GEN_100; // @[CSR.scala 186:17 312:43]
  wire [31:0] _GEN_115 = csr_addr == 12'h701 ? mcause : _GEN_101; // @[CSR.scala 187:19 312:43]
  wire [31:0] _GEN_116 = csr_addr == 12'h701 ? mbadaddr : _GEN_102; // @[CSR.scala 188:21 312:43]
  wire [31:0] _GEN_117 = csr_addr == 12'h701 ? mtohost : _GEN_103; // @[CSR.scala 190:24 312:43]
  wire [31:0] _GEN_118 = csr_addr == 12'h701 ? _GEN_0 : _GEN_104; // @[CSR.scala 312:43]
  wire [31:0] _GEN_119 = csr_addr == 12'h701 ? _cycle_T_1 : _GEN_105; // @[CSR.scala 312:43 265:9]
  wire [31:0] _GEN_120 = csr_addr == 12'h701 ? _GEN_3 : _GEN_107; // @[CSR.scala 312:43]
  wire [31:0] _GEN_121 = csr_addr == 12'h701 ? _GEN_2 : _GEN_108; // @[CSR.scala 312:43]
  wire [31:0] _GEN_122 = csr_addr == 12'h701 ? _GEN_4 : _GEN_109; // @[CSR.scala 312:43]
  wire  _GEN_123 = csr_addr == 12'h304 ? wdata[7] : MTIE; // @[CSR.scala 308:41 309:16 170:21]
  wire  _GEN_124 = csr_addr == 12'h304 ? wdata[3] : MSIE; // @[CSR.scala 308:41 310:16 176:21]
  wire [31:0] _GEN_125 = csr_addr == 12'h304 ? _time_T_1 : _GEN_110; // @[CSR.scala 308:41 263:8]
  wire [31:0] _GEN_126 = csr_addr == 12'h304 ? _GEN_1 : _GEN_111; // @[CSR.scala 308:41]
  wire [31:0] _GEN_127 = csr_addr == 12'h304 ? mtimecmp : _GEN_112; // @[CSR.scala 182:21 308:41]
  wire [31:0] _GEN_128 = csr_addr == 12'h304 ? mscratch : _GEN_113; // @[CSR.scala 184:21 308:41]
  wire [34:0] _GEN_129 = csr_addr == 12'h304 ? {{3'd0}, mepc} : _GEN_114; // @[CSR.scala 186:17 308:41]
  wire [31:0] _GEN_130 = csr_addr == 12'h304 ? mcause : _GEN_115; // @[CSR.scala 187:19 308:41]
  wire [31:0] _GEN_131 = csr_addr == 12'h304 ? mbadaddr : _GEN_116; // @[CSR.scala 188:21 308:41]
  wire [31:0] _GEN_132 = csr_addr == 12'h304 ? mtohost : _GEN_117; // @[CSR.scala 190:24 308:41]
  wire [31:0] _GEN_133 = csr_addr == 12'h304 ? _GEN_0 : _GEN_118; // @[CSR.scala 308:41]
  wire [31:0] _GEN_134 = csr_addr == 12'h304 ? _cycle_T_1 : _GEN_119; // @[CSR.scala 308:41 265:9]
  wire [31:0] _GEN_135 = csr_addr == 12'h304 ? _GEN_3 : _GEN_120; // @[CSR.scala 308:41]
  wire [31:0] _GEN_136 = csr_addr == 12'h304 ? _GEN_2 : _GEN_121; // @[CSR.scala 308:41]
  wire [31:0] _GEN_137 = csr_addr == 12'h304 ? _GEN_4 : _GEN_122; // @[CSR.scala 308:41]
  wire  _GEN_138 = csr_addr == 12'h344 ? wdata[7] : MTIP; // @[CSR.scala 304:41 305:16 167:21]
  wire  _GEN_139 = csr_addr == 12'h344 ? wdata[3] : MSIP; // @[CSR.scala 304:41 306:16 173:21]
  wire  _GEN_140 = csr_addr == 12'h344 ? MTIE : _GEN_123; // @[CSR.scala 170:21 304:41]
  wire  _GEN_141 = csr_addr == 12'h344 ? MSIE : _GEN_124; // @[CSR.scala 176:21 304:41]
  wire [31:0] _GEN_142 = csr_addr == 12'h344 ? _time_T_1 : _GEN_125; // @[CSR.scala 304:41 263:8]
  wire [31:0] _GEN_143 = csr_addr == 12'h344 ? _GEN_1 : _GEN_126; // @[CSR.scala 304:41]
  wire [31:0] _GEN_144 = csr_addr == 12'h344 ? mtimecmp : _GEN_127; // @[CSR.scala 182:21 304:41]
  wire [31:0] _GEN_145 = csr_addr == 12'h344 ? mscratch : _GEN_128; // @[CSR.scala 184:21 304:41]
  wire [34:0] _GEN_146 = csr_addr == 12'h344 ? {{3'd0}, mepc} : _GEN_129; // @[CSR.scala 186:17 304:41]
  wire [31:0] _GEN_147 = csr_addr == 12'h344 ? mcause : _GEN_130; // @[CSR.scala 187:19 304:41]
  wire [31:0] _GEN_148 = csr_addr == 12'h344 ? mbadaddr : _GEN_131; // @[CSR.scala 188:21 304:41]
  wire [31:0] _GEN_149 = csr_addr == 12'h344 ? mtohost : _GEN_132; // @[CSR.scala 190:24 304:41]
  wire [31:0] _GEN_150 = csr_addr == 12'h344 ? _GEN_0 : _GEN_133; // @[CSR.scala 304:41]
  wire [31:0] _GEN_151 = csr_addr == 12'h344 ? _cycle_T_1 : _GEN_134; // @[CSR.scala 304:41 265:9]
  wire [31:0] _GEN_152 = csr_addr == 12'h344 ? _GEN_3 : _GEN_135; // @[CSR.scala 304:41]
  wire [31:0] _GEN_153 = csr_addr == 12'h344 ? _GEN_2 : _GEN_136; // @[CSR.scala 304:41]
  wire [31:0] _GEN_154 = csr_addr == 12'h344 ? _GEN_4 : _GEN_137; // @[CSR.scala 304:41]
  wire [1:0] _GEN_155 = csr_addr == 12'h300 ? wdata[5:4] : PRV1; // @[CSR.scala 298:38 299:14 147:21]
  wire  _GEN_156 = csr_addr == 12'h300 ? wdata[3] : IE1; // @[CSR.scala 298:38 300:13 151:20]
  wire [1:0] _GEN_157 = csr_addr == 12'h300 ? wdata[2:1] : PRV; // @[CSR.scala 298:38 301:13 146:20]
  wire  _GEN_158 = csr_addr == 12'h300 ? wdata[0] : IE; // @[CSR.scala 298:38 302:12 150:19]
  wire  _GEN_159 = csr_addr == 12'h300 ? MTIP : _GEN_138; // @[CSR.scala 167:21 298:38]
  wire  _GEN_160 = csr_addr == 12'h300 ? MSIP : _GEN_139; // @[CSR.scala 173:21 298:38]
  wire  _GEN_161 = csr_addr == 12'h300 ? MTIE : _GEN_140; // @[CSR.scala 170:21 298:38]
  wire  _GEN_162 = csr_addr == 12'h300 ? MSIE : _GEN_141; // @[CSR.scala 176:21 298:38]
  wire [31:0] _GEN_163 = csr_addr == 12'h300 ? _time_T_1 : _GEN_142; // @[CSR.scala 298:38 263:8]
  wire [31:0] _GEN_164 = csr_addr == 12'h300 ? _GEN_1 : _GEN_143; // @[CSR.scala 298:38]
  wire [31:0] _GEN_165 = csr_addr == 12'h300 ? mtimecmp : _GEN_144; // @[CSR.scala 182:21 298:38]
  wire [31:0] _GEN_166 = csr_addr == 12'h300 ? mscratch : _GEN_145; // @[CSR.scala 184:21 298:38]
  wire [34:0] _GEN_167 = csr_addr == 12'h300 ? {{3'd0}, mepc} : _GEN_146; // @[CSR.scala 186:17 298:38]
  wire [31:0] _GEN_168 = csr_addr == 12'h300 ? mcause : _GEN_147; // @[CSR.scala 187:19 298:38]
  wire [31:0] _GEN_169 = csr_addr == 12'h300 ? mbadaddr : _GEN_148; // @[CSR.scala 188:21 298:38]
  wire [31:0] _GEN_170 = csr_addr == 12'h300 ? mtohost : _GEN_149; // @[CSR.scala 190:24 298:38]
  wire [31:0] _GEN_171 = csr_addr == 12'h300 ? _GEN_0 : _GEN_150; // @[CSR.scala 298:38]
  wire [31:0] _GEN_172 = csr_addr == 12'h300 ? _cycle_T_1 : _GEN_151; // @[CSR.scala 298:38 265:9]
  wire [31:0] _GEN_173 = csr_addr == 12'h300 ? _GEN_3 : _GEN_152; // @[CSR.scala 298:38]
  wire [31:0] _GEN_174 = csr_addr == 12'h300 ? _GEN_2 : _GEN_153; // @[CSR.scala 298:38]
  wire [31:0] _GEN_175 = csr_addr == 12'h300 ? _GEN_4 : _GEN_154; // @[CSR.scala 298:38]
  wire [1:0] _GEN_176 = wen ? _GEN_155 : PRV1; // @[CSR.scala 147:21 297:21]
  wire  _GEN_177 = wen ? _GEN_156 : IE1; // @[CSR.scala 151:20 297:21]
  wire [1:0] _GEN_178 = wen ? _GEN_157 : PRV; // @[CSR.scala 146:20 297:21]
  wire  _GEN_179 = wen ? _GEN_158 : IE; // @[CSR.scala 150:19 297:21]
  wire  _GEN_180 = wen ? _GEN_159 : MTIP; // @[CSR.scala 167:21 297:21]
  wire  _GEN_181 = wen ? _GEN_160 : MSIP; // @[CSR.scala 173:21 297:21]
  wire  _GEN_182 = wen ? _GEN_161 : MTIE; // @[CSR.scala 170:21 297:21]
  wire  _GEN_183 = wen ? _GEN_162 : MSIE; // @[CSR.scala 176:21 297:21]
  wire [31:0] _GEN_184 = wen ? _GEN_163 : _time_T_1; // @[CSR.scala 297:21 263:8]
  wire [31:0] _GEN_185 = wen ? _GEN_164 : _GEN_1; // @[CSR.scala 297:21]
  wire [34:0] _GEN_188 = wen ? _GEN_167 : {{3'd0}, mepc}; // @[CSR.scala 186:17 297:21]
  wire [31:0] _GEN_191 = wen ? _GEN_170 : mtohost; // @[CSR.scala 297:21 190:24]
  wire [31:0] _GEN_193 = wen ? _GEN_172 : _cycle_T_1; // @[CSR.scala 297:21 265:9]
  wire [31:0] _GEN_194 = wen ? _GEN_173 : _GEN_3; // @[CSR.scala 297:21]
  wire [31:0] _GEN_195 = wen ? _GEN_174 : _GEN_2; // @[CSR.scala 297:21]
  wire [31:0] _GEN_196 = wen ? _GEN_175 : _GEN_4; // @[CSR.scala 297:21]
  wire  _GEN_200 = isEret | _GEN_177; // @[CSR.scala 292:24 296:11]
  wire [34:0] _GEN_209 = isEret ? {{3'd0}, mepc} : _GEN_188; // @[CSR.scala 186:17 292:24]
  wire [34:0] _GEN_218 = io_expt ? {{3'd0}, _mepc_T_1} : _GEN_209; // @[CSR.scala 272:19 273:12]
  wire [34:0] _GEN_239 = _isInstRet_T_5 ? _GEN_218 : {{3'd0}, mepc}; // @[CSR.scala 186:17 271:19]
  assign io_out = _io_out_T_1 ? cycle : _io_out_T_85; // @[Lookup.scala 34:39]
  assign io_expt = _io_expt_T_14 | isEcall | isEbreak; // @[CSR.scala 258:41]
  assign io_evec = 32'h100 + _GEN_260; // @[CSR.scala 259:20]
  assign io_epc = mepc; // @[CSR.scala 260:10]
  assign io_host_tohost = mtohost; // @[CSR.scala 192:18]
  always @(posedge clock) begin
    if (reset) begin // @[CSR.scala 129:21]
      time_ <= 32'h0; // @[CSR.scala 129:21]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (io_expt) begin // @[CSR.scala 272:19]
        time_ <= _time_T_1; // @[CSR.scala 263:8]
      end else if (isEret) begin // @[CSR.scala 292:24]
        time_ <= _time_T_1; // @[CSR.scala 263:8]
      end else begin
        time_ <= _GEN_184;
      end
    end else begin
      time_ <= _time_T_1; // @[CSR.scala 263:8]
    end
    if (reset) begin // @[CSR.scala 130:22]
      timeh <= 32'h0; // @[CSR.scala 130:22]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (io_expt) begin // @[CSR.scala 272:19]
        timeh <= _GEN_1;
      end else if (isEret) begin // @[CSR.scala 292:24]
        timeh <= _GEN_1;
      end else begin
        timeh <= _GEN_185;
      end
    end else begin
      timeh <= _GEN_1;
    end
    if (reset) begin // @[CSR.scala 131:22]
      cycle <= 32'h0; // @[CSR.scala 131:22]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (io_expt) begin // @[CSR.scala 272:19]
        cycle <= _cycle_T_1; // @[CSR.scala 265:9]
      end else if (isEret) begin // @[CSR.scala 292:24]
        cycle <= _cycle_T_1; // @[CSR.scala 265:9]
      end else begin
        cycle <= _GEN_193;
      end
    end else begin
      cycle <= _cycle_T_1; // @[CSR.scala 265:9]
    end
    if (reset) begin // @[CSR.scala 132:23]
      cycleh <= 32'h0; // @[CSR.scala 132:23]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (io_expt) begin // @[CSR.scala 272:19]
        cycleh <= _GEN_2;
      end else if (isEret) begin // @[CSR.scala 292:24]
        cycleh <= _GEN_2;
      end else begin
        cycleh <= _GEN_195;
      end
    end else begin
      cycleh <= _GEN_2;
    end
    if (reset) begin // @[CSR.scala 133:24]
      instret <= 32'h0; // @[CSR.scala 133:24]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (io_expt) begin // @[CSR.scala 272:19]
        instret <= _GEN_3;
      end else if (isEret) begin // @[CSR.scala 292:24]
        instret <= _GEN_3;
      end else begin
        instret <= _GEN_194;
      end
    end else begin
      instret <= _GEN_3;
    end
    if (reset) begin // @[CSR.scala 134:25]
      instreth <= 32'h0; // @[CSR.scala 134:25]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (io_expt) begin // @[CSR.scala 272:19]
        instreth <= _GEN_4;
      end else if (isEret) begin // @[CSR.scala 292:24]
        instreth <= _GEN_4;
      end else begin
        instreth <= _GEN_196;
      end
    end else begin
      instreth <= _GEN_4;
    end
    if (reset) begin // @[CSR.scala 146:20]
      PRV <= 2'h3; // @[CSR.scala 146:20]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (io_expt) begin // @[CSR.scala 272:19]
        PRV <= 2'h3; // @[CSR.scala 287:11]
      end else if (isEret) begin // @[CSR.scala 292:24]
        PRV <= PRV1; // @[CSR.scala 293:11]
      end else begin
        PRV <= _GEN_178;
      end
    end
    if (reset) begin // @[CSR.scala 147:21]
      PRV1 <= 2'h3; // @[CSR.scala 147:21]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (io_expt) begin // @[CSR.scala 272:19]
        PRV1 <= PRV; // @[CSR.scala 289:12]
      end else if (isEret) begin // @[CSR.scala 292:24]
        PRV1 <= 2'h0; // @[CSR.scala 295:12]
      end else begin
        PRV1 <= _GEN_176;
      end
    end
    if (reset) begin // @[CSR.scala 150:19]
      IE <= 1'h0; // @[CSR.scala 150:19]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (io_expt) begin // @[CSR.scala 272:19]
        IE <= 1'h0; // @[CSR.scala 288:10]
      end else if (isEret) begin // @[CSR.scala 292:24]
        IE <= IE1; // @[CSR.scala 294:10]
      end else begin
        IE <= _GEN_179;
      end
    end
    if (reset) begin // @[CSR.scala 151:20]
      IE1 <= 1'h0; // @[CSR.scala 151:20]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (io_expt) begin // @[CSR.scala 272:19]
        IE1 <= IE; // @[CSR.scala 290:11]
      end else begin
        IE1 <= _GEN_200;
      end
    end
    if (reset) begin // @[CSR.scala 167:21]
      MTIP <= 1'h0; // @[CSR.scala 167:21]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (!(io_expt)) begin // @[CSR.scala 272:19]
        if (!(isEret)) begin // @[CSR.scala 292:24]
          MTIP <= _GEN_180;
        end
      end
    end
    if (reset) begin // @[CSR.scala 170:21]
      MTIE <= 1'h0; // @[CSR.scala 170:21]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (!(io_expt)) begin // @[CSR.scala 272:19]
        if (!(isEret)) begin // @[CSR.scala 292:24]
          MTIE <= _GEN_182;
        end
      end
    end
    if (reset) begin // @[CSR.scala 173:21]
      MSIP <= 1'h0; // @[CSR.scala 173:21]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (!(io_expt)) begin // @[CSR.scala 272:19]
        if (!(isEret)) begin // @[CSR.scala 292:24]
          MSIP <= _GEN_181;
        end
      end
    end
    if (reset) begin // @[CSR.scala 176:21]
      MSIE <= 1'h0; // @[CSR.scala 176:21]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (!(io_expt)) begin // @[CSR.scala 272:19]
        if (!(isEret)) begin // @[CSR.scala 292:24]
          MSIE <= _GEN_183;
        end
      end
    end
    if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (!(io_expt)) begin // @[CSR.scala 272:19]
        if (!(isEret)) begin // @[CSR.scala 292:24]
          if (wen) begin // @[CSR.scala 297:21]
            mtimecmp <= _GEN_165;
          end
        end
      end
    end
    if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (!(io_expt)) begin // @[CSR.scala 272:19]
        if (!(isEret)) begin // @[CSR.scala 292:24]
          if (wen) begin // @[CSR.scala 297:21]
            mscratch <= _GEN_166;
          end
        end
      end
    end
    mepc <= _GEN_239[31:0];
    if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (io_expt) begin // @[CSR.scala 272:19]
        mcause <= {{28'd0}, _mcause_T_6}; // @[CSR.scala 274:14]
      end else if (!(isEret)) begin // @[CSR.scala 292:24]
        if (wen) begin // @[CSR.scala 297:21]
          mcause <= _GEN_168;
        end
      end
    end
    if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (io_expt) begin // @[CSR.scala 272:19]
        if (iaddrInvalid | laddrInvalid | saddrInvalid) begin // @[CSR.scala 291:58]
          mbadaddr <= io_addr; // @[CSR.scala 291:69]
        end
      end else if (!(isEret)) begin // @[CSR.scala 292:24]
        if (wen) begin // @[CSR.scala 297:21]
          mbadaddr <= _GEN_169;
        end
      end
    end
    if (reset) begin // @[CSR.scala 190:24]
      mtohost <= 32'h0; // @[CSR.scala 190:24]
    end else if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (!(io_expt)) begin // @[CSR.scala 272:19]
        if (!(isEret)) begin // @[CSR.scala 292:24]
          mtohost <= _GEN_191;
        end
      end
    end
    if (_isInstRet_T_5) begin // @[CSR.scala 271:19]
      if (io_expt) begin // @[CSR.scala 272:19]
        mfromhost <= _GEN_0;
      end else if (isEret) begin // @[CSR.scala 292:24]
        mfromhost <= _GEN_0;
      end else if (wen) begin // @[CSR.scala 297:21]
        mfromhost <= _GEN_171;
      end else begin
        mfromhost <= _GEN_0;
      end
    end else begin
      mfromhost <= _GEN_0;
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
  time_ = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  timeh = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  cycle = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  cycleh = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  instret = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  instreth = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  PRV = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  PRV1 = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  IE = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  IE1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  MTIP = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  MTIE = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  MSIP = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  MSIE = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  mtimecmp = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  mscratch = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  mepc = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  mcause = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  mbadaddr = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  mtohost = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  mfromhost = _RAND_20[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
