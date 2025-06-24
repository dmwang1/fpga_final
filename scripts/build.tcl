# Non-project mode build script for my_arty_project
set_param general.maxThreads 8

# Set part
set part "xc7a100tcsg324-1"
set top_module "top"

# Clean any previous run
if {[file exists ../output]} {
    file delete -force ../output
}
file mkdir ../output

# Read source files
puts "Reading source files..."
read_verilog [glob ../src/hdl/*.v]
read_xdc [glob ../src/constraints/*.xdc]

# Set top module
set_property top $top_module [current_fileset]

puts "Starting synthesis..."
synth_design -top $top_module -part $part

# Write checkpoint
write_checkpoint -force ../output/post_synth.dcp

puts "Starting implementation..."
opt_design
place_design
route_design

# Write final checkpoint
write_checkpoint -force ../output/post_route.dcp

puts "Generating bitstream..."
write_bitstream -force ../output/${top_module}.bit

# Generate reports
puts "Generating reports..."
report_utilization -file ../output/utilization.rpt
report_timing -file ../output/timing.rpt
report_power -file ../output/power.rpt

puts "Build complete! Bitstream: ../output/${top_module}.bit"