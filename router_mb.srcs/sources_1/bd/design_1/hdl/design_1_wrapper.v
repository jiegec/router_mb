//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
//Date        : Mon Jun 17 21:31:16 2019
//Host        : oslab-Ubuntu16 running 64-bit Ubuntu 18.04.2 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (clk,
    reset_n_in,
    rgmii1_rd,
    rgmii1_rx_ctl,
    rgmii1_rxc,
    rgmii1_td,
    rgmii1_tx_ctl,
    rgmii1_txc,
    rgmii2_rd,
    rgmii2_rx_ctl,
    rgmii2_rxc,
    rgmii2_td,
    rgmii2_tx_ctl,
    rgmii2_txc,
    rgmii3_rd,
    rgmii3_rx_ctl,
    rgmii3_rxc,
    rgmii3_td,
    rgmii3_tx_ctl,
    rgmii3_txc,
    rgmii4_rd,
    rgmii4_rx_ctl,
    rgmii4_rxc,
    rgmii4_td,
    rgmii4_tx_ctl,
    rgmii4_txc);
  input clk;
  input reset_n_in;
  input [3:0]rgmii1_rd;
  input rgmii1_rx_ctl;
  input rgmii1_rxc;
  output [3:0]rgmii1_td;
  output rgmii1_tx_ctl;
  output rgmii1_txc;
  input [3:0]rgmii2_rd;
  input rgmii2_rx_ctl;
  input rgmii2_rxc;
  output [3:0]rgmii2_td;
  output rgmii2_tx_ctl;
  output rgmii2_txc;
  input [3:0]rgmii3_rd;
  input rgmii3_rx_ctl;
  input rgmii3_rxc;
  output [3:0]rgmii3_td;
  output rgmii3_tx_ctl;
  output rgmii3_txc;
  input [3:0]rgmii4_rd;
  input rgmii4_rx_ctl;
  input rgmii4_rxc;
  output [3:0]rgmii4_td;
  output rgmii4_tx_ctl;
  output rgmii4_txc;

  wire clk;
  wire reset_n_in;
  wire [3:0]rgmii1_rd;
  wire rgmii1_rx_ctl;
  wire rgmii1_rxc;
  wire [3:0]rgmii1_td;
  wire rgmii1_tx_ctl;
  wire rgmii1_txc;
  wire [3:0]rgmii2_rd;
  wire rgmii2_rx_ctl;
  wire rgmii2_rxc;
  wire [3:0]rgmii2_td;
  wire rgmii2_tx_ctl;
  wire rgmii2_txc;
  wire [3:0]rgmii3_rd;
  wire rgmii3_rx_ctl;
  wire rgmii3_rxc;
  wire [3:0]rgmii3_td;
  wire rgmii3_tx_ctl;
  wire rgmii3_txc;
  wire [3:0]rgmii4_rd;
  wire rgmii4_rx_ctl;
  wire rgmii4_rxc;
  wire [3:0]rgmii4_td;
  wire rgmii4_tx_ctl;
  wire rgmii4_txc;

  design_1 design_1_i
       (.clk(clk),
        .reset_n_in(reset_n_in),
        .rgmii1_rd(rgmii1_rd),
        .rgmii1_rx_ctl(rgmii1_rx_ctl),
        .rgmii1_rxc(rgmii1_rxc),
        .rgmii1_td(rgmii1_td),
        .rgmii1_tx_ctl(rgmii1_tx_ctl),
        .rgmii1_txc(rgmii1_txc),
        .rgmii2_rd(rgmii2_rd),
        .rgmii2_rx_ctl(rgmii2_rx_ctl),
        .rgmii2_rxc(rgmii2_rxc),
        .rgmii2_td(rgmii2_td),
        .rgmii2_tx_ctl(rgmii2_tx_ctl),
        .rgmii2_txc(rgmii2_txc),
        .rgmii3_rd(rgmii3_rd),
        .rgmii3_rx_ctl(rgmii3_rx_ctl),
        .rgmii3_rxc(rgmii3_rxc),
        .rgmii3_td(rgmii3_td),
        .rgmii3_tx_ctl(rgmii3_tx_ctl),
        .rgmii3_txc(rgmii3_txc),
        .rgmii4_rd(rgmii4_rd),
        .rgmii4_rx_ctl(rgmii4_rx_ctl),
        .rgmii4_rxc(rgmii4_rxc),
        .rgmii4_td(rgmii4_td),
        .rgmii4_tx_ctl(rgmii4_tx_ctl),
        .rgmii4_txc(rgmii4_txc));
endmodule
