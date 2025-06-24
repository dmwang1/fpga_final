# Clean up any existing simulation
catch {close_sim -quiet}
catch {close_project -quiet}

# Remove old simulation directory to avoid file locks
set sim_dir "../sim_terminal"
if {[file exists $sim_dir]} {
    puts "Cleaning up existing simulation..."
    catch {file delete -force $sim_dir}
    after 1000
}

# Create simulation project
create_project -force sim_project_terminal $sim_dir -part xc7a100tcsg324-1

# Add source files
add_files -fileset sources_1 [glob ../src/hdl/*.v]
add_files -fileset sim_1 ../src/testbench/tb_top.v

# Set simulation properties
set_property top tb_top [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1

puts "Launching simulation..."
launch_simulation

puts "Adding waveforms..."
# Add signals to waveform
add_wave -divider "Clock and Reset"
add_wave /tb_top/clk
add_wave /tb_top/rst_n

add_wave -divider "Test Signals"  
add_wave /tb_top/sw
add_wave /tb_top/led

# Run simulation
puts "Running simulation for 1000ns..."
run 1000ns

# Zoom to show all data
wave zoom full

puts "Simulation complete!"
puts "Waveform viewer should be open."
puts "Clock should toggle every 5ns (10ns period)"

# Keep the simulation open
puts "Press Ctrl+C to close when done viewing waveforms."