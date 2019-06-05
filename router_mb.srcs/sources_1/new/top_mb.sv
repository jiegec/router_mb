`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2019 03:35:22 PM
// Design Name: 
// Module Name: top_mb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "constants.vh"

module top_mb(
    input logic clk, // 50MHz
    input logic reset_n_in,

    // rgmii
    input logic [3:0] rgmii1_rd,
    input logic rgmii1_rx_ctl,
    input logic rgmii1_rxc,
    output logic [3:0] rgmii1_td,
    output logic rgmii1_tx_ctl,
    output logic rgmii1_txc,

    input logic [3:0] rgmii2_rd,
    input logic rgmii2_rx_ctl,
    input logic rgmii2_rxc,
    output logic [3:0] rgmii2_td,
    output logic rgmii2_tx_ctl,
    output logic rgmii2_txc
    );

    logic axis_clk;
    logic clk125M;
    logic clk200M;
    // from router to os
    logic [`BYTE_WIDTH-1:0] axis_rxd_tdata;
    logic axis_rxd_tlast;
    logic axis_rxd_tready;
    logic axis_rxd_tvalid;

    // from os to router
    logic [`BYTE_WIDTH-1:0] axis_txd_tdata;
    logic axis_txd_tlast;
    logic axis_txd_tready;
    logic axis_txd_tvalid;

    logic [`PORT_OS_COUNT-1:0][`STATS_WIDTH-1:0] stats_rx_packets;
    logic [`PORT_OS_COUNT-1:0][`STATS_WIDTH-1:0] stats_rx_bytes;
    logic [`PORT_OS_COUNT-1:0][`STATS_WIDTH-1:0] stats_tx_packets;
    logic [`PORT_OS_COUNT-1:0][`STATS_WIDTH-1:0] stats_tx_bytes;

    logic [`STATS_WIDTH-1:0] stats_total_rx_packets;
    logic [`STATS_WIDTH-1:0] stats_total_rx_bytes;
    logic [`STATS_WIDTH-1:0] stats_total_tx_packets;
    logic [`STATS_WIDTH-1:0] stats_total_tx_bytes;

    assign stats_total_rx_packets = stats_rx_packets[0] + stats_rx_packets[1];
    assign stats_total_rx_bytes = stats_rx_bytes[0] + stats_rx_bytes[1];
    assign stats_total_tx_packets = stats_tx_packets[0] + stats_tx_packets[1];
    assign stats_total_tx_bytes = stats_tx_bytes[0] + stats_tx_bytes[1];

    // accessing routing table
    logic os_clk;
    logic [16-1:0] os_addr;
    logic [`ROUTING_TABLE_ENTRY_WIDTH-1:0] os_din;
    logic [`ROUTING_TABLE_ENTRY_WIDTH-1:0] os_dout;
    logic [(`ROUTING_TABLE_ENTRY_WIDTH)/`BYTE_WIDTH-1:0] os_wea;
    logic os_rst;
    logic os_en;

    router router_inst(
        .clk(clk),
        .clk125M(clk125M),
        .clk200M(clk200M),
        .reset_n(reset_n_in),

        .axis_clk(axis_clk),
        .axis_rxd_tdata(axis_rxd_tdata),
        .axis_rxd_tlast(axis_rxd_tlast),
        .axis_rxd_tready(axis_rxd_tready),
        .axis_rxd_tvalid(axis_rxd_tvalid),
        .axis_txd_tdata(axis_txd_tdata),
        .axis_txd_tlast(axis_txd_tlast),
        .axis_txd_tready(axis_txd_tready),
        .axis_txd_tvalid(axis_txd_tvalid),

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

        .stats_rx_bytes(stats_rx_bytes),
        .stats_rx_packets(stats_rx_packets),
        .stats_tx_bytes(stats_tx_bytes),
        .stats_tx_packets(stats_tx_packets),

        .os_clk(os_clk),
        .os_addr(os_addr),
        .os_din(os_din),
        .os_dout(os_dout),
        .os_wea(os_wea),
        .os_rst(os_rst),
        .os_en(os_en)
    );

    design_1_wrapper design_1_inst(
        .ext_clk(clk),
        .ext_reset_n(reset_n_in),
        .clk125M(clk125M),
        .clk200M(clk200M),

        .axis_clk(axis_clk),
        .AXI_STR_RXD_0_tdata(axis_rxd_tdata),
        .AXI_STR_RXD_0_tlast(axis_rxd_tlast),
        .AXI_STR_RXD_0_tready(axis_rxd_tready),
        .AXI_STR_RXD_0_tvalid(axis_rxd_tvalid),
        .AXI_STR_TXD_0_tdata(axis_txd_tdata),
        .AXI_STR_TXD_0_tlast(axis_txd_tlast),
        .AXI_STR_TXD_0_tready(axis_txd_tready),
        .AXI_STR_TXD_0_tvalid(axis_txd_tvalid),

        .rx_bytes_tri_i(stats_total_rx_bytes),
        .rx_packets_tri_i(stats_total_rx_packets),

        .tx_bytes_tri_i(stats_total_tx_bytes),
        .tx_packets_tri_i(stats_total_tx_packets),

        .routing_table_addr(os_addr),
        .routing_table_clk(os_clk),
        .routing_table_din(os_din),
        .routing_table_dout(os_dout),
        .routing_table_en(os_en),
        .routing_table_rst(os_rst),
        .routing_table_we(os_wea)
    );
endmodule
