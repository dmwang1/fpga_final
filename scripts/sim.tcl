# Simple simulation script with automatic waveform viewing
# Usage: vivado -mode gui -source sim.tcl
# This will open Vivado with simulation and waves automatically loaded

# Configuration - MODIFY FOR YOUR PROJECT
set top_module "top"
set testbench "tb_top"

puts "Starting simulation for $testbench..."

# Clean up any existing simulation
catch {close_sim -quiet}
catch {close_project -quiet}

# Remove old simulation directory
set sim_dir "../sim_auto"
if {[file exists $sim_dir]} {
    puts "Cleaning up existing simulation..."
    file delete -force $sim_dir
}

# Create simulation project
create_project -force sim_auto $sim_dir -part xc7a100tcsg324-1

# Add source files
add_files -fileset sources_1 [glob -nocomplain ../src/hdl/*.v]
add_files -fileset sources_1 [glob -nocomplain ../src/hdl/*.sv]
add_files -fileset sim_1 [glob -nocomplain ../src/testbench/*.v]

# Set simulation properties
set_property top $testbench [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1

puts "Launching simulation..."
launch_simulation

# Add all signals automatically (only works in GUI mode)
if {[string compare [get_property MODE [current_project]] "GUI"] == 0} {
    add_wave -recursive /$testbench
    # Run simulation (adjust time as needed)
    puts "Running simulation for 1000ns..."
    run 1000ns
    # Auto-zoom to fit
    wave zoom full
} else {
    # In batch mode, just run simulation
    puts "Running simulation for 1000ns..."
    run 1000ns
    puts "Simulation complete - no waves in batch mode"
}

puts "Simulation complete!"
puts "Waveform viewer should be open."
puts "Close Vivado when done viewing waveforms."