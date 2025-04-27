# Nexys A7 Pin Constraints

# 7 segment display
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]

set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]

set_property PACKAGE_PIN K13 [get_ports {seg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]

set_property PACKAGE_PIN K16 [get_ports {seg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]

set_property PACKAGE_PIN R10 [get_ports {seg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]

set_property PACKAGE_PIN T10 [get_ports {seg[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]


set_property PACKAGE_PIN U13 [get_ports {an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]

set_property PACKAGE_PIN K2 [get_ports {an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]

set_property PACKAGE_PIN T14 [get_ports {an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]

set_property PACKAGE_PIN P14 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {an[4]}]

set_property IOSTANDARD LVCMOS33 [get_ports {an[5]}]

set_property IOSTANDARD LVCMOS33 [get_ports {an[6]}]

set_property IOSTANDARD LVCMOS33 [get_ports {an[7]}]

# Buttons
set_property PACKAGE_PIN N17 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]






# Clock signal
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

# Switches
set_property PACKAGE_PIN J15 [get_ports {a[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[0]}]

set_property PACKAGE_PIN L16 [get_ports {a[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[1]}]

set_property PACKAGE_PIN M13 [get_ports {a[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[2]}]

set_property PACKAGE_PIN R15 [get_ports {a[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[3]}]

set_property PACKAGE_PIN R17 [get_ports {a[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[4]}]

set_property PACKAGE_PIN T18 [get_ports {a[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[5]}]

set_property PACKAGE_PIN U18 [get_ports {a[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[6]}]

set_property PACKAGE_PIN R13 [get_ports {a[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[7]}]

set_property PACKAGE_PIN T8 [get_ports {b[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {b[0]}]

set_property PACKAGE_PIN U8 [get_ports {b[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {b[1]}]

set_property PACKAGE_PIN R16 [get_ports {b[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[2]}]

set_property PACKAGE_PIN T13 [get_ports {b[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[3]}]

set_property PACKAGE_PIN H6 [get_ports {b[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[4]}]

set_property PACKAGE_PIN U12 [get_ports {b[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[5]}]

set_property PACKAGE_PIN U11 [get_ports {b[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[6]}]

set_property PACKAGE_PIN V10 [get_ports {b[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports start]
set_property PACKAGE_PIN P18 [get_ports start]

set_property PACKAGE_PIN P15 [get_ports {seg[4]}]
set_property PACKAGE_PIN T11 [get_ports {seg[5]}]
set_property PACKAGE_PIN L18 [get_ports {seg[6]}]

set_property PACKAGE_PIN J14 [get_ports {an[4]}]
set_property PACKAGE_PIN T9 [get_ports {an[5]}]
set_property PACKAGE_PIN J18 [get_ports {an[6]}]
set_property PACKAGE_PIN J17 [get_ports {an[7]}]
