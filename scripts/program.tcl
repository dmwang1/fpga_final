# Program Arty A7 board
puts "Opening hardware manager..."
open_hw_manager
connect_hw_server

puts "Opening hardware target..."
open_hw_target

# Find the FPGA device
set device [lindex [get_hw_devices] 0]
puts "Found device: $device"

# Set bitstream file
set_property PROGRAM.FILE {../output/top.bit} $device

puts "Programming device..."
program_hw_devices $device

puts "Programming complete!"
close_hw_manager