# Non-project mode build script for my_arty_project
set_param general.maxThreads 8

# Set part and top module
set part "xc7a100tcsg324-1"

# Get top module from command line argument
if {$argc >= 1} {
    set top_module [lindex $argv 0]
} else {
    set top_module "top_clkgen"  # Default fallback
}   

# Clean any previous run
if {[file exists ../output]} {
    file delete -force ../output
}
file mkdir ../output

# IP files (comment out if no IP used)
# read_ip [glob -nocomplain ../src/ip/*/*.xci]
# upgrade_ip [get_ips]
# generate_target all [get_ips]

# Read source files .... comment either v or sv 
puts "Reading source files..."
# add_files [glob ../src/hdl/*.v]
add_files [glob ../src/hdl/*.sv]

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