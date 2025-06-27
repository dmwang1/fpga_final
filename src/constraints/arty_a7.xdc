## Clock signal 100MHz
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}]

## Switches
set_property -dict { PACKAGE_PIN A8    IOSTANDARD LVCMOS33 } [get_ports { sw[0] }]
set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVCMOS33 } [get_ports { sw[1] }]
set_property -dict { PACKAGE_PIN C10   IOSTANDARD LVCMOS33 } [get_ports { sw[2] }]
set_property -dict { PACKAGE_PIN A10   IOSTANDARD LVCMOS33 } [get_ports { sw[3] }]

## LEDs - YOUR WORKING VERSION - KEEP THESE ACTIVE
set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { led[0] }]
set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { led[1] }]
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { led[2] }]
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { led[3] }]

## Reset button
set_property -dict { PACKAGE_PIN C12   IOSTANDARD LVCMOS33 } [get_ports { rst_n }]

## ============================================================================
## FUTURE OPTIONS - UNCOMMENT WHEN NEEDED
## ============================================================================

## RGB LEDs (uncomment these 4 lines and comment out LEDs above to use RGB)
# set_property -dict { PACKAGE_PIN G6    IOSTANDARD LVCMOS33 } [get_ports { led[0] }]  # RGB0_Red
# set_property -dict { PACKAGE_PIN F6    IOSTANDARD LVCMOS33 } [get_ports { led[1] }]  # RGB0_Green
# set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { led[2] }]  # RGB0_Blue
# set_property -dict { PACKAGE_PIN G3    IOSTANDARD LVCMOS33 } [get_ports { led[3] }]  # RGB1_Red

## Additional Buttons (if you need more buttons in future)
# set_property -dict { PACKAGE_PIN D9    IOSTANDARD LVCMOS33 } [get_ports { btn[0] }]
# set_property -dict { PACKAGE_PIN C9    IOSTANDARD LVCMOS33 } [get_ports { btn[1] }]
# set_property -dict { PACKAGE_PIN B9    IOSTANDARD LVCMOS33 } [get_ports { btn[2] }]
# set_property -dict { PACKAGE_PIN B8    IOSTANDARD LVCMOS33 } [get_ports { btn[3] }]

## UART (for serial communication)
# set_property -dict { PACKAGE_PIN D10   IOSTANDARD LVCMOS33 } [get_ports { uart_txd }]
# set_property -dict { PACKAGE_PIN A9    IOSTANDARD LVCMOS33 } [get_ports { uart_rxd }]

## All 6 RGB LED colors (if you want more colorful displays)
# set_property -dict { PACKAGE_PIN G6    IOSTANDARD LVCMOS33 } [get_ports { rgb0_red }]
# set_property -dict { PACKAGE_PIN F6    IOSTANDARD LVCMOS33 } [get_ports { rgb0_green }]
# set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { rgb0_blue }]
# set_property -dict { PACKAGE_PIN G3    IOSTANDARD LVCMOS33 } [get_ports { rgb1_red }]
# set_property -dict { PACKAGE_PIN J4    IOSTANDARD LVCMOS33 } [get_ports { rgb1_green }]
# set_property -dict { PACKAGE_PIN G4    IOSTANDARD LVCMOS33 } [get_ports { rgb1_blue }]