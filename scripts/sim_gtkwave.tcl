# Simulation script that generates VCD for GTKWave
# Place this file in your scripts/ directory

set top_module "top"
set testbench "tb_top"

puts "Starting simulation for GTKWave..."

# Clean up
catch {close_sim -quiet}
catch {close_project -quiet}

set sim_dir "../sim_gtk"
if {[file exists $sim_dir]} {
    file delete -force $sim_dir
}

# Create simulation project
create_project -force sim_gtk $sim_dir -part xc7a100tcsg324-1

# Add files
add_files -fileset sources_1 [glob -nocomplain ../src/hdl/*.v]
add_files -fileset sources_1 [glob -nocomplain ../src/hdl/*.sv]
add_files -fileset sim_1 [glob -nocomplain ../src/testbench/*.v]

# Set simulation properties
set_property top $testbench [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1

# Launch simulation
launch_simulation

# Run simulation
puts "Running simulation..."
run 1000ns

# Export VCD file for GTKWave
puts "Exporting VCD file for GTKWave..."
set vcd_file "../output/simulation.vcd"
file mkdir ../output

# Open VCD file for writing
open_vcd $vcd_file

# Log all signals
log_vcd [get_objects -recursive]

# Restart and run again to capture all data
restart
run 1000ns

# Close VCD file
close_vcd

puts "VCD file created: $vcd_file"
puts "You can now view with: gtkwave $vcd_file"

# Close simulation
close_sim
close_project