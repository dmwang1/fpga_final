# Synthesis-only script for quick checks
# Usage: vivado -mode batch -source synth_only.tcl -tclargs top_clkgen

# Module selection
if {$argc >= 1} {
    set top_module [lindex $argv 0]
} else {
    set top_module "top"  # default
}

set part "xc7a100tcsg324-1"

puts "Synthesizing module: $top_module"

# Read all source files (both .v and .sv)
# read_verilog [glob -nocomplain ../src/hdl/*.v]
read_verilog [glob -nocomplain ../src/hdl/*.sv]
read_xdc [glob ../src/constraints/*.xdc]

set_property top $top_module [current_fileset]

puts "Starting synthesis..."
synth_design -top $top_module -part $part

puts "Synthesis complete!"
puts "Generating quick reports..."

# Quick reports
report_utilization
report_timing -max_paths 10

puts "Check complete for module: $top_module"