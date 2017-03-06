//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Sat Mar 04 16:58:36 2017
//Host        : DESKTOP-G26N4G8 running 64-bit major release  (build 9200)
//Command     : generate_target delay_module.bd
//Design      : delay_module
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "delay_module,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=delay_module,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "delay_module.hwdef" *) 
module delay_module
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

  wire [5:0]DELAY_AXI_1_ARADDR;
  wire [2:0]DELAY_AXI_1_ARPROT;
  wire DELAY_AXI_1_ARREADY;
  wire DELAY_AXI_1_ARVALID;
  wire [5:0]DELAY_AXI_1_AWADDR;
  wire [2:0]DELAY_AXI_1_AWPROT;
  wire DELAY_AXI_1_AWREADY;
  wire DELAY_AXI_1_AWVALID;
  wire DELAY_AXI_1_BREADY;
  wire [1:0]DELAY_AXI_1_BRESP;
  wire DELAY_AXI_1_BVALID;
  wire [31:0]DELAY_AXI_1_RDATA;
  wire DELAY_AXI_1_RREADY;
  wire [1:0]DELAY_AXI_1_RRESP;
  wire DELAY_AXI_1_RVALID;
  wire [31:0]DELAY_AXI_1_WDATA;
  wire DELAY_AXI_1_WREADY;
  wire [3:0]DELAY_AXI_1_WSTRB;
  wire DELAY_AXI_1_WVALID;
  wire DELAY_OUT_0_ch1;
  wire DELAY_OUT_0_out_1;
  wire DELAY_OUT_0_out_2;
  wire DELAY_OUT_0_out_3;
  wire DELAY_OUT_0_out_4;
  wire DELAY_OUT_0_tstart;
  wire TDC_TO_DELAY_0_data_out_flag;
  wire [14:0]TDC_TO_DELAY_0_delaydata;
  wire data_flag_1;
  wire delay_0_init_wr;
  wire [14:0]delay_0_out_1_delay;
  wire [13:0]delay_0_out_1_width;
  wire [14:0]delay_0_out_2_delay;
  wire [13:0]delay_0_out_2_width;
  wire [14:0]delay_0_out_3_delay;
  wire [13:0]delay_0_out_3_width;
  wire [14:0]delay_0_out_4_delay;
  wire [13:0]delay_0_out_4_width;
  wire [14:0]delay_0_tstart_cycle;
  wire [13:0]delay_0_tstart_width;
  wire delay_axi_aclk_1;
  wire delay_axi_aresetn_1;
  wire [21:0]timedata_1;
  wire [31:0]tstart_count_1;

  assign DELAY_AXI_1_ARADDR = DELAY_AXI_araddr[5:0];
  assign DELAY_AXI_1_ARPROT = DELAY_AXI_arprot[2:0];
  assign DELAY_AXI_1_ARVALID = DELAY_AXI_arvalid;
  assign DELAY_AXI_1_AWADDR = DELAY_AXI_awaddr[5:0];
  assign DELAY_AXI_1_AWPROT = DELAY_AXI_awprot[2:0];
  assign DELAY_AXI_1_AWVALID = DELAY_AXI_awvalid;
  assign DELAY_AXI_1_BREADY = DELAY_AXI_bready;
  assign DELAY_AXI_1_RREADY = DELAY_AXI_rready;
  assign DELAY_AXI_1_WDATA = DELAY_AXI_wdata[31:0];
  assign DELAY_AXI_1_WSTRB = DELAY_AXI_wstrb[3:0];
  assign DELAY_AXI_1_WVALID = DELAY_AXI_wvalid;
  assign DELAY_AXI_arready = DELAY_AXI_1_ARREADY;
  assign DELAY_AXI_awready = DELAY_AXI_1_AWREADY;
  assign DELAY_AXI_bresp[1:0] = DELAY_AXI_1_BRESP;
  assign DELAY_AXI_bvalid = DELAY_AXI_1_BVALID;
  assign DELAY_AXI_rdata[31:0] = DELAY_AXI_1_RDATA;
  assign DELAY_AXI_rresp[1:0] = DELAY_AXI_1_RRESP;
  assign DELAY_AXI_rvalid = DELAY_AXI_1_RVALID;
  assign DELAY_AXI_wready = DELAY_AXI_1_WREADY;
  assign ch1 = DELAY_OUT_0_ch1;
  assign data_flag_1 = data_flag;
  assign delay_axi_aclk_1 = delay_axi_aclk;
  assign delay_axi_aresetn_1 = delay_axi_aresetn;
  assign out_1 = DELAY_OUT_0_out_1;
  assign out_2 = DELAY_OUT_0_out_2;
  assign out_3 = DELAY_OUT_0_out_3;
  assign out_4 = DELAY_OUT_0_out_4;
  assign timedata_1 = timedata[21:0];
  assign tstart = DELAY_OUT_0_tstart;
  assign tstart_count_1 = tstart_count[31:0];
  delay_module_DELAY_OUT_0_0 DELAY_OUT_0
       (.ch1(DELAY_OUT_0_ch1),
        .clk(delay_axi_aclk_1),
        .cycle(delay_0_tstart_cycle),
        .delay_1(delay_0_out_1_delay),
        .delay_2(delay_0_out_2_delay),
        .delay_3(delay_0_out_3_delay),
        .delay_4(delay_0_out_4_delay),
        .init(delay_0_init_wr),
        .out_1(DELAY_OUT_0_out_1),
        .out_1_width(delay_0_out_1_width),
        .out_2(DELAY_OUT_0_out_2),
        .out_2_width(delay_0_out_2_width),
        .out_3(DELAY_OUT_0_out_3),
        .out_3_width(delay_0_out_3_width),
        .out_4(DELAY_OUT_0_out_4),
        .out_4_width(delay_0_out_4_width),
        .resetn(delay_axi_aresetn_1),
        .tdc_data(TDC_TO_DELAY_0_delaydata),
        .tdc_data_flag(TDC_TO_DELAY_0_data_out_flag),
        .tstart(DELAY_OUT_0_tstart),
        .tstart_count(tstart_count_1),
        .tstart_width(delay_0_tstart_width));
  delay_module_TDC_TO_DELAY_0_0 TDC_TO_DELAY_0
       (.clk(delay_axi_aclk_1),
        .data_flag(data_flag_1),
        .data_out_flag(TDC_TO_DELAY_0_data_out_flag),
        .delaydata(TDC_TO_DELAY_0_delaydata),
        .resetn(delay_axi_aresetn_1),
        .timedata(timedata_1));
  delay_module_delay_0_1 delay_0
       (.delay_axi_aclk(delay_axi_aclk_1),
        .delay_axi_araddr(DELAY_AXI_1_ARADDR),
        .delay_axi_aresetn(delay_axi_aresetn_1),
        .delay_axi_arprot(DELAY_AXI_1_ARPROT),
        .delay_axi_arready(DELAY_AXI_1_ARREADY),
        .delay_axi_arvalid(DELAY_AXI_1_ARVALID),
        .delay_axi_awaddr(DELAY_AXI_1_AWADDR),
        .delay_axi_awprot(DELAY_AXI_1_AWPROT),
        .delay_axi_awready(DELAY_AXI_1_AWREADY),
        .delay_axi_awvalid(DELAY_AXI_1_AWVALID),
        .delay_axi_bready(DELAY_AXI_1_BREADY),
        .delay_axi_bresp(DELAY_AXI_1_BRESP),
        .delay_axi_bvalid(DELAY_AXI_1_BVALID),
        .delay_axi_rdata(DELAY_AXI_1_RDATA),
        .delay_axi_rready(DELAY_AXI_1_RREADY),
        .delay_axi_rresp(DELAY_AXI_1_RRESP),
        .delay_axi_rvalid(DELAY_AXI_1_RVALID),
        .delay_axi_wdata(DELAY_AXI_1_WDATA),
        .delay_axi_wready(DELAY_AXI_1_WREADY),
        .delay_axi_wstrb(DELAY_AXI_1_WSTRB),
        .delay_axi_wvalid(DELAY_AXI_1_WVALID),
        .init_wr(delay_0_init_wr),
        .out_1_delay(delay_0_out_1_delay),
        .out_1_width(delay_0_out_1_width),
        .out_2_delay(delay_0_out_2_delay),
        .out_2_width(delay_0_out_2_width),
        .out_3_delay(delay_0_out_3_delay),
        .out_3_width(delay_0_out_3_width),
        .out_4_delay(delay_0_out_4_delay),
        .out_4_width(delay_0_out_4_width),
        .tstart_cycle(delay_0_tstart_cycle),
        .tstart_width(delay_0_tstart_width));
endmodule
