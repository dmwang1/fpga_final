# Synthesis-only script for quick checks
set part "xc7a100tcsg324-1"
set top_module "top"

read_verilog [glob ../src/hdl/*.v]
read_xdc [glob ../src/constraints/*.xdc]
set_property top $top_module [current_fileset]

synth_design -top $top_module -part $part

# Quick reports
report_utilization
report_timing -max_paths 10