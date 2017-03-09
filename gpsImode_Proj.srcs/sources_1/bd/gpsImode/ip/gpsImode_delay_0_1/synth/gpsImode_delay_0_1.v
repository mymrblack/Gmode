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


// IP VLNV: xilinx.com:user:delay:1.0
// IP Revision: 13

(* X_CORE_INFO = "delay_v1_0,Vivado 2016.2" *)
(* CHECK_LICENSE_TYPE = "gpsImode_delay_0_1,delay_v1_0,{}" *)
(* CORE_GENERATION_INFO = "gpsImode_delay_0_1,delay_v1_0,{x_ipProduct=Vivado 2016.2,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=delay,x_ipVersion=1.0,x_ipCoreRevision=13,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_DELAY_AXI_DATA_WIDTH=32,C_DELAY_AXI_ADDR_WIDTH=6}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module gpsImode_delay_0_1 (
  time_record_flag,
  data_flag,
  ch1_time_data,
  tstart_out,
  out_1,
  out_2,
  out_3,
  out_4,
  out_1_delay_data,
  out_2_delay_data,
  out_3_delay_data,
  out_4_delay_data,
  delay_axi_awaddr,
  delay_axi_awprot,
  delay_axi_awvalid,
  delay_axi_awready,
  delay_axi_wdata,
  delay_axi_wstrb,
  delay_axi_wvalid,
  delay_axi_wready,
  delay_axi_bresp,
  delay_axi_bvalid,
  delay_axi_bready,
  delay_axi_araddr,
  delay_axi_arprot,
  delay_axi_arvalid,
  delay_axi_arready,
  delay_axi_rdata,
  delay_axi_rresp,
  delay_axi_rvalid,
  delay_axi_rready,
  delay_axi_aclk,
  delay_axi_aresetn
);

input wire time_record_flag;
input wire data_flag;
input wire [21 : 0] ch1_time_data;
output wire tstart_out;
output wire out_1;
output wire out_2;
output wire out_3;
output wire out_4;
output wire [14 : 0] out_1_delay_data;
output wire [14 : 0] out_2_delay_data;
output wire [14 : 0] out_3_delay_data;
output wire [14 : 0] out_4_delay_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI AWADDR" *)
input wire [5 : 0] delay_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI AWPROT" *)
input wire [2 : 0] delay_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI AWVALID" *)
input wire delay_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI AWREADY" *)
output wire delay_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI WDATA" *)
input wire [31 : 0] delay_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI WSTRB" *)
input wire [3 : 0] delay_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI WVALID" *)
input wire delay_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI WREADY" *)
output wire delay_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI BRESP" *)
output wire [1 : 0] delay_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI BVALID" *)
output wire delay_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI BREADY" *)
input wire delay_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI ARADDR" *)
input wire [5 : 0] delay_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI ARPROT" *)
input wire [2 : 0] delay_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI ARVALID" *)
input wire delay_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI ARREADY" *)
output wire delay_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI RDATA" *)
output wire [31 : 0] delay_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI RRESP" *)
output wire [1 : 0] delay_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI RVALID" *)
output wire delay_axi_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 DELAY_AXI RREADY" *)
input wire delay_axi_rready;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 DELAY_AXI_CLK CLK" *)
input wire delay_axi_aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 DELAY_AXI_RST RST" *)
input wire delay_axi_aresetn;

  delay_v1_0 #(
    .C_DELAY_AXI_DATA_WIDTH(32),  // Width of S_AXI data bus
    .C_DELAY_AXI_ADDR_WIDTH(6)  // Width of S_AXI address bus
  ) inst (
    .time_record_flag(time_record_flag),
    .data_flag(data_flag),
    .ch1_time_data(ch1_time_data),
    .tstart_out(tstart_out),
    .out_1(out_1),
    .out_2(out_2),
    .out_3(out_3),
    .out_4(out_4),
    .out_1_delay_data(out_1_delay_data),
    .out_2_delay_data(out_2_delay_data),
    .out_3_delay_data(out_3_delay_data),
    .out_4_delay_data(out_4_delay_data),
    .delay_axi_awaddr(delay_axi_awaddr),
    .delay_axi_awprot(delay_axi_awprot),
    .delay_axi_awvalid(delay_axi_awvalid),
    .delay_axi_awready(delay_axi_awready),
    .delay_axi_wdata(delay_axi_wdata),
    .delay_axi_wstrb(delay_axi_wstrb),
    .delay_axi_wvalid(delay_axi_wvalid),
    .delay_axi_wready(delay_axi_wready),
    .delay_axi_bresp(delay_axi_bresp),
    .delay_axi_bvalid(delay_axi_bvalid),
    .delay_axi_bready(delay_axi_bready),
    .delay_axi_araddr(delay_axi_araddr),
    .delay_axi_arprot(delay_axi_arprot),
    .delay_axi_arvalid(delay_axi_arvalid),
    .delay_axi_arready(delay_axi_arready),
    .delay_axi_rdata(delay_axi_rdata),
    .delay_axi_rresp(delay_axi_rresp),
    .delay_axi_rvalid(delay_axi_rvalid),
    .delay_axi_rready(delay_axi_rready),
    .delay_axi_aclk(delay_axi_aclk),
    .delay_axi_aresetn(delay_axi_aresetn)
  );
endmodule
