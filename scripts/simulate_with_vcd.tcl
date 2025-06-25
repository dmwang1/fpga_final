catch {close_sim -quiet}
catch {close_project -quiet}

# Remove old simulation directory
set sim_dir "../sim_vcd"
if {[file exists $sim_dir]} {
    puts "Cleaning up existing simulation..."
    catch {file delete -force $sim_dir}
    after 1000
}

# Ensure output directory exists
if {![file exists ../output]} {
    file mkdir ../output
}

# Get testbench name from command line
if {$argc >= 1} {
    set testbench [lindex $argv 0]
} else {
    set testbench "tb_top"  
}

# Create simulation project
create_project -force sim_vcd_project $sim_dir -part xc7a100tcsg324-1

# Add source files to the project and CHANGE V OR SV AS NEEDED
# add_files -fileset sources_1 [glob ../src/hdl/*.v]
add_files -fileset sources_1 [glob ../src/hdl/*.sv]
add_files -fileset sim_1 [glob ../src/testbench/*.sv]

# Set simulation properties (FIXED: Use variable instead of hardcoded)
set_property top $testbench [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]

# Update compile order
update_compile_order -fileset sim_1

puts "Launching simulation for testbench: $testbench"
launch_simulation

puts "Starting VCD capture from clean state..."

# First restart simulation to clean state
restart

# Set up VCD logging with absolute path
set vcd_path [file normalize "../output/waves.vcd"]
puts "VCD file will be saved to: $vcd_path"

open_vcd $vcd_path
# FIXED: Use variable instead of hardcoded path
log_vcd [get_objects -recursive /$testbench/*]

puts "Running simulation for 1000ns..."
run 1000ns

puts "Closing VCD file..."
close_vcd

puts "Simulation complete!"
puts "VCD file saved to: $vcd_path"
puts "Transfer this file to your RPi4 and view with: gtkwave waves.vcd"