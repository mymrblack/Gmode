
#JA4 
set_property PACKAGE_PIN AA9  [get_ports {sig_in}]
set_property IOSTANDARD LVCMOS33 [get_ports {sig_in}]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets sig_in_IBUF]

#JA2
set_property PACKAGE_PIN AA11  [get_ports {B}]
set_property IOSTANDARD LVCMOS33 [get_ports {B}]

#JA3
set_property PACKAGE_PIN Y10  [get_ports {clr}]
set_property IOSTANDARD LVCMOS33 [get_ports {clr}]

#JA1
set_property PACKAGE_PIN Y11  [get_ports {pwmo}]
set_property IOSTANDARD LVCMOS33 [get_ports {pwmo}]

#JA7
set_property PACKAGE_PIN  AB11  [get_ports {pwmd}]
set_property IOSTANDARD LVCMOS33 [get_ports {pwmd}]
