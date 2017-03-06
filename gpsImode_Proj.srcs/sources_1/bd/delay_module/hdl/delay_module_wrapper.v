//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Sat Mar 04 16:58:36 2017
//Host        : DESKTOP-G26N4G8 running 64-bit major release  (build 9200)
//Command     : generate_target delay_module_wrapper.bd
//Design      : delay_module_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module delay_module_wrapper
   (DELAY_AXI_araddr,
    DELAY_AXI_arprot,
    DELAY_AXI_arready,
    DELAY_AXI_arvalid,
    DELAY_AXI_awaddr,
    DELAY_AXI_awprot,
    DELAY_AXI_awready,
    DELAY_AXI_awvalid,
    DELAY_AXI_bready,
    DELAY_AXI_bresp,
    DELAY_AXI_bvalid,
    DELAY_AXI_rdata,
    DELAY_AXI_rready,
    DELAY_AXI_rresp,
    DELAY_AXI_rvalid,
    DELAY_AXI_wdata,
    DELAY_AXI_wready,
    DELAY_AXI_wstrb,
    DELAY_AXI_wvalid,
    ch1,
    data_flag,
    delay_axi_aclk,
    delay_axi_aresetn,
    out_1,
    out_2,
    out_3,
    out_4,
    timedata,
    tstart,
    tstart_count);
  input [5:0]DELAY_AXI_araddr;
  input [2:0]DELAY_AXI_arprot;
  output DELAY_AXI_arready;
  input DELAY_AXI_arvalid;
  input [5:0]DELAY_AXI_awaddr;
  input [2:0]DELAY_AXI_awprot;
  output DELAY_AXI_awready;
  input DELAY_AXI_awvalid;
  input DELAY_AXI_bready;
  output [1:0]DELAY_AXI_bresp;
  output DELAY_AXI_bvalid;
  output [31:0]DELAY_AXI_rdata;
  input DELAY_AXI_rready;
  output [1:0]DELAY_AXI_rresp;
  output DELAY_AXI_rvalid;
  input [31:0]DELAY_AXI_wdata;
  output DELAY_AXI_wready;
  input [3:0]DELAY_AXI_wstrb;
  input DELAY_AXI_wvalid;
  output ch1;
  input data_flag;
  input delay_axi_aclk;
  input delay_axi_aresetn;
  output out_1;
  output out_2;
  output out_3;
  output out_4;
  input [21:0]timedata;
  output tstart;
  input [31:0]tstart_count;

  wire [5:0]DELAY_AXI_araddr;
  wire [2:0]DELAY_AXI_arprot;
  wire DELAY_AXI_arready;
  wire DELAY_AXI_arvalid;
  wire [5:0]DELAY_AXI_awaddr;
  wire [2:0]DELAY_AXI_awprot;
  wire DELAY_AXI_awready;
  wire DELAY_AXI_awvalid;
  wire DELAY_AXI_bready;
  wire [1:0]DELAY_AXI_bresp;
  wire DELAY_AXI_bvalid;
  wire [31:0]DELAY_AXI_rdata;
  wire DELAY_AXI_rready;
  wire [1:0]DELAY_AXI_rresp;
  wire DELAY_AXI_rvalid;
  wire [31:0]DELAY_AXI_wdata;
  wire DELAY_AXI_wready;
  wire [3:0]DELAY_AXI_wstrb;
  wire DELAY_AXI_wvalid;
  wire ch1;
  wire data_flag;
  wire delay_axi_aclk;
  wire delay_axi_aresetn;
  wire out_1;
  wire out_2;
  wire out_3;
  wire out_4;
  wire [21:0]timedata;
  wire tstart;
  wire [31:0]tstart_count;

  delay_module delay_module_i
       (.DELAY_AXI_araddr(DELAY_AXI_araddr),
        .DELAY_AXI_arprot(DELAY_AXI_arprot),
        .DELAY_AXI_arready(DELAY_AXI_arready),
        .DELAY_AXI_arvalid(DELAY_AXI_arvalid),
        .DELAY_AXI_awaddr(DELAY_AXI_awaddr),
        .DELAY_AXI_awprot(DELAY_AXI_awprot),
        .DELAY_AXI_awready(DELAY_AXI_awready),
        .DELAY_AXI_awvalid(DELAY_AXI_awvalid),
        .DELAY_AXI_bready(DELAY_AXI_bready),
        .DELAY_AXI_bresp(DELAY_AXI_bresp),
        .DELAY_AXI_bvalid(DELAY_AXI_bvalid),
        .DELAY_AXI_rdata(DELAY_AXI_rdata),
        .DELAY_AXI_rready(DELAY_AXI_rready),
        .DELAY_AXI_rresp(DELAY_AXI_rresp),
        .DELAY_AXI_rvalid(DELAY_AXI_rvalid),
        .DELAY_AXI_wdata(DELAY_AXI_wdata),
        .DELAY_AXI_wready(DELAY_AXI_wready),
        .DELAY_AXI_wstrb(DELAY_AXI_wstrb),
        .DELAY_AXI_wvalid(DELAY_AXI_wvalid),
        .ch1(ch1),
        .data_flag(data_flag),
        .delay_axi_aclk(delay_axi_aclk),
        .delay_axi_aresetn(delay_axi_aresetn),
        .out_1(out_1),
        .out_2(out_2),
        .out_3(out_3),
        .out_4(out_4),
        .timedata(timedata),
        .tstart(tstart),
        .tstart_count(tstart_count));
endmodule
