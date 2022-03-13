`ifdef FORMAL

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
assume ((lft_tile_regs_11 == shadow0));
assume ((lft_tile_regs_12 == shadow1));

end

if ((counter == 4'd13)) begin
assume ((reset == 1'd0));
assume ((lft_tile_pc == 32'd532));
assume ((lft_tile_fe_pc == 32'd528));
assume ((lft_tile_ew_pc == 32'd524));
assume ((lft_tile_fe_inst == 32'd12945075));
assert (((shadow0 + shadow1) == lft_tile_regs_13));

end


	(* anyconst *) reg [3:0] t_0;
	(* anyconst *) reg [3:0] t_1;





end

`endif
