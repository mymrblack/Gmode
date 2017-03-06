
`timescale 1 ns / 1 ps

	module delay_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface DELAY_AXI
		parameter integer C_DELAY_AXI_DATA_WIDTH	= 32,
		parameter integer C_DELAY_AXI_ADDR_WIDTH	= 6
	)
	(
		// Users to add ports here
        input [31 : 0] tstart_count,
        input data_flag,
        input [21 : 0] ch1_time_data,
        
        output tstart_out,
        output out_1,
        output out_2,
        output out_3,
        output out_4,
        output ch1,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface DELAY_AXI
		input wire  delay_axi_aclk,
		input wire  delay_axi_aresetn,
		input wire [C_DELAY_AXI_ADDR_WIDTH-1 : 0] delay_axi_awaddr,
		input wire [2 : 0] delay_axi_awprot,
		input wire  delay_axi_awvalid,
		output wire  delay_axi_awready,
		input wire [C_DELAY_AXI_DATA_WIDTH-1 : 0] delay_axi_wdata,
		input wire [(C_DELAY_AXI_DATA_WIDTH/8)-1 : 0] delay_axi_wstrb,
		input wire  delay_axi_wvalid,
		output wire  delay_axi_wready,
		output wire [1 : 0] delay_axi_bresp,
		output wire  delay_axi_bvalid,
		input wire  delay_axi_bready,
		input wire [C_DELAY_AXI_ADDR_WIDTH-1 : 0] delay_axi_araddr,
		input wire [2 : 0] delay_axi_arprot,
		input wire  delay_axi_arvalid,
		output wire  delay_axi_arready,
		output wire [C_DELAY_AXI_DATA_WIDTH-1 : 0] delay_axi_rdata,
		output wire [1 : 0] delay_axi_rresp,
		output wire  delay_axi_rvalid,
		input wire  delay_axi_rready
	);
// Instantiation of Axi Bus Interface DELAY_AXI
	delay_v1_0_DELAY_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_DELAY_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_DELAY_AXI_ADDR_WIDTH)
	) delay_v1_0_DELAY_AXI_inst (
        .tstart_count(tstart_count),

        .data_flag(data_flag),
        .ch1_time_data(ch1_time_data),

        .tstart_out(tstart_out),
        .out_1(out_1),
        .out_2(out_2),
        .out_3(out_3),
        .out_4(out_4),

		.S_AXI_ACLK(delay_axi_aclk),
		.S_AXI_ARESETN(delay_axi_aresetn),
		.S_AXI_AWADDR(delay_axi_awaddr),
		.S_AXI_AWPROT(delay_axi_awprot),
		.S_AXI_AWVALID(delay_axi_awvalid),
		.S_AXI_AWREADY(delay_axi_awready),
		.S_AXI_WDATA(delay_axi_wdata),
		.S_AXI_WSTRB(delay_axi_wstrb),
		.S_AXI_WVALID(delay_axi_wvalid),
		.S_AXI_WREADY(delay_axi_wready),
		.S_AXI_BRESP(delay_axi_bresp),
		.S_AXI_BVALID(delay_axi_bvalid),
		.S_AXI_BREADY(delay_axi_bready),
		.S_AXI_ARADDR(delay_axi_araddr),
		.S_AXI_ARPROT(delay_axi_arprot),
		.S_AXI_ARVALID(delay_axi_arvalid),
		.S_AXI_ARREADY(delay_axi_arready),
		.S_AXI_RDATA(delay_axi_rdata),
		.S_AXI_RRESP(delay_axi_rresp),
		.S_AXI_RVALID(delay_axi_rvalid),
		.S_AXI_RREADY(delay_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule
