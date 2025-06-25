@"
set testbench "tb_top_vcd"
catch {close_sim -quiet}
catch {close_project -quiet}
create_project -force sim_vcd ../sim_vcd -part xc7a100tcsg324-1
add_files -fileset sources_1 [glob ../src/hdl/*.v]
add_files -fileset sim_1 ../src/testbench/tb_top_vcd.v
set_property top `$testbench [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation
run 1000ns
close_sim
close_project
"@ > scripts/sim_simple.tcl