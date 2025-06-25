# Direct XSim simulation approach (no Vivado project needed)
# This runs XSim directly from command line

# Ensure output directory exists
if {![file exists ../output]} {
    file mkdir ../output
}

puts "Compiling Verilog files with XVlog..."

# Compile the design files using xvlog
exec xvlog ../src/hdl/top.v
exec xvlog ../src/testbench/tb_top.v

puts "Elaborating design with XElab..."

# Elaborate the design
exec xelab -debug typical tb_top -s tb_top_sim

puts "Running simulation with XSim..."

# Create XSim command file
set cmd_file "../output/xsim_commands.tcl"
set fp [open $cmd_file w]
puts $fp "open_vcd ../output/waves.vcd"
puts $fp "log_vcd \[get_objects -recursive /tb_top/*\]"
puts $fp "run 1000ns"
puts $fp "close_vcd"
puts $fp "exit"
close $fp

# Run XSim with the command file
exec xsim tb_top_sim -t $cmd_file

puts "Simulation complete!"
puts "VCD file: ../output/waves.vcd"