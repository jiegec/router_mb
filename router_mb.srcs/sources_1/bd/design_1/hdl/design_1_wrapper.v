//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
//Date        : Wed Jun  5 19:01:33 2019
//Host        : oslab-Ubuntu16 running 64-bit Ubuntu 18.04.2 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (AXI_STR_RXD_0_tdata,
    AXI_STR_RXD_0_tlast,
    AXI_STR_RXD_0_tready,
    AXI_STR_RXD_0_tvalid,
    AXI_STR_TXD_0_tdata,
    AXI_STR_TXD_0_tlast,
    AXI_STR_TXD_0_tready,
    AXI_STR_TXD_0_tvalid,
    axis_clk,
    clk125M,
    clk200M,
    ext_clk,
    ext_reset_n,
    routing_table_addr,
    routing_table_clk,
    routing_table_din,
    routing_table_dout,
    routing_table_en,
    routing_table_rst,
    routing_table_we,
    rx_bytes_tri_i,
    rx_packets_tri_i,
    tx_bytes_tri_i,
    tx_packets_tri_i);
  input [31:0]AXI_STR_RXD_0_tdata;
  input AXI_STR_RXD_0_tlast;
  output AXI_STR_RXD_0_tready;
  input AXI_STR_RXD_0_tvalid;
  output [31:0]AXI_STR_TXD_0_tdata;
  output AXI_STR_TXD_0_tlast;
  input AXI_STR_TXD_0_tready;
  output AXI_STR_TXD_0_tvalid;
  output axis_clk;
  output clk125M;
  output clk200M;
  input ext_clk;
  input ext_reset_n;
  output [13:0]routing_table_addr;
  output routing_table_clk;
  output [127:0]routing_table_din;
  input [127:0]routing_table_dout;
  output routing_table_en;
  output routing_table_rst;
  output [15:0]routing_table_we;
  input [31:0]rx_bytes_tri_i;
  input [31:0]rx_packets_tri_i;
  input [31:0]tx_bytes_tri_i;
  input [31:0]tx_packets_tri_i;

  wire [31:0]AXI_STR_RXD_0_tdata;
  wire AXI_STR_RXD_0_tlast;
  wire AXI_STR_RXD_0_tready;
  wire AXI_STR_RXD_0_tvalid;
  wire [31:0]AXI_STR_TXD_0_tdata;
  wire AXI_STR_TXD_0_tlast;
  wire AXI_STR_TXD_0_tready;
  wire AXI_STR_TXD_0_tvalid;
  wire axis_clk;
  wire clk125M;
  wire clk200M;
  wire ext_clk;
  wire ext_reset_n;
  wire [13:0]routing_table_addr;
  wire routing_table_clk;
  wire [127:0]routing_table_din;
  wire [127:0]routing_table_dout;
  wire routing_table_en;
  wire routing_table_rst;
  wire [15:0]routing_table_we;
  wire [31:0]rx_bytes_tri_i;
  wire [31:0]rx_packets_tri_i;
  wire [31:0]tx_bytes_tri_i;
  wire [31:0]tx_packets_tri_i;

  design_1 design_1_i
       (.AXI_STR_RXD_0_tdata(AXI_STR_RXD_0_tdata),
        .AXI_STR_RXD_0_tlast(AXI_STR_RXD_0_tlast),
        .AXI_STR_RXD_0_tready(AXI_STR_RXD_0_tready),
        .AXI_STR_RXD_0_tvalid(AXI_STR_RXD_0_tvalid),
        .AXI_STR_TXD_0_tdata(AXI_STR_TXD_0_tdata),
        .AXI_STR_TXD_0_tlast(AXI_STR_TXD_0_tlast),
        .AXI_STR_TXD_0_tready(AXI_STR_TXD_0_tready),
        .AXI_STR_TXD_0_tvalid(AXI_STR_TXD_0_tvalid),
        .axis_clk(axis_clk),
        .clk125M(clk125M),
        .clk200M(clk200M),
        .ext_clk(ext_clk),
        .ext_reset_n(ext_reset_n),
        .routing_table_addr(routing_table_addr),
        .routing_table_clk(routing_table_clk),
        .routing_table_din(routing_table_din),
        .routing_table_dout(routing_table_dout),
        .routing_table_en(routing_table_en),
        .routing_table_rst(routing_table_rst),
        .routing_table_we(routing_table_we),
        .rx_bytes_tri_i(rx_bytes_tri_i),
        .rx_packets_tri_i(rx_packets_tri_i),
        .tx_bytes_tri_i(tx_bytes_tri_i),
        .tx_packets_tri_i(tx_packets_tri_i));
endmodule
