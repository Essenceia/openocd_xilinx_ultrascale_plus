# Main clock signal 
set_property -dict {LOC E18 IOSTANDARD LVDS} [get_ports Clk_100mhz_p_i]
set_property -dict {LOC D18 IOSTANDARD LVDS} [get_ports Clk_100mhz_n_i]
create_clock -period 10 -name clk_100mhz [get_ports Clk_100mhz_p_i]

# LEDS
set_property -dict {LOC B11 IOSTANDARD LVCMOS18} [get_ports { Led_o[0]}]
set_property -dict {LOC C11 IOSTANDARD LVCMOS18} [get_ports { Led_o[1]}]
set_property -dict {LOC A10 IOSTANDARD LVCMOS18} [get_ports { Led_o[2]}]
set_property -dict {LOC B10 IOSTANDARD LVCMOS18} [get_ports { Led_o[3]}]
