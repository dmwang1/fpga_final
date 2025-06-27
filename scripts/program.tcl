# Program Arty A7 board
# Usage: vivado -mode batch -source program.tcl -tclargs top_clkgen

# Module selection for bitstream file
if {$argc >= 1} {
    set top_module [lindex $argv 0]
} else {
    set top_module "top"  
}

set bitstream_file "../output/${top_module}.bit"

puts "Programming with bitstream: $bitstream_file"

# Check if bitstream exists
if {![file exists $bitstream_file]} {
    puts "ERROR: Bitstream file not found: $bitstream_file"
    puts "Run full build first with: vivado -mode batch -source build.tcl -tclargs $top_module"
    exit 1
}

puts "Opening hardware manager..."
open_hw_manager
connect_hw_server

puts "Opening hardware target..."
open_hw_target

# Find the FPGA device
set device [lindex [get_hw_devices] 0]
puts "Found device: $device"

# Set bitstream file
set_property PROGRAM.FILE $bitstream_file $device

puts "Programming device with $top_module..."
program_hw_devices $device

puts "Programming complete!"
close_hw_manager