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
module RegFile(
  input           clock,
  input  [4:0]    io_raddr1,
  input  [4:0]    io_raddr2,
  output [31:0]   io_rdata1,
  output [31:0]   io_rdata2,
  input           io_wen,
  input  [4:0]    io_waddr,
  input  [31:0]   io_wdata,
  output [1023:0] io_sigIO_lft_tile_regfile
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] regs [0:31]; // @[RegFile.scala 27:17]
  wire  regs_io_rdata1_MPORT_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_rdata1_MPORT_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_rdata1_MPORT_data; // @[RegFile.scala 27:17]
  wire  regs_io_rdata2_MPORT_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_rdata2_MPORT_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_rdata2_MPORT_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_1_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_1_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_1_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_2_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_2_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_2_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_3_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_3_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_3_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_4_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_4_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_4_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_5_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_5_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_5_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_6_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_6_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_6_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_7_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_7_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_7_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_8_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_8_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_8_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_9_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_9_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_9_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_10_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_10_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_10_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_11_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_11_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_11_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_12_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_12_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_12_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_13_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_13_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_13_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_14_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_14_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_14_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_15_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_15_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_15_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_16_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_16_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_16_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_17_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_17_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_17_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_18_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_18_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_18_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_19_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_19_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_19_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_20_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_20_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_20_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_21_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_21_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_21_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_22_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_22_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_22_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_23_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_23_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_23_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_24_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_24_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_24_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_25_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_25_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_25_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_26_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_26_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_26_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_27_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_27_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_27_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_28_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_28_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_28_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_29_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_29_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_29_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_30_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_30_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_30_data; // @[RegFile.scala 27:17]
  wire  regs_io_sigIO_lft_tile_regfile_MPORT_31_en; // @[RegFile.scala 27:17]
  wire [4:0] regs_io_sigIO_lft_tile_regfile_MPORT_31_addr; // @[RegFile.scala 27:17]
  wire [31:0] regs_io_sigIO_lft_tile_regfile_MPORT_31_data; // @[RegFile.scala 27:17]
  wire [31:0] regs_MPORT_data; // @[RegFile.scala 27:17]
  wire [4:0] regs_MPORT_addr; // @[RegFile.scala 27:17]
  wire  regs_MPORT_mask; // @[RegFile.scala 27:17]
  wire  regs_MPORT_en; // @[RegFile.scala 27:17]
  wire  _T = |io_waddr; // @[RegFile.scala 30:26]
  wire [255:0] io_sigIO_lft_tile_regfile_lo_lo = {regs_io_sigIO_lft_tile_regfile_MPORT_24_data,
    regs_io_sigIO_lft_tile_regfile_MPORT_25_data,regs_io_sigIO_lft_tile_regfile_MPORT_26_data,
    regs_io_sigIO_lft_tile_regfile_MPORT_27_data,regs_io_sigIO_lft_tile_regfile_MPORT_28_data,
    regs_io_sigIO_lft_tile_regfile_MPORT_29_data,regs_io_sigIO_lft_tile_regfile_MPORT_30_data,
    regs_io_sigIO_lft_tile_regfile_MPORT_31_data}; // @[Cat.scala 31:58]
  wire [511:0] io_sigIO_lft_tile_regfile_lo = {regs_io_sigIO_lft_tile_regfile_MPORT_16_data,
    regs_io_sigIO_lft_tile_regfile_MPORT_17_data,regs_io_sigIO_lft_tile_regfile_MPORT_18_data,
    regs_io_sigIO_lft_tile_regfile_MPORT_19_data,regs_io_sigIO_lft_tile_regfile_MPORT_20_data,
    regs_io_sigIO_lft_tile_regfile_MPORT_21_data,regs_io_sigIO_lft_tile_regfile_MPORT_22_data,
    regs_io_sigIO_lft_tile_regfile_MPORT_23_data,io_sigIO_lft_tile_regfile_lo_lo}; // @[Cat.scala 31:58]
  wire [255:0] io_sigIO_lft_tile_regfile_hi_lo = {regs_io_sigIO_lft_tile_regfile_MPORT_8_data,
    regs_io_sigIO_lft_tile_regfile_MPORT_9_data,regs_io_sigIO_lft_tile_regfile_MPORT_10_data,
    regs_io_sigIO_lft_tile_regfile_MPORT_11_data,regs_io_sigIO_lft_tile_regfile_MPORT_12_data,
    regs_io_sigIO_lft_tile_regfile_MPORT_13_data,regs_io_sigIO_lft_tile_regfile_MPORT_14_data,
    regs_io_sigIO_lft_tile_regfile_MPORT_15_data}; // @[Cat.scala 31:58]
  wire [511:0] io_sigIO_lft_tile_regfile_hi = {regs_io_sigIO_lft_tile_regfile_MPORT_data,
    regs_io_sigIO_lft_tile_regfile_MPORT_1_data,regs_io_sigIO_lft_tile_regfile_MPORT_2_data,
    regs_io_sigIO_lft_tile_regfile_MPORT_3_data,regs_io_sigIO_lft_tile_regfile_MPORT_4_data,
    regs_io_sigIO_lft_tile_regfile_MPORT_5_data,regs_io_sigIO_lft_tile_regfile_MPORT_6_data,
    regs_io_sigIO_lft_tile_regfile_MPORT_7_data,io_sigIO_lft_tile_regfile_hi_lo}; // @[Cat.scala 31:58]
  assign regs_io_rdata1_MPORT_en = 1'h1;
  assign regs_io_rdata1_MPORT_addr = io_raddr1;
  assign regs_io_rdata1_MPORT_data = regs[regs_io_rdata1_MPORT_addr]; // @[RegFile.scala 27:17]
  assign regs_io_rdata2_MPORT_en = 1'h1;
  assign regs_io_rdata2_MPORT_addr = io_raddr2;
  assign regs_io_rdata2_MPORT_data = regs[regs_io_rdata2_MPORT_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_addr = 5'h1f;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_1_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_1_addr = 5'h1e;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_1_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_1_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_2_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_2_addr = 5'h1d;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_2_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_2_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_3_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_3_addr = 5'h1c;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_3_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_3_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_4_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_4_addr = 5'h1b;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_4_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_4_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_5_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_5_addr = 5'h1a;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_5_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_5_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_6_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_6_addr = 5'h19;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_6_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_6_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_7_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_7_addr = 5'h18;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_7_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_7_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_8_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_8_addr = 5'h17;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_8_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_8_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_9_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_9_addr = 5'h16;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_9_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_9_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_10_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_10_addr = 5'h15;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_10_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_10_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_11_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_11_addr = 5'h14;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_11_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_11_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_12_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_12_addr = 5'h13;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_12_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_12_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_13_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_13_addr = 5'h12;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_13_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_13_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_14_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_14_addr = 5'h11;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_14_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_14_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_15_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_15_addr = 5'h10;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_15_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_15_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_16_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_16_addr = 5'hf;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_16_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_16_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_17_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_17_addr = 5'he;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_17_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_17_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_18_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_18_addr = 5'hd;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_18_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_18_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_19_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_19_addr = 5'hc;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_19_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_19_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_20_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_20_addr = 5'hb;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_20_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_20_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_21_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_21_addr = 5'ha;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_21_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_21_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_22_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_22_addr = 5'h9;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_22_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_22_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_23_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_23_addr = 5'h8;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_23_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_23_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_24_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_24_addr = 5'h7;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_24_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_24_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_25_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_25_addr = 5'h6;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_25_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_25_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_26_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_26_addr = 5'h5;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_26_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_26_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_27_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_27_addr = 5'h4;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_27_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_27_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_28_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_28_addr = 5'h3;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_28_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_28_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_29_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_29_addr = 5'h2;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_29_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_29_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_30_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_30_addr = 5'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_30_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_30_addr]; // @[RegFile.scala 27:17]
  assign regs_io_sigIO_lft_tile_regfile_MPORT_31_en = 1'h1;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_31_addr = 5'h0;
  assign regs_io_sigIO_lft_tile_regfile_MPORT_31_data = regs[regs_io_sigIO_lft_tile_regfile_MPORT_31_addr]; // @[RegFile.scala 27:17]
  assign regs_MPORT_data = io_wdata;
  assign regs_MPORT_addr = io_waddr;
  assign regs_MPORT_mask = 1'h1;
  assign regs_MPORT_en = io_wen & _T;
  assign io_rdata1 = |io_raddr1 ? regs_io_rdata1_MPORT_data : 32'h0; // @[RegFile.scala 28:19]
  assign io_rdata2 = |io_raddr2 ? regs_io_rdata2_MPORT_data : 32'h0; // @[RegFile.scala 29:19]
  assign io_sigIO_lft_tile_regfile = {io_sigIO_lft_tile_regfile_hi,io_sigIO_lft_tile_regfile_lo}; // @[Cat.scala 31:58]
  always @(posedge clock) begin
    if (regs_MPORT_en & regs_MPORT_mask) begin
      regs[regs_MPORT_addr] <= regs_MPORT_data; // @[RegFile.scala 27:17]
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
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regs[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ALUArea(
  input  [31:0] io_A,
  input  [31:0] io_B,
  input  [3:0]  io_alu_op,
  output [31:0] io_out,
  output [31:0] io_sum
);
  wire [31:0] _sum_T_2 = 32'h0 - io_B; // @[ALU.scala 69:38]
  wire [31:0] _sum_T_3 = io_alu_op[0] ? _sum_T_2 : io_B; // @[ALU.scala 69:23]
  wire [31:0] sum = io_A + _sum_T_3; // @[ALU.scala 69:18]
  wire  _cmp_T_7 = io_alu_op[1] ? io_B[31] : io_A[31]; // @[ALU.scala 70:70]
  wire  cmp = io_A[31] == io_B[31] ? sum[31] : _cmp_T_7; // @[ALU.scala 70:16]
  wire [4:0] shamt = io_B[4:0]; // @[ALU.scala 71:19]
  wire [31:0] _GEN_0 = {{16'd0}, io_A[31:16]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_4 = _GEN_0 & 32'hffff; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_6 = {io_A[15:0], 16'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shin_T_8 = _shin_T_6 & 32'hffff0000; // @[Bitwise.scala 105:80]
  wire [31:0] _shin_T_9 = _shin_T_4 | _shin_T_8; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_1 = {{8'd0}, _shin_T_9[31:8]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_14 = _GEN_1 & 32'hff00ff; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_16 = {_shin_T_9[23:0], 8'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shin_T_18 = _shin_T_16 & 32'hff00ff00; // @[Bitwise.scala 105:80]
  wire [31:0] _shin_T_19 = _shin_T_14 | _shin_T_18; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_2 = {{4'd0}, _shin_T_19[31:4]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_24 = _GEN_2 & 32'hf0f0f0f; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_26 = {_shin_T_19[27:0], 4'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shin_T_28 = _shin_T_26 & 32'hf0f0f0f0; // @[Bitwise.scala 105:80]
  wire [31:0] _shin_T_29 = _shin_T_24 | _shin_T_28; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_3 = {{2'd0}, _shin_T_29[31:2]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_34 = _GEN_3 & 32'h33333333; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_36 = {_shin_T_29[29:0], 2'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shin_T_38 = _shin_T_36 & 32'hcccccccc; // @[Bitwise.scala 105:80]
  wire [31:0] _shin_T_39 = _shin_T_34 | _shin_T_38; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_4 = {{1'd0}, _shin_T_39[31:1]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_44 = _GEN_4 & 32'h55555555; // @[Bitwise.scala 105:31]
  wire [31:0] _shin_T_46 = {_shin_T_39[30:0], 1'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shin_T_48 = _shin_T_46 & 32'haaaaaaaa; // @[Bitwise.scala 105:80]
  wire [31:0] _shin_T_49 = _shin_T_44 | _shin_T_48; // @[Bitwise.scala 105:39]
  wire [31:0] shin = io_alu_op[3] ? io_A : _shin_T_49; // @[ALU.scala 72:17]
  wire  _shiftr_T_2 = io_alu_op[0] & shin[31]; // @[ALU.scala 73:34]
  wire [32:0] _shiftr_T_4 = {_shiftr_T_2,shin}; // @[ALU.scala 73:59]
  wire [32:0] _shiftr_T_5 = $signed(_shiftr_T_4) >>> shamt; // @[ALU.scala 73:66]
  wire [31:0] shiftr = _shiftr_T_5[31:0]; // @[ALU.scala 73:75]
  wire [31:0] _GEN_5 = {{16'd0}, shiftr[31:16]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_3 = _GEN_5 & 32'hffff; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_5 = {shiftr[15:0], 16'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shiftl_T_7 = _shiftl_T_5 & 32'hffff0000; // @[Bitwise.scala 105:80]
  wire [31:0] _shiftl_T_8 = _shiftl_T_3 | _shiftl_T_7; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_6 = {{8'd0}, _shiftl_T_8[31:8]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_13 = _GEN_6 & 32'hff00ff; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_15 = {_shiftl_T_8[23:0], 8'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shiftl_T_17 = _shiftl_T_15 & 32'hff00ff00; // @[Bitwise.scala 105:80]
  wire [31:0] _shiftl_T_18 = _shiftl_T_13 | _shiftl_T_17; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_7 = {{4'd0}, _shiftl_T_18[31:4]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_23 = _GEN_7 & 32'hf0f0f0f; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_25 = {_shiftl_T_18[27:0], 4'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shiftl_T_27 = _shiftl_T_25 & 32'hf0f0f0f0; // @[Bitwise.scala 105:80]
  wire [31:0] _shiftl_T_28 = _shiftl_T_23 | _shiftl_T_27; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_8 = {{2'd0}, _shiftl_T_28[31:2]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_33 = _GEN_8 & 32'h33333333; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_35 = {_shiftl_T_28[29:0], 2'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shiftl_T_37 = _shiftl_T_35 & 32'hcccccccc; // @[Bitwise.scala 105:80]
  wire [31:0] _shiftl_T_38 = _shiftl_T_33 | _shiftl_T_37; // @[Bitwise.scala 105:39]
  wire [31:0] _GEN_9 = {{1'd0}, _shiftl_T_38[31:1]}; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_43 = _GEN_9 & 32'h55555555; // @[Bitwise.scala 105:31]
  wire [31:0] _shiftl_T_45 = {_shiftl_T_38[30:0], 1'h0}; // @[Bitwise.scala 105:70]
  wire [31:0] _shiftl_T_47 = _shiftl_T_45 & 32'haaaaaaaa; // @[Bitwise.scala 105:80]
  wire [31:0] shiftl = _shiftl_T_43 | _shiftl_T_47; // @[Bitwise.scala 105:39]
  wire  _out_T_2 = io_alu_op == 4'h0 | io_alu_op == 4'h1; // @[ALU.scala 78:29]
  wire  _out_T_5 = io_alu_op == 4'h5 | io_alu_op == 4'h7; // @[ALU.scala 81:31]
  wire  _out_T_8 = io_alu_op == 4'h9 | io_alu_op == 4'h8; // @[ALU.scala 84:33]
  wire  _out_T_9 = io_alu_op == 4'h6; // @[ALU.scala 87:23]
  wire  _out_T_10 = io_alu_op == 4'h2; // @[ALU.scala 90:25]
  wire [31:0] _out_T_11 = io_A & io_B; // @[ALU.scala 91:21]
  wire  _out_T_12 = io_alu_op == 4'h3; // @[ALU.scala 93:27]
  wire [31:0] _out_T_13 = io_A | io_B; // @[ALU.scala 94:23]
  wire [31:0] _out_T_15 = io_A ^ io_B; // @[ALU.scala 95:50]
  wire [31:0] _out_T_17 = io_alu_op == 4'ha ? io_A : io_B; // @[ALU.scala 95:62]
  wire [31:0] _out_T_18 = io_alu_op == 4'h4 ? _out_T_15 : _out_T_17; // @[ALU.scala 95:20]
  wire [31:0] _out_T_19 = _out_T_12 ? _out_T_13 : _out_T_18; // @[ALU.scala 92:18]
  wire [31:0] _out_T_20 = _out_T_10 ? _out_T_11 : _out_T_19; // @[ALU.scala 89:16]
  wire [31:0] _out_T_21 = _out_T_9 ? shiftl : _out_T_20; // @[ALU.scala 86:14]
  wire [31:0] _out_T_22 = _out_T_8 ? shiftr : _out_T_21; // @[ALU.scala 83:12]
  wire [31:0] _out_T_23 = _out_T_5 ? {{31'd0}, cmp} : _out_T_22; // @[ALU.scala 80:10]
  assign io_out = _out_T_2 ? sum : _out_T_23; // @[ALU.scala 77:8]
  assign io_sum = io_A + _sum_T_3; // @[ALU.scala 69:18]
endmodule
module ImmGenWire(
  input  [31:0] io_inst,
  input  [2:0]  io_sel,
  output [31:0] io_out
);
  wire [11:0] Iimm = io_inst[31:20]; // @[ImmGen.scala 29:30]
  wire [11:0] Simm = {io_inst[31:25],io_inst[11:7]}; // @[ImmGen.scala 30:51]
  wire [12:0] Bimm = {io_inst[31],io_inst[7],io_inst[30:25],io_inst[11:8],1'h0}; // @[ImmGen.scala 31:86]
  wire [31:0] Uimm = {io_inst[31:12],12'h0}; // @[ImmGen.scala 32:46]
  wire [20:0] Jimm = {io_inst[31],io_inst[19:12],io_inst[20],io_inst[30:25],io_inst[24:21],1'h0}; // @[ImmGen.scala 33:105]
  wire [5:0] Zimm = {1'b0,$signed(io_inst[19:15])}; // @[ImmGen.scala 34:30]
  wire [11:0] _io_out_T_1 = $signed(Iimm) & -12'sh2; // @[ImmGen.scala 38:10]
  wire [11:0] _io_out_T_3 = 3'h1 == io_sel ? $signed(Iimm) : $signed(_io_out_T_1); // @[Mux.scala 81:58]
  wire [11:0] _io_out_T_5 = 3'h2 == io_sel ? $signed(Simm) : $signed(_io_out_T_3); // @[Mux.scala 81:58]
  wire [12:0] _io_out_T_7 = 3'h5 == io_sel ? $signed(Bimm) : $signed({{1{_io_out_T_5[11]}},_io_out_T_5}); // @[Mux.scala 81:58]
  wire [31:0] _io_out_T_9 = 3'h3 == io_sel ? $signed(Uimm) : $signed({{19{_io_out_T_7[12]}},_io_out_T_7}); // @[Mux.scala 81:58]
  wire [31:0] _io_out_T_11 = 3'h4 == io_sel ? $signed({{11{Jimm[20]}},Jimm}) : $signed(_io_out_T_9); // @[Mux.scala 81:58]
  assign io_out = 3'h6 == io_sel ? $signed({{26{Zimm[5]}},Zimm}) : $signed(_io_out_T_11); // @[ImmGen.scala 40:5]
endmodule
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
module Datapath(
  input           clock,
  input           reset,
  input           io_host_fromhost_valid,
  input  [31:0]   io_host_fromhost_bits,
  output [31:0]   io_host_tohost,
  output          io_icache_req_valid,
  output [31:0]   io_icache_req_bits_addr,
  input           io_icache_resp_valid,
  input  [31:0]   io_icache_resp_bits_data,
  output [31:0]   io_dcache_req_bits_addr,
  output [31:0]   io_dcache_req_bits_data,
  output [3:0]    io_dcache_req_bits_mask,
  input  [31:0]   io_dcache_resp_bits_data,
  output [31:0]   io_ctrl_inst,
  input  [1:0]    io_ctrl_pc_sel,
  input           io_ctrl_inst_kill,
  input           io_ctrl_A_sel,
  input           io_ctrl_B_sel,
  input  [2:0]    io_ctrl_imm_sel,
  input  [3:0]    io_ctrl_alu_op,
  input  [2:0]    io_ctrl_br_type,
  input  [1:0]    io_ctrl_st_type,
  input  [2:0]    io_ctrl_ld_type,
  input  [1:0]    io_ctrl_wb_sel,
  input           io_ctrl_wb_en,
  input  [2:0]    io_ctrl_csr_cmd,
  input           io_ctrl_illegal,
  output [31:0]   io_sigIO_lft_tile_imm,
  output [1023:0] io_sigIO_lft_tile_regfile,
  output [4:0]    io_sigIO_lft_tile_reg_rd1_addr_in,
  output [4:0]    io_sigIO_lft_tile_reg_rd2_addr_in,
  output [31:0]   io_sigIO_lft_tile_reg_rd1_data_out,
  output [31:0]   io_sigIO_lft_tile_reg_rd2_data_out,
  output [4:0]    io_sigIO_lft_tile_reg_wr_addr_in,
  output [31:0]   io_sigIO_lft_tile_reg_wr_data_in,
  output [31:0]   io_sigIO_lft_tile_alu_data_out,
  output [32:0]   io_sigIO_lft_tile_npc,
  output [32:0]   io_sigIO_lft_tile_pc,
  output [32:0]   io_sigIO_lft_tile_fe_pc,
  output [32:0]   io_sigIO_lft_tile_ew_pc,
  output [31:0]   io_sigIO_lft_tile_inst,
  output [31:0]   io_sigIO_lft_tile_fe_inst
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
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
`endif // RANDOMIZE_REG_INIT
  wire  csr_clock; // @[Datapath.scala 58:19]
  wire  csr_reset; // @[Datapath.scala 58:19]
  wire  csr_io_stall; // @[Datapath.scala 58:19]
  wire [2:0] csr_io_cmd; // @[Datapath.scala 58:19]
  wire [31:0] csr_io_in; // @[Datapath.scala 58:19]
  wire [31:0] csr_io_out; // @[Datapath.scala 58:19]
  wire [31:0] csr_io_pc; // @[Datapath.scala 58:19]
  wire [31:0] csr_io_addr; // @[Datapath.scala 58:19]
  wire [31:0] csr_io_inst; // @[Datapath.scala 58:19]
  wire  csr_io_illegal; // @[Datapath.scala 58:19]
  wire [1:0] csr_io_st_type; // @[Datapath.scala 58:19]
  wire [2:0] csr_io_ld_type; // @[Datapath.scala 58:19]
  wire  csr_io_pc_check; // @[Datapath.scala 58:19]
  wire  csr_io_expt; // @[Datapath.scala 58:19]
  wire [31:0] csr_io_evec; // @[Datapath.scala 58:19]
  wire [31:0] csr_io_epc; // @[Datapath.scala 58:19]
  wire  csr_io_host_fromhost_valid; // @[Datapath.scala 58:19]
  wire [31:0] csr_io_host_fromhost_bits; // @[Datapath.scala 58:19]
  wire [31:0] csr_io_host_tohost; // @[Datapath.scala 58:19]
  wire  regFile_clock; // @[Datapath.scala 59:23]
  wire [4:0] regFile_io_raddr1; // @[Datapath.scala 59:23]
  wire [4:0] regFile_io_raddr2; // @[Datapath.scala 59:23]
  wire [31:0] regFile_io_rdata1; // @[Datapath.scala 59:23]
  wire [31:0] regFile_io_rdata2; // @[Datapath.scala 59:23]
  wire  regFile_io_wen; // @[Datapath.scala 59:23]
  wire [4:0] regFile_io_waddr; // @[Datapath.scala 59:23]
  wire [31:0] regFile_io_wdata; // @[Datapath.scala 59:23]
  wire [1023:0] regFile_io_sigIO_lft_tile_regfile; // @[Datapath.scala 59:23]
  wire [31:0] alu_io_A; // @[Config.scala 22:52]
  wire [31:0] alu_io_B; // @[Config.scala 22:52]
  wire [3:0] alu_io_alu_op; // @[Config.scala 22:52]
  wire [31:0] alu_io_out; // @[Config.scala 22:52]
  wire [31:0] alu_io_sum; // @[Config.scala 22:52]
  wire [31:0] immGen_io_inst; // @[Config.scala 23:52]
  wire [2:0] immGen_io_sel; // @[Config.scala 23:52]
  wire [31:0] immGen_io_out; // @[Config.scala 23:52]
  wire [31:0] brCond_io_rs1; // @[Config.scala 24:52]
  wire [31:0] brCond_io_rs2; // @[Config.scala 24:52]
  wire [2:0] brCond_io_br_type; // @[Config.scala 24:52]
  wire  brCond_io_taken; // @[Config.scala 24:52]
  reg [31:0] fe_inst; // @[Datapath.scala 68:24]
  reg [32:0] fe_pc; // @[Datapath.scala 69:18]
  reg [31:0] ew_inst; // @[Datapath.scala 73:24]
  reg [32:0] ew_pc; // @[Datapath.scala 74:18]
  reg [31:0] ew_alu; // @[Datapath.scala 75:19]
  reg [31:0] csr_in; // @[Datapath.scala 76:19]
  reg [1:0] st_type; // @[Datapath.scala 80:20]
  reg [2:0] ld_type; // @[Datapath.scala 81:20]
  reg [1:0] wb_sel; // @[Datapath.scala 82:19]
  reg  wb_en; // @[Datapath.scala 83:18]
  reg [2:0] csr_cmd; // @[Datapath.scala 84:20]
  reg  illegal; // @[Datapath.scala 85:20]
  reg  pc_check; // @[Datapath.scala 86:21]
  reg  started; // @[Datapath.scala 90:24]
  wire  stall = ~io_icache_resp_valid; // @[Datapath.scala 91:15]
  wire [31:0] _pc_T_1 = 32'h200 - 32'h4; // @[Datapath.scala 92:45]
  reg [32:0] pc; // @[Datapath.scala 92:19]
  wire  _npc_T = io_ctrl_pc_sel == 2'h3; // @[Datapath.scala 100:24]
  wire  _npc_T_1 = io_ctrl_pc_sel == 2'h1; // @[Datapath.scala 103:26]
  wire  _npc_T_2 = io_ctrl_pc_sel == 2'h1 | brCond_io_taken; // @[Datapath.scala 103:37]
  wire [31:0] _npc_T_3 = {{1'd0}, alu_io_sum[31:1]}; // @[Datapath.scala 104:22]
  wire [32:0] _npc_T_4 = {_npc_T_3, 1'h0}; // @[Datapath.scala 104:29]
  wire [32:0] _npc_T_7 = pc + 33'h4; // @[Datapath.scala 105:47]
  wire [32:0] _npc_T_8 = io_ctrl_pc_sel == 2'h2 ? pc : _npc_T_7; // @[Datapath.scala 105:14]
  wire [32:0] _npc_T_9 = _npc_T_2 ? _npc_T_4 : _npc_T_8; // @[Datapath.scala 102:12]
  wire [32:0] _npc_T_10 = _npc_T ? {{1'd0}, csr_io_epc} : _npc_T_9; // @[Datapath.scala 99:10]
  wire [32:0] _npc_T_11 = csr_io_expt ? {{1'd0}, csr_io_evec} : _npc_T_10; // @[Datapath.scala 96:8]
  wire [32:0] npc = stall ? pc : _npc_T_11; // @[Datapath.scala 93:16]
  wire [31:0] inst = started | io_ctrl_inst_kill | brCond_io_taken | csr_io_expt ? 32'h13 : io_icache_resp_bits_data; // @[Datapath.scala 111:8]
  wire  _io_icache_req_valid_T = ~stall; // @[Datapath.scala 116:26]
  wire [4:0] rs1_addr = fe_inst[19:15]; // @[Datapath.scala 134:25]
  wire [4:0] rs2_addr = fe_inst[24:20]; // @[Datapath.scala 135:25]
  wire [4:0] wb_rd_addr = ew_inst[11:7]; // @[Datapath.scala 147:27]
  wire  rs1hazard = wb_en & |rs1_addr & rs1_addr == wb_rd_addr; // @[Datapath.scala 148:41]
  wire  rs2hazard = wb_en & |rs2_addr & rs2_addr == wb_rd_addr; // @[Datapath.scala 149:41]
  wire  _rs1_T = wb_sel == 2'h0; // @[Datapath.scala 150:24]
  wire [31:0] rs1 = wb_sel == 2'h0 & rs1hazard ? ew_alu : regFile_io_rdata1; // @[Datapath.scala 150:16]
  wire [31:0] rs2 = _rs1_T & rs2hazard ? ew_alu : regFile_io_rdata2; // @[Datapath.scala 151:16]
  wire [32:0] _alu_io_A_T_1 = io_ctrl_A_sel ? {{1'd0}, rs1} : fe_pc; // @[Datapath.scala 154:18]
  wire [31:0] _daddr_T = stall ? ew_alu : alu_io_sum; // @[Datapath.scala 164:18]
  wire [31:0] _daddr_T_1 = {{2'd0}, _daddr_T[31:2]}; // @[Datapath.scala 164:46]
  wire [33:0] _GEN_26 = {_daddr_T_1, 2'h0}; // @[Datapath.scala 164:53]
  wire [34:0] daddr = {{1'd0}, _GEN_26}; // @[Datapath.scala 164:53]
  wire [4:0] _GEN_27 = {alu_io_sum[1], 4'h0}; // @[Datapath.scala 165:32]
  wire [7:0] _woffset_T_1 = {{3'd0}, _GEN_27}; // @[Datapath.scala 165:32]
  wire [3:0] _woffset_T_3 = {alu_io_sum[0], 3'h0}; // @[Datapath.scala 165:64]
  wire [7:0] _GEN_28 = {{4'd0}, _woffset_T_3}; // @[Datapath.scala 165:47]
  wire [7:0] woffset = _woffset_T_1 | _GEN_28; // @[Datapath.scala 165:47]
  wire [286:0] _GEN_0 = {{255'd0}, rs2}; // @[Datapath.scala 168:34]
  wire [286:0] _io_dcache_req_bits_data_T = _GEN_0 << woffset; // @[Datapath.scala 168:34]
  wire [1:0] _io_dcache_req_bits_mask_T = stall ? st_type : io_ctrl_st_type; // @[Datapath.scala 170:8]
  wire [4:0] _io_dcache_req_bits_mask_T_2 = 5'h3 << alu_io_sum[1:0]; // @[Datapath.scala 172:47]
  wire [3:0] _io_dcache_req_bits_mask_T_4 = 4'h1 << alu_io_sum[1:0]; // @[Datapath.scala 172:86]
  wire [3:0] _io_dcache_req_bits_mask_T_6 = 2'h1 == _io_dcache_req_bits_mask_T ? 4'hf : 4'h0; // @[Mux.scala 81:58]
  wire [4:0] _io_dcache_req_bits_mask_T_8 = 2'h2 == _io_dcache_req_bits_mask_T ? _io_dcache_req_bits_mask_T_2 : {{1
    'd0}, _io_dcache_req_bits_mask_T_6}; // @[Mux.scala 81:58]
  wire [4:0] _io_dcache_req_bits_mask_T_10 = 2'h3 == _io_dcache_req_bits_mask_T ? {{1'd0}, _io_dcache_req_bits_mask_T_4}
     : _io_dcache_req_bits_mask_T_8; // @[Mux.scala 81:58]
  wire  _T_6 = ~csr_io_expt; // @[Datapath.scala 183:24]
  wire [4:0] _GEN_29 = {ew_alu[1], 4'h0}; // @[Datapath.scala 198:28]
  wire [7:0] _loffset_T_1 = {{3'd0}, _GEN_29}; // @[Datapath.scala 198:28]
  wire [3:0] _loffset_T_3 = {ew_alu[0], 3'h0}; // @[Datapath.scala 198:56]
  wire [7:0] _GEN_30 = {{4'd0}, _loffset_T_3}; // @[Datapath.scala 198:43]
  wire [7:0] loffset = _loffset_T_1 | _GEN_30; // @[Datapath.scala 198:43]
  wire [31:0] lshift = io_dcache_resp_bits_data >> loffset; // @[Datapath.scala 199:41]
  wire [32:0] _load_T = {1'b0,$signed(io_dcache_resp_bits_data)}; // @[Datapath.scala 202:30]
  wire [15:0] _load_T_2 = lshift[15:0]; // @[Datapath.scala 204:30]
  wire [7:0] _load_T_4 = lshift[7:0]; // @[Datapath.scala 205:29]
  wire [16:0] _load_T_6 = {1'b0,$signed(lshift[15:0])}; // @[Datapath.scala 206:31]
  wire [8:0] _load_T_8 = {1'b0,$signed(lshift[7:0])}; // @[Datapath.scala 207:30]
  wire [32:0] _load_T_10 = 3'h2 == ld_type ? $signed({{17{_load_T_2[15]}},_load_T_2}) : $signed(_load_T); // @[Mux.scala 81:58]
  wire [32:0] _load_T_12 = 3'h3 == ld_type ? $signed({{25{_load_T_4[7]}},_load_T_4}) : $signed(_load_T_10); // @[Mux.scala 81:58]
  wire [32:0] _load_T_14 = 3'h4 == ld_type ? $signed({{16{_load_T_6[16]}},_load_T_6}) : $signed(_load_T_12); // @[Mux.scala 81:58]
  wire [32:0] load = 3'h5 == ld_type ? $signed({{24{_load_T_8[8]}},_load_T_8}) : $signed(_load_T_14); // @[Mux.scala 81:58]
  wire [32:0] _regWrite_T = {1'b0,$signed(ew_alu)}; // @[Datapath.scala 226:30]
  wire [32:0] _regWrite_T_2 = ew_pc + 33'h4; // @[Datapath.scala 226:73]
  wire [33:0] _regWrite_T_3 = {1'b0,$signed(_regWrite_T_2)}; // @[Datapath.scala 226:80]
  wire [32:0] _regWrite_T_4 = {1'b0,$signed(csr_io_out)}; // @[Datapath.scala 226:107]
  wire [32:0] _regWrite_T_6 = 2'h1 == wb_sel ? $signed(load) : $signed(_regWrite_T); // @[Mux.scala 81:58]
  wire [33:0] _regWrite_T_8 = 2'h2 == wb_sel ? $signed(_regWrite_T_3) : $signed({{1{_regWrite_T_6[32]}},_regWrite_T_6}); // @[Mux.scala 81:58]
  wire [33:0] regWrite = 2'h3 == wb_sel ? $signed({{1{_regWrite_T_4[32]}},_regWrite_T_4}) : $signed(_regWrite_T_8); // @[Datapath.scala 226:114]
  reg [31:0] ts__decode_rs_addr; // @[Datapath.scala 260:36]
  reg [31:0] ic__decode_rs_addr; // @[Datapath.scala 261:36]
  reg  valid__decode_rs_addr; // @[Datapath.scala 262:40]
  reg [31:0] ts__decode_i_imm; // @[Datapath.scala 263:36]
  reg [31:0] ic__decode_i_imm; // @[Datapath.scala 264:36]
  reg  valid__decode_i_imm; // @[Datapath.scala 265:40]
  CSR csr ( // @[Datapath.scala 58:19]
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
  RegFile regFile ( // @[Datapath.scala 59:23]
    .clock(regFile_clock),
    .io_raddr1(regFile_io_raddr1),
    .io_raddr2(regFile_io_raddr2),
    .io_rdata1(regFile_io_rdata1),
    .io_rdata2(regFile_io_rdata2),
    .io_wen(regFile_io_wen),
    .io_waddr(regFile_io_waddr),
    .io_wdata(regFile_io_wdata),
    .io_sigIO_lft_tile_regfile(regFile_io_sigIO_lft_tile_regfile)
  );
  ALUArea alu ( // @[Config.scala 22:52]
    .io_A(alu_io_A),
    .io_B(alu_io_B),
    .io_alu_op(alu_io_alu_op),
    .io_out(alu_io_out),
    .io_sum(alu_io_sum)
  );
  ImmGenWire immGen ( // @[Config.scala 23:52]
    .io_inst(immGen_io_inst),
    .io_sel(immGen_io_sel),
    .io_out(immGen_io_out)
  );
  BrCondArea brCond ( // @[Config.scala 24:52]
    .io_rs1(brCond_io_rs1),
    .io_rs2(brCond_io_rs2),
    .io_br_type(brCond_io_br_type),
    .io_taken(brCond_io_taken)
  );
  assign io_host_tohost = csr_io_host_tohost; // @[Datapath.scala 222:11]
  assign io_icache_req_valid = ~stall; // @[Datapath.scala 116:26]
  assign io_icache_req_bits_addr = npc[31:0]; // @[Datapath.scala 113:27]
  assign io_dcache_req_bits_addr = daddr[31:0]; // @[Datapath.scala 167:27]
  assign io_dcache_req_bits_data = _io_dcache_req_bits_data_T[31:0]; // @[Datapath.scala 168:27]
  assign io_dcache_req_bits_mask = _io_dcache_req_bits_mask_T_10[3:0]; // @[Datapath.scala 169:27]
  assign io_ctrl_inst = fe_inst; // @[Datapath.scala 130:16]
  assign io_sigIO_lft_tile_imm = immGen_io_out; // @[Datapath.scala 241:39]
  assign io_sigIO_lft_tile_regfile = regFile_io_sigIO_lft_tile_regfile; // @[Datapath.scala 242:39]
  assign io_sigIO_lft_tile_reg_rd1_addr_in = fe_inst[19:15]; // @[Datapath.scala 134:25]
  assign io_sigIO_lft_tile_reg_rd2_addr_in = fe_inst[24:20]; // @[Datapath.scala 135:25]
  assign io_sigIO_lft_tile_reg_rd1_data_out = wb_sel == 2'h0 & rs1hazard ? ew_alu : regFile_io_rdata1; // @[Datapath.scala 150:16]
  assign io_sigIO_lft_tile_reg_rd2_data_out = _rs1_T & rs2hazard ? ew_alu : regFile_io_rdata2; // @[Datapath.scala 151:16]
  assign io_sigIO_lft_tile_reg_wr_addr_in = ew_inst[11:7]; // @[Datapath.scala 147:27]
  assign io_sigIO_lft_tile_reg_wr_data_in = regWrite[31:0]; // @[Datapath.scala 248:39]
  assign io_sigIO_lft_tile_alu_data_out = alu_io_out; // @[Datapath.scala 249:39]
  assign io_sigIO_lft_tile_npc = stall ? pc : _npc_T_11; // @[Datapath.scala 93:16]
  assign io_sigIO_lft_tile_pc = pc; // @[Datapath.scala 251:39]
  assign io_sigIO_lft_tile_fe_pc = fe_pc; // @[Datapath.scala 252:39]
  assign io_sigIO_lft_tile_ew_pc = ew_pc; // @[Datapath.scala 253:39]
  assign io_sigIO_lft_tile_inst = inst; // @[Datapath.scala 254:39]
  assign io_sigIO_lft_tile_fe_inst = fe_inst; // @[Datapath.scala 255:39]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_stall = ~io_icache_resp_valid; // @[Datapath.scala 91:15]
  assign csr_io_cmd = csr_cmd; // @[Datapath.scala 214:14]
  assign csr_io_in = csr_in; // @[Datapath.scala 213:13]
  assign csr_io_pc = ew_pc[31:0]; // @[Datapath.scala 216:13]
  assign csr_io_addr = ew_alu; // @[Datapath.scala 217:15]
  assign csr_io_inst = ew_inst; // @[Datapath.scala 215:15]
  assign csr_io_illegal = illegal; // @[Datapath.scala 218:18]
  assign csr_io_st_type = st_type; // @[Datapath.scala 221:18]
  assign csr_io_ld_type = ld_type; // @[Datapath.scala 220:18]
  assign csr_io_pc_check = pc_check; // @[Datapath.scala 219:19]
  assign csr_io_host_fromhost_valid = io_host_fromhost_valid; // @[Datapath.scala 222:11]
  assign csr_io_host_fromhost_bits = io_host_fromhost_bits; // @[Datapath.scala 222:11]
  assign regFile_clock = clock;
  assign regFile_io_raddr1 = fe_inst[19:15]; // @[Datapath.scala 134:25]
  assign regFile_io_raddr2 = fe_inst[24:20]; // @[Datapath.scala 135:25]
  assign regFile_io_wen = wb_en & _io_icache_req_valid_T & _T_6; // @[Datapath.scala 228:37]
  assign regFile_io_waddr = ew_inst[11:7]; // @[Datapath.scala 147:27]
  assign regFile_io_wdata = regWrite[31:0]; // @[Datapath.scala 230:20]
  assign alu_io_A = _alu_io_A_T_1[31:0]; // @[Datapath.scala 154:12]
  assign alu_io_B = io_ctrl_B_sel ? rs2 : immGen_io_out; // @[Datapath.scala 155:18]
  assign alu_io_alu_op = io_ctrl_alu_op; // @[Datapath.scala 156:17]
  assign immGen_io_inst = fe_inst; // @[Datapath.scala 140:18]
  assign immGen_io_sel = io_ctrl_imm_sel; // @[Datapath.scala 141:17]
  assign brCond_io_rs1 = wb_sel == 2'h0 & rs1hazard ? ew_alu : regFile_io_rdata1; // @[Datapath.scala 150:16]
  assign brCond_io_rs2 = _rs1_T & rs2hazard ? ew_alu : regFile_io_rdata2; // @[Datapath.scala 151:16]
  assign brCond_io_br_type = io_ctrl_br_type; // @[Datapath.scala 161:21]
  always @(posedge clock) begin
    if (reset) begin // @[Datapath.scala 68:24]
      fe_inst <= 32'h13; // @[Datapath.scala 68:24]
    end else if (_io_icache_req_valid_T) begin // @[Datapath.scala 122:16]
      if (started | io_ctrl_inst_kill | brCond_io_taken | csr_io_expt) begin // @[Datapath.scala 111:8]
        fe_inst <= 32'h13;
      end else begin
        fe_inst <= io_icache_resp_bits_data;
      end
    end
    if (_io_icache_req_valid_T) begin // @[Datapath.scala 122:16]
      fe_pc <= pc; // @[Datapath.scala 123:11]
    end
    if (reset) begin // @[Datapath.scala 73:24]
      ew_inst <= 32'h13; // @[Datapath.scala 73:24]
    end else if (!(reset | _io_icache_req_valid_T & csr_io_expt)) begin // @[Datapath.scala 176:47]
      if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 183:38]
        ew_inst <= fe_inst; // @[Datapath.scala 185:13]
      end
    end
    if (!(reset | _io_icache_req_valid_T & csr_io_expt)) begin // @[Datapath.scala 176:47]
      if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 183:38]
        ew_pc <= fe_pc; // @[Datapath.scala 184:11]
      end
    end
    if (!(reset | _io_icache_req_valid_T & csr_io_expt)) begin // @[Datapath.scala 176:47]
      if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 183:38]
        ew_alu <= alu_io_out; // @[Datapath.scala 186:12]
      end
    end
    if (!(reset | _io_icache_req_valid_T & csr_io_expt)) begin // @[Datapath.scala 176:47]
      if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 183:38]
        if (io_ctrl_imm_sel == 3'h6) begin // @[Datapath.scala 187:18]
          csr_in <= immGen_io_out;
        end else if (wb_sel == 2'h0 & rs1hazard) begin // @[Datapath.scala 150:16]
          csr_in <= ew_alu;
        end else begin
          csr_in <= regFile_io_rdata1;
        end
      end
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 176:47]
      st_type <= 2'h0; // @[Datapath.scala 177:13]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 183:38]
      st_type <= io_ctrl_st_type; // @[Datapath.scala 188:13]
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 176:47]
      ld_type <= 3'h0; // @[Datapath.scala 178:13]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 183:38]
      ld_type <= io_ctrl_ld_type; // @[Datapath.scala 189:13]
    end
    if (!(reset | _io_icache_req_valid_T & csr_io_expt)) begin // @[Datapath.scala 176:47]
      if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 183:38]
        wb_sel <= io_ctrl_wb_sel; // @[Datapath.scala 190:12]
      end
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 176:47]
      wb_en <= 1'h0; // @[Datapath.scala 179:11]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 183:38]
      wb_en <= io_ctrl_wb_en; // @[Datapath.scala 191:11]
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 176:47]
      csr_cmd <= 3'h0; // @[Datapath.scala 180:13]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 183:38]
      csr_cmd <= io_ctrl_csr_cmd; // @[Datapath.scala 192:13]
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 176:47]
      illegal <= 1'h0; // @[Datapath.scala 181:13]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 183:38]
      illegal <= io_ctrl_illegal; // @[Datapath.scala 193:13]
    end
    if (reset | _io_icache_req_valid_T & csr_io_expt) begin // @[Datapath.scala 176:47]
      pc_check <= 1'h0; // @[Datapath.scala 182:14]
    end else if (_io_icache_req_valid_T & ~csr_io_expt) begin // @[Datapath.scala 183:38]
      pc_check <= _npc_T_1; // @[Datapath.scala 194:14]
    end
    started <= reset; // @[Datapath.scala 90:31]
    if (reset) begin // @[Datapath.scala 92:19]
      pc <= {{1'd0}, _pc_T_1}; // @[Datapath.scala 92:19]
    end else if (!(stall)) begin // @[Datapath.scala 93:16]
      if (csr_io_expt) begin // @[Datapath.scala 96:8]
        pc <= {{1'd0}, csr_io_evec};
      end else if (_npc_T) begin // @[Datapath.scala 99:10]
        pc <= {{1'd0}, csr_io_epc};
      end else begin
        pc <= _npc_T_9;
      end
    end
    ts__decode_rs_addr <= ts__decode_rs_addr; // @[Datapath.scala 260:36]
    ic__decode_rs_addr <= ic__decode_rs_addr; // @[Datapath.scala 261:36]
    if (reset) begin // @[Datapath.scala 262:40]
      valid__decode_rs_addr <= 1'h0; // @[Datapath.scala 262:40]
    end
    ts__decode_i_imm <= ts__decode_i_imm; // @[Datapath.scala 263:36]
    ic__decode_i_imm <= ic__decode_i_imm; // @[Datapath.scala 264:36]
    if (reset) begin // @[Datapath.scala 265:40]
      valid__decode_i_imm <= 1'h0; // @[Datapath.scala 265:40]
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
  _RAND_15 = {1{`RANDOM}};
  ts__decode_rs_addr = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  ic__decode_rs_addr = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  valid__decode_rs_addr = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  ts__decode_i_imm = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  ic__decode_i_imm = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  valid__decode_i_imm = _RAND_20[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Control(
  input  [31:0] io_inst,
  output [1:0]  io_pc_sel,
  output        io_inst_kill,
  output        io_A_sel,
  output        io_B_sel,
  output [2:0]  io_imm_sel,
  output [3:0]  io_alu_op,
  output [2:0]  io_br_type,
  output [1:0]  io_st_type,
  output [2:0]  io_ld_type,
  output [1:0]  io_wb_sel,
  output        io_wb_en,
  output [2:0]  io_csr_cmd,
  output        io_illegal
);
  wire [31:0] _ctrlSignals_T = io_inst & 32'h7f; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_1 = 32'h37 == _ctrlSignals_T; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_3 = 32'h17 == _ctrlSignals_T; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_5 = 32'h6f == _ctrlSignals_T; // @[Lookup.scala 31:38]
  wire [31:0] _ctrlSignals_T_6 = io_inst & 32'h707f; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_7 = 32'h67 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_9 = 32'h63 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_11 = 32'h1063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_13 = 32'h4063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_15 = 32'h5063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_17 = 32'h6063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_19 = 32'h7063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_21 = 32'h3 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_23 = 32'h1003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_25 = 32'h2003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_27 = 32'h4003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_29 = 32'h5003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_31 = 32'h23 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_33 = 32'h1023 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_35 = 32'h2023 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_37 = 32'h13 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_39 = 32'h2013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_41 = 32'h3013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_43 = 32'h4013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_45 = 32'h6013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_47 = 32'h7013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire [31:0] _ctrlSignals_T_48 = io_inst & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_49 = 32'h1013 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_51 = 32'h5013 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_53 = 32'h40005013 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_55 = 32'h33 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_57 = 32'h40000033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_59 = 32'h1033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_61 = 32'h2033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_63 = 32'h3033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_65 = 32'h4033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_67 = 32'h5033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_69 = 32'h40005033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_71 = 32'h6033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_73 = 32'h7033 == _ctrlSignals_T_48; // @[Lookup.scala 31:38]
  wire [31:0] _ctrlSignals_T_74 = io_inst & 32'hf00fffff; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_75 = 32'hf == _ctrlSignals_T_74; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_77 = 32'h100f == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_79 = 32'h1073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_81 = 32'h2073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_83 = 32'h3073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_85 = 32'h5073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_87 = 32'h6073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_89 = 32'h7073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_91 = 32'h73 == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_93 = 32'h100073 == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_95 = 32'h10000073 == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_97 = 32'h10200073 == io_inst; // @[Lookup.scala 31:38]
  wire [1:0] _ctrlSignals_T_99 = _ctrlSignals_T_95 ? 2'h3 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_100 = _ctrlSignals_T_93 ? 2'h0 : _ctrlSignals_T_99; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_101 = _ctrlSignals_T_91 ? 2'h0 : _ctrlSignals_T_100; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_102 = _ctrlSignals_T_89 ? 2'h2 : _ctrlSignals_T_101; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_103 = _ctrlSignals_T_87 ? 2'h2 : _ctrlSignals_T_102; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_104 = _ctrlSignals_T_85 ? 2'h2 : _ctrlSignals_T_103; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_105 = _ctrlSignals_T_83 ? 2'h2 : _ctrlSignals_T_104; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_106 = _ctrlSignals_T_81 ? 2'h2 : _ctrlSignals_T_105; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_107 = _ctrlSignals_T_79 ? 2'h2 : _ctrlSignals_T_106; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_108 = _ctrlSignals_T_77 ? 2'h2 : _ctrlSignals_T_107; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_109 = _ctrlSignals_T_75 ? 2'h0 : _ctrlSignals_T_108; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_110 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_109; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_111 = _ctrlSignals_T_71 ? 2'h0 : _ctrlSignals_T_110; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_112 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_111; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_113 = _ctrlSignals_T_67 ? 2'h0 : _ctrlSignals_T_112; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_114 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_113; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_115 = _ctrlSignals_T_63 ? 2'h0 : _ctrlSignals_T_114; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_116 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_115; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_117 = _ctrlSignals_T_59 ? 2'h0 : _ctrlSignals_T_116; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_118 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_117; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_119 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_118; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_120 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_119; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_121 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_120; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_122 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_121; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_123 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_122; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_124 = _ctrlSignals_T_45 ? 2'h0 : _ctrlSignals_T_123; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_125 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_124; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_126 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_125; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_127 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_126; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_128 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_127; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_129 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_128; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_130 = _ctrlSignals_T_33 ? 2'h0 : _ctrlSignals_T_129; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_131 = _ctrlSignals_T_31 ? 2'h0 : _ctrlSignals_T_130; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_132 = _ctrlSignals_T_29 ? 2'h2 : _ctrlSignals_T_131; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_133 = _ctrlSignals_T_27 ? 2'h2 : _ctrlSignals_T_132; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_134 = _ctrlSignals_T_25 ? 2'h2 : _ctrlSignals_T_133; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_135 = _ctrlSignals_T_23 ? 2'h2 : _ctrlSignals_T_134; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_136 = _ctrlSignals_T_21 ? 2'h2 : _ctrlSignals_T_135; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_137 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_136; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_138 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_137; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_139 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_138; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_140 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_139; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_141 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_140; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_142 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_141; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_143 = _ctrlSignals_T_7 ? 2'h1 : _ctrlSignals_T_142; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_144 = _ctrlSignals_T_5 ? 2'h1 : _ctrlSignals_T_143; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_145 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_144; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_156 = _ctrlSignals_T_77 ? 1'h0 : _ctrlSignals_T_79 | (_ctrlSignals_T_81 | _ctrlSignals_T_83); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_157 = _ctrlSignals_T_75 ? 1'h0 : _ctrlSignals_T_156; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_185 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_21 | (_ctrlSignals_T_23 | (_ctrlSignals_T_25 | (
    _ctrlSignals_T_27 | (_ctrlSignals_T_29 | (_ctrlSignals_T_31 | (_ctrlSignals_T_33 | (_ctrlSignals_T_35 | (
    _ctrlSignals_T_37 | (_ctrlSignals_T_39 | (_ctrlSignals_T_41 | (_ctrlSignals_T_43 | (_ctrlSignals_T_45 | (
    _ctrlSignals_T_47 | (_ctrlSignals_T_49 | (_ctrlSignals_T_51 | (_ctrlSignals_T_53 | (_ctrlSignals_T_55 | (
    _ctrlSignals_T_57 | (_ctrlSignals_T_59 | (_ctrlSignals_T_61 | (_ctrlSignals_T_63 | (_ctrlSignals_T_65 | (
    _ctrlSignals_T_67 | (_ctrlSignals_T_69 | (_ctrlSignals_T_71 | (_ctrlSignals_T_73 | _ctrlSignals_T_157)))))))))))))))
    ))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_186 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_185; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_187 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_186; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_188 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_187; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_189 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_188; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_190 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_189; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_192 = _ctrlSignals_T_5 ? 1'h0 : _ctrlSignals_T_7 | _ctrlSignals_T_190; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_193 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_192; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_216 = _ctrlSignals_T_53 ? 1'h0 : _ctrlSignals_T_55 | (_ctrlSignals_T_57 | (_ctrlSignals_T_59 | (
    _ctrlSignals_T_61 | (_ctrlSignals_T_63 | (_ctrlSignals_T_65 | (_ctrlSignals_T_67 | (_ctrlSignals_T_69 | (
    _ctrlSignals_T_71 | _ctrlSignals_T_73)))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_217 = _ctrlSignals_T_51 ? 1'h0 : _ctrlSignals_T_216; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_218 = _ctrlSignals_T_49 ? 1'h0 : _ctrlSignals_T_217; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_219 = _ctrlSignals_T_47 ? 1'h0 : _ctrlSignals_T_218; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_220 = _ctrlSignals_T_45 ? 1'h0 : _ctrlSignals_T_219; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_221 = _ctrlSignals_T_43 ? 1'h0 : _ctrlSignals_T_220; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_222 = _ctrlSignals_T_41 ? 1'h0 : _ctrlSignals_T_221; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_223 = _ctrlSignals_T_39 ? 1'h0 : _ctrlSignals_T_222; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_224 = _ctrlSignals_T_37 ? 1'h0 : _ctrlSignals_T_223; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_225 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_224; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_226 = _ctrlSignals_T_33 ? 1'h0 : _ctrlSignals_T_225; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_227 = _ctrlSignals_T_31 ? 1'h0 : _ctrlSignals_T_226; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_228 = _ctrlSignals_T_29 ? 1'h0 : _ctrlSignals_T_227; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_229 = _ctrlSignals_T_27 ? 1'h0 : _ctrlSignals_T_228; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_230 = _ctrlSignals_T_25 ? 1'h0 : _ctrlSignals_T_229; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_231 = _ctrlSignals_T_23 ? 1'h0 : _ctrlSignals_T_230; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_232 = _ctrlSignals_T_21 ? 1'h0 : _ctrlSignals_T_231; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_233 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_232; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_234 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_233; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_235 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_234; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_236 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_235; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_237 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_236; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_238 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_237; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_239 = _ctrlSignals_T_7 ? 1'h0 : _ctrlSignals_T_238; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_240 = _ctrlSignals_T_5 ? 1'h0 : _ctrlSignals_T_239; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_241 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_240; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_246 = _ctrlSignals_T_89 ? 3'h6 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_247 = _ctrlSignals_T_87 ? 3'h6 : _ctrlSignals_T_246; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_248 = _ctrlSignals_T_85 ? 3'h6 : _ctrlSignals_T_247; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_249 = _ctrlSignals_T_83 ? 3'h0 : _ctrlSignals_T_248; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_250 = _ctrlSignals_T_81 ? 3'h0 : _ctrlSignals_T_249; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_251 = _ctrlSignals_T_79 ? 3'h0 : _ctrlSignals_T_250; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_252 = _ctrlSignals_T_77 ? 3'h0 : _ctrlSignals_T_251; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_253 = _ctrlSignals_T_75 ? 3'h0 : _ctrlSignals_T_252; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_254 = _ctrlSignals_T_73 ? 3'h0 : _ctrlSignals_T_253; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_255 = _ctrlSignals_T_71 ? 3'h0 : _ctrlSignals_T_254; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_256 = _ctrlSignals_T_69 ? 3'h0 : _ctrlSignals_T_255; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_257 = _ctrlSignals_T_67 ? 3'h0 : _ctrlSignals_T_256; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_258 = _ctrlSignals_T_65 ? 3'h0 : _ctrlSignals_T_257; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_259 = _ctrlSignals_T_63 ? 3'h0 : _ctrlSignals_T_258; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_260 = _ctrlSignals_T_61 ? 3'h0 : _ctrlSignals_T_259; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_261 = _ctrlSignals_T_59 ? 3'h0 : _ctrlSignals_T_260; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_262 = _ctrlSignals_T_57 ? 3'h0 : _ctrlSignals_T_261; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_263 = _ctrlSignals_T_55 ? 3'h0 : _ctrlSignals_T_262; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_264 = _ctrlSignals_T_53 ? 3'h1 : _ctrlSignals_T_263; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_265 = _ctrlSignals_T_51 ? 3'h1 : _ctrlSignals_T_264; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_266 = _ctrlSignals_T_49 ? 3'h1 : _ctrlSignals_T_265; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_267 = _ctrlSignals_T_47 ? 3'h1 : _ctrlSignals_T_266; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_268 = _ctrlSignals_T_45 ? 3'h1 : _ctrlSignals_T_267; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_269 = _ctrlSignals_T_43 ? 3'h1 : _ctrlSignals_T_268; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_270 = _ctrlSignals_T_41 ? 3'h1 : _ctrlSignals_T_269; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_271 = _ctrlSignals_T_39 ? 3'h1 : _ctrlSignals_T_270; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_272 = _ctrlSignals_T_37 ? 3'h1 : _ctrlSignals_T_271; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_273 = _ctrlSignals_T_35 ? 3'h2 : _ctrlSignals_T_272; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_274 = _ctrlSignals_T_33 ? 3'h2 : _ctrlSignals_T_273; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_275 = _ctrlSignals_T_31 ? 3'h2 : _ctrlSignals_T_274; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_276 = _ctrlSignals_T_29 ? 3'h1 : _ctrlSignals_T_275; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_277 = _ctrlSignals_T_27 ? 3'h1 : _ctrlSignals_T_276; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_278 = _ctrlSignals_T_25 ? 3'h1 : _ctrlSignals_T_277; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_279 = _ctrlSignals_T_23 ? 3'h1 : _ctrlSignals_T_278; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_280 = _ctrlSignals_T_21 ? 3'h1 : _ctrlSignals_T_279; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_281 = _ctrlSignals_T_19 ? 3'h5 : _ctrlSignals_T_280; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_282 = _ctrlSignals_T_17 ? 3'h5 : _ctrlSignals_T_281; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_283 = _ctrlSignals_T_15 ? 3'h5 : _ctrlSignals_T_282; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_284 = _ctrlSignals_T_13 ? 3'h5 : _ctrlSignals_T_283; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_285 = _ctrlSignals_T_11 ? 3'h5 : _ctrlSignals_T_284; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_286 = _ctrlSignals_T_9 ? 3'h5 : _ctrlSignals_T_285; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_287 = _ctrlSignals_T_7 ? 3'h1 : _ctrlSignals_T_286; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_288 = _ctrlSignals_T_5 ? 3'h4 : _ctrlSignals_T_287; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_289 = _ctrlSignals_T_3 ? 3'h3 : _ctrlSignals_T_288; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_297 = _ctrlSignals_T_83 ? 4'ha : 4'hf; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_298 = _ctrlSignals_T_81 ? 4'ha : _ctrlSignals_T_297; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_299 = _ctrlSignals_T_79 ? 4'ha : _ctrlSignals_T_298; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_300 = _ctrlSignals_T_77 ? 4'hf : _ctrlSignals_T_299; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_301 = _ctrlSignals_T_75 ? 4'hf : _ctrlSignals_T_300; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_302 = _ctrlSignals_T_73 ? 4'h2 : _ctrlSignals_T_301; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_303 = _ctrlSignals_T_71 ? 4'h3 : _ctrlSignals_T_302; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_304 = _ctrlSignals_T_69 ? 4'h9 : _ctrlSignals_T_303; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_305 = _ctrlSignals_T_67 ? 4'h8 : _ctrlSignals_T_304; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_306 = _ctrlSignals_T_65 ? 4'h4 : _ctrlSignals_T_305; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_307 = _ctrlSignals_T_63 ? 4'h7 : _ctrlSignals_T_306; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_308 = _ctrlSignals_T_61 ? 4'h5 : _ctrlSignals_T_307; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_309 = _ctrlSignals_T_59 ? 4'h6 : _ctrlSignals_T_308; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_310 = _ctrlSignals_T_57 ? 4'h1 : _ctrlSignals_T_309; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_311 = _ctrlSignals_T_55 ? 4'h0 : _ctrlSignals_T_310; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_312 = _ctrlSignals_T_53 ? 4'h9 : _ctrlSignals_T_311; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_313 = _ctrlSignals_T_51 ? 4'h8 : _ctrlSignals_T_312; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_314 = _ctrlSignals_T_49 ? 4'h6 : _ctrlSignals_T_313; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_315 = _ctrlSignals_T_47 ? 4'h2 : _ctrlSignals_T_314; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_316 = _ctrlSignals_T_45 ? 4'h3 : _ctrlSignals_T_315; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_317 = _ctrlSignals_T_43 ? 4'h4 : _ctrlSignals_T_316; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_318 = _ctrlSignals_T_41 ? 4'h7 : _ctrlSignals_T_317; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_319 = _ctrlSignals_T_39 ? 4'h5 : _ctrlSignals_T_318; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_320 = _ctrlSignals_T_37 ? 4'h0 : _ctrlSignals_T_319; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_321 = _ctrlSignals_T_35 ? 4'h0 : _ctrlSignals_T_320; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_322 = _ctrlSignals_T_33 ? 4'h0 : _ctrlSignals_T_321; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_323 = _ctrlSignals_T_31 ? 4'h0 : _ctrlSignals_T_322; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_324 = _ctrlSignals_T_29 ? 4'h0 : _ctrlSignals_T_323; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_325 = _ctrlSignals_T_27 ? 4'h0 : _ctrlSignals_T_324; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_326 = _ctrlSignals_T_25 ? 4'h0 : _ctrlSignals_T_325; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_327 = _ctrlSignals_T_23 ? 4'h0 : _ctrlSignals_T_326; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_328 = _ctrlSignals_T_21 ? 4'h0 : _ctrlSignals_T_327; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_329 = _ctrlSignals_T_19 ? 4'h0 : _ctrlSignals_T_328; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_330 = _ctrlSignals_T_17 ? 4'h0 : _ctrlSignals_T_329; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_331 = _ctrlSignals_T_15 ? 4'h0 : _ctrlSignals_T_330; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_332 = _ctrlSignals_T_13 ? 4'h0 : _ctrlSignals_T_331; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_333 = _ctrlSignals_T_11 ? 4'h0 : _ctrlSignals_T_332; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_334 = _ctrlSignals_T_9 ? 4'h0 : _ctrlSignals_T_333; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_335 = _ctrlSignals_T_7 ? 4'h0 : _ctrlSignals_T_334; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_336 = _ctrlSignals_T_5 ? 4'h0 : _ctrlSignals_T_335; // @[Lookup.scala 34:39]
  wire [3:0] _ctrlSignals_T_337 = _ctrlSignals_T_3 ? 4'h0 : _ctrlSignals_T_336; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_377 = _ctrlSignals_T_19 ? 3'h4 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_378 = _ctrlSignals_T_17 ? 3'h1 : _ctrlSignals_T_377; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_379 = _ctrlSignals_T_15 ? 3'h5 : _ctrlSignals_T_378; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_380 = _ctrlSignals_T_13 ? 3'h2 : _ctrlSignals_T_379; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_381 = _ctrlSignals_T_11 ? 3'h6 : _ctrlSignals_T_380; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_382 = _ctrlSignals_T_9 ? 3'h3 : _ctrlSignals_T_381; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_383 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_382; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_384 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_383; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_385 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_384; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_388 = _ctrlSignals_T_93 ? 1'h0 : _ctrlSignals_T_95; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_389 = _ctrlSignals_T_91 ? 1'h0 : _ctrlSignals_T_388; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_397 = _ctrlSignals_T_75 ? 1'h0 : _ctrlSignals_T_77 | (_ctrlSignals_T_79 | (_ctrlSignals_T_81 | (
    _ctrlSignals_T_83 | (_ctrlSignals_T_85 | (_ctrlSignals_T_87 | (_ctrlSignals_T_89 | _ctrlSignals_T_389)))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_398 = _ctrlSignals_T_73 ? 1'h0 : _ctrlSignals_T_397; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_399 = _ctrlSignals_T_71 ? 1'h0 : _ctrlSignals_T_398; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_400 = _ctrlSignals_T_69 ? 1'h0 : _ctrlSignals_T_399; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_401 = _ctrlSignals_T_67 ? 1'h0 : _ctrlSignals_T_400; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_402 = _ctrlSignals_T_65 ? 1'h0 : _ctrlSignals_T_401; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_403 = _ctrlSignals_T_63 ? 1'h0 : _ctrlSignals_T_402; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_404 = _ctrlSignals_T_61 ? 1'h0 : _ctrlSignals_T_403; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_405 = _ctrlSignals_T_59 ? 1'h0 : _ctrlSignals_T_404; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_406 = _ctrlSignals_T_57 ? 1'h0 : _ctrlSignals_T_405; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_407 = _ctrlSignals_T_55 ? 1'h0 : _ctrlSignals_T_406; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_408 = _ctrlSignals_T_53 ? 1'h0 : _ctrlSignals_T_407; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_409 = _ctrlSignals_T_51 ? 1'h0 : _ctrlSignals_T_408; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_410 = _ctrlSignals_T_49 ? 1'h0 : _ctrlSignals_T_409; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_411 = _ctrlSignals_T_47 ? 1'h0 : _ctrlSignals_T_410; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_412 = _ctrlSignals_T_45 ? 1'h0 : _ctrlSignals_T_411; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_413 = _ctrlSignals_T_43 ? 1'h0 : _ctrlSignals_T_412; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_414 = _ctrlSignals_T_41 ? 1'h0 : _ctrlSignals_T_413; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_415 = _ctrlSignals_T_39 ? 1'h0 : _ctrlSignals_T_414; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_416 = _ctrlSignals_T_37 ? 1'h0 : _ctrlSignals_T_415; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_417 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_416; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_418 = _ctrlSignals_T_33 ? 1'h0 : _ctrlSignals_T_417; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_419 = _ctrlSignals_T_31 ? 1'h0 : _ctrlSignals_T_418; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_425 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_21 | (_ctrlSignals_T_23 | (_ctrlSignals_T_25 | (
    _ctrlSignals_T_27 | (_ctrlSignals_T_29 | _ctrlSignals_T_419)))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_426 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_425; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_427 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_426; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_428 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_427; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_429 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_428; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_430 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_429; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_433 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_5 | (_ctrlSignals_T_7 | _ctrlSignals_T_430); // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_465 = _ctrlSignals_T_35 ? 2'h1 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_466 = _ctrlSignals_T_33 ? 2'h2 : _ctrlSignals_T_465; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_467 = _ctrlSignals_T_31 ? 2'h3 : _ctrlSignals_T_466; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_468 = _ctrlSignals_T_29 ? 2'h0 : _ctrlSignals_T_467; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_469 = _ctrlSignals_T_27 ? 2'h0 : _ctrlSignals_T_468; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_470 = _ctrlSignals_T_25 ? 2'h0 : _ctrlSignals_T_469; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_471 = _ctrlSignals_T_23 ? 2'h0 : _ctrlSignals_T_470; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_472 = _ctrlSignals_T_21 ? 2'h0 : _ctrlSignals_T_471; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_473 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_472; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_474 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_473; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_475 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_474; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_476 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_475; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_477 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_476; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_478 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_477; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_479 = _ctrlSignals_T_7 ? 2'h0 : _ctrlSignals_T_478; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_480 = _ctrlSignals_T_5 ? 2'h0 : _ctrlSignals_T_479; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_481 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_480; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_516 = _ctrlSignals_T_29 ? 3'h4 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_517 = _ctrlSignals_T_27 ? 3'h5 : _ctrlSignals_T_516; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_518 = _ctrlSignals_T_25 ? 3'h1 : _ctrlSignals_T_517; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_519 = _ctrlSignals_T_23 ? 3'h2 : _ctrlSignals_T_518; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_520 = _ctrlSignals_T_21 ? 3'h3 : _ctrlSignals_T_519; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_521 = _ctrlSignals_T_19 ? 3'h0 : _ctrlSignals_T_520; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_522 = _ctrlSignals_T_17 ? 3'h0 : _ctrlSignals_T_521; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_523 = _ctrlSignals_T_15 ? 3'h0 : _ctrlSignals_T_522; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_524 = _ctrlSignals_T_13 ? 3'h0 : _ctrlSignals_T_523; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_525 = _ctrlSignals_T_11 ? 3'h0 : _ctrlSignals_T_524; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_526 = _ctrlSignals_T_9 ? 3'h0 : _ctrlSignals_T_525; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_527 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_526; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_528 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_527; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_529 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_528; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_532 = _ctrlSignals_T_93 ? 2'h3 : _ctrlSignals_T_99; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_533 = _ctrlSignals_T_91 ? 2'h3 : _ctrlSignals_T_532; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_534 = _ctrlSignals_T_89 ? 2'h3 : _ctrlSignals_T_533; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_535 = _ctrlSignals_T_87 ? 2'h3 : _ctrlSignals_T_534; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_536 = _ctrlSignals_T_85 ? 2'h3 : _ctrlSignals_T_535; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_537 = _ctrlSignals_T_83 ? 2'h3 : _ctrlSignals_T_536; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_538 = _ctrlSignals_T_81 ? 2'h3 : _ctrlSignals_T_537; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_539 = _ctrlSignals_T_79 ? 2'h3 : _ctrlSignals_T_538; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_540 = _ctrlSignals_T_77 ? 2'h0 : _ctrlSignals_T_539; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_541 = _ctrlSignals_T_75 ? 2'h0 : _ctrlSignals_T_540; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_542 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_541; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_543 = _ctrlSignals_T_71 ? 2'h0 : _ctrlSignals_T_542; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_544 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_543; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_545 = _ctrlSignals_T_67 ? 2'h0 : _ctrlSignals_T_544; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_546 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_545; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_547 = _ctrlSignals_T_63 ? 2'h0 : _ctrlSignals_T_546; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_548 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_547; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_549 = _ctrlSignals_T_59 ? 2'h0 : _ctrlSignals_T_548; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_550 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_549; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_551 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_550; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_552 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_551; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_553 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_552; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_554 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_553; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_555 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_554; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_556 = _ctrlSignals_T_45 ? 2'h0 : _ctrlSignals_T_555; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_557 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_556; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_558 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_557; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_559 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_558; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_560 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_559; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_561 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_560; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_562 = _ctrlSignals_T_33 ? 2'h0 : _ctrlSignals_T_561; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_563 = _ctrlSignals_T_31 ? 2'h0 : _ctrlSignals_T_562; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_564 = _ctrlSignals_T_29 ? 2'h1 : _ctrlSignals_T_563; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_565 = _ctrlSignals_T_27 ? 2'h1 : _ctrlSignals_T_564; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_566 = _ctrlSignals_T_25 ? 2'h1 : _ctrlSignals_T_565; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_567 = _ctrlSignals_T_23 ? 2'h1 : _ctrlSignals_T_566; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_568 = _ctrlSignals_T_21 ? 2'h1 : _ctrlSignals_T_567; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_569 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_568; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_570 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_569; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_571 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_570; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_572 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_571; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_573 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_572; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_574 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_573; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_575 = _ctrlSignals_T_7 ? 2'h2 : _ctrlSignals_T_574; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_576 = _ctrlSignals_T_5 ? 2'h2 : _ctrlSignals_T_575; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_577 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_576; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_588 = _ctrlSignals_T_77 ? 1'h0 : _ctrlSignals_T_79 | (_ctrlSignals_T_81 | (_ctrlSignals_T_83 | (
    _ctrlSignals_T_85 | (_ctrlSignals_T_87 | _ctrlSignals_T_89)))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_589 = _ctrlSignals_T_75 ? 1'h0 : _ctrlSignals_T_588; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_609 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_37 | (_ctrlSignals_T_39 | (_ctrlSignals_T_41 | (
    _ctrlSignals_T_43 | (_ctrlSignals_T_45 | (_ctrlSignals_T_47 | (_ctrlSignals_T_49 | (_ctrlSignals_T_51 | (
    _ctrlSignals_T_53 | (_ctrlSignals_T_55 | (_ctrlSignals_T_57 | (_ctrlSignals_T_59 | (_ctrlSignals_T_61 | (
    _ctrlSignals_T_63 | (_ctrlSignals_T_65 | (_ctrlSignals_T_67 | (_ctrlSignals_T_69 | (_ctrlSignals_T_71 | (
    _ctrlSignals_T_73 | _ctrlSignals_T_589)))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_610 = _ctrlSignals_T_33 ? 1'h0 : _ctrlSignals_T_609; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_611 = _ctrlSignals_T_31 ? 1'h0 : _ctrlSignals_T_610; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_617 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_21 | (_ctrlSignals_T_23 | (_ctrlSignals_T_25 | (
    _ctrlSignals_T_27 | (_ctrlSignals_T_29 | _ctrlSignals_T_611)))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_618 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_617; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_619 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_618; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_620 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_619; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_621 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_620; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_622 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_621; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_627 = _ctrlSignals_T_95 ? 3'h4 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_628 = _ctrlSignals_T_93 ? 3'h4 : _ctrlSignals_T_627; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_629 = _ctrlSignals_T_91 ? 3'h4 : _ctrlSignals_T_628; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_630 = _ctrlSignals_T_89 ? 3'h3 : _ctrlSignals_T_629; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_631 = _ctrlSignals_T_87 ? 3'h2 : _ctrlSignals_T_630; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_632 = _ctrlSignals_T_85 ? 3'h1 : _ctrlSignals_T_631; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_633 = _ctrlSignals_T_83 ? 3'h3 : _ctrlSignals_T_632; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_634 = _ctrlSignals_T_81 ? 3'h2 : _ctrlSignals_T_633; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_635 = _ctrlSignals_T_79 ? 3'h1 : _ctrlSignals_T_634; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_636 = _ctrlSignals_T_77 ? 3'h0 : _ctrlSignals_T_635; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_637 = _ctrlSignals_T_75 ? 3'h0 : _ctrlSignals_T_636; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_638 = _ctrlSignals_T_73 ? 3'h0 : _ctrlSignals_T_637; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_639 = _ctrlSignals_T_71 ? 3'h0 : _ctrlSignals_T_638; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_640 = _ctrlSignals_T_69 ? 3'h0 : _ctrlSignals_T_639; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_641 = _ctrlSignals_T_67 ? 3'h0 : _ctrlSignals_T_640; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_642 = _ctrlSignals_T_65 ? 3'h0 : _ctrlSignals_T_641; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_643 = _ctrlSignals_T_63 ? 3'h0 : _ctrlSignals_T_642; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_644 = _ctrlSignals_T_61 ? 3'h0 : _ctrlSignals_T_643; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_645 = _ctrlSignals_T_59 ? 3'h0 : _ctrlSignals_T_644; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_646 = _ctrlSignals_T_57 ? 3'h0 : _ctrlSignals_T_645; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_647 = _ctrlSignals_T_55 ? 3'h0 : _ctrlSignals_T_646; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_648 = _ctrlSignals_T_53 ? 3'h0 : _ctrlSignals_T_647; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_649 = _ctrlSignals_T_51 ? 3'h0 : _ctrlSignals_T_648; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_650 = _ctrlSignals_T_49 ? 3'h0 : _ctrlSignals_T_649; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_651 = _ctrlSignals_T_47 ? 3'h0 : _ctrlSignals_T_650; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_652 = _ctrlSignals_T_45 ? 3'h0 : _ctrlSignals_T_651; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_653 = _ctrlSignals_T_43 ? 3'h0 : _ctrlSignals_T_652; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_654 = _ctrlSignals_T_41 ? 3'h0 : _ctrlSignals_T_653; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_655 = _ctrlSignals_T_39 ? 3'h0 : _ctrlSignals_T_654; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_656 = _ctrlSignals_T_37 ? 3'h0 : _ctrlSignals_T_655; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_657 = _ctrlSignals_T_35 ? 3'h0 : _ctrlSignals_T_656; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_658 = _ctrlSignals_T_33 ? 3'h0 : _ctrlSignals_T_657; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_659 = _ctrlSignals_T_31 ? 3'h0 : _ctrlSignals_T_658; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_660 = _ctrlSignals_T_29 ? 3'h0 : _ctrlSignals_T_659; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_661 = _ctrlSignals_T_27 ? 3'h0 : _ctrlSignals_T_660; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_662 = _ctrlSignals_T_25 ? 3'h0 : _ctrlSignals_T_661; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_663 = _ctrlSignals_T_23 ? 3'h0 : _ctrlSignals_T_662; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_664 = _ctrlSignals_T_21 ? 3'h0 : _ctrlSignals_T_663; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_665 = _ctrlSignals_T_19 ? 3'h0 : _ctrlSignals_T_664; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_666 = _ctrlSignals_T_17 ? 3'h0 : _ctrlSignals_T_665; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_667 = _ctrlSignals_T_15 ? 3'h0 : _ctrlSignals_T_666; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_668 = _ctrlSignals_T_13 ? 3'h0 : _ctrlSignals_T_667; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_669 = _ctrlSignals_T_11 ? 3'h0 : _ctrlSignals_T_668; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_670 = _ctrlSignals_T_9 ? 3'h0 : _ctrlSignals_T_669; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_671 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_670; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_672 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_671; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_673 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_672; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_674 = _ctrlSignals_T_97 ? 1'h0 : 1'h1; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_675 = _ctrlSignals_T_95 ? 1'h0 : _ctrlSignals_T_674; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_676 = _ctrlSignals_T_93 ? 1'h0 : _ctrlSignals_T_675; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_677 = _ctrlSignals_T_91 ? 1'h0 : _ctrlSignals_T_676; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_678 = _ctrlSignals_T_89 ? 1'h0 : _ctrlSignals_T_677; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_679 = _ctrlSignals_T_87 ? 1'h0 : _ctrlSignals_T_678; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_680 = _ctrlSignals_T_85 ? 1'h0 : _ctrlSignals_T_679; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_681 = _ctrlSignals_T_83 ? 1'h0 : _ctrlSignals_T_680; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_682 = _ctrlSignals_T_81 ? 1'h0 : _ctrlSignals_T_681; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_683 = _ctrlSignals_T_79 ? 1'h0 : _ctrlSignals_T_682; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_684 = _ctrlSignals_T_77 ? 1'h0 : _ctrlSignals_T_683; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_685 = _ctrlSignals_T_75 ? 1'h0 : _ctrlSignals_T_684; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_686 = _ctrlSignals_T_73 ? 1'h0 : _ctrlSignals_T_685; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_687 = _ctrlSignals_T_71 ? 1'h0 : _ctrlSignals_T_686; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_688 = _ctrlSignals_T_69 ? 1'h0 : _ctrlSignals_T_687; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_689 = _ctrlSignals_T_67 ? 1'h0 : _ctrlSignals_T_688; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_690 = _ctrlSignals_T_65 ? 1'h0 : _ctrlSignals_T_689; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_691 = _ctrlSignals_T_63 ? 1'h0 : _ctrlSignals_T_690; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_692 = _ctrlSignals_T_61 ? 1'h0 : _ctrlSignals_T_691; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_693 = _ctrlSignals_T_59 ? 1'h0 : _ctrlSignals_T_692; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_694 = _ctrlSignals_T_57 ? 1'h0 : _ctrlSignals_T_693; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_695 = _ctrlSignals_T_55 ? 1'h0 : _ctrlSignals_T_694; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_696 = _ctrlSignals_T_53 ? 1'h0 : _ctrlSignals_T_695; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_697 = _ctrlSignals_T_51 ? 1'h0 : _ctrlSignals_T_696; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_698 = _ctrlSignals_T_49 ? 1'h0 : _ctrlSignals_T_697; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_699 = _ctrlSignals_T_47 ? 1'h0 : _ctrlSignals_T_698; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_700 = _ctrlSignals_T_45 ? 1'h0 : _ctrlSignals_T_699; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_701 = _ctrlSignals_T_43 ? 1'h0 : _ctrlSignals_T_700; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_702 = _ctrlSignals_T_41 ? 1'h0 : _ctrlSignals_T_701; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_703 = _ctrlSignals_T_39 ? 1'h0 : _ctrlSignals_T_702; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_704 = _ctrlSignals_T_37 ? 1'h0 : _ctrlSignals_T_703; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_705 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_704; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_706 = _ctrlSignals_T_33 ? 1'h0 : _ctrlSignals_T_705; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_707 = _ctrlSignals_T_31 ? 1'h0 : _ctrlSignals_T_706; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_708 = _ctrlSignals_T_29 ? 1'h0 : _ctrlSignals_T_707; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_709 = _ctrlSignals_T_27 ? 1'h0 : _ctrlSignals_T_708; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_710 = _ctrlSignals_T_25 ? 1'h0 : _ctrlSignals_T_709; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_711 = _ctrlSignals_T_23 ? 1'h0 : _ctrlSignals_T_710; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_712 = _ctrlSignals_T_21 ? 1'h0 : _ctrlSignals_T_711; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_713 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_712; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_714 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_713; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_715 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_714; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_716 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_715; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_717 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_716; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_718 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_717; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_719 = _ctrlSignals_T_7 ? 1'h0 : _ctrlSignals_T_718; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_720 = _ctrlSignals_T_5 ? 1'h0 : _ctrlSignals_T_719; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_721 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_720; // @[Lookup.scala 34:39]
  assign io_pc_sel = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_145; // @[Lookup.scala 34:39]
  assign io_inst_kill = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_433; // @[Lookup.scala 34:39]
  assign io_A_sel = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_193; // @[Lookup.scala 34:39]
  assign io_B_sel = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_241; // @[Lookup.scala 34:39]
  assign io_imm_sel = _ctrlSignals_T_1 ? 3'h3 : _ctrlSignals_T_289; // @[Lookup.scala 34:39]
  assign io_alu_op = _ctrlSignals_T_1 ? 4'hb : _ctrlSignals_T_337; // @[Lookup.scala 34:39]
  assign io_br_type = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_385; // @[Lookup.scala 34:39]
  assign io_st_type = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_481; // @[Lookup.scala 34:39]
  assign io_ld_type = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_529; // @[Lookup.scala 34:39]
  assign io_wb_sel = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_577; // @[Lookup.scala 34:39]
  assign io_wb_en = _ctrlSignals_T_1 | (_ctrlSignals_T_3 | (_ctrlSignals_T_5 | (_ctrlSignals_T_7 | _ctrlSignals_T_622)))
    ; // @[Lookup.scala 34:39]
  assign io_csr_cmd = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_673; // @[Lookup.scala 34:39]
  assign io_illegal = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_721; // @[Lookup.scala 34:39]
endmodule
module Core(
  input           clock,
  input           reset,
  input           io_host_fromhost_valid,
  input  [31:0]   io_host_fromhost_bits,
  output [31:0]   io_host_tohost,
  output          io_icache_req_valid,
  output [31:0]   io_icache_req_bits_addr,
  input           io_icache_resp_valid,
  input  [31:0]   io_icache_resp_bits_data,
  output [31:0]   io_dcache_req_bits_addr,
  output [31:0]   io_dcache_req_bits_data,
  output [3:0]    io_dcache_req_bits_mask,
  input  [31:0]   io_dcache_resp_bits_data,
  output [31:0]   io_sigIO_lft_tile_imm,
  output [1023:0] io_sigIO_lft_tile_regfile,
  output [4:0]    io_sigIO_lft_tile_reg_rd1_addr_in,
  output [4:0]    io_sigIO_lft_tile_reg_rd2_addr_in,
  output [31:0]   io_sigIO_lft_tile_reg_rd1_data_out,
  output [31:0]   io_sigIO_lft_tile_reg_rd2_data_out,
  output [4:0]    io_sigIO_lft_tile_reg_wr_addr_in,
  output [31:0]   io_sigIO_lft_tile_reg_wr_data_in,
  output [31:0]   io_sigIO_lft_tile_alu_data_out,
  output [32:0]   io_sigIO_lft_tile_npc,
  output [32:0]   io_sigIO_lft_tile_pc,
  output [32:0]   io_sigIO_lft_tile_fe_pc,
  output [32:0]   io_sigIO_lft_tile_ew_pc,
  output [31:0]   io_sigIO_lft_tile_inst,
  output [31:0]   io_sigIO_lft_tile_fe_inst
);
  wire  dpath_clock; // @[Core.scala 76:21]
  wire  dpath_reset; // @[Core.scala 76:21]
  wire  dpath_io_host_fromhost_valid; // @[Core.scala 76:21]
  wire [31:0] dpath_io_host_fromhost_bits; // @[Core.scala 76:21]
  wire [31:0] dpath_io_host_tohost; // @[Core.scala 76:21]
  wire  dpath_io_icache_req_valid; // @[Core.scala 76:21]
  wire [31:0] dpath_io_icache_req_bits_addr; // @[Core.scala 76:21]
  wire  dpath_io_icache_resp_valid; // @[Core.scala 76:21]
  wire [31:0] dpath_io_icache_resp_bits_data; // @[Core.scala 76:21]
  wire [31:0] dpath_io_dcache_req_bits_addr; // @[Core.scala 76:21]
  wire [31:0] dpath_io_dcache_req_bits_data; // @[Core.scala 76:21]
  wire [3:0] dpath_io_dcache_req_bits_mask; // @[Core.scala 76:21]
  wire [31:0] dpath_io_dcache_resp_bits_data; // @[Core.scala 76:21]
  wire [31:0] dpath_io_ctrl_inst; // @[Core.scala 76:21]
  wire [1:0] dpath_io_ctrl_pc_sel; // @[Core.scala 76:21]
  wire  dpath_io_ctrl_inst_kill; // @[Core.scala 76:21]
  wire  dpath_io_ctrl_A_sel; // @[Core.scala 76:21]
  wire  dpath_io_ctrl_B_sel; // @[Core.scala 76:21]
  wire [2:0] dpath_io_ctrl_imm_sel; // @[Core.scala 76:21]
  wire [3:0] dpath_io_ctrl_alu_op; // @[Core.scala 76:21]
  wire [2:0] dpath_io_ctrl_br_type; // @[Core.scala 76:21]
  wire [1:0] dpath_io_ctrl_st_type; // @[Core.scala 76:21]
  wire [2:0] dpath_io_ctrl_ld_type; // @[Core.scala 76:21]
  wire [1:0] dpath_io_ctrl_wb_sel; // @[Core.scala 76:21]
  wire  dpath_io_ctrl_wb_en; // @[Core.scala 76:21]
  wire [2:0] dpath_io_ctrl_csr_cmd; // @[Core.scala 76:21]
  wire  dpath_io_ctrl_illegal; // @[Core.scala 76:21]
  wire [31:0] dpath_io_sigIO_lft_tile_imm; // @[Core.scala 76:21]
  wire [1023:0] dpath_io_sigIO_lft_tile_regfile; // @[Core.scala 76:21]
  wire [4:0] dpath_io_sigIO_lft_tile_reg_rd1_addr_in; // @[Core.scala 76:21]
  wire [4:0] dpath_io_sigIO_lft_tile_reg_rd2_addr_in; // @[Core.scala 76:21]
  wire [31:0] dpath_io_sigIO_lft_tile_reg_rd1_data_out; // @[Core.scala 76:21]
  wire [31:0] dpath_io_sigIO_lft_tile_reg_rd2_data_out; // @[Core.scala 76:21]
  wire [4:0] dpath_io_sigIO_lft_tile_reg_wr_addr_in; // @[Core.scala 76:21]
  wire [31:0] dpath_io_sigIO_lft_tile_reg_wr_data_in; // @[Core.scala 76:21]
  wire [31:0] dpath_io_sigIO_lft_tile_alu_data_out; // @[Core.scala 76:21]
  wire [32:0] dpath_io_sigIO_lft_tile_npc; // @[Core.scala 76:21]
  wire [32:0] dpath_io_sigIO_lft_tile_pc; // @[Core.scala 76:21]
  wire [32:0] dpath_io_sigIO_lft_tile_fe_pc; // @[Core.scala 76:21]
  wire [32:0] dpath_io_sigIO_lft_tile_ew_pc; // @[Core.scala 76:21]
  wire [31:0] dpath_io_sigIO_lft_tile_inst; // @[Core.scala 76:21]
  wire [31:0] dpath_io_sigIO_lft_tile_fe_inst; // @[Core.scala 76:21]
  wire [31:0] ctrl_io_inst; // @[Core.scala 77:20]
  wire [1:0] ctrl_io_pc_sel; // @[Core.scala 77:20]
  wire  ctrl_io_inst_kill; // @[Core.scala 77:20]
  wire  ctrl_io_A_sel; // @[Core.scala 77:20]
  wire  ctrl_io_B_sel; // @[Core.scala 77:20]
  wire [2:0] ctrl_io_imm_sel; // @[Core.scala 77:20]
  wire [3:0] ctrl_io_alu_op; // @[Core.scala 77:20]
  wire [2:0] ctrl_io_br_type; // @[Core.scala 77:20]
  wire [1:0] ctrl_io_st_type; // @[Core.scala 77:20]
  wire [2:0] ctrl_io_ld_type; // @[Core.scala 77:20]
  wire [1:0] ctrl_io_wb_sel; // @[Core.scala 77:20]
  wire  ctrl_io_wb_en; // @[Core.scala 77:20]
  wire [2:0] ctrl_io_csr_cmd; // @[Core.scala 77:20]
  wire  ctrl_io_illegal; // @[Core.scala 77:20]
  Datapath dpath ( // @[Core.scala 76:21]
    .clock(dpath_clock),
    .reset(dpath_reset),
    .io_host_fromhost_valid(dpath_io_host_fromhost_valid),
    .io_host_fromhost_bits(dpath_io_host_fromhost_bits),
    .io_host_tohost(dpath_io_host_tohost),
    .io_icache_req_valid(dpath_io_icache_req_valid),
    .io_icache_req_bits_addr(dpath_io_icache_req_bits_addr),
    .io_icache_resp_valid(dpath_io_icache_resp_valid),
    .io_icache_resp_bits_data(dpath_io_icache_resp_bits_data),
    .io_dcache_req_bits_addr(dpath_io_dcache_req_bits_addr),
    .io_dcache_req_bits_data(dpath_io_dcache_req_bits_data),
    .io_dcache_req_bits_mask(dpath_io_dcache_req_bits_mask),
    .io_dcache_resp_bits_data(dpath_io_dcache_resp_bits_data),
    .io_ctrl_inst(dpath_io_ctrl_inst),
    .io_ctrl_pc_sel(dpath_io_ctrl_pc_sel),
    .io_ctrl_inst_kill(dpath_io_ctrl_inst_kill),
    .io_ctrl_A_sel(dpath_io_ctrl_A_sel),
    .io_ctrl_B_sel(dpath_io_ctrl_B_sel),
    .io_ctrl_imm_sel(dpath_io_ctrl_imm_sel),
    .io_ctrl_alu_op(dpath_io_ctrl_alu_op),
    .io_ctrl_br_type(dpath_io_ctrl_br_type),
    .io_ctrl_st_type(dpath_io_ctrl_st_type),
    .io_ctrl_ld_type(dpath_io_ctrl_ld_type),
    .io_ctrl_wb_sel(dpath_io_ctrl_wb_sel),
    .io_ctrl_wb_en(dpath_io_ctrl_wb_en),
    .io_ctrl_csr_cmd(dpath_io_ctrl_csr_cmd),
    .io_ctrl_illegal(dpath_io_ctrl_illegal),
    .io_sigIO_lft_tile_imm(dpath_io_sigIO_lft_tile_imm),
    .io_sigIO_lft_tile_regfile(dpath_io_sigIO_lft_tile_regfile),
    .io_sigIO_lft_tile_reg_rd1_addr_in(dpath_io_sigIO_lft_tile_reg_rd1_addr_in),
    .io_sigIO_lft_tile_reg_rd2_addr_in(dpath_io_sigIO_lft_tile_reg_rd2_addr_in),
    .io_sigIO_lft_tile_reg_rd1_data_out(dpath_io_sigIO_lft_tile_reg_rd1_data_out),
    .io_sigIO_lft_tile_reg_rd2_data_out(dpath_io_sigIO_lft_tile_reg_rd2_data_out),
    .io_sigIO_lft_tile_reg_wr_addr_in(dpath_io_sigIO_lft_tile_reg_wr_addr_in),
    .io_sigIO_lft_tile_reg_wr_data_in(dpath_io_sigIO_lft_tile_reg_wr_data_in),
    .io_sigIO_lft_tile_alu_data_out(dpath_io_sigIO_lft_tile_alu_data_out),
    .io_sigIO_lft_tile_npc(dpath_io_sigIO_lft_tile_npc),
    .io_sigIO_lft_tile_pc(dpath_io_sigIO_lft_tile_pc),
    .io_sigIO_lft_tile_fe_pc(dpath_io_sigIO_lft_tile_fe_pc),
    .io_sigIO_lft_tile_ew_pc(dpath_io_sigIO_lft_tile_ew_pc),
    .io_sigIO_lft_tile_inst(dpath_io_sigIO_lft_tile_inst),
    .io_sigIO_lft_tile_fe_inst(dpath_io_sigIO_lft_tile_fe_inst)
  );
  Control ctrl ( // @[Core.scala 77:20]
    .io_inst(ctrl_io_inst),
    .io_pc_sel(ctrl_io_pc_sel),
    .io_inst_kill(ctrl_io_inst_kill),
    .io_A_sel(ctrl_io_A_sel),
    .io_B_sel(ctrl_io_B_sel),
    .io_imm_sel(ctrl_io_imm_sel),
    .io_alu_op(ctrl_io_alu_op),
    .io_br_type(ctrl_io_br_type),
    .io_st_type(ctrl_io_st_type),
    .io_ld_type(ctrl_io_ld_type),
    .io_wb_sel(ctrl_io_wb_sel),
    .io_wb_en(ctrl_io_wb_en),
    .io_csr_cmd(ctrl_io_csr_cmd),
    .io_illegal(ctrl_io_illegal)
  );
  assign io_host_tohost = dpath_io_host_tohost; // @[Core.scala 79:11]
  assign io_icache_req_valid = dpath_io_icache_req_valid; // @[Core.scala 80:19]
  assign io_icache_req_bits_addr = dpath_io_icache_req_bits_addr; // @[Core.scala 80:19]
  assign io_dcache_req_bits_addr = dpath_io_dcache_req_bits_addr; // @[Core.scala 81:19]
  assign io_dcache_req_bits_data = dpath_io_dcache_req_bits_data; // @[Core.scala 81:19]
  assign io_dcache_req_bits_mask = dpath_io_dcache_req_bits_mask; // @[Core.scala 81:19]
  assign io_sigIO_lft_tile_imm = dpath_io_sigIO_lft_tile_imm; // @[Core.scala 89:25]
  assign io_sigIO_lft_tile_regfile = dpath_io_sigIO_lft_tile_regfile; // @[Core.scala 90:29]
  assign io_sigIO_lft_tile_reg_rd1_addr_in = dpath_io_sigIO_lft_tile_reg_rd1_addr_in; // @[Core.scala 91:37]
  assign io_sigIO_lft_tile_reg_rd2_addr_in = dpath_io_sigIO_lft_tile_reg_rd2_addr_in; // @[Core.scala 92:37]
  assign io_sigIO_lft_tile_reg_rd1_data_out = dpath_io_sigIO_lft_tile_reg_rd1_data_out; // @[Core.scala 93:38]
  assign io_sigIO_lft_tile_reg_rd2_data_out = dpath_io_sigIO_lft_tile_reg_rd2_data_out; // @[Core.scala 94:38]
  assign io_sigIO_lft_tile_reg_wr_addr_in = dpath_io_sigIO_lft_tile_reg_wr_addr_in; // @[Core.scala 95:36]
  assign io_sigIO_lft_tile_reg_wr_data_in = dpath_io_sigIO_lft_tile_reg_wr_data_in; // @[Core.scala 96:36]
  assign io_sigIO_lft_tile_alu_data_out = dpath_io_sigIO_lft_tile_alu_data_out; // @[Core.scala 97:34]
  assign io_sigIO_lft_tile_npc = dpath_io_sigIO_lft_tile_npc; // @[Core.scala 98:25]
  assign io_sigIO_lft_tile_pc = dpath_io_sigIO_lft_tile_pc; // @[Core.scala 99:24]
  assign io_sigIO_lft_tile_fe_pc = dpath_io_sigIO_lft_tile_fe_pc; // @[Core.scala 100:27]
  assign io_sigIO_lft_tile_ew_pc = dpath_io_sigIO_lft_tile_ew_pc; // @[Core.scala 101:27]
  assign io_sigIO_lft_tile_inst = dpath_io_sigIO_lft_tile_inst; // @[Core.scala 102:26]
  assign io_sigIO_lft_tile_fe_inst = dpath_io_sigIO_lft_tile_fe_inst; // @[Core.scala 103:29]
  assign dpath_clock = clock;
  assign dpath_reset = reset;
  assign dpath_io_host_fromhost_valid = io_host_fromhost_valid; // @[Core.scala 79:11]
  assign dpath_io_host_fromhost_bits = io_host_fromhost_bits; // @[Core.scala 79:11]
  assign dpath_io_icache_resp_valid = io_icache_resp_valid; // @[Core.scala 80:19]
  assign dpath_io_icache_resp_bits_data = io_icache_resp_bits_data; // @[Core.scala 80:19]
  assign dpath_io_dcache_resp_bits_data = io_dcache_resp_bits_data; // @[Core.scala 81:19]
  assign dpath_io_ctrl_pc_sel = ctrl_io_pc_sel; // @[Core.scala 82:17]
  assign dpath_io_ctrl_inst_kill = ctrl_io_inst_kill; // @[Core.scala 82:17]
  assign dpath_io_ctrl_A_sel = ctrl_io_A_sel; // @[Core.scala 82:17]
  assign dpath_io_ctrl_B_sel = ctrl_io_B_sel; // @[Core.scala 82:17]
  assign dpath_io_ctrl_imm_sel = ctrl_io_imm_sel; // @[Core.scala 82:17]
  assign dpath_io_ctrl_alu_op = ctrl_io_alu_op; // @[Core.scala 82:17]
  assign dpath_io_ctrl_br_type = ctrl_io_br_type; // @[Core.scala 82:17]
  assign dpath_io_ctrl_st_type = ctrl_io_st_type; // @[Core.scala 82:17]
  assign dpath_io_ctrl_ld_type = ctrl_io_ld_type; // @[Core.scala 82:17]
  assign dpath_io_ctrl_wb_sel = ctrl_io_wb_sel; // @[Core.scala 82:17]
  assign dpath_io_ctrl_wb_en = ctrl_io_wb_en; // @[Core.scala 82:17]
  assign dpath_io_ctrl_csr_cmd = ctrl_io_csr_cmd; // @[Core.scala 82:17]
  assign dpath_io_ctrl_illegal = ctrl_io_illegal; // @[Core.scala 82:17]
  assign ctrl_io_inst = dpath_io_ctrl_inst; // @[Core.scala 82:17]
endmodule
module FakeDCache(
  input         clock,
  input  [31:0] io_req_bits_addr,
  input  [31:0] io_req_bits_data,
  input  [3:0]  io_req_bits_mask,
  output [31:0] io_resp_bits_data
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:9]; // @[CoreTop.scala 41:16]
  wire  mem_io_resp_bits_data_MPORT_en; // @[CoreTop.scala 41:16]
  wire [3:0] mem_io_resp_bits_data_MPORT_addr; // @[CoreTop.scala 41:16]
  wire [7:0] mem_io_resp_bits_data_MPORT_data; // @[CoreTop.scala 41:16]
  wire  mem_io_resp_bits_data_MPORT_1_en; // @[CoreTop.scala 41:16]
  wire [3:0] mem_io_resp_bits_data_MPORT_1_addr; // @[CoreTop.scala 41:16]
  wire [7:0] mem_io_resp_bits_data_MPORT_1_data; // @[CoreTop.scala 41:16]
  wire  mem_io_resp_bits_data_MPORT_2_en; // @[CoreTop.scala 41:16]
  wire [3:0] mem_io_resp_bits_data_MPORT_2_addr; // @[CoreTop.scala 41:16]
  wire [7:0] mem_io_resp_bits_data_MPORT_2_data; // @[CoreTop.scala 41:16]
  wire  mem_io_resp_bits_data_MPORT_3_en; // @[CoreTop.scala 41:16]
  wire [3:0] mem_io_resp_bits_data_MPORT_3_addr; // @[CoreTop.scala 41:16]
  wire [7:0] mem_io_resp_bits_data_MPORT_3_data; // @[CoreTop.scala 41:16]
  wire [7:0] mem_MPORT_data; // @[CoreTop.scala 41:16]
  wire [3:0] mem_MPORT_addr; // @[CoreTop.scala 41:16]
  wire  mem_MPORT_mask; // @[CoreTop.scala 41:16]
  wire  mem_MPORT_en; // @[CoreTop.scala 41:16]
  wire [7:0] mem_MPORT_1_data; // @[CoreTop.scala 41:16]
  wire [3:0] mem_MPORT_1_addr; // @[CoreTop.scala 41:16]
  wire  mem_MPORT_1_mask; // @[CoreTop.scala 41:16]
  wire  mem_MPORT_1_en; // @[CoreTop.scala 41:16]
  wire [7:0] mem_MPORT_2_data; // @[CoreTop.scala 41:16]
  wire [3:0] mem_MPORT_2_addr; // @[CoreTop.scala 41:16]
  wire  mem_MPORT_2_mask; // @[CoreTop.scala 41:16]
  wire  mem_MPORT_2_en; // @[CoreTop.scala 41:16]
  wire [7:0] mem_MPORT_3_data; // @[CoreTop.scala 41:16]
  wire [3:0] mem_MPORT_3_addr; // @[CoreTop.scala 41:16]
  wire  mem_MPORT_3_mask; // @[CoreTop.scala 41:16]
  wire  mem_MPORT_3_en; // @[CoreTop.scala 41:16]
  wire [29:0] addrMsb = io_req_bits_addr[31:2]; // @[CoreTop.scala 42:33]
  wire [31:0] _io_resp_bits_data_T = {addrMsb,2'h3}; // @[CoreTop.scala 45:22]
  wire [31:0] _io_resp_bits_data_T_2 = {addrMsb,2'h2}; // @[CoreTop.scala 46:22]
  wire [31:0] _io_resp_bits_data_T_5 = {addrMsb,2'h1}; // @[CoreTop.scala 47:22]
  wire [23:0] _io_resp_bits_data_T_7 = {mem_io_resp_bits_data_MPORT_data,mem_io_resp_bits_data_MPORT_1_data,
    mem_io_resp_bits_data_MPORT_2_data}; // @[CoreTop.scala 46:35]
  wire [31:0] _io_resp_bits_data_T_8 = {addrMsb,2'h0}; // @[CoreTop.scala 48:22]
  assign mem_io_resp_bits_data_MPORT_en = 1'h1;
  assign mem_io_resp_bits_data_MPORT_addr = _io_resp_bits_data_T[3:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_io_resp_bits_data_MPORT_data = mem[mem_io_resp_bits_data_MPORT_addr]; // @[CoreTop.scala 41:16]
  `else
  assign mem_io_resp_bits_data_MPORT_data = mem_io_resp_bits_data_MPORT_addr >= 4'ha ? _RAND_1[7:0] :
    mem[mem_io_resp_bits_data_MPORT_addr]; // @[CoreTop.scala 41:16]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_io_resp_bits_data_MPORT_1_en = 1'h1;
  assign mem_io_resp_bits_data_MPORT_1_addr = _io_resp_bits_data_T_2[3:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_io_resp_bits_data_MPORT_1_data = mem[mem_io_resp_bits_data_MPORT_1_addr]; // @[CoreTop.scala 41:16]
  `else
  assign mem_io_resp_bits_data_MPORT_1_data = mem_io_resp_bits_data_MPORT_1_addr >= 4'ha ? _RAND_2[7:0] :
    mem[mem_io_resp_bits_data_MPORT_1_addr]; // @[CoreTop.scala 41:16]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_io_resp_bits_data_MPORT_2_en = 1'h1;
  assign mem_io_resp_bits_data_MPORT_2_addr = _io_resp_bits_data_T_5[3:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_io_resp_bits_data_MPORT_2_data = mem[mem_io_resp_bits_data_MPORT_2_addr]; // @[CoreTop.scala 41:16]
  `else
  assign mem_io_resp_bits_data_MPORT_2_data = mem_io_resp_bits_data_MPORT_2_addr >= 4'ha ? _RAND_3[7:0] :
    mem[mem_io_resp_bits_data_MPORT_2_addr]; // @[CoreTop.scala 41:16]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_io_resp_bits_data_MPORT_3_en = 1'h1;
  assign mem_io_resp_bits_data_MPORT_3_addr = _io_resp_bits_data_T_8[3:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_io_resp_bits_data_MPORT_3_data = mem[mem_io_resp_bits_data_MPORT_3_addr]; // @[CoreTop.scala 41:16]
  `else
  assign mem_io_resp_bits_data_MPORT_3_data = mem_io_resp_bits_data_MPORT_3_addr >= 4'ha ? _RAND_4[7:0] :
    mem[mem_io_resp_bits_data_MPORT_3_addr]; // @[CoreTop.scala 41:16]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_MPORT_data = io_req_bits_data[31:24];
  assign mem_MPORT_addr = _io_resp_bits_data_T[3:0];
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_req_bits_mask[3];
  assign mem_MPORT_1_data = io_req_bits_data[23:16];
  assign mem_MPORT_1_addr = _io_resp_bits_data_T_2[3:0];
  assign mem_MPORT_1_mask = 1'h1;
  assign mem_MPORT_1_en = io_req_bits_mask[2];
  assign mem_MPORT_2_data = io_req_bits_data[15:8];
  assign mem_MPORT_2_addr = _io_resp_bits_data_T_5[3:0];
  assign mem_MPORT_2_mask = 1'h1;
  assign mem_MPORT_2_en = io_req_bits_mask[1];
  assign mem_MPORT_3_data = io_req_bits_data[7:0];
  assign mem_MPORT_3_addr = _io_resp_bits_data_T_8[3:0];
  assign mem_MPORT_3_mask = 1'h1;
  assign mem_MPORT_3_en = io_req_bits_mask[0];
  assign io_resp_bits_data = {_io_resp_bits_data_T_7,mem_io_resp_bits_data_MPORT_3_data}; // @[CoreTop.scala 47:35]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[CoreTop.scala 41:16]
    end
    if (mem_MPORT_1_en & mem_MPORT_1_mask) begin
      mem[mem_MPORT_1_addr] <= mem_MPORT_1_data; // @[CoreTop.scala 41:16]
    end
    if (mem_MPORT_2_en & mem_MPORT_2_mask) begin
      mem[mem_MPORT_2_addr] <= mem_MPORT_2_data; // @[CoreTop.scala 41:16]
    end
    if (mem_MPORT_3_en & mem_MPORT_3_mask) begin
      mem[mem_MPORT_3_addr] <= mem_MPORT_3_data; // @[CoreTop.scala 41:16]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
  _RAND_2 = {1{`RANDOM}};
  _RAND_3 = {1{`RANDOM}};
  _RAND_4 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 10; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CoreTop(
  input           clock,
  input           reset,
  output          io_io_icache_req_valid,
  output [31:0]   io_io_icache_req_bits_addr,
  output [31:0]   io_io_icache_req_bits_data,
  output [3:0]    io_io_icache_req_bits_mask,
  input           io_io_icache_resp_valid,
  input  [31:0]   io_io_icache_resp_bits_data,
  input           io_host_fromhost_valid,
  input  [31:0]   io_host_fromhost_bits,
  output [31:0]   io_host_tohost,
  output [31:0]   io_sigIO_lft_tile_imm,
  output [1023:0] io_sigIO_lft_tile_regfile,
  output [4:0]    io_sigIO_lft_tile_reg_rd1_addr_in,
  output [4:0]    io_sigIO_lft_tile_reg_rd2_addr_in,
  output [31:0]   io_sigIO_lft_tile_reg_rd1_data_out,
  output [31:0]   io_sigIO_lft_tile_reg_rd2_data_out,
  output [4:0]    io_sigIO_lft_tile_reg_wr_addr_in,
  output [31:0]   io_sigIO_lft_tile_reg_wr_data_in,
  output [31:0]   io_sigIO_lft_tile_alu_data_out,
  output [32:0]   io_sigIO_lft_tile_npc,
  output [32:0]   io_sigIO_lft_tile_pc,
  output [32:0]   io_sigIO_lft_tile_fe_pc,
  output [32:0]   io_sigIO_lft_tile_ew_pc,
  output [31:0]   io_sigIO_lft_tile_inst,
  output [31:0]   io_sigIO_lft_tile_fe_inst
);
  wire  core_clock; // @[CoreTop.scala 65:20]
  wire  core_reset; // @[CoreTop.scala 65:20]
  wire  core_io_host_fromhost_valid; // @[CoreTop.scala 65:20]
  wire [31:0] core_io_host_fromhost_bits; // @[CoreTop.scala 65:20]
  wire [31:0] core_io_host_tohost; // @[CoreTop.scala 65:20]
  wire  core_io_icache_req_valid; // @[CoreTop.scala 65:20]
  wire [31:0] core_io_icache_req_bits_addr; // @[CoreTop.scala 65:20]
  wire  core_io_icache_resp_valid; // @[CoreTop.scala 65:20]
  wire [31:0] core_io_icache_resp_bits_data; // @[CoreTop.scala 65:20]
  wire [31:0] core_io_dcache_req_bits_addr; // @[CoreTop.scala 65:20]
  wire [31:0] core_io_dcache_req_bits_data; // @[CoreTop.scala 65:20]
  wire [3:0] core_io_dcache_req_bits_mask; // @[CoreTop.scala 65:20]
  wire [31:0] core_io_dcache_resp_bits_data; // @[CoreTop.scala 65:20]
  wire [31:0] core_io_sigIO_lft_tile_imm; // @[CoreTop.scala 65:20]
  wire [1023:0] core_io_sigIO_lft_tile_regfile; // @[CoreTop.scala 65:20]
  wire [4:0] core_io_sigIO_lft_tile_reg_rd1_addr_in; // @[CoreTop.scala 65:20]
  wire [4:0] core_io_sigIO_lft_tile_reg_rd2_addr_in; // @[CoreTop.scala 65:20]
  wire [31:0] core_io_sigIO_lft_tile_reg_rd1_data_out; // @[CoreTop.scala 65:20]
  wire [31:0] core_io_sigIO_lft_tile_reg_rd2_data_out; // @[CoreTop.scala 65:20]
  wire [4:0] core_io_sigIO_lft_tile_reg_wr_addr_in; // @[CoreTop.scala 65:20]
  wire [31:0] core_io_sigIO_lft_tile_reg_wr_data_in; // @[CoreTop.scala 65:20]
  wire [31:0] core_io_sigIO_lft_tile_alu_data_out; // @[CoreTop.scala 65:20]
  wire [32:0] core_io_sigIO_lft_tile_npc; // @[CoreTop.scala 65:20]
  wire [32:0] core_io_sigIO_lft_tile_pc; // @[CoreTop.scala 65:20]
  wire [32:0] core_io_sigIO_lft_tile_fe_pc; // @[CoreTop.scala 65:20]
  wire [32:0] core_io_sigIO_lft_tile_ew_pc; // @[CoreTop.scala 65:20]
  wire [31:0] core_io_sigIO_lft_tile_inst; // @[CoreTop.scala 65:20]
  wire [31:0] core_io_sigIO_lft_tile_fe_inst; // @[CoreTop.scala 65:20]
  wire  dcache_clock; // @[CoreTop.scala 66:22]
  wire [31:0] dcache_io_req_bits_addr; // @[CoreTop.scala 66:22]
  wire [31:0] dcache_io_req_bits_data; // @[CoreTop.scala 66:22]
  wire [3:0] dcache_io_req_bits_mask; // @[CoreTop.scala 66:22]
  wire [31:0] dcache_io_resp_bits_data; // @[CoreTop.scala 66:22]
  Core core ( // @[CoreTop.scala 65:20]
    .clock(core_clock),
    .reset(core_reset),
    .io_host_fromhost_valid(core_io_host_fromhost_valid),
    .io_host_fromhost_bits(core_io_host_fromhost_bits),
    .io_host_tohost(core_io_host_tohost),
    .io_icache_req_valid(core_io_icache_req_valid),
    .io_icache_req_bits_addr(core_io_icache_req_bits_addr),
    .io_icache_resp_valid(core_io_icache_resp_valid),
    .io_icache_resp_bits_data(core_io_icache_resp_bits_data),
    .io_dcache_req_bits_addr(core_io_dcache_req_bits_addr),
    .io_dcache_req_bits_data(core_io_dcache_req_bits_data),
    .io_dcache_req_bits_mask(core_io_dcache_req_bits_mask),
    .io_dcache_resp_bits_data(core_io_dcache_resp_bits_data),
    .io_sigIO_lft_tile_imm(core_io_sigIO_lft_tile_imm),
    .io_sigIO_lft_tile_regfile(core_io_sigIO_lft_tile_regfile),
    .io_sigIO_lft_tile_reg_rd1_addr_in(core_io_sigIO_lft_tile_reg_rd1_addr_in),
    .io_sigIO_lft_tile_reg_rd2_addr_in(core_io_sigIO_lft_tile_reg_rd2_addr_in),
    .io_sigIO_lft_tile_reg_rd1_data_out(core_io_sigIO_lft_tile_reg_rd1_data_out),
    .io_sigIO_lft_tile_reg_rd2_data_out(core_io_sigIO_lft_tile_reg_rd2_data_out),
    .io_sigIO_lft_tile_reg_wr_addr_in(core_io_sigIO_lft_tile_reg_wr_addr_in),
    .io_sigIO_lft_tile_reg_wr_data_in(core_io_sigIO_lft_tile_reg_wr_data_in),
    .io_sigIO_lft_tile_alu_data_out(core_io_sigIO_lft_tile_alu_data_out),
    .io_sigIO_lft_tile_npc(core_io_sigIO_lft_tile_npc),
    .io_sigIO_lft_tile_pc(core_io_sigIO_lft_tile_pc),
    .io_sigIO_lft_tile_fe_pc(core_io_sigIO_lft_tile_fe_pc),
    .io_sigIO_lft_tile_ew_pc(core_io_sigIO_lft_tile_ew_pc),
    .io_sigIO_lft_tile_inst(core_io_sigIO_lft_tile_inst),
    .io_sigIO_lft_tile_fe_inst(core_io_sigIO_lft_tile_fe_inst)
  );
  FakeDCache dcache ( // @[CoreTop.scala 66:22]
    .clock(dcache_clock),
    .io_req_bits_addr(dcache_io_req_bits_addr),
    .io_req_bits_data(dcache_io_req_bits_data),
    .io_req_bits_mask(dcache_io_req_bits_mask),
    .io_resp_bits_data(dcache_io_resp_bits_data)
  );
  assign io_io_icache_req_valid = core_io_icache_req_valid; // @[CoreTop.scala 76:26]
  assign io_io_icache_req_bits_addr = core_io_icache_req_bits_addr; // @[CoreTop.scala 77:30]
  assign io_io_icache_req_bits_data = 32'h0; // @[CoreTop.scala 78:30]
  assign io_io_icache_req_bits_mask = 4'h0; // @[CoreTop.scala 79:32]
  assign io_host_tohost = core_io_host_tohost; // @[CoreTop.scala 72:11]
  assign io_sigIO_lft_tile_imm = core_io_sigIO_lft_tile_imm; // @[CoreTop.scala 119:25]
  assign io_sigIO_lft_tile_regfile = core_io_sigIO_lft_tile_regfile; // @[CoreTop.scala 120:29]
  assign io_sigIO_lft_tile_reg_rd1_addr_in = core_io_sigIO_lft_tile_reg_rd1_addr_in; // @[CoreTop.scala 121:37]
  assign io_sigIO_lft_tile_reg_rd2_addr_in = core_io_sigIO_lft_tile_reg_rd2_addr_in; // @[CoreTop.scala 122:37]
  assign io_sigIO_lft_tile_reg_rd1_data_out = core_io_sigIO_lft_tile_reg_rd1_data_out; // @[CoreTop.scala 123:38]
  assign io_sigIO_lft_tile_reg_rd2_data_out = core_io_sigIO_lft_tile_reg_rd2_data_out; // @[CoreTop.scala 124:38]
  assign io_sigIO_lft_tile_reg_wr_addr_in = core_io_sigIO_lft_tile_reg_wr_addr_in; // @[CoreTop.scala 125:36]
  assign io_sigIO_lft_tile_reg_wr_data_in = core_io_sigIO_lft_tile_reg_wr_data_in; // @[CoreTop.scala 126:36]
  assign io_sigIO_lft_tile_alu_data_out = core_io_sigIO_lft_tile_alu_data_out; // @[CoreTop.scala 127:34]
  assign io_sigIO_lft_tile_npc = core_io_sigIO_lft_tile_npc; // @[CoreTop.scala 128:25]
  assign io_sigIO_lft_tile_pc = core_io_sigIO_lft_tile_pc; // @[CoreTop.scala 129:24]
  assign io_sigIO_lft_tile_fe_pc = core_io_sigIO_lft_tile_fe_pc; // @[CoreTop.scala 130:27]
  assign io_sigIO_lft_tile_ew_pc = core_io_sigIO_lft_tile_ew_pc; // @[CoreTop.scala 131:27]
  assign io_sigIO_lft_tile_inst = core_io_sigIO_lft_tile_inst; // @[CoreTop.scala 132:26]
  assign io_sigIO_lft_tile_fe_inst = core_io_sigIO_lft_tile_fe_inst; // @[CoreTop.scala 133:29]
  assign core_clock = clock;
  assign core_reset = reset;
  assign core_io_host_fromhost_valid = io_host_fromhost_valid; // @[CoreTop.scala 72:11]
  assign core_io_host_fromhost_bits = io_host_fromhost_bits; // @[CoreTop.scala 72:11]
  assign core_io_icache_resp_valid = io_io_icache_resp_valid; // @[CoreTop.scala 80:29]
  assign core_io_icache_resp_bits_data = io_io_icache_resp_bits_data; // @[CoreTop.scala 81:34]
  assign core_io_dcache_resp_bits_data = dcache_io_resp_bits_data; // @[CoreTop.scala 74:18]
  assign dcache_clock = clock;
  assign dcache_io_req_bits_addr = core_io_dcache_req_bits_addr; // @[CoreTop.scala 74:18]
  assign dcache_io_req_bits_data = core_io_dcache_req_bits_data; // @[CoreTop.scala 74:18]
  assign dcache_io_req_bits_mask = core_io_dcache_req_bits_mask; // @[CoreTop.scala 74:18]
endmodule
