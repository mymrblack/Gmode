
`timescale 1 ns / 1 ps

	module gmode_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface TDC_AXI
		parameter integer C_TDC_AXI_DATA_WIDTH	= 32,
		parameter integer C_TDC_AXI_ADDR_WIDTH	= 7
	)
	(
		// Users to add ports here
        input [C_TDC_AXI_DATA_WIDTH-1 : 0] tdc_data,
        input [C_TDC_AXI_DATA_WIDTH-1 : 0] ch1_data,
        input [C_TDC_AXI_DATA_WIDTH-1 : 0] ch2_data,
        input [C_TDC_AXI_DATA_WIDTH-1 : 0] tri_count,
        input err_flag,
        input int_flag,
        input StopDis,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface TDC_AXI
		input wire  tdc_axi_aclk,
		input wire  tdc_axi_aresetn,
		input wire [C_TDC_AXI_ADDR_WIDTH-1 : 0] tdc_axi_awaddr,
		input wire [2 : 0] tdc_axi_awprot,
		input wire  tdc_axi_awvalid,
		output wire  tdc_axi_awready,
		input wire [C_TDC_AXI_DATA_WIDTH-1 : 0] tdc_axi_wdata,
		input wire [(C_TDC_AXI_DATA_WIDTH/8)-1 : 0] tdc_axi_wstrb,
		input wire  tdc_axi_wvalid,
		output wire  tdc_axi_wready,
		output wire [1 : 0] tdc_axi_bresp,
		output wire  tdc_axi_bvalid,
		input wire  tdc_axi_bready,
		input wire [C_TDC_AXI_ADDR_WIDTH-1 : 0] tdc_axi_araddr,
		input wire [2 : 0] tdc_axi_arprot,
		input wire  tdc_axi_arvalid,
		output wire  tdc_axi_arready,
		output wire [C_TDC_AXI_DATA_WIDTH-1 : 0] tdc_axi_rdata,
		output wire [1 : 0] tdc_axi_rresp,
		output wire  tdc_axi_rvalid,
		input wire  tdc_axi_rready
	);
// Instantiation of Axi Bus Interface TDC_AXI
	gmode_v1_0_TDC_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_TDC_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_TDC_AXI_ADDR_WIDTH)
	) gmode_v1_0_TDC_AXI_inst (
        .tdc_data(tdc_data),
        .ch1_data(ch1_data),
        .ch2_data(ch2_data),
        .tri_count(tri_count),
        .err_flag(err_flag),
        .int_flag(int_flag),
        .StopDis(StopDis),
		.S_AXI_ACLK(tdc_axi_aclk),
		.S_AXI_ARESETN(tdc_axi_aresetn),
		.S_AXI_AWADDR(tdc_axi_awaddr),
		.S_AXI_AWPROT(tdc_axi_awprot),
		.S_AXI_AWVALID(tdc_axi_awvalid),
		.S_AXI_AWREADY(tdc_axi_awready),
		.S_AXI_WDATA(tdc_axi_wdata),
		.S_AXI_WSTRB(tdc_axi_wstrb),
		.S_AXI_WVALID(tdc_axi_wvalid),
		.S_AXI_WREADY(tdc_axi_wready),
		.S_AXI_BRESP(tdc_axi_bresp),
		.S_AXI_BVALID(tdc_axi_bvalid),
		.S_AXI_BREADY(tdc_axi_bready),
		.S_AXI_ARADDR(tdc_axi_araddr),
		.S_AXI_ARPROT(tdc_axi_arprot),
		.S_AXI_ARVALID(tdc_axi_arvalid),
		.S_AXI_ARREADY(tdc_axi_arready),
		.S_AXI_RDATA(tdc_axi_rdata),
		.S_AXI_RRESP(tdc_axi_rresp),
		.S_AXI_RVALID(tdc_axi_rvalid),
		.S_AXI_RREADY(tdc_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule
