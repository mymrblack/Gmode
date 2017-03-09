// (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:myip_fifo_ctrl:1.0
// IP Revision: 7

(* X_CORE_INFO = "myip_fifo_ctrl_v1_0,Vivado 2016.2" *)
(* CHECK_LICENSE_TYPE = "gpsImode_myip_fifo_ctrl_0_0,myip_fifo_ctrl_v1_0,{}" *)
(* CORE_GENERATION_INFO = "gpsImode_myip_fifo_ctrl_0_0,myip_fifo_ctrl_v1_0,{x_ipProduct=Vivado 2016.2,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=myip_fifo_ctrl,x_ipVersion=1.0,x_ipCoreRevision=7,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_FIFO_AXI_DATA_WIDTH=32,C_FIFO_AXI_ADDR_WIDTH=8}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module gpsImode_myip_fifo_ctrl_0_0 (
  data_in_flag,
  fifo1_full,
  fifo2_full,
  fifo1_empty,
  fifo2_empty,
  ch1_data_to_be_wr,
  ch2_data_to_be_wr,
  gps1_data_to_be_wr,
  gps2_data_to_be_wr,
  start_tri_data_to_be_wr,
  delay1_data_to_be_wr,
  delay2_data_to_be_wr,
  delay3_data_to_be_wr,
  delay4_data_to_be_wr,
  ch1_fifo1_rd_data,
  ch2_fifo1_rd_data,
  gps1_fifo1_rd_data,
  gps2_fifo1_rd_data,
  start_tri_fifo1_rd_data,
  delay1_fifo1_rd_data,
  delay2_fifo1_rd_data,
  delay3_fifo1_rd_data,
  delay4_fifo1_rd_data,
  ch1_fifo2_rd_data,
  ch2_fifo2_rd_data,
  gps1_fifo2_rd_data,
  gps2_fifo2_rd_data,
  start_tri_fifo2_rd_data,
  delay1_fifo2_rd_data,
  delay2_fifo2_rd_data,
  delay3_fifo2_rd_data,
  delay4_fifo2_rd_data,
  ch1_fifo_wr_data,
  ch2_fifo_wr_data,
  gps1_fifo_wr_data,
  gps2_fifo_wr_data,
  start_tri_fifo_wr_data,
  delay1_fifo_wr_data,
  delay2_fifo_wr_data,
  delay3_fifo_wr_data,
  delay4_fifo_wr_data,
  fifo1_rd,
  fifo2_rd,
  fifo1_wr,
  fifo2_wr,
  fifo_rst,
  fifo_axi_awaddr,
  fifo_axi_awprot,
  fifo_axi_awvalid,
  fifo_axi_awready,
  fifo_axi_wdata,
  fifo_axi_wstrb,
  fifo_axi_wvalid,
  fifo_axi_wready,
  fifo_axi_bresp,
  fifo_axi_bvalid,
  fifo_axi_bready,
  fifo_axi_araddr,
  fifo_axi_arprot,
  fifo_axi_arvalid,
  fifo_axi_arready,
  fifo_axi_rdata,
  fifo_axi_rresp,
  fifo_axi_rvalid,
  fifo_axi_rready,
  fifo_axi_aclk,
  fifo_axi_aresetn
);

input wire data_in_flag;
input wire fifo1_full;
input wire fifo2_full;
input wire fifo1_empty;
input wire fifo2_empty;
input wire [21 : 0] ch1_data_to_be_wr;
input wire [21 : 0] ch2_data_to_be_wr;
input wire [31 : 0] gps1_data_to_be_wr;
input wire [31 : 0] gps2_data_to_be_wr;
input wire [31 : 0] start_tri_data_to_be_wr;
input wire [14 : 0] delay1_data_to_be_wr;
input wire [14 : 0] delay2_data_to_be_wr;
input wire [14 : 0] delay3_data_to_be_wr;
input wire [14 : 0] delay4_data_to_be_wr;
input wire [21 : 0] ch1_fifo1_rd_data;
input wire [21 : 0] ch2_fifo1_rd_data;
input wire [31 : 0] gps1_fifo1_rd_data;
input wire [31 : 0] gps2_fifo1_rd_data;
input wire [31 : 0] start_tri_fifo1_rd_data;
input wire [14 : 0] delay1_fifo1_rd_data;
input wire [14 : 0] delay2_fifo1_rd_data;
input wire [14 : 0] delay3_fifo1_rd_data;
input wire [14 : 0] delay4_fifo1_rd_data;
input wire [21 : 0] ch1_fifo2_rd_data;
input wire [21 : 0] ch2_fifo2_rd_data;
input wire [31 : 0] gps1_fifo2_rd_data;
input wire [31 : 0] gps2_fifo2_rd_data;
input wire [31 : 0] start_tri_fifo2_rd_data;
input wire [14 : 0] delay1_fifo2_rd_data;
input wire [14 : 0] delay2_fifo2_rd_data;
input wire [14 : 0] delay3_fifo2_rd_data;
input wire [14 : 0] delay4_fifo2_rd_data;
output wire [21 : 0] ch1_fifo_wr_data;
output wire [21 : 0] ch2_fifo_wr_data;
output wire [31 : 0] gps1_fifo_wr_data;
output wire [31 : 0] gps2_fifo_wr_data;
output wire [31 : 0] start_tri_fifo_wr_data;
output wire [14 : 0] delay1_fifo_wr_data;
output wire [14 : 0] delay2_fifo_wr_data;
output wire [14 : 0] delay3_fifo_wr_data;
output wire [14 : 0] delay4_fifo_wr_data;
output wire fifo1_rd;
output wire fifo2_rd;
output wire fifo1_wr;
output wire fifo2_wr;
output wire fifo_rst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI AWADDR" *)
input wire [7 : 0] fifo_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI AWPROT" *)
input wire [2 : 0] fifo_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI AWVALID" *)
input wire fifo_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI AWREADY" *)
output wire fifo_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI WDATA" *)
input wire [31 : 0] fifo_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI WSTRB" *)
input wire [3 : 0] fifo_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI WVALID" *)
input wire fifo_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI WREADY" *)
output wire fifo_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI BRESP" *)
output wire [1 : 0] fifo_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI BVALID" *)
output wire fifo_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI BREADY" *)
input wire fifo_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI ARADDR" *)
input wire [7 : 0] fifo_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI ARPROT" *)
input wire [2 : 0] fifo_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI ARVALID" *)
input wire fifo_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI ARREADY" *)
output wire fifo_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI RDATA" *)
output wire [31 : 0] fifo_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI RRESP" *)
output wire [1 : 0] fifo_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI RVALID" *)
output wire fifo_axi_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 FIFO_AXI RREADY" *)
input wire fifo_axi_rready;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 FIFO_AXI_CLK CLK" *)
input wire fifo_axi_aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 FIFO_AXI_RST RST" *)
input wire fifo_axi_aresetn;

  myip_fifo_ctrl_v1_0 #(
    .C_FIFO_AXI_DATA_WIDTH(32),  // Width of S_AXI data bus
    .C_FIFO_AXI_ADDR_WIDTH(8)  // Width of S_AXI address bus
  ) inst (
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
    .ch1_fifo1_rd_data(ch1_fifo1_rd_data),
    .ch2_fifo1_rd_data(ch2_fifo1_rd_data),
    .gps1_fifo1_rd_data(gps1_fifo1_rd_data),
    .gps2_fifo1_rd_data(gps2_fifo1_rd_data),
    .start_tri_fifo1_rd_data(start_tri_fifo1_rd_data),
    .delay1_fifo1_rd_data(delay1_fifo1_rd_data),
    .delay2_fifo1_rd_data(delay2_fifo1_rd_data),
    .delay3_fifo1_rd_data(delay3_fifo1_rd_data),
    .delay4_fifo1_rd_data(delay4_fifo1_rd_data),
    .ch1_fifo2_rd_data(ch1_fifo2_rd_data),
    .ch2_fifo2_rd_data(ch2_fifo2_rd_data),
    .gps1_fifo2_rd_data(gps1_fifo2_rd_data),
    .gps2_fifo2_rd_data(gps2_fifo2_rd_data),
    .start_tri_fifo2_rd_data(start_tri_fifo2_rd_data),
    .delay1_fifo2_rd_data(delay1_fifo2_rd_data),
    .delay2_fifo2_rd_data(delay2_fifo2_rd_data),
    .delay3_fifo2_rd_data(delay3_fifo2_rd_data),
    .delay4_fifo2_rd_data(delay4_fifo2_rd_data),
    .ch1_fifo_wr_data(ch1_fifo_wr_data),
    .ch2_fifo_wr_data(ch2_fifo_wr_data),
    .gps1_fifo_wr_data(gps1_fifo_wr_data),
    .gps2_fifo_wr_data(gps2_fifo_wr_data),
    .start_tri_fifo_wr_data(start_tri_fifo_wr_data),
    .delay1_fifo_wr_data(delay1_fifo_wr_data),
    .delay2_fifo_wr_data(delay2_fifo_wr_data),
    .delay3_fifo_wr_data(delay3_fifo_wr_data),
    .delay4_fifo_wr_data(delay4_fifo_wr_data),
    .fifo1_rd(fifo1_rd),
    .fifo2_rd(fifo2_rd),
    .fifo1_wr(fifo1_wr),
    .fifo2_wr(fifo2_wr),
    .fifo_rst(fifo_rst),
    .fifo_axi_awaddr(fifo_axi_awaddr),
    .fifo_axi_awprot(fifo_axi_awprot),
    .fifo_axi_awvalid(fifo_axi_awvalid),
    .fifo_axi_awready(fifo_axi_awready),
    .fifo_axi_wdata(fifo_axi_wdata),
    .fifo_axi_wstrb(fifo_axi_wstrb),
    .fifo_axi_wvalid(fifo_axi_wvalid),
    .fifo_axi_wready(fifo_axi_wready),
    .fifo_axi_bresp(fifo_axi_bresp),
    .fifo_axi_bvalid(fifo_axi_bvalid),
    .fifo_axi_bready(fifo_axi_bready),
    .fifo_axi_araddr(fifo_axi_araddr),
    .fifo_axi_arprot(fifo_axi_arprot),
    .fifo_axi_arvalid(fifo_axi_arvalid),
    .fifo_axi_arready(fifo_axi_arready),
    .fifo_axi_rdata(fifo_axi_rdata),
    .fifo_axi_rresp(fifo_axi_rresp),
    .fifo_axi_rvalid(fifo_axi_rvalid),
    .fifo_axi_rready(fifo_axi_rready),
    .fifo_axi_aclk(fifo_axi_aclk),
    .fifo_axi_aresetn(fifo_axi_aresetn)
  );
endmodule
