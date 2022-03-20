module FormalCoreTop (
  input         clock,
  input         start
);

    `define NUMINST 8
	`define TEST_INST_0 32'd209716627
	`define TEST_INST_1 32'd104859155

    `define INSTR_UNDER_TEST 32'h0c860613


    reg         reset;
    reg         io_io_icache_req_valid;
    reg [31:0]  io_io_icache_req_bits_addr;
    reg [31:0]  io_io_icache_req_bits_data;
    reg [3:0]   io_io_icache_req_bits_mask;
    reg         io_io_icache_resp_valid;
    reg [31:0]  io_io_icache_resp_bits_data;
    reg         io_host_fromhost_valid;
    reg [31:0]  io_host_fromhost_bits;
    reg [31:0]  io_host_tohost;
    wire         ct_reset;
    wire         ct_io_io_icache_req_valid;
    wire [31:0]  ct_io_io_icache_req_bits_addr;
    wire [31:0]  ct_io_io_icache_req_bits_data;
    wire [3:0]   ct_io_io_icache_req_bits_mask;
    wire         ct_io_io_icache_resp_valid;
    wire [31:0]  ct_io_io_icache_resp_bits_data;
    wire         ct_io_host_fromhost_valid;
    wire [31:0]  ct_io_host_fromhost_bits;
    wire [31:0]  ct_io_host_tohost;

    wire [31:0] lft_tile_imm;
    wire [1023:0] lft_tile_regfile;
    wire [4:0] lft_tile_reg_rd1_addr_in;
    wire [4:0] lft_tile_reg_rd2_addr_in;
    wire [31:0] lft_tile_reg_rd1_data_out;
    wire [31:0] lft_tile_reg_rd2_data_out;
    wire [4:0] lft_tile_reg_wr_addr_in;
    wire [31:0] lft_tile_reg_wr_data_in;
    wire [31:0] lft_tile_alu_data_out;
    wire [32:0] lft_tile_npc;
    wire [32:0] lft_tile_pc;
    wire [32:0] lft_tile_fe_pc;
    wire [32:0] lft_tile_ew_pc;
    wire [31:0] lft_tile_inst;
    wire [31:0] lft_tile_fe_inst;
    CoreTop coretop (
        .clock(clock),
        .reset(ct_reset),
        .io_io_icache_req_valid(ct_io_io_icache_req_valid),
        .io_io_icache_req_bits_addr(ct_io_io_icache_req_bits_addr),
        .io_io_icache_req_bits_data(ct_io_io_icache_req_bits_data),
        .io_io_icache_req_bits_mask(ct_io_io_icache_req_bits_mask),
        .io_io_icache_resp_valid(ct_io_io_icache_resp_valid),
        .io_io_icache_resp_bits_data(ct_io_io_icache_resp_bits_data),
        .io_host_fromhost_valid(ct_io_host_fromhost_valid),
        .io_host_fromhost_bits(ct_io_host_fromhost_bits),
        .io_host_tohost(ct_io_host_tohost),
        .io_sigIO_lft_tile_imm(lft_tile_imm),
        .io_sigIO_lft_tile_regfile(lft_tile_regfile),
        .io_sigIO_lft_tile_reg_rd1_addr_in(lft_tile_reg_rd1_addr_in),
        .io_sigIO_lft_tile_reg_rd2_addr_in(lft_tile_reg_rd2_addr_in),
        .io_sigIO_lft_tile_reg_rd1_data_out(lft_tile_reg_rd1_data_out),
        .io_sigIO_lft_tile_reg_rd2_data_out(lft_tile_reg_rd2_data_out),
        .io_sigIO_lft_tile_reg_wr_addr_in(lft_tile_reg_wr_addr_in),
        .io_sigIO_lft_tile_reg_wr_data_in(lft_tile_reg_wr_data_in),
        .io_sigIO_lft_tile_alu_data_out(lft_tile_alu_data_out),
        .io_sigIO_lft_tile_npc(lft_tile_npc),
        .io_sigIO_lft_tile_pc(lft_tile_pc),
        .io_sigIO_lft_tile_fe_pc(lft_tile_fe_pc),
        .io_sigIO_lft_tile_ew_pc(lft_tile_ew_pc),
        .io_sigIO_lft_tile_inst(lft_tile_inst),
        .io_sigIO_lft_tile_fe_inst(lft_tile_fe_inst)
    );
    assign ct_reset = reset;
    assign ct_io_io_icache_req_valid = io_io_icache_req_valid;
    assign ct_io_io_icache_req_bits_addr = io_io_icache_req_bits_addr;
    assign ct_io_io_icache_req_bits_data = io_io_icache_req_bits_data;
    assign ct_io_io_icache_req_bits_mask = io_io_icache_req_bits_mask;
    assign ct_io_io_icache_resp_valid = io_io_icache_resp_valid;
    assign ct_io_io_icache_resp_bits_data = io_io_icache_resp_bits_data;
    assign ct_io_host_fromhost_valid = io_host_fromhost_valid;
    assign ct_io_host_fromhost_bits = io_host_fromhost_bits;
    assign ct_io_host_tohost = io_host_tohost;

	reg [3:0] counter;
    reg first_cycle;
    reg [31:0] prev_io_io_icache_req_bits_addr;

    reg [31:0] old_lft_tile_regs_12;
	
    wire [31:0] lft_regfile_mem [0:31];
    wire [31:0] lft_tile_regs_11  = lft_tile_regfile[11*32+31:11*32];
	wire [31:0] lft_tile_regs_12  = lft_tile_regfile[12*32+31:12*32];
	wire [31:0] lft_tile_regs_13  = lft_tile_regfile[13*32+31:13*32];

    genvar i_flat;
    generate
    for (i_flat = 0; i_flat < 32; i_flat=i_flat+1) begin
        assign lft_regfile_mem[i_flat] = lft_tile_regfile[i_flat*32+31:i_flat*32];
    end
    endgenerate

    reg [31:0] inst_stream [0:`NUMINST-1];


    initial begin
        counter = 4'd0;
        first_cycle = 1'd1;

        reset = 1'd1;
        io_io_icache_resp_valid <= 1'd1;
        io_io_icache_resp_bits_data <= 32'd0;
    end

	always @(posedge clock) begin
	    counter <= (counter + 1'd1);
        prev_io_io_icache_req_bits_addr <= io_io_icache_req_bits_addr;
        if (counter == 15) begin
            first_cycle <= 0;
        end

        io_host_fromhost_valid <= 0;
        io_host_fromhost_bits <= 0;

        old_lft_tile_regs_12 <= lft_tile_regs_12;

`ifdef FORMAL
        inst_stream[0] <= `INSTR_UNDER_TEST;
        inst_stream[1] <= `INSTR_UNDER_TEST;
        inst_stream[2] <= `INSTR_UNDER_TEST;
        inst_stream[3] <= `INSTR_UNDER_TEST;
        inst_stream[4] <= `INSTR_UNDER_TEST;
        inst_stream[5] <= `INSTR_UNDER_TEST;
        inst_stream[6] <= `INSTR_UNDER_TEST;
        inst_stream[7] <= `INSTR_UNDER_TEST;
`endif

	end

    always @(posedge clock) begin

        if (first_cycle) begin
            if ((counter == 4'd0)) begin
                reset <= 1;
                assume(lft_tile_regfile == 0);
                io_io_icache_resp_valid <= 1'd1;
                io_io_icache_resp_bits_data <= 32'd0;
            end else if ((counter == 4'd1)) begin
                reset <= 0;
                assume(lft_tile_regfile == 0);
                io_io_icache_resp_valid <= 1'd0;
                io_io_icache_resp_bits_data <= 32'd0;
            end else begin
                reset <= 0;
                io_io_icache_resp_valid <= 1'd1;
                io_io_icache_resp_bits_data <= inst_stream[io_io_icache_req_bits_addr];
            end
        end else begin
            io_io_icache_resp_valid <= 1'd1;
            io_io_icache_resp_bits_data <= inst_stream[io_io_icache_req_bits_addr];
        end

`ifdef FORMAL
        fail: assert(!(counter > 8 || !first_cycle) || (old_lft_tile_regs_12 + 31'd200 == lft_tile_regs_12));
`endif
    end




    // Abstract system

    reg     prev_start, started;
    reg     i0_active, i0_started;

    wire    trigger;
    assign  trigger = !prev_start && start;

    reg [31:0]  i0_pc;
    reg [31:0]  i0_inst;
    reg         i0_started;
    reg         i0_active, i0_check_0, i0_check_1, i0_check_2;


    initial begin
        prev_start = 0;
        started = 0;

        i0_started = 0;
        i0_active = 0;
        i0_check_0 = 0;
        i0_check_1 = 0;
        i0_check_2 = 0;
    end
    always @(posedge clock) begin
        prev_start <= start;
        started <= started || trigger;

        if (counter > 8 && started && !i0_started) begin
            i0_pc <= lft_tile_npc;
            // TODO: i0_inst??
            i0_started <= 1;
            i0_active <= 1;
        end else if ((lft_tile_ew_pc == i0_pc) && i0_active) begin
            i0_active <= 0;
        end
    end

	// define get_i_imm(inst : inst_t) : bv12 = inst[31:20];
	// and extends it with sign
	function [31:0] get_i_imm;
		input [31:0] inst;
		begin
			get_i_imm = {{20{inst[31]}}, inst[31:20]};
		end
	endfunction
	
	// define get_s_imm(inst : inst_t) : bv12 = inst[31:25] ++ inst[11:7];
	function [31:0] get_s_imm;
		input [31:0] inst;
		begin
			get_s_imm = {{20{inst[31]}}, inst[31:25], inst[11:7]};
		end
	endfunction
	// define get_rd(inst : inst_t) : reg_addr_t = inst[11:7];
	function [4:0] get_rd;
		input [31:0] inst;
		begin
			get_rd = inst[11:7];
		end
	endfunction
    // define get_rs1(inst : inst_t) : reg_addr_t = inst[19:15];
	function [4:0] get_rs1 (input [31:0] inst);
		begin
			get_rs1 = inst[19:15];
		end
	endfunction
	// define get_rs2(inst : inst_t) : reg_addr_t = inst[24:20];
	function [4:0] get_rs2 (input [31:0] inst);
		begin
			get_rs2 = inst[24:20];
		end
	endfunction


	reg [31:0] 	txn__imm;
	reg [31:0] 	txn__regfile [0:31];
	reg [4:0]  	txn__reg_rd1_addr_in;
	reg [4:0]  	txn__reg_rd2_addr_in;
	reg [31:0] 	txn__reg_rd1_data_out;
	reg [31:0] 	txn__reg_rd2_data_out;
	reg [4:0]	txn__reg_wr_addr_in;
	reg [31:0]	txn__reg_wr_data_in;
	reg [31:0]	txn__alu_out;
    wire rs1hazard = 1;

    wire [1023:0] 	txn__regfile_flat;
    generate
        for (i_flat = 0 ; i_flat < 32; i_flat=i_flat+1) begin
            assign txn__regfile_flat[i_flat*32+31:i_flat*32] = txn__regfile[i_flat];
        end
    endgenerate


	always @(posedge clock ) begin
        if ((lft_tile_pc == i0_pc) && i0_active) begin
            // decode_i_imm
			txn__imm = get_i_imm(lft_tile_inst);
            // decode_rs_addr
            txn__reg_rd1_addr_in = get_rs1(lft_tile_inst);
            txn__reg_rd2_addr_in = get_rs2(lft_tile_inst);
            // regs_read
            txn__reg_rd1_data_out = rs1hazard ? txn__alu_out : txn__regfile[txn__reg_rd1_addr_in];
            txn__reg_rd2_data_out = txn__regfile[txn__reg_rd2_addr_in];
            // alu_compute_add_rs_imm
            txn__alu_out = txn__imm + txn__reg_rd1_data_out;

            i0_check_0 <= 1;
        end else begin
            i0_check_0 <= 0;
        end

		if ((lft_tile_fe_pc == i0_pc) && i0_active) begin
            // feed__alu_out__reg_rd_data_in
            txn__reg_wr_data_in = txn__alu_out;
            // decode_rd_addr
			txn__reg_wr_addr_in = get_rd(lft_tile_fe_inst); 

            i0_check_1 <= 1;
        end else begin
            i0_check_1 <= 0;
        end

		if ((lft_tile_ew_pc == i0_pc) && i0_active)	begin
			// regs_write
            txn__regfile[txn__reg_wr_addr_in] = txn__reg_wr_data_in;

            i0_check_2 <= 1;
        end else begin
            i0_check_2 <= 0;
		end
	end

`ifdef FORMAL
    always @(posedge clock) begin

        if ((lft_tile_pc == i0_pc) && i0_active) begin
            assume(txn__alu_out == lft_tile_alu_data_out);
            assume(txn__regfile_flat == lft_tile_regfile);
        end

        if (i0_check_0) begin
            check_0_0_0:    assert(txn__alu_out == lft_tile_alu_data_out);
            check_0_0_1:    assert(txn__reg_rd1_data_out == lft_tile_reg_rd1_data_out);
            check_0_0_2:    assert(txn__reg_rd2_data_out == lft_tile_reg_rd2_data_out);
        end
        if (i0_check_1) begin
            check_0_1_0:    assert(txn__reg_wr_data_in == lft_tile_reg_wr_data_in);
            check_0_1_1:    assert(txn__reg_wr_addr_in == lft_tile_reg_wr_addr_in);
        end
        if (i0_check_2) begin
            check_0_2_0:    assert(txn__regfile[txn__reg_wr_addr_in] == lft_regfile_mem[txn__reg_wr_addr_in]);
        end

    end
`endif

	
endmodule