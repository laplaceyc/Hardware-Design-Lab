# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]

# 7-Segment signal
set_property PACKAGE_PIN W4 [get_ports {DIGIT[3]}]
set_property PACKAGE_PIN V4 [get_ports {DIGIT[2]}]
set_property PACKAGE_PIN U4 [get_ports {DIGIT[1]}]
set_property PACKAGE_PIN U2 [get_ports {DIGIT[0]}]
set_property PACKAGE_PIN W7 [get_ports {DISPLAY[6]}]
set_property PACKAGE_PIN W6 [get_ports {DISPLAY[5]}]
set_property PACKAGE_PIN U8 [get_ports {DISPLAY[4]}]
set_property PACKAGE_PIN V8 [get_ports {DISPLAY[3]}]
set_property PACKAGE_PIN U5 [get_ports {DISPLAY[2]}]
set_property PACKAGE_PIN V5 [get_ports {DISPLAY[1]}]
set_property PACKAGE_PIN U7 [get_ports {DISPLAY[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {DIGIT[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIGIT[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIGIT[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIGIT[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISPLAY[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISPLAY[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISPLAY[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISPLAY[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISPLAY[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISPLAY[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISPLAY[0]}]

# Pushbutton signal
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

# LED signal

set_property PACKAGE_PIN L1 [get_ports {drop_money[0]}]
set_property PACKAGE_PIN P1 [get_ports {drop_money[1]}]
set_property PACKAGE_PIN N3 [get_ports {drop_money[2]}]
set_property PACKAGE_PIN P3 [get_ports {drop_money[3]}]
set_property PACKAGE_PIN U3 [get_ports {drop_money[4]}]
set_property PACKAGE_PIN W3 [get_ports {drop_money[5]}]
set_property PACKAGE_PIN V3 [get_ports {drop_money[6]}]
set_property PACKAGE_PIN V13 [get_ports {drop_money[7]}]
set_property PACKAGE_PIN V14 [get_ports {drop_money[8]}]
set_property PACKAGE_PIN U14 [get_ports {drop_money[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {drop_money[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {drop_money[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {drop_money[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {drop_money[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {drop_money[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {drop_money[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {drop_money[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {drop_money[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {drop_money[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {drop_money[9]}]

# PS2 signal
set_property PACKAGE_PIN C17 [get_ports PS2_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports PS2_CLK]
set_property PULLUP true [get_ports PS2_CLK]
set_property PACKAGE_PIN B17 [get_ports PS2_DATA]
set_property IOSTANDARD LVCMOS33 [get_ports PS2_DATA]
set_property PULLUP true [get_ports PS2_DATA]

#where 3.3 is the voltage provided to configuration bank 0
set_property CONFIG_VOLTAGE 3.3 [current_design]
#where value1 is either VCCO(for Vdd=3.3) or GND(for Vdd=1.8)
set_property CFGBVS VCCO [current_design]

set_property IOSTANDARD LVCMOS33 [get_ports drop_business_ticket]
set_property IOSTANDARD LVCMOS33 [get_ports drop_general_ticket]
set_property PACKAGE_PIN U16 [get_ports drop_business_ticket]
set_property PACKAGE_PIN E19 [get_ports drop_general_ticket]
