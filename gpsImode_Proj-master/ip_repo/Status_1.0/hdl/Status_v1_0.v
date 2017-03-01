
`timescale 1 ns / 1 ps

	module Status_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface STATUS_AXI
		parameter integer C_STATUS_AXI_DATA_WIDTH	= 32,
		parameter integer C_STATUS_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
        output init_led,
        output ready_led,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface STATUS_AXI
		input wire  status_axi_aclk,
		input wire  status_axi_aresetn,
		input wire [C_STATUS_AXI_ADDR_WIDTH-1 : 0] status_axi_awaddr,
		input wire [2 : 0] status_axi_awprot,
		input wire  status_axi_awvalid,
		output wire  status_axi_awready,
		input wire [C_STATUS_AXI_DATA_WIDTH-1 : 0] status_axi_wdata,
		input wire [(C_STATUS_AXI_DATA_WIDTH/8)-1 : 0] status_axi_wstrb,
		input wire  status_axi_wvalid,
		output wire  status_axi_wready,
		output wire [1 : 0] status_axi_bresp,
		output wire  status_axi_bvalid,
		input wire  status_axi_bready,
		input wire [C_STATUS_AXI_ADDR_WIDTH-1 : 0] status_axi_araddr,
		input wire [2 : 0] status_axi_arprot,
		input wire  status_axi_arvalid,
		output wire  status_axi_arready,
		output wire [C_STATUS_AXI_DATA_WIDTH-1 : 0] status_axi_rdata,
		output wire [1 : 0] status_axi_rresp,
		output wire  status_axi_rvalid,
		input wire  status_axi_rready
	);
// Instantiation of Axi Bus Interface STATUS_AXI
	Status_v1_0_STATUS_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_STATUS_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_STATUS_AXI_ADDR_WIDTH)
	) Status_v1_0_STATUS_AXI_inst (
        .init_led(init_led),
        .ready_led(ready_led),
		.S_AXI_ACLK(status_axi_aclk),
		.S_AXI_ARESETN(status_axi_aresetn),
		.S_AXI_AWADDR(status_axi_awaddr),
		.S_AXI_AWPROT(status_axi_awprot),
		.S_AXI_AWVALID(status_axi_awvalid),
		.S_AXI_AWREADY(status_axi_awready),
		.S_AXI_WDATA(status_axi_wdata),
		.S_AXI_WSTRB(status_axi_wstrb),
		.S_AXI_WVALID(status_axi_wvalid),
		.S_AXI_WREADY(status_axi_wready),
		.S_AXI_BRESP(status_axi_bresp),
		.S_AXI_BVALID(status_axi_bvalid),
		.S_AXI_BREADY(status_axi_bready),
		.S_AXI_ARADDR(status_axi_araddr),
		.S_AXI_ARPROT(status_axi_arprot),
		.S_AXI_ARVALID(status_axi_arvalid),
		.S_AXI_ARREADY(status_axi_arready),
		.S_AXI_RDATA(status_axi_rdata),
		.S_AXI_RRESP(status_axi_rresp),
		.S_AXI_RVALID(status_axi_rvalid),
		.S_AXI_RREADY(status_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule
