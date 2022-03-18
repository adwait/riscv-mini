`ifdef FORMAL

	`define TEST_INST_0 32'd209716627
	`define TEST_INST_1 32'd104859155

	reg [3:0] counter  = 4'b0000;
	(* anyconst *) reg [31:0] shadow0 ;
	(* anyconst *) reg [31:0] shadow1 ;

	wire [31:0] lft_tile_regs_11  = lft_tile_regfile[11*32+31:11*32];
	wire [31:0] lft_tile_regs_12  = lft_tile_regfile[12*32+31:12*32];
	wire [31:0] lft_tile_regs_13  = lft_tile_regfile[13*32+31:13*32];


	always @(posedge clock) begin
	counter <= (counter + 1'd1);
	end

always @(posedge clock) begin

if ((counter == 4'd0)) begin
assume ((reset == 1'd1));
assume ((lft_tile_pc == 32'd508));
assume ((lft_tile_fe_pc == 32'd0));
assume ((lft_tile_ew_pc == 32'd0));
assume ((lft_tile_fe_inst == 32'd19));

end

if ((counter == 4'd1)) begin
assume ((reset == 1'd0));
assume ((lft_tile_pc == 32'd508));
assume ((lft_tile_fe_pc == 32'd508));
assume ((lft_tile_ew_pc == 32'd0));
assume ((lft_tile_fe_inst == 32'd19));

end

if ((counter == 4'd2)) begin
assume ((reset == 1'd0));
assume ((lft_tile_pc == 32'd512));
assume ((lft_tile_fe_pc == 32'd508));
assume ((lft_tile_ew_pc == 32'd508));
assume ((lft_tile_fe_inst == 32'd19));

end

if ((counter == 4'd3)) begin
assume ((reset == 1'd0));
assume ((lft_tile_pc == 32'd512));
assume ((lft_tile_fe_pc == 32'd508));
assume ((lft_tile_ew_pc == 32'd508));
assume ((lft_tile_fe_inst == 32'd19));

end

if ((counter == 4'd4)) begin
assume ((reset == 1'd0));
assume ((lft_tile_pc == 32'd512));
assume ((lft_tile_fe_pc == 32'd508));
assume ((lft_tile_ew_pc == 32'd508));
assume ((lft_tile_fe_inst == 32'd19));

end

if ((counter == 4'd5)) begin
assume ((reset == 1'd0));
assume ((lft_tile_pc == 32'd512));
assume ((lft_tile_fe_pc == 32'd508));
assume ((lft_tile_ew_pc == 32'd508));
assume ((lft_tile_fe_inst == 32'd19));

end

if ((counter == 4'd6)) begin
assume ((reset == 1'd0));
assume ((lft_tile_pc == 32'd516));
assume ((lft_tile_fe_pc == 32'd512));
assume ((lft_tile_ew_pc == 32'd508));
assume ((lft_tile_fe_inst == 32'd209716627));

end

if ((counter == 4'd7)) begin
assume ((reset == 1'd0));
assume ((lft_tile_pc == 32'd520));
assume ((lft_tile_fe_pc == 32'd516));
assume ((lft_tile_ew_pc == 32'd512));
assume ((lft_tile_fe_inst == 32'd104859155));

end

if ((counter == 4'd8)) begin
assume ((reset == 1'd0));
assume ((lft_tile_pc == 32'd524));
assume ((lft_tile_fe_pc == 32'd520));
assume ((lft_tile_ew_pc == 32'd516));
assume ((lft_tile_fe_inst == 32'd12945075));

end

if ((counter == 4'd9)) begin
assume ((reset == 1'd0));
assume ((lft_tile_pc == 32'd528));
assume ((lft_tile_fe_pc == 32'd524));
assume ((lft_tile_ew_pc == 32'd520));
assume ((lft_tile_fe_inst == 32'd12945075));

end

if ((counter == 4'd10)) begin
assume ((reset == 1'd0));
assume ((lft_tile_pc == 32'd528));
assume ((lft_tile_fe_pc == 32'd524));
assume ((lft_tile_ew_pc == 32'd520));
assume ((lft_tile_fe_inst == 32'd12945075));

end

if ((counter == 4'd11)) begin
assume ((reset == 1'd0));
assume ((lft_tile_pc == 32'd528));
assume ((lft_tile_fe_pc == 32'd524));
assume ((lft_tile_ew_pc == 32'd520));
assume ((lft_tile_fe_inst == 32'd12945075));

end

if ((counter == 4'd12)) begin
assume ((reset == 1'd0));
assume ((lft_tile_pc == 32'd528));
assume ((lft_tile_fe_pc == 32'd524));
assume ((lft_tile_ew_pc == 32'd520));
assume ((lft_tile_fe_inst == 32'd12945075));
// assume ((lft_tile_regs_11 == shadow0));
// assume ((lft_tile_regs_12 == shadow1));

end

if ((counter == 4'd13)) begin
assume ((reset == 1'd0));
assume ((lft_tile_pc == 32'd532));
assume ((lft_tile_fe_pc == 32'd528));
assume ((lft_tile_ew_pc == 32'd524));
assume ((lft_tile_fe_inst == 32'd12945075));
// assert (((shadow0 + shadow1) == lft_tile_regs_13));
end


end
	// (* anyconst *) reg [3:0] step__decode_i_imm__0;
	// (* anyconst *) reg [3:0] step__decode_rd_addr__0;
	// (* anyconst *) reg [3:0] step__feed__imm__reg_wr_data_in__0;
	// (* anyconst *) reg [3:0] step__regs_write__0;
	// (* anyconst *) reg [3:0] step__decode_s_imm__1;
	// (* anyconst *) reg [3:0] step__decode_rbs_addr__1;
	// (* anyconst *) reg [3:0] step__regs_read__1;
	// (* anyconst *) reg [3:0] step__feed__inst__mem_addr_wr_in__1;
	// (* anyconst *) reg [3:0] step__feed__reg_rd2_data_out__mem_data_wr_in__1;
	// (* anyconst *) reg [3:0] step__write_mem__1;
	
	(* anyconst *) reg [3:0] step__decode_i_imm__0;
	(* anyconst *) reg [3:0] step__decode_i_imm__1;
	(* anyconst *) reg [3:0] step__decode_rd_addr__0;
	(* anyconst *) reg [3:0] step__decode_rd_addr__1;
	(* anyconst *) reg [3:0] step__feed__imm__reg_wr_data_in__0;
	(* anyconst *) reg [3:0] step__feed__imm__reg_wr_data_in__1;
	(* anyconst *) reg [3:0] step__regs_write__0;
	(* anyconst *) reg [3:0] step__regs_write__1;


	// reg [3:0] step_var  = 4'b0000;

	// `define MAX_TS 14

	// always @(posedge clock ) begin
	// 	step_var <= step_var + 1'd1;

	// 	assume(step__decode_i_imm__0 < `MAX_TS);
	// 	assume(step__decode_i_imm__1 < `MAX_TS);
	// 	assume(step__decode_rd_addr__0 < `MAX_TS);
	// 	assume(step__decode_rd_addr__1 < `MAX_TS);
	// 	assume(step__feed__imm__reg_wr_data_in__0 < `MAX_TS);
	// 	assume(step__feed__imm__reg_wr_data_in__1 < `MAX_TS);
	// 	assume(step__regs_write__0 < `MAX_TS);
	// 	assume(step__regs_write__1 < `MAX_TS);

	// 	assume()
	// end



	// reg [31:0] 	txn__imm;
	// reg [31:0] 	txn__regfile [0:31];
	// reg [4:0]  	txn__reg_rd1_addr_in;
	// reg [4:0]  	txn__reg_rd2_addr_in;
	// reg [31:0] 	txn__reg_rd1_data_out;
	// reg [31:0] 	txn__reg_rd2_data_out;
	// reg [4:0]	txn__reg_wr_addr_in;
	// reg [31:0]	txn__reg_wr_data_in;
	// reg [31:0]	txn__alu_out;


	// // define get_i_imm(inst : inst_t) : bv12 = inst[31:20];
	// // and extends it with sign
	// function [31:0] get_i_imm;
	// 	input [31:0] inst;
	// 	begin
	// 		get_i_imm = {{20{inst[31]}}, inst[31:20]};
	// 	end
	// endfunction
	
	// // define get_s_imm(inst : inst_t) : bv12 = inst[31:25] ++ inst[11:7];
	// function [31:0] get_s_imm;
	// 	input [31:0] inst;
	// 	begin
	// 		get_s_imm = {{20{inst[31]}}, inst[31:25], inst[11:7]};
	// 	end
	// endfunction
	// // define get_rd(inst : inst_t) : reg_addr_t = inst[11:7];
	// function [4:0] get_rd;
	// 	input [31:0] inst;
	// 	begin
	// 		get_rd = inst[11:7];
	// 	end
	// endfunction
    // // define get_rs1(inst : inst_t) : reg_addr_t = inst[19:15];
	// function [4:0] get_rs1 (input [31:0] inst);
	// 	begin
	// 		get_rs1 = inst[19:15];
	// 	end
	// endfunction
	// // define get_rs2(inst : inst_t) : reg_addr_t = inst[24:20];
	// function [4:0] get_rs2 (input [31:0] inst);
	// 	begin
	// 		get_rs2 = inst[24:20];
	// 	end
	// endfunction

	// always @(posedge clock ) begin
	
	// 	if ((step_var) == (step__decode_i_imm__0)) begin
	// 		txn__imm = get_i_imm(`TEST_INST_0);
	// 		assume(txn__imm == lft_tile_imm);
	// 	end else if ((step_var) == (step__decode_i_imm__1))	begin
	// 		txn__imm = get_i_imm(`TEST_INST_1);
	// 		assume(txn__imm == lft_tile_imm);
	// 	end

	// 	if ((step_var) == (step__decode_rd_addr__0)) begin
	// 		txn__reg_wr_addr_in = get_rd(`TEST_INST_0); 
	// 		assume(txn__reg_wr_addr_in == lft_tile_reg_wr_addr_in);
	// 	end else if ((step_var) == (step__decode_rd_addr__1)) begin
	// 		txn__reg_wr_addr_in = get_rd(`TEST_INST_1); 
	// 		assume(txn__reg_wr_addr_in == lft_tile_reg_wr_addr_in);
	// 	end

	// 	if ((step_var) == (step__feed__imm__reg_wr_data_in__0))	begin
	// 		txn__reg_wr_data_in = txn__imm;
	// 		assume(txn__reg_wr_data_in == lft_tile_reg_wr_data_in);
	// 	end else if ((step_var) == (step__feed__imm__reg_wr_data_in__1)) begin
	// 		txn__reg_wr_data_in = txn__imm;
	// 		assume(txn__reg_wr_data_in == lft_tile_reg_wr_data_in);
	// 	end

	// 	if ((step_var) == (step__regs_write__0)) begin
	// 		txn__regfile[txn__reg_wr_addr_in] = txn__reg_wr_data_in; 
	// 		assume(txn__regfile[txn__reg_wr_addr_in] == lft_tile_reg_wr_data_in);
	// 	end else if ((step_var) == (step__regs_write__1)) begin
	// 		txn__regfile[txn__reg_wr_addr_in] = txn__reg_wr_data_in;
	// 		assume(txn__regfile[txn__reg_wr_addr_in] == lft_tile_reg_wr_data_in);
	// 	end

	// 	if (step_var == `MAX_TS) begin
	// 		assert(0);
	// 	end

	// end

	


	// if ((step_var) == (step__decode_rbs_addr__1)) begin
	// 	txn__reg_rd1_addr_in = get_rs1(test_inst_1);
	// 	txn__reg_rd2_addr_in = get_rs2(test_inst_1); 
	// end

	// if ((step_var) == (step__regs_read__1))	begin
	// 	txn__reg_rd1_data_out = txn__regfile[txn__reg_rd1_addr_in];
	// 	txn__reg_rd2_data_out = txn__regfile[txn__reg_rd2_addr_in]; 
	// end

	// if ((step_var) == (step__alu_compute__1)) begin
	// 	txn__alu_out = 
	// end

	// if ((step_var) == (step__feed__reg_rd2_data_out__mem_data_wr_in__1)) begin
	// 	call () = feed__reg_rd2_data_out__mem_data_wr_in(); 
	// end

	// if ((step_var) == (step__write_mem__1))	begin
	// 	call () = write_mem(); 
	// end


`endif
