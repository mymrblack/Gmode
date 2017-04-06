#JD1_P
set_property PACKAGE_PIN V7 [get_ports {raster_a}]
set_property IOSTANDARD LVCMOS33 [get_ports {raster_a}]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets raster_a_IBUF]

#JD1_N
set_property PACKAGE_PIN W7  [get_ports {raster_b}]
set_property IOSTANDARD LVCMOS33 [get_ports {raster_b}]

#JD2_P
set_property PACKAGE_PIN V5  [get_ports {raster_z}]
set_property IOSTANDARD LVCMOS33 [get_ports {raster_z}]

#JD3_P
set_property PACKAGE_PIN W6  [get_ports {pos_pwm}]
set_property IOSTANDARD LVCMOS33 [get_ports {pos_pwm}]

#JD3_N
set_property PACKAGE_PIN  W5  [get_ports {dir}]
set_property IOSTANDARD LVCMOS33 [get_ports {dir}]