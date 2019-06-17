################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name clk -period 20 [get_ports clk]
create_clock -name rgmii1_rxc -period 10 [get_ports rgmii1_rxc]
create_clock -name rgmii2_rxc -period 10 [get_ports rgmii2_rxc]
create_clock -name rgmii3_rxc -period 10 [get_ports rgmii3_rxc]
create_clock -name rgmii4_rxc -period 10 [get_ports rgmii4_rxc]

################################################################################