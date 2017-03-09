//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Thu Mar 09 16:55:06 2017
//Host        : DESKTOP-G26N4G8 running 64-bit major release  (build 9200)
//Command     : generate_target gpsImode_wrapper.bd
//Design      : gpsImode_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module gpsImode_wrapper
   (AluTrigger,
    B,
    DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    EF1,
    EF2,
    ErrFlag,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    IrFlag,
    PPS_IN,
    StartDis,
    StopDis1,
    StopDis2,
    StopDis3,
    StopDis4,
    StopTrigger1,
    StopTrigger2,
    Tstart,
    Tstop1,
    Tstop2,
    UART_rxd,
    UART_txd,
    addr,
    clr,
    csn,
    data,
    oen,
    out_1,
    out_2,
    out_3,
    out_4,
    pwmd,
    pwmo,
    rdn,
    sig_in,
    switch,
    tstart_out,
    wrn);
  output AluTrigger;
  input B;
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  input EF1;
  input EF2;
  input ErrFlag;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  input IrFlag;
  input PPS_IN;
  output StartDis;
  output StopDis1;
  output StopDis2;
  output StopDis3;
  output StopDis4;
  input StopTrigger1;
  input StopTrigger2;
  output Tstart;
  output Tstop1;
  output Tstop2;
  input UART_rxd;
  output UART_txd;
  output [3:0]addr;
  input clr;
  output csn;
  inout [27:0]data;
  output oen;
  output out_1;
  output out_2;
  output out_3;
  output out_4;
  output pwmd;
  output pwmo;
  output rdn;
  input sig_in;
  input switch;
  output tstart_out;
  output wrn;

  wire AluTrigger;
  wire B;
  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire EF1;
  wire EF2;
  wire ErrFlag;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire IrFlag;
  wire PPS_IN;
  wire StartDis;
  wire StopDis1;
  wire StopDis2;
  wire StopDis3;
  wire StopDis4;
  wire StopTrigger1;
  wire StopTrigger2;
  wire Tstart;
  wire Tstop1;
  wire Tstop2;
  wire UART_rxd;
  wire UART_txd;
  wire [3:0]addr;
  wire clr;
  wire csn;
  wire [27:0]data;
  wire oen;
  wire out_1;
  wire out_2;
  wire out_3;
  wire out_4;
  wire pwmd;
  wire pwmo;
  wire rdn;
  wire sig_in;
  wire switch;
  wire tstart_out;
  wire wrn;

  gpsImode gpsImode_i
       (.AluTrigger(AluTrigger),
        .B(B),
        .DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .EF1(EF1),
        .EF2(EF2),
        .ErrFlag(ErrFlag),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .IrFlag(IrFlag),
        .PPS_IN(PPS_IN),
        .StartDis(StartDis),
        .StopDis1(StopDis1),
        .StopDis2(StopDis2),
        .StopDis3(StopDis3),
        .StopDis4(StopDis4),
        .StopTrigger1(StopTrigger1),
        .StopTrigger2(StopTrigger2),
        .Tstart(Tstart),
        .Tstop1(Tstop1),
        .Tstop2(Tstop2),
        .UART_rxd(UART_rxd),
        .UART_txd(UART_txd),
        .addr(addr),
        .clr(clr),
        .csn(csn),
        .data(data),
        .oen(oen),
        .out_1(out_1),
        .out_2(out_2),
        .out_3(out_3),
        .out_4(out_4),
        .pwmd(pwmd),
        .pwmo(pwmo),
        .rdn(rdn),
        .sig_in(sig_in),
        .switch(switch),
        .tstart_out(tstart_out),
        .wrn(wrn));
endmodule
