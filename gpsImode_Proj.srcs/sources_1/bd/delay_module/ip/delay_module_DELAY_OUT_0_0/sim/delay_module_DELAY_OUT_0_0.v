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


// IP VLNV: xilinx.com:user:DELAY_OUT:1.0
// IP Revision: 6

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module delay_module_DELAY_OUT_0_0 (
  clk,
  resetn,
  tstart_count,
  init,
  tdc_data_flag,
  tdc_data,
  cycle,
  tstart_width,
  delay_1,
  out_1_width,
  delay_2,
  out_2_width,
  delay_3,
  out_3_width,
  delay_4,
  out_4_width,
  tstart,
  out_1,
  out_2,
  out_3,
  out_4,
  ch1
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 resetn RST" *)
input wire resetn;
input wire [31 : 0] tstart_count;
input wire init;
input wire tdc_data_flag;
input wire [14 : 0] tdc_data;
input wire [14 : 0] cycle;
input wire [13 : 0] tstart_width;
input wire [14 : 0] delay_1;
input wire [13 : 0] out_1_width;
input wire [14 : 0] delay_2;
input wire [13 : 0] out_2_width;
input wire [14 : 0] delay_3;
input wire [13 : 0] out_3_width;
input wire [14 : 0] delay_4;
input wire [13 : 0] out_4_width;
output wire tstart;
output wire out_1;
output wire out_2;
output wire out_3;
output wire out_4;
output wire ch1;

  DELAY_OUT inst (
    .clk(clk),
    .resetn(resetn),
    .tstart_count(tstart_count),
    .init(init),
    .tdc_data_flag(tdc_data_flag),
    .tdc_data(tdc_data),
    .cycle(cycle),
    .tstart_width(tstart_width),
    .delay_1(delay_1),
    .out_1_width(out_1_width),
    .delay_2(delay_2),
    .out_2_width(out_2_width),
    .delay_3(delay_3),
    .out_3_width(out_3_width),
    .delay_4(delay_4),
    .out_4_width(out_4_width),
    .tstart(tstart),
    .out_1(out_1),
    .out_2(out_2),
    .out_3(out_3),
    .out_4(out_4),
    .ch1(ch1)
  );
endmodule
