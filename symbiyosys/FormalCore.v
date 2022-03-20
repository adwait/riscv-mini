
    `define NUMINST 8

	`define TEST_INST_0 32'd209716627
	`define TEST_INST_1 32'd104859155

	reg [3:0] counter;
    reg first_cycle;
    reg [31:0] prev_io_io_icache_req_bits_addr;
	// (* anyconst *) reg [31:0] shadow0 ;
	// (* anyconst *) reg [31:0] shadow1 ;

    reg [31:0] old_lft_tile_regs_12;

	wire [31:0] lft_tile_regs_11  = lft_tile_regfile[11*32+31:11*32];
	wire [31:0] lft_tile_regs_12  = lft_tile_regfile[12*32+31:12*32];
	wire [31:0] lft_tile_regs_13  = lft_tile_regfile[13*32+31:13*32];

    reg [31:0] inst_stream [0:`NUMINST-1];

    initial begin
        counter = 4'd0;
        first_cycle = 1'd1;
    end

	always @(posedge clock) begin
	    counter <= (counter + 1'd1);
        prev_io_io_icache_req_bits_addr <= io_io_icache_req_bits_addr;
        if (counter == 15) begin
            first_cycle <= 0;
        end

        old_lft_tile_regs_12 <= lft_tile_regs_12;

`ifdef FORMAL
        assume(io_host_fromhost_valid == 0);
        assume(io_host_fromhost_bits == 0);

        // assume(inst_stream[0] == 32'h06400593 || inst_stream[0] == 32'h0c858613 || inst_stream[0] == 32'h0c860613);
        assume(inst_stream[0] == 32'h0c860613);
        // assume(inst_stream[1] == 32'h06400593 || inst_stream[1] == 32'h0c858613 || inst_stream[1] == 32'h0c860613);
        assume(inst_stream[1] == 32'h0c860613);
        // assume(inst_stream[2] == 32'h06400593 || inst_stream[2] == 32'h0c858613 || inst_stream[2] == 32'h0c860613);
        assume(inst_stream[2] == 32'h0c860613);
        // assume(inst_stream[3] == 32'h06400593 || inst_stream[3] == 32'h0c858613 || inst_stream[3] == 32'h0c860613);
        assume(inst_stream[3] == 32'h0c860613);
        // assume(inst_stream[4] == 32'h06400593 || inst_stream[4] == 32'h0c858613 || inst_stream[4] == 32'h0c860613);
        assume(inst_stream[4] == 32'h0c860613);
        // assume(inst_stream[5] == 32'h06400593 || inst_stream[5] == 32'h0c858613 || inst_stream[5] == 32'h0c860613);
        assume(inst_stream[5] == 32'h0c860613);
        // assume(inst_stream[6] == 32'h06400593 || inst_stream[6] == 32'h0c858613 || inst_stream[6] == 32'h0c860613);
        assume(inst_stream[6] == 32'h0c860613);
        // assume(inst_stream[7] == 32'h06400593 || inst_stream[7] == 32'h0c858613 || inst_stream[7] == 32'h0c860613);
        assume(inst_stream[7] == 32'h0c860613);
`endif

	end

`ifdef FORMAL
    always @(posedge clock) begin

        if (first_cycle) begin
            if ((counter == 4'd0)) begin
                assume(reset);
                assume(lft_tile_regfile == 0);
                assume(lft_tile_fe_inst == 0);
                assume(io_io_icache_resp_valid == 1'd1);
                assume(io_io_icache_resp_bits_data == 32'd0);
            end else if ((counter == 4'd1)) begin
                assume(reset);
                assume(lft_tile_regfile == 0);
                assume(io_io_icache_resp_valid == 1'd1);
                assume(io_io_icache_resp_bits_data == 32'd0);
            end else if ((counter == 4'd2)) begin
                assume(!reset);
                assume(io_io_icache_resp_valid == 1'd0);
                assume(io_io_icache_resp_bits_data == 32'd0);
                // assume(lft_tile_pc == 32'h1fc);
            end else begin
                assume(!reset);
                assume(io_io_icache_resp_valid == 1'd1);
                assume(io_io_icache_resp_bits_data == inst_stream[prev_io_io_icache_req_bits_addr]);
            end
        end else begin
            assume(io_io_icache_resp_valid == 1'd1);
            assume(io_io_icache_resp_bits_data == inst_stream[prev_io_io_icache_req_bits_addr]);
        end

        assert(!(counter > 10 || !first_cycle) || (old_lft_tile_regs_12 + 31'd100 == lft_tile_regs_12));
    end
`endif