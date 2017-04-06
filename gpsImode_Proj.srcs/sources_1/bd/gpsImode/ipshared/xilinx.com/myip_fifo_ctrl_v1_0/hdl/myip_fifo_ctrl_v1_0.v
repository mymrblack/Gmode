
`timescale 1 ns / 1 ps

module myip_fifo_ctrl_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface FIFO_AXI
		parameter integer C_FIFO_AXI_DATA_WIDTH	= 32,
		parameter integer C_FIFO_AXI_ADDR_WIDTH	= 8
	)
	(
		// Users to add ports here
        input data_in_flag,
        input fifo1_full,
        input fifo2_full,
        input fifo1_empty,
        input fifo2_empty,

        input [21:0] ch1_data_to_be_wr,
        input [21:0] ch2_data_to_be_wr,
        input [31:0] gps1_data_to_be_wr,
        input [31:0] gps2_data_to_be_wr,
        input [31:0] start_tri_data_to_be_wr,
        input [14:0] delay1_data_to_be_wr,
        input [14:0] delay2_data_to_be_wr,
        input [14:0] delay3_data_to_be_wr,
        input [14:0] delay4_data_to_be_wr,
        input [31:0] motor_angle_data_to_be_wr,

        input [21:0] ch1_fifo1_rd_data,
        input [21:0] ch2_fifo1_rd_data,
        input [31:0] gps1_fifo1_rd_data,
        input [31:0] gps2_fifo1_rd_data,
        input [31:0] start_tri_fifo1_rd_data,
        input [14:0] delay1_fifo1_rd_data,
        input [14:0] delay2_fifo1_rd_data,
        input [14:0] delay3_fifo1_rd_data,
        input [14:0] delay4_fifo1_rd_data,
        input [31:0] motor_angle_fifo1_rd_data,

        input [21:0] ch1_fifo2_rd_data,
        input [21:0] ch2_fifo2_rd_data,
        input [31:0] gps1_fifo2_rd_data,
        input [31:0] gps2_fifo2_rd_data,
        input [31:0] start_tri_fifo2_rd_data,
        input [14:0] delay1_fifo2_rd_data,
        input [14:0] delay2_fifo2_rd_data,
        input [14:0] delay3_fifo2_rd_data,
        input [14:0] delay4_fifo2_rd_data,
        input [31:0] motor_angle_fifo2_rd_data,

        output [21:0] ch1_fifo_wr_data,
        output [21:0] ch2_fifo_wr_data,
        output [31:0] gps1_fifo_wr_data,
        output [31:0] gps2_fifo_wr_data,
        output [31:0] start_tri_fifo_wr_data,
        output [14:0] delay1_fifo_wr_data,
        output [14:0] delay2_fifo_wr_data,
        output [14:0] delay3_fifo_wr_data,
        output [14:0] delay4_fifo_wr_data,
        output [31:0] motor_angle_fifo_wr_data,

        output fifo1_rd,
        output fifo2_rd,
        output fifo1_wr,
        output fifo2_wr,

        output fifo_rst,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface FIFO_AXI
		input wire  fifo_axi_aclk,
		input wire  fifo_axi_aresetn,
		input wire [C_FIFO_AXI_ADDR_WIDTH-1 : 0] fifo_axi_awaddr,
		input wire [2 : 0] fifo_axi_awprot,
		input wire  fifo_axi_awvalid,
		output wire  fifo_axi_awready,
		input wire [C_FIFO_AXI_DATA_WIDTH-1 : 0] fifo_axi_wdata,
		input wire [(C_FIFO_AXI_DATA_WIDTH/8)-1 : 0] fifo_axi_wstrb,
		input wire  fifo_axi_wvalid,
		output wire  fifo_axi_wready,
		output wire [1 : 0] fifo_axi_bresp,
		output wire  fifo_axi_bvalid,
		input wire  fifo_axi_bready,
		input wire [C_FIFO_AXI_ADDR_WIDTH-1 : 0] fifo_axi_araddr,
		input wire [2 : 0] fifo_axi_arprot,
		input wire  fifo_axi_arvalid,
		output wire  fifo_axi_arready,
		output wire [C_FIFO_AXI_DATA_WIDTH-1 : 0] fifo_axi_rdata,
		output wire [1 : 0] fifo_axi_rresp,
		output wire  fifo_axi_rvalid,
		input wire  fifo_axi_rready
	);
// Instantiation of Axi Bus Interface FIFO_AXI
	myip_fifo_ctrl_v1_0_FIFO_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_FIFO_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_FIFO_AXI_ADDR_WIDTH)
	) myip_fifo_ctrl_v1_0_FIFO_AXI_inst (
        .data_in_flag(data_in_flag),
        .fifo1_full(fifo1_full),
        .fifo2_full(fifo2_full),
        .fifo1_empty(fifo1_empty),
        .fifo2_empty(fifo2_empty),

        .ch1_data_to_be_wr(ch1_data_to_be_wr),
        .ch2_data_to_be_wr(ch2_data_to_be_wr),
        .gps1_data_to_be_wr(gps1_data_to_be_wr),
        .gps2_data_to_be_wr(gps2_data_to_be_wr),
        .start_tri_data_to_be_wr(start_tri_data_to_be_wr),
        .delay1_data_to_be_wr(delay1_data_to_be_wr),
        .delay2_data_to_be_wr(delay2_data_to_be_wr),
        .delay3_data_to_be_wr(delay3_data_to_be_wr),
        .delay4_data_to_be_wr(delay4_data_to_be_wr),
        .motor_angle_data_to_be_wr(motor_angle_data_to_be_wr),

        .ch1_fifo1_rd_data(ch1_fifo1_rd_data),
        .ch2_fifo1_rd_data(ch2_fifo1_rd_data),
        .gps1_fifo1_rd_data(gps1_fifo1_rd_data),
        .gps2_fifo1_rd_data(gps2_fifo1_rd_data),
        .start_tri_fifo1_rd_data(start_tri_fifo1_rd_data),
        .delay1_fifo1_rd_data(delay1_fifo1_rd_data),
        .delay2_fifo1_rd_data(delay2_fifo1_rd_data),
        .delay3_fifo1_rd_data(delay3_fifo1_rd_data),
        .delay4_fifo1_rd_data(delay4_fifo1_rd_data),
        .motor_angle_fifo1_rd_data(motor_angle_fifo1_rd_data),

        .ch1_fifo2_rd_data(ch1_fifo2_rd_data),
        .ch2_fifo2_rd_data(ch2_fifo2_rd_data),
        .gps1_fifo2_rd_data(gps1_fifo2_rd_data),
        .gps2_fifo2_rd_data(gps2_fifo2_rd_data),
        .start_tri_fifo2_rd_data(start_tri_fifo2_rd_data),
        .delay1_fifo2_rd_data(delay1_fifo2_rd_data),
        .delay2_fifo2_rd_data(delay2_fifo2_rd_data),
        .delay3_fifo2_rd_data(delay3_fifo2_rd_data),
        .delay4_fifo2_rd_data(delay4_fifo2_rd_data),
        .motor_angle_fifo2_rd_data(motor_angle_fifo2_rd_data),

        .ch1_fifo_wr_data(ch1_fifo_wr_data),
        .ch2_fifo_wr_data(ch2_fifo_wr_data),
        .gps1_fifo_wr_data(gps1_fifo_wr_data),
        .gps2_fifo_wr_data(gps2_fifo_wr_data),
        .start_tri_fifo_wr_data(start_tri_fifo_wr_data),
        .delay1_fifo_wr_data(delay1_fifo_wr_data),
        .delay2_fifo_wr_data(delay2_fifo_wr_data),
        .delay3_fifo_wr_data(delay3_fifo_wr_data),
        .delay4_fifo_wr_data(delay4_fifo_wr_data),
        .motor_angle_fifo_wr_data(motor_angle_fifo_wr_data),

        .fifo1_rd(fifo1_rd),
        .fifo2_rd(fifo2_rd),
        .fifo1_wr(fifo1_wr),
        .fifo2_wr(fifo2_wr),
        .fifo_rst(fifo_rst),

		.S_AXI_ACLK(fifo_axi_aclk),
		.S_AXI_ARESETN(fifo_axi_aresetn),
		.S_AXI_AWADDR(fifo_axi_awaddr),
		.S_AXI_AWPROT(fifo_axi_awprot),
		.S_AXI_AWVALID(fifo_axi_awvalid),
		.S_AXI_AWREADY(fifo_axi_awready),
		.S_AXI_WDATA(fifo_axi_wdata),
		.S_AXI_WSTRB(fifo_axi_wstrb),
		.S_AXI_WVALID(fifo_axi_wvalid),
		.S_AXI_WREADY(fifo_axi_wready),
		.S_AXI_BRESP(fifo_axi_bresp),
		.S_AXI_BVALID(fifo_axi_bvalid),
		.S_AXI_BREADY(fifo_axi_bready),
		.S_AXI_ARADDR(fifo_axi_araddr),
		.S_AXI_ARPROT(fifo_axi_arprot),
		.S_AXI_ARVALID(fifo_axi_arvalid),
		.S_AXI_ARREADY(fifo_axi_arready),
		.S_AXI_RDATA(fifo_axi_rdata),
		.S_AXI_RRESP(fifo_axi_rresp),
		.S_AXI_RVALID(fifo_axi_rvalid),
		.S_AXI_RREADY(fifo_axi_rready)
	);

	// Add user logic here

	// User logic ends

endmodule
