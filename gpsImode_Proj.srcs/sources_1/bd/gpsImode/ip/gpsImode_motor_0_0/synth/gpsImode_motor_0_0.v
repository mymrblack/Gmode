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


// IP VLNV: xilinx.com:user:motor:2.0
// IP Revision: 6

(* X_CORE_INFO = "motor_v2_0,Vivado 2016.2" *)
(* CHECK_LICENSE_TYPE = "gpsImode_motor_0_0,motor_v2_0,{}" *)
(* CORE_GENERATION_INFO = "gpsImode_motor_0_0,motor_v2_0,{x_ipProduct=Vivado 2016.2,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=motor,x_ipVersion=2.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_MOTOR_AXI_DATA_WIDTH=32,C_MOTOR_AXI_ADDR_WIDTH=6}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module gpsImode_motor_0_0 (
  raster_a,
  raster_b,
  raster_z,
  record_flag,
  pos_pwm,
  dir,
  raster_val,
  motor_axi_awaddr,
  motor_axi_awprot,
  motor_axi_awvalid,
  motor_axi_awready,
  motor_axi_wdata,
  motor_axi_wstrb,
  motor_axi_wvalid,
  motor_axi_wready,
  motor_axi_bresp,
  motor_axi_bvalid,
  motor_axi_bready,
  motor_axi_araddr,
  motor_axi_arprot,
  motor_axi_arvalid,
  motor_axi_arready,
  motor_axi_rdata,
  motor_axi_rresp,
  motor_axi_rvalid,
  motor_axi_rready,
  motor_axi_aclk,
  motor_axi_aresetn
);

input wire raster_a;
input wire raster_b;
input wire raster_z;
input wire record_flag;
output wire pos_pwm;
output wire dir;
output wire [31 : 0] raster_val;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI AWADDR" *)
input wire [5 : 0] motor_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI AWPROT" *)
input wire [2 : 0] motor_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI AWVALID" *)
input wire motor_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI AWREADY" *)
output wire motor_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI WDATA" *)
input wire [31 : 0] motor_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI WSTRB" *)
input wire [3 : 0] motor_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI WVALID" *)
input wire motor_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI WREADY" *)
output wire motor_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI BRESP" *)
output wire [1 : 0] motor_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI BVALID" *)
output wire motor_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI BREADY" *)
input wire motor_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI ARADDR" *)
input wire [5 : 0] motor_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI ARPROT" *)
input wire [2 : 0] motor_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI ARVALID" *)
input wire motor_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI ARREADY" *)
output wire motor_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI RDATA" *)
output wire [31 : 0] motor_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI RRESP" *)
output wire [1 : 0] motor_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI RVALID" *)
output wire motor_axi_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 MOTOR_AXI RREADY" *)
input wire motor_axi_rready;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 MOTOR_AXI_CLK CLK" *)
input wire motor_axi_aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 MOTOR_AXI_RST RST" *)
input wire motor_axi_aresetn;

  motor_v2_0 #(
    .C_MOTOR_AXI_DATA_WIDTH(32),  // Width of S_AXI data bus
    .C_MOTOR_AXI_ADDR_WIDTH(6)  // Width of S_AXI address bus
  ) inst (
    .raster_a(raster_a),
    .raster_b(raster_b),
    .raster_z(raster_z),
    .record_flag(record_flag),
    .pos_pwm(pos_pwm),
    .dir(dir),
    .raster_val(raster_val),
    .motor_axi_awaddr(motor_axi_awaddr),
    .motor_axi_awprot(motor_axi_awprot),
    .motor_axi_awvalid(motor_axi_awvalid),
    .motor_axi_awready(motor_axi_awready),
    .motor_axi_wdata(motor_axi_wdata),
    .motor_axi_wstrb(motor_axi_wstrb),
    .motor_axi_wvalid(motor_axi_wvalid),
    .motor_axi_wready(motor_axi_wready),
    .motor_axi_bresp(motor_axi_bresp),
    .motor_axi_bvalid(motor_axi_bvalid),
    .motor_axi_bready(motor_axi_bready),
    .motor_axi_araddr(motor_axi_araddr),
    .motor_axi_arprot(motor_axi_arprot),
    .motor_axi_arvalid(motor_axi_arvalid),
    .motor_axi_arready(motor_axi_arready),
    .motor_axi_rdata(motor_axi_rdata),
    .motor_axi_rresp(motor_axi_rresp),
    .motor_axi_rvalid(motor_axi_rvalid),
    .motor_axi_rready(motor_axi_rready),
    .motor_axi_aclk(motor_axi_aclk),
    .motor_axi_aresetn(motor_axi_aresetn)
  );
endmodule
