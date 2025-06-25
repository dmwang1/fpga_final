Project Tree:
```
├── .gitignore
├── .vscode/
│   └── tasks.json
├── README.md
├── dfx_runtime.txt
├── scripts/
│   ├── .Xil/
│   │   └── top_propImpl.xdc
│   ├── build.tcl
│   ├── clean.tcl
│   ├── dfx_runtime.txt
│   ├── program.tcl
│   ├── sim.tcl
│   ├── sim_gtkwave.tcl
│   ├── simulate_terminal.tcl
│   ├── simulate_with_vcd.tcl
│   ├── synth_only.tcl
│   ├── xelab.pb
│   └── xsim_batch.tcl
├── sim_auto/
│   └── sim_auto.xpr
├── sim_gtk/
│   └── sim_gtk.xpr
├── sim_vcd/
│   └── sim_vcd_project.xpr
└── src/
    ├── constraints/
    │   └── arty_a7.xdc
    ├── hdl/
    │   ├── data_acq_top.sv
    │   └── top.v
    └── testbench/
        └── tb_top.v
```

# File: .gitignore
```text
﻿# Vivado generated files
*.jou
*.log
*.str
*.xpr.bak
vivado.jou
vivado.log
*.cache/
*.hw/
*.ip_user_files/
*.runs/
*.sim/
*.srcs/sources_1/ip/*/
*.gen/
*.hbs
*.dcp
*.bit
*.ltx
*.rpt
*.xml
*.tmp
*.debug
*.wdb
*.wcfg

# Output directory
output/

# OS files
Thumbs.db
.DS_Store
*.tmp
*~

# Keep these files
!*.xdc
!*.v
!*.vhd
!*.sv
!*.tcl
!*.md
```
# End of file: .gitignore

# File: .vscode/tasks.json
```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "FPGA: Full Build",
            "type": "shell",
            "command": "C:\\Xilinx\\2025.1\\Vivado\\bin\\vivado.bat",
            "args": ["-mode", "batch", "-source", "build.tcl"],
            "options": {
                "cwd": "${workspaceFolder}/scripts"
            },
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "presentation": {
                "echo": true,
                "reveal": "always",
                "focus": false,
                "panel": "shared",
                "showReuseMessage": true,
                "clear": false
            },
            "problemMatcher": []
        },
        {
            "label": "FPGA: Synthesis Only",
            "type": "shell",
            "command": "C:\\Xilinx\\2025.1\\Vivado\\bin\\vivado.bat",
            "args": ["-mode", "batch", "-source", "synth_only.tcl"],
            "options": {
                "cwd": "${workspaceFolder}/scripts"
            },
            "group": "build"
        },
        {
            "label": "FPGA: Program Device",
            "type": "shell",
            "command": "C:\\Xilinx\\2025.1\\Vivado\\bin\\vivado.bat",
            "args": ["-mode", "batch", "-source", "program.tcl"],
            "options": {
                "cwd": "${workspaceFolder}/scripts"
            }
        }
    ]
}
```
# End of file: .vscode/tasks.json

# File: README.md
```markdown
﻿# my_arty_project

FPGA project for Arty A7-100T board using Vivado non-project mode workflow.

## Project Structure
- src/hdl/ - Verilog source files
- src/constraints/ - XDC constraint files  
- scripts/ - TCL build scripts
- output/ - Generated bitstreams and reports (ignored by git)

## Quick Start

1. **Open in VSCode**: Open this folder in VSCode
2. **Build**: Press Ctrl+Shift+P â†’ "Tasks: Run Task" â†’ "FPGA: Full Build"  
3. **Program**: Run task "FPGA: Program Device"

## Command Line Usage

`ash
cd scripts

# Full build (synthesis + implementation + bitstream)
vivado -mode batch -source build.tcl

# Synthesis only (for quick checks)
vivado -mode batch -source synth_only.tcl

# Program the device
vivado -mode batch -source program.tcl
`

## Development Workflow

1. Edit Verilog files in src/hdl/
2. Modify constraints in src/constraints/ 
3. Run synthesis to check for errors
4. Run full build when ready
5. Program device and test
6. Commit changes to git

## Files

- **Top Module**: $TopModule.v
- **Constraints**: rty_a7.xdc 
- **Target Device**: xc7a100tcsg324-1

Built with Vivado non-project mode for clean version control.


## in vscode terminal working
& "C:\Xilinx\2025.1\Vivado\bin\vivado.bat" -mode batch -source build.tcl

& "C:\Xilinx\2025.1\Vivado\bin\vivado.bat" -mode batch -source program.tcl

## working in gui
source build.tcl
source program.tcl

get_ports
get_ports led*

# Check if constraints were applied
get_pins -of_objects [get_ports led*]

& "C:\Xilinx\2025.1\Vivado\bin\vivado.bat" -mode batch -source simulate.tcl

ssh -X dwang@100.93.4.75

# wave process from rpi:

vivado -mode batch -source simulate_with_vcd.tcl
scp "C:/Users/dwang/Documents/fpga_dev/my_arty_project/output/waves.vcd" tripod@100.81.165.41:/home/tripod/Desktop/
# On RPi4
cd ~/Desktop
gtkwave waves.vcd




Solution 4: Simplified Approach
Since your GUI simulation works, just open Vivado GUI and run:
powershell# Open Vivado GUI, then in Tcl Console:
& "C:\Xilinx\2025.1\Vivado\bin\vivado.bat" -mode gui
Then in GUI Tcl Console:
tclcd C:/Users/dwang/Documents/fpga_dev/my_arty_project/scripts
source simulate_terminal.tcl
```
# End of file: README.md

# File: dfx_runtime.txt
```text
DFXRuntime Profile Report:
Total Application(DFX) Runtime :                  CPU : 0:0:6 WALL : 0:0:0  0.00 % 
```
# End of file: dfx_runtime.txt

# File: scripts/.Xil/top_propImpl.xdc
```text
set_property SRC_FILE_INFO {cfile:C:/Users/dwang/Documents/fpga_dev/my_arty_project/src/constraints/arty_a7.xdc rfile:../../src/constraints/arty_a7.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }]
set_property src_info {type:XDC file:1 line:6 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A8    IOSTANDARD LVCMOS33 } [get_ports { sw[0] }]
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVCMOS33 } [get_ports { sw[1] }]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C10   IOSTANDARD LVCMOS33 } [get_ports { sw[2] }]
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A10   IOSTANDARD LVCMOS33 } [get_ports { sw[3] }]
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { led[0] }]
set_property src_info {type:XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { led[1] }]
set_property src_info {type:XDC file:1 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { led[2] }]
set_property src_info {type:XDC file:1 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { led[3] }]
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C12   IOSTANDARD LVCMOS33 } [get_ports { rst_n }]
```
# End of file: scripts/.Xil/top_propImpl.xdc

# File: scripts/build.tcl
```text
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
```
# End of file: scripts/build.tcl

# File: scripts/clean.tcl
```text
# Clean script for data acquisition project
puts "Cleaning project files..."

# Remove output directory
if {[file exists ../output]} {
    puts "Removing output directory..."
    file delete -force ../output
}

# Remove simulation directories
if {[file exists ../sim/work]} {
    puts "Removing simulation work directory..."
    file delete -force ../sim/work
}

if {[file exists ../sim_terminal]} {
    puts "Removing terminal simulation directory..."
    file delete -force ../sim_terminal
}

if {[file exists ../sim]} {
    # Remove simulation generated files but keep source
    foreach pattern {transcript vsim.wlf modelsim.ini *.vstf *.wdb *.wcfg} {
        set files [glob -nocomplain ../sim/$pattern]
        foreach file $files {
            if {[file exists $file]} {
                puts "Removing $file"
                file delete -force $file
            }
        }
    }
}

# Clean Xilinx generated files in scripts directory
if {[file exists .Xil]} {
    puts "Removing .Xil directory..."
    file delete -force .Xil
}

# Remove individual generated files in scripts (skip files in use)
foreach file {clockInfo.txt dfx_runtime.txt} {
    if {[file exists $file]} {
        puts "Removing $file"
        file delete -force $file
    }
}

# Try to remove log files (may fail if Vivado is using them - that's OK)
foreach file {vivado.jou vivado.log} {
    if {[file exists $file]} {
        puts "Attempting to remove $file"
        if {[catch {file delete -force $file} error]} {
            puts "  Note: $file is in use by Vivado (this is normal)"
        } else {
            puts "  Successfully removed $file"
        }
    }
}

# Remove any checkpoint files in project root
set checkpoint_files [glob -nocomplain ../*.dcp]
foreach file $checkpoint_files {
    puts "Removing checkpoint: $file"
    file delete -force $file
}

# Remove any log files in project root
set log_files [glob -nocomplain ../*.log]
foreach file $log_files {
    puts "Removing log: $file"
    file delete -force $file
}

puts "Clean complete!"
puts "All generated files have been removed."
puts "Source files and constraints are preserved."
```
# End of file: scripts/clean.tcl

# File: scripts/dfx_runtime.txt
```text
DFXRuntime Profile Report:
Total Application(DFX) Runtime :                  CPU : 0:0:9 WALL : 0:0:0  0.00 % 
```
# End of file: scripts/dfx_runtime.txt

# File: scripts/program.tcl
```text
# Program Arty A7 board
puts "Opening hardware manager..."
open_hw_manager
connect_hw_server

puts "Opening hardware target..."
open_hw_target

# Find the FPGA device
set device [lindex [get_hw_devices] 0]
puts "Found device: $device"

# Set bitstream file
set_property PROGRAM.FILE {../output/top.bit} $device

puts "Programming device..."
program_hw_devices $device

puts "Programming complete!"
close_hw_manager
```
# End of file: scripts/program.tcl

# File: scripts/sim.tcl
```text
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
```
# End of file: scripts/sim.tcl

# File: scripts/sim_gtkwave.tcl
```text
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
```
# End of file: scripts/sim_gtkwave.tcl

# File: scripts/simulate_terminal.tcl
```text
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
```
# End of file: scripts/simulate_terminal.tcl

# File: scripts/simulate_with_vcd.tcl
```text
# Clean simulation script with proper VCD generation
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

# Create simulation project
create_project -force sim_vcd_project $sim_dir -part xc7a100tcsg324-1

# Add source files to the project
add_files -fileset sources_1 [glob ../src/hdl/*.v]
add_files -fileset sim_1 [glob ../src/testbench/*.v]

# Set simulation properties
set_property top tb_top [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]

# Update compile order
update_compile_order -fileset sim_1

puts "Launching simulation..."
launch_simulation

puts "Starting VCD capture from clean state..."

# First restart simulation to clean state
restart

# Set up VCD logging with absolute path
set vcd_path [file normalize "../output/waves.vcd"]
puts "VCD file will be saved to: $vcd_path"

open_vcd $vcd_path
log_vcd [get_objects -recursive /tb_top/*]

puts "Running simulation for 1000ns..."
run 1000ns

puts "Closing VCD file..."
close_vcd

puts "Simulation complete!"
puts "VCD file saved to: $vcd_path"
puts "Transfer this file to your RPi4 and view with: gtkwave waves.vcd"
```
# End of file: scripts/simulate_with_vcd.tcl

# File: scripts/synth_only.tcl
```text
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
```
# End of file: scripts/synth_only.tcl

# File: scripts/xelab.pb
```text

M
%s %s
410*	simulator2
Vivado Simulator2
	v2025.1.0Z43-3977hpx�
�
%s
*	simulator2}
{Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.hpx�
�
Running: %s
333*	simulator2`
^C:\Xilinx\2025.1\Vivado\bin\unwrapped\win64.o\xelab.exe -debug typical tb_top -s sim_snapshot Z43-3449hpx�
Z
.Multi-threading is on. Using %s slave threads
406*	simulator2
10Z43-3954hpx�
�
9Can not find design unit %s in library %s located at %s 
109*	simulator2
work.tb_top2
work2

xsim.dir/workZ43-3225hpx�


End Record
```
# End of file: scripts/xelab.pb

# File: scripts/xsim_batch.tcl
```text
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
```
# End of file: scripts/xsim_batch.tcl

# File: sim_auto/sim_auto.xpr
```text
<?xml version="1.0" encoding="UTF-8"?>
<!-- Product Version: Vivado v2025.1 (64-bit)                              -->
<!--                                                                         -->
<!-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.                   -->
<!-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.   -->

<Project Product="Vivado" Version="7" Minor="70" Path="C:/Users/dwang/Documents/fpga_dev/my_arty_project/sim_auto/sim_auto.xpr">
  <DefaultLaunch Dir="$PRUNDIR"/>
  <Configuration>
    <Option Name="Id" Val="e86e9e78a9ba4e44946c69b48d4282e6"/>
    <Option Name="Part" Val="xc7a100tcsg324-1"/>
    <Option Name="CompiledLibDir" Val="$PCACHEDIR/compile_simlib"/>
    <Option Name="CompiledLibDirXSim" Val=""/>
    <Option Name="CompiledLibDirModelSim" Val="$PCACHEDIR/compile_simlib/modelsim"/>
    <Option Name="CompiledLibDirQuesta" Val="$PCACHEDIR/compile_simlib/questa"/>
    <Option Name="CompiledLibDirXcelium" Val="$PCACHEDIR/compile_simlib/xcelium"/>
    <Option Name="CompiledLibDirVCS" Val="$PCACHEDIR/compile_simlib/vcs"/>
    <Option Name="CompiledLibDirRiviera" Val="$PCACHEDIR/compile_simlib/riviera"/>
    <Option Name="CompiledLibDirActivehdl" Val="$PCACHEDIR/compile_simlib/activehdl"/>
    <Option Name="SimulatorInstallDirModelSim" Val=""/>
    <Option Name="SimulatorInstallDirQuesta" Val=""/>
    <Option Name="SimulatorInstallDirXcelium" Val=""/>
    <Option Name="SimulatorInstallDirVCS" Val=""/>
    <Option Name="SimulatorInstallDirRiviera" Val=""/>
    <Option Name="SimulatorInstallDirActiveHdl" Val=""/>
    <Option Name="SimulatorGccInstallDirModelSim" Val=""/>
    <Option Name="SimulatorGccInstallDirQuesta" Val=""/>
    <Option Name="SimulatorGccInstallDirXcelium" Val=""/>
    <Option Name="SimulatorGccInstallDirVCS" Val=""/>
    <Option Name="SimulatorGccInstallDirRiviera" Val=""/>
    <Option Name="SimulatorGccInstallDirActiveHdl" Val=""/>
    <Option Name="SimulatorVersionXsim" Val="2025.1"/>
    <Option Name="SimulatorVersionModelSim" Val="2024.3"/>
    <Option Name="SimulatorVersionQuesta" Val="2024.3_3"/>
    <Option Name="SimulatorVersionXcelium" Val="24.09.001"/>
    <Option Name="SimulatorVersionVCS" Val="W-2024.09-SP1"/>
    <Option Name="SimulatorVersionRiviera" Val="2024.10"/>
    <Option Name="SimulatorVersionActiveHdl" Val="15.0"/>
    <Option Name="SimulatorGccVersionXsim" Val="9.3.0"/>
    <Option Name="SimulatorGccVersionModelSim" Val="7.4.0"/>
    <Option Name="SimulatorGccVersionQuesta" Val="7.4.0"/>
    <Option Name="SimulatorGccVersionXcelium" Val="9.3.0"/>
    <Option Name="SimulatorGccVersionVCS" Val="9.2.0"/>
    <Option Name="SimulatorGccVersionRiviera" Val="9.3.0"/>
    <Option Name="SimulatorGccVersionActiveHdl" Val="9.3.0"/>
    <Option Name="BoardPart" Val=""/>
    <Option Name="ActiveSimSet" Val="sim_1"/>
    <Option Name="DefaultLib" Val="xil_defaultlib"/>
    <Option Name="ProjectType" Val="Default"/>
    <Option Name="IPDefaultOutputPath" Val="$PGENDIR/sources_1"/>
    <Option Name="IPCachePermission" Val="read"/>
    <Option Name="IPCachePermission" Val="write"/>
    <Option Name="EnableCoreContainer" Val="FALSE"/>
    <Option Name="EnableResourceEstimation" Val="FALSE"/>
    <Option Name="SimCompileState" Val="TRUE"/>
    <Option Name="CreateRefXciForCoreContainers" Val="FALSE"/>
    <Option Name="IPUserFilesDir" Val="$PIPUSERFILESDIR"/>
    <Option Name="IPStaticSourceDir" Val="$PIPUSERFILESDIR/ipstatic"/>
    <Option Name="EnableBDX" Val="FALSE"/>
    <Option Name="WTXSimLaunchSim" Val="1"/>
    <Option Name="WTModelSimLaunchSim" Val="0"/>
    <Option Name="WTQuestaLaunchSim" Val="0"/>
    <Option Name="WTIesLaunchSim" Val="0"/>
    <Option Name="WTVcsLaunchSim" Val="0"/>
    <Option Name="WTRivieraLaunchSim" Val="0"/>
    <Option Name="WTActivehdlLaunchSim" Val="0"/>
    <Option Name="WTXSimExportSim" Val="0"/>
    <Option Name="WTModelSimExportSim" Val="0"/>
    <Option Name="WTQuestaExportSim" Val="0"/>
    <Option Name="WTIesExportSim" Val="0"/>
    <Option Name="WTVcsExportSim" Val="0"/>
    <Option Name="WTRivieraExportSim" Val="0"/>
    <Option Name="WTActivehdlExportSim" Val="0"/>
    <Option Name="GenerateIPUpgradeLog" Val="TRUE"/>
    <Option Name="XSimRadix" Val="hex"/>
    <Option Name="XSimTimeUnit" Val="ns"/>
    <Option Name="XSimArrayDisplayLimit" Val="1024"/>
    <Option Name="XSimTraceLimit" Val="65536"/>
    <Option Name="SimTypes" Val="rtl"/>
    <Option Name="SimTypes" Val="bfm"/>
    <Option Name="SimTypes" Val="tlm"/>
    <Option Name="SimTypes" Val="tlm_dpi"/>
    <Option Name="MEMEnableMemoryMapGeneration" Val="TRUE"/>
    <Option Name="DcpsUptoDate" Val="TRUE"/>
    <Option Name="UseInlineHdlIP" Val="TRUE"/>
    <Option Name="LocalIPRepoLeafDirName" Val="ip_repo"/>
  </Configuration>
  <FileSets Version="1" Minor="32">
    <FileSet Name="sources_1" Type="DesignSrcs" RelSrcDir="$PSRCDIR/sources_1" RelGenDir="$PGENDIR/sources_1">
      <Filter Type="Srcs"/>
      <File Path="$PPRDIR/../src/hdl/top.v">
        <FileInfo>
          <Attr Name="UsedIn" Val="synthesis"/>
          <Attr Name="UsedIn" Val="implementation"/>
          <Attr Name="UsedIn" Val="simulation"/>
        </FileInfo>
      </File>
      <File Path="$PPRDIR/../src/hdl/data_acq_top.sv">
        <FileInfo>
          <Attr Name="UsedIn" Val="synthesis"/>
          <Attr Name="UsedIn" Val="implementation"/>
          <Attr Name="UsedIn" Val="simulation"/>
        </FileInfo>
      </File>
      <Config>
        <Option Name="DesignMode" Val="RTL"/>
        <Option Name="TopAutoSet" Val="TRUE"/>
      </Config>
    </FileSet>
    <FileSet Name="constrs_1" Type="Constrs" RelSrcDir="$PSRCDIR/constrs_1" RelGenDir="$PGENDIR/constrs_1">
      <Filter Type="Constrs"/>
      <Config>
        <Option Name="ConstrsType" Val="XDC"/>
      </Config>
    </FileSet>
    <FileSet Name="sim_1" Type="SimulationSrcs" RelSrcDir="$PSRCDIR/sim_1" RelGenDir="$PGENDIR/sim_1">
      <File Path="$PPRDIR/../src/testbench/tb_top.v">
        <FileInfo>
          <Attr Name="UsedIn" Val="synthesis"/>
          <Attr Name="UsedIn" Val="implementation"/>
          <Attr Name="UsedIn" Val="simulation"/>
        </FileInfo>
      </File>
      <Config>
        <Option Name="DesignMode" Val="RTL"/>
        <Option Name="TopModule" Val="tb_top"/>
        <Option Name="TopLib" Val="xil_defaultlib"/>
        <Option Name="TransportPathDelay" Val="0"/>
        <Option Name="TransportIntDelay" Val="0"/>
        <Option Name="SelectedSimModel" Val="rtl"/>
        <Option Name="PamDesignTestbench" Val=""/>
        <Option Name="PamDutBypassFile" Val="xil_dut_bypass"/>
        <Option Name="PamSignalDriverFile" Val="xil_bypass_driver"/>
        <Option Name="PamPseudoTop" Val="pseudo_tb"/>
        <Option Name="SrcSet" Val="sources_1"/>
        <Option Name="CosimPdi" Val=""/>
        <Option Name="CosimPlatform" Val=""/>
        <Option Name="CosimElf" Val=""/>
        <Option Name="Dmv" Val=""/>
      </Config>
    </FileSet>
    <FileSet Name="utils_1" Type="Utils" RelSrcDir="$PSRCDIR/utils_1" RelGenDir="$PGENDIR/utils_1">
      <Filter Type="Utils"/>
      <Config>
        <Option Name="TopAutoSet" Val="TRUE"/>
      </Config>
    </FileSet>
  </FileSets>
  <Simulators>
    <Simulator Name="XSim">
      <Option Name="Description" Val="Vivado Simulator"/>
      <Option Name="CompiledLib" Val="0"/>
    </Simulator>
    <Simulator Name="ModelSim">
      <Option Name="Description" Val="ModelSim Simulator"/>
    </Simulator>
    <Simulator Name="Questa">
      <Option Name="Description" Val="Questa Advanced Simulator"/>
    </Simulator>
    <Simulator Name="Riviera">
      <Option Name="Description" Val="Riviera-PRO Simulator"/>
    </Simulator>
    <Simulator Name="ActiveHDL">
      <Option Name="Description" Val="Active-HDL Simulator"/>
    </Simulator>
  </Simulators>
  <Runs Version="1" Minor="22">
    <Run Id="synth_1" Type="Ft3:Synth" SrcSet="sources_1" Part="xc7a100tcsg324-1" ConstrsSet="constrs_1" Description="Vivado Synthesis Defaults" AutoIncrementalCheckpoint="true" WriteIncrSynthDcp="false" State="current" IncludeInArchive="true" IsChild="false" AutoIncrementalDir="$PSRCDIR/utils_1/imports/synth_1" AutoRQSDir="$PSRCDIR/utils_1/imports/synth_1" ParallelReportGen="true">
      <Strategy Version="1" Minor="2">
        <StratHandle Name="Vivado Synthesis Defaults" Flow="Vivado Synthesis 2025">
          <Desc>Vivado Synthesis Defaults</Desc>
        </StratHandle>
        <Step Id="synth_design"/>
      </Strategy>
      <ReportStrategy Name="Vivado Synthesis Default Reports" Flow="Vivado Synthesis 2025"/>
      <Report Name="ROUTE_DESIGN.REPORT_METHODOLOGY" Enabled="1"/>
      <RQSFiles/>
    </Run>
    <Run Id="impl_1" Type="Ft2:EntireDesign" Part="xc7a100tcsg324-1" ConstrsSet="constrs_1" Description="Default settings for Implementation." AutoIncrementalCheckpoint="false" WriteIncrSynthDcp="false" State="current" SynthRun="synth_1" IncludeInArchive="true" IsChild="false" GenFullBitstream="true" AutoIncrementalDir="$PSRCDIR/utils_1/imports/impl_1" AutoRQSDir="$PSRCDIR/utils_1/imports/impl_1" ParallelReportGen="true">
      <Strategy Version="1" Minor="2">
        <StratHandle Name="Vivado Implementation Defaults" Flow="Vivado Implementation 2025">
          <Desc>Default settings for Implementation.</Desc>
        </StratHandle>
        <Step Id="init_design"/>
        <Step Id="opt_design"/>
        <Step Id="power_opt_design"/>
        <Step Id="place_design"/>
        <Step Id="post_place_power_opt_design"/>
        <Step Id="phys_opt_design"/>
        <Step Id="route_design"/>
        <Step Id="post_route_phys_opt_design"/>
        <Step Id="write_bitstream"/>
      </Strategy>
      <ReportStrategy Name="Vivado Implementation Default Reports" Flow="Vivado Implementation 2025"/>
      <Report Name="ROUTE_DESIGN.REPORT_METHODOLOGY" Enabled="1"/>
      <RQSFiles/>
    </Run>
  </Runs>
  <Board/>
  <DashboardSummary Version="1" Minor="0">
    <Dashboards>
      <Dashboard Name="default_dashboard">
        <Gadgets>
          <Gadget Name="drc_1" Type="drc" Version="1" Row="2" Column="0">
            <GadgetParam Name="REPORTS" Type="string_list" Value="impl_1#impl_1_route_report_drc_0 "/>
          </Gadget>
          <Gadget Name="methodology_1" Type="methodology" Version="1" Row="2" Column="1">
            <GadgetParam Name="REPORTS" Type="string_list" Value="impl_1#impl_1_route_report_methodology_0 "/>
          </Gadget>
          <Gadget Name="power_1" Type="power" Version="1" Row="1" Column="0">
            <GadgetParam Name="REPORTS" Type="string_list" Value="impl_1#impl_1_route_report_power_0 "/>
          </Gadget>
          <Gadget Name="timing_1" Type="timing" Version="1" Row="0" Column="1">
            <GadgetParam Name="REPORTS" Type="string_list" Value="impl_1#impl_1_route_report_timing_summary_0 "/>
          </Gadget>
          <Gadget Name="utilization_1" Type="utilization" Version="1" Row="0" Column="0">
            <GadgetParam Name="REPORTS" Type="string_list" Value="synth_1#synth_1_synth_report_utilization_0 "/>
            <GadgetParam Name="RUN.STEP" Type="string" Value="synth_design"/>
            <GadgetParam Name="RUN.TYPE" Type="string" Value="synthesis"/>
          </Gadget>
          <Gadget Name="utilization_2" Type="utilization" Version="1" Row="1" Column="1">
            <GadgetParam Name="REPORTS" Type="string_list" Value="impl_1#impl_1_place_report_utilization_0 "/>
          </Gadget>
        </Gadgets>
      </Dashboard>
      <CurrentDashboard>default_dashboard</CurrentDashboard>
    </Dashboards>
  </DashboardSummary>
</Project>
```
# End of file: sim_auto/sim_auto.xpr

# File: sim_gtk/sim_gtk.xpr
```text
<?xml version="1.0" encoding="UTF-8"?>
<!-- Product Version: Vivado v2025.1 (64-bit)                              -->
<!--                                                                         -->
<!-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.                   -->
<!-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.   -->

<Project Product="Vivado" Version="7" Minor="70" Path="C:/Users/dwang/Documents/fpga_dev/my_arty_project/sim_gtk/sim_gtk.xpr">
  <DefaultLaunch Dir="$PRUNDIR"/>
  <Configuration>
    <Option Name="Id" Val="72fac0b2f0f04427903523e164c8d3d2"/>
    <Option Name="Part" Val="xc7a100tcsg324-1"/>
    <Option Name="CompiledLibDir" Val="$PCACHEDIR/compile_simlib"/>
    <Option Name="CompiledLibDirXSim" Val=""/>
    <Option Name="CompiledLibDirModelSim" Val="$PCACHEDIR/compile_simlib/modelsim"/>
    <Option Name="CompiledLibDirQuesta" Val="$PCACHEDIR/compile_simlib/questa"/>
    <Option Name="CompiledLibDirXcelium" Val="$PCACHEDIR/compile_simlib/xcelium"/>
    <Option Name="CompiledLibDirVCS" Val="$PCACHEDIR/compile_simlib/vcs"/>
    <Option Name="CompiledLibDirRiviera" Val="$PCACHEDIR/compile_simlib/riviera"/>
    <Option Name="CompiledLibDirActivehdl" Val="$PCACHEDIR/compile_simlib/activehdl"/>
    <Option Name="SimulatorInstallDirModelSim" Val=""/>
    <Option Name="SimulatorInstallDirQuesta" Val=""/>
    <Option Name="SimulatorInstallDirXcelium" Val=""/>
    <Option Name="SimulatorInstallDirVCS" Val=""/>
    <Option Name="SimulatorInstallDirRiviera" Val=""/>
    <Option Name="SimulatorInstallDirActiveHdl" Val=""/>
    <Option Name="SimulatorGccInstallDirModelSim" Val=""/>
    <Option Name="SimulatorGccInstallDirQuesta" Val=""/>
    <Option Name="SimulatorGccInstallDirXcelium" Val=""/>
    <Option Name="SimulatorGccInstallDirVCS" Val=""/>
    <Option Name="SimulatorGccInstallDirRiviera" Val=""/>
    <Option Name="SimulatorGccInstallDirActiveHdl" Val=""/>
    <Option Name="SimulatorVersionXsim" Val="2025.1"/>
    <Option Name="SimulatorVersionModelSim" Val="2024.3"/>
    <Option Name="SimulatorVersionQuesta" Val="2024.3_3"/>
    <Option Name="SimulatorVersionXcelium" Val="24.09.001"/>
    <Option Name="SimulatorVersionVCS" Val="W-2024.09-SP1"/>
    <Option Name="SimulatorVersionRiviera" Val="2024.10"/>
    <Option Name="SimulatorVersionActiveHdl" Val="15.0"/>
    <Option Name="SimulatorGccVersionXsim" Val="9.3.0"/>
    <Option Name="SimulatorGccVersionModelSim" Val="7.4.0"/>
    <Option Name="SimulatorGccVersionQuesta" Val="7.4.0"/>
    <Option Name="SimulatorGccVersionXcelium" Val="9.3.0"/>
    <Option Name="SimulatorGccVersionVCS" Val="9.2.0"/>
    <Option Name="SimulatorGccVersionRiviera" Val="9.3.0"/>
    <Option Name="SimulatorGccVersionActiveHdl" Val="9.3.0"/>
    <Option Name="BoardPart" Val=""/>
    <Option Name="ActiveSimSet" Val="sim_1"/>
    <Option Name="DefaultLib" Val="xil_defaultlib"/>
    <Option Name="ProjectType" Val="Default"/>
    <Option Name="IPDefaultOutputPath" Val="$PGENDIR/sources_1"/>
    <Option Name="IPCachePermission" Val="read"/>
    <Option Name="IPCachePermission" Val="write"/>
    <Option Name="EnableCoreContainer" Val="FALSE"/>
    <Option Name="EnableResourceEstimation" Val="FALSE"/>
    <Option Name="SimCompileState" Val="TRUE"/>
    <Option Name="CreateRefXciForCoreContainers" Val="FALSE"/>
    <Option Name="IPUserFilesDir" Val="$PIPUSERFILESDIR"/>
    <Option Name="IPStaticSourceDir" Val="$PIPUSERFILESDIR/ipstatic"/>
    <Option Name="EnableBDX" Val="FALSE"/>
    <Option Name="WTXSimLaunchSim" Val="1"/>
    <Option Name="WTModelSimLaunchSim" Val="0"/>
    <Option Name="WTQuestaLaunchSim" Val="0"/>
    <Option Name="WTIesLaunchSim" Val="0"/>
    <Option Name="WTVcsLaunchSim" Val="0"/>
    <Option Name="WTRivieraLaunchSim" Val="0"/>
    <Option Name="WTActivehdlLaunchSim" Val="0"/>
    <Option Name="WTXSimExportSim" Val="0"/>
    <Option Name="WTModelSimExportSim" Val="0"/>
    <Option Name="WTQuestaExportSim" Val="0"/>
    <Option Name="WTIesExportSim" Val="0"/>
    <Option Name="WTVcsExportSim" Val="0"/>
    <Option Name="WTRivieraExportSim" Val="0"/>
    <Option Name="WTActivehdlExportSim" Val="0"/>
    <Option Name="GenerateIPUpgradeLog" Val="TRUE"/>
    <Option Name="XSimRadix" Val="hex"/>
    <Option Name="XSimTimeUnit" Val="ns"/>
    <Option Name="XSimArrayDisplayLimit" Val="1024"/>
    <Option Name="XSimTraceLimit" Val="65536"/>
    <Option Name="SimTypes" Val="rtl"/>
    <Option Name="SimTypes" Val="bfm"/>
    <Option Name="SimTypes" Val="tlm"/>
    <Option Name="SimTypes" Val="tlm_dpi"/>
    <Option Name="MEMEnableMemoryMapGeneration" Val="TRUE"/>
    <Option Name="DcpsUptoDate" Val="TRUE"/>
    <Option Name="UseInlineHdlIP" Val="TRUE"/>
    <Option Name="LocalIPRepoLeafDirName" Val="ip_repo"/>
  </Configuration>
  <FileSets Version="1" Minor="32">
    <FileSet Name="sources_1" Type="DesignSrcs" RelSrcDir="$PSRCDIR/sources_1" RelGenDir="$PGENDIR/sources_1">
      <Filter Type="Srcs"/>
      <File Path="$PPRDIR/../src/hdl/top.v">
        <FileInfo>
          <Attr Name="UsedIn" Val="synthesis"/>
          <Attr Name="UsedIn" Val="implementation"/>
          <Attr Name="UsedIn" Val="simulation"/>
        </FileInfo>
      </File>
      <File Path="$PPRDIR/../src/hdl/data_acq_top.sv">
        <FileInfo>
          <Attr Name="UsedIn" Val="synthesis"/>
          <Attr Name="UsedIn" Val="implementation"/>
          <Attr Name="UsedIn" Val="simulation"/>
        </FileInfo>
      </File>
      <Config>
        <Option Name="DesignMode" Val="RTL"/>
        <Option Name="TopAutoSet" Val="TRUE"/>
      </Config>
    </FileSet>
    <FileSet Name="constrs_1" Type="Constrs" RelSrcDir="$PSRCDIR/constrs_1" RelGenDir="$PGENDIR/constrs_1">
      <Filter Type="Constrs"/>
      <Config>
        <Option Name="ConstrsType" Val="XDC"/>
      </Config>
    </FileSet>
    <FileSet Name="sim_1" Type="SimulationSrcs" RelSrcDir="$PSRCDIR/sim_1" RelGenDir="$PGENDIR/sim_1">
      <File Path="$PPRDIR/../src/testbench/tb_top.v">
        <FileInfo>
          <Attr Name="UsedIn" Val="synthesis"/>
          <Attr Name="UsedIn" Val="implementation"/>
          <Attr Name="UsedIn" Val="simulation"/>
        </FileInfo>
      </File>
      <Config>
        <Option Name="DesignMode" Val="RTL"/>
        <Option Name="TopModule" Val="tb_top"/>
        <Option Name="TopLib" Val="xil_defaultlib"/>
        <Option Name="TransportPathDelay" Val="0"/>
        <Option Name="TransportIntDelay" Val="0"/>
        <Option Name="SelectedSimModel" Val="rtl"/>
        <Option Name="PamDesignTestbench" Val=""/>
        <Option Name="PamDutBypassFile" Val="xil_dut_bypass"/>
        <Option Name="PamSignalDriverFile" Val="xil_bypass_driver"/>
        <Option Name="PamPseudoTop" Val="pseudo_tb"/>
        <Option Name="SrcSet" Val="sources_1"/>
        <Option Name="CosimPdi" Val=""/>
        <Option Name="CosimPlatform" Val=""/>
        <Option Name="CosimElf" Val=""/>
        <Option Name="Dmv" Val=""/>
      </Config>
    </FileSet>
    <FileSet Name="utils_1" Type="Utils" RelSrcDir="$PSRCDIR/utils_1" RelGenDir="$PGENDIR/utils_1">
      <Filter Type="Utils"/>
      <Config>
        <Option Name="TopAutoSet" Val="TRUE"/>
      </Config>
    </FileSet>
  </FileSets>
  <Simulators>
    <Simulator Name="XSim">
      <Option Name="Description" Val="Vivado Simulator"/>
      <Option Name="CompiledLib" Val="0"/>
    </Simulator>
    <Simulator Name="ModelSim">
      <Option Name="Description" Val="ModelSim Simulator"/>
    </Simulator>
    <Simulator Name="Questa">
      <Option Name="Description" Val="Questa Advanced Simulator"/>
    </Simulator>
    <Simulator Name="Riviera">
      <Option Name="Description" Val="Riviera-PRO Simulator"/>
    </Simulator>
    <Simulator Name="ActiveHDL">
      <Option Name="Description" Val="Active-HDL Simulator"/>
    </Simulator>
  </Simulators>
  <Runs Version="1" Minor="22">
    <Run Id="synth_1" Type="Ft3:Synth" SrcSet="sources_1" Part="xc7a100tcsg324-1" ConstrsSet="constrs_1" Description="Vivado Synthesis Defaults" AutoIncrementalCheckpoint="true" WriteIncrSynthDcp="false" State="current" IncludeInArchive="true" IsChild="false" AutoIncrementalDir="$PSRCDIR/utils_1/imports/synth_1" AutoRQSDir="$PSRCDIR/utils_1/imports/synth_1" ParallelReportGen="true">
      <Strategy Version="1" Minor="2">
        <StratHandle Name="Vivado Synthesis Defaults" Flow="Vivado Synthesis 2025">
          <Desc>Vivado Synthesis Defaults</Desc>
        </StratHandle>
        <Step Id="synth_design"/>
      </Strategy>
      <ReportStrategy Name="Vivado Synthesis Default Reports" Flow="Vivado Synthesis 2025"/>
      <Report Name="ROUTE_DESIGN.REPORT_METHODOLOGY" Enabled="1"/>
      <RQSFiles/>
    </Run>
    <Run Id="impl_1" Type="Ft2:EntireDesign" Part="xc7a100tcsg324-1" ConstrsSet="constrs_1" Description="Default settings for Implementation." AutoIncrementalCheckpoint="false" WriteIncrSynthDcp="false" State="current" SynthRun="synth_1" IncludeInArchive="true" IsChild="false" GenFullBitstream="true" AutoIncrementalDir="$PSRCDIR/utils_1/imports/impl_1" AutoRQSDir="$PSRCDIR/utils_1/imports/impl_1" ParallelReportGen="true">
      <Strategy Version="1" Minor="2">
        <StratHandle Name="Vivado Implementation Defaults" Flow="Vivado Implementation 2025">
          <Desc>Default settings for Implementation.</Desc>
        </StratHandle>
        <Step Id="init_design"/>
        <Step Id="opt_design"/>
        <Step Id="power_opt_design"/>
        <Step Id="place_design"/>
        <Step Id="post_place_power_opt_design"/>
        <Step Id="phys_opt_design"/>
        <Step Id="route_design"/>
        <Step Id="post_route_phys_opt_design"/>
        <Step Id="write_bitstream"/>
      </Strategy>
      <ReportStrategy Name="Vivado Implementation Default Reports" Flow="Vivado Implementation 2025"/>
      <Report Name="ROUTE_DESIGN.REPORT_METHODOLOGY" Enabled="1"/>
      <RQSFiles/>
    </Run>
  </Runs>
  <Board/>
  <DashboardSummary Version="1" Minor="0">
    <Dashboards>
      <Dashboard Name="default_dashboard">
        <Gadgets>
          <Gadget Name="drc_1" Type="drc" Version="1" Row="2" Column="0">
            <GadgetParam Name="REPORTS" Type="string_list" Value="impl_1#impl_1_route_report_drc_0 "/>
          </Gadget>
          <Gadget Name="methodology_1" Type="methodology" Version="1" Row="2" Column="1">
            <GadgetParam Name="REPORTS" Type="string_list" Value="impl_1#impl_1_route_report_methodology_0 "/>
          </Gadget>
          <Gadget Name="power_1" Type="power" Version="1" Row="1" Column="0">
            <GadgetParam Name="REPORTS" Type="string_list" Value="impl_1#impl_1_route_report_power_0 "/>
          </Gadget>
          <Gadget Name="timing_1" Type="timing" Version="1" Row="0" Column="1">
            <GadgetParam Name="REPORTS" Type="string_list" Value="impl_1#impl_1_route_report_timing_summary_0 "/>
          </Gadget>
          <Gadget Name="utilization_1" Type="utilization" Version="1" Row="0" Column="0">
            <GadgetParam Name="REPORTS" Type="string_list" Value="synth_1#synth_1_synth_report_utilization_0 "/>
            <GadgetParam Name="RUN.STEP" Type="string" Value="synth_design"/>
            <GadgetParam Name="RUN.TYPE" Type="string" Value="synthesis"/>
          </Gadget>
          <Gadget Name="utilization_2" Type="utilization" Version="1" Row="1" Column="1">
            <GadgetParam Name="REPORTS" Type="string_list" Value="impl_1#impl_1_place_report_utilization_0 "/>
          </Gadget>
        </Gadgets>
      </Dashboard>
      <CurrentDashboard>default_dashboard</CurrentDashboard>
    </Dashboards>
  </DashboardSummary>
</Project>
```
# End of file: sim_gtk/sim_gtk.xpr

# File: sim_vcd/sim_vcd_project.xpr
```text
<?xml version="1.0" encoding="UTF-8"?>
<!-- Product Version: Vivado v2025.1 (64-bit)                              -->
<!--                                                                         -->
<!-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.                   -->
<!-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.   -->

<Project Product="Vivado" Version="7" Minor="70" Path="C:/Users/dwang/Documents/fpga_dev/my_arty_project/sim_vcd/sim_vcd_project.xpr">
  <DefaultLaunch Dir="$PRUNDIR"/>
  <Configuration>
    <Option Name="Id" Val="6ff79b21d2d148df9c35f2218bf5743a"/>
    <Option Name="Part" Val="xc7a100tcsg324-1"/>
    <Option Name="CompiledLibDir" Val="$PCACHEDIR/compile_simlib"/>
    <Option Name="CompiledLibDirXSim" Val=""/>
    <Option Name="CompiledLibDirModelSim" Val="$PCACHEDIR/compile_simlib/modelsim"/>
    <Option Name="CompiledLibDirQuesta" Val="$PCACHEDIR/compile_simlib/questa"/>
    <Option Name="CompiledLibDirXcelium" Val="$PCACHEDIR/compile_simlib/xcelium"/>
    <Option Name="CompiledLibDirVCS" Val="$PCACHEDIR/compile_simlib/vcs"/>
    <Option Name="CompiledLibDirRiviera" Val="$PCACHEDIR/compile_simlib/riviera"/>
    <Option Name="CompiledLibDirActivehdl" Val="$PCACHEDIR/compile_simlib/activehdl"/>
    <Option Name="SimulatorInstallDirModelSim" Val=""/>
    <Option Name="SimulatorInstallDirQuesta" Val=""/>
    <Option Name="SimulatorInstallDirXcelium" Val=""/>
    <Option Name="SimulatorInstallDirVCS" Val=""/>
    <Option Name="SimulatorInstallDirRiviera" Val=""/>
    <Option Name="SimulatorInstallDirActiveHdl" Val=""/>
    <Option Name="SimulatorGccInstallDirModelSim" Val=""/>
    <Option Name="SimulatorGccInstallDirQuesta" Val=""/>
    <Option Name="SimulatorGccInstallDirXcelium" Val=""/>
    <Option Name="SimulatorGccInstallDirVCS" Val=""/>
    <Option Name="SimulatorGccInstallDirRiviera" Val=""/>
    <Option Name="SimulatorGccInstallDirActiveHdl" Val=""/>
    <Option Name="SimulatorVersionXsim" Val="2025.1"/>
    <Option Name="SimulatorVersionModelSim" Val="2024.3"/>
    <Option Name="SimulatorVersionQuesta" Val="2024.3_3"/>
    <Option Name="SimulatorVersionXcelium" Val="24.09.001"/>
    <Option Name="SimulatorVersionVCS" Val="W-2024.09-SP1"/>
    <Option Name="SimulatorVersionRiviera" Val="2024.10"/>
    <Option Name="SimulatorVersionActiveHdl" Val="15.0"/>
    <Option Name="SimulatorGccVersionXsim" Val="9.3.0"/>
    <Option Name="SimulatorGccVersionModelSim" Val="7.4.0"/>
    <Option Name="SimulatorGccVersionQuesta" Val="7.4.0"/>
    <Option Name="SimulatorGccVersionXcelium" Val="9.3.0"/>
    <Option Name="SimulatorGccVersionVCS" Val="9.2.0"/>
    <Option Name="SimulatorGccVersionRiviera" Val="9.3.0"/>
    <Option Name="SimulatorGccVersionActiveHdl" Val="9.3.0"/>
    <Option Name="BoardPart" Val=""/>
    <Option Name="ActiveSimSet" Val="sim_1"/>
    <Option Name="DefaultLib" Val="xil_defaultlib"/>
    <Option Name="ProjectType" Val="Default"/>
    <Option Name="IPDefaultOutputPath" Val="$PGENDIR/sources_1"/>
    <Option Name="IPCachePermission" Val="read"/>
    <Option Name="IPCachePermission" Val="write"/>
    <Option Name="EnableCoreContainer" Val="FALSE"/>
    <Option Name="EnableResourceEstimation" Val="FALSE"/>
    <Option Name="SimCompileState" Val="TRUE"/>
    <Option Name="CreateRefXciForCoreContainers" Val="FALSE"/>
    <Option Name="IPUserFilesDir" Val="$PIPUSERFILESDIR"/>
    <Option Name="IPStaticSourceDir" Val="$PIPUSERFILESDIR/ipstatic"/>
    <Option Name="EnableBDX" Val="FALSE"/>
    <Option Name="WTXSimLaunchSim" Val="1"/>
    <Option Name="WTModelSimLaunchSim" Val="0"/>
    <Option Name="WTQuestaLaunchSim" Val="0"/>
    <Option Name="WTIesLaunchSim" Val="0"/>
    <Option Name="WTVcsLaunchSim" Val="0"/>
    <Option Name="WTRivieraLaunchSim" Val="0"/>
    <Option Name="WTActivehdlLaunchSim" Val="0"/>
    <Option Name="WTXSimExportSim" Val="0"/>
    <Option Name="WTModelSimExportSim" Val="0"/>
    <Option Name="WTQuestaExportSim" Val="0"/>
    <Option Name="WTIesExportSim" Val="0"/>
    <Option Name="WTVcsExportSim" Val="0"/>
    <Option Name="WTRivieraExportSim" Val="0"/>
    <Option Name="WTActivehdlExportSim" Val="0"/>
    <Option Name="GenerateIPUpgradeLog" Val="TRUE"/>
    <Option Name="XSimRadix" Val="hex"/>
    <Option Name="XSimTimeUnit" Val="ns"/>
    <Option Name="XSimArrayDisplayLimit" Val="1024"/>
    <Option Name="XSimTraceLimit" Val="65536"/>
    <Option Name="SimTypes" Val="rtl"/>
    <Option Name="SimTypes" Val="bfm"/>
    <Option Name="SimTypes" Val="tlm"/>
    <Option Name="SimTypes" Val="tlm_dpi"/>
    <Option Name="MEMEnableMemoryMapGeneration" Val="TRUE"/>
    <Option Name="DcpsUptoDate" Val="TRUE"/>
    <Option Name="UseInlineHdlIP" Val="TRUE"/>
    <Option Name="LocalIPRepoLeafDirName" Val="ip_repo"/>
  </Configuration>
  <FileSets Version="1" Minor="32">
    <FileSet Name="sources_1" Type="DesignSrcs" RelSrcDir="$PSRCDIR/sources_1" RelGenDir="$PGENDIR/sources_1">
      <Filter Type="Srcs"/>
      <File Path="$PPRDIR/../src/hdl/top.v">
        <FileInfo>
          <Attr Name="UsedIn" Val="synthesis"/>
          <Attr Name="UsedIn" Val="implementation"/>
          <Attr Name="UsedIn" Val="simulation"/>
        </FileInfo>
      </File>
      <Config>
        <Option Name="DesignMode" Val="RTL"/>
        <Option Name="TopAutoSet" Val="TRUE"/>
      </Config>
    </FileSet>
    <FileSet Name="constrs_1" Type="Constrs" RelSrcDir="$PSRCDIR/constrs_1" RelGenDir="$PGENDIR/constrs_1">
      <Filter Type="Constrs"/>
      <Config>
        <Option Name="ConstrsType" Val="XDC"/>
      </Config>
    </FileSet>
    <FileSet Name="sim_1" Type="SimulationSrcs" RelSrcDir="$PSRCDIR/sim_1" RelGenDir="$PGENDIR/sim_1">
      <File Path="$PPRDIR/../src/testbench/tb_top.v">
        <FileInfo>
          <Attr Name="UsedIn" Val="synthesis"/>
          <Attr Name="UsedIn" Val="implementation"/>
          <Attr Name="UsedIn" Val="simulation"/>
        </FileInfo>
      </File>
      <Config>
        <Option Name="DesignMode" Val="RTL"/>
        <Option Name="TopModule" Val="tb_top"/>
        <Option Name="TopLib" Val="xil_defaultlib"/>
        <Option Name="TransportPathDelay" Val="0"/>
        <Option Name="TransportIntDelay" Val="0"/>
        <Option Name="SelectedSimModel" Val="rtl"/>
        <Option Name="PamDesignTestbench" Val=""/>
        <Option Name="PamDutBypassFile" Val="xil_dut_bypass"/>
        <Option Name="PamSignalDriverFile" Val="xil_bypass_driver"/>
        <Option Name="PamPseudoTop" Val="pseudo_tb"/>
        <Option Name="SrcSet" Val="sources_1"/>
        <Option Name="CosimPdi" Val=""/>
        <Option Name="CosimPlatform" Val=""/>
        <Option Name="CosimElf" Val=""/>
        <Option Name="Dmv" Val=""/>
      </Config>
    </FileSet>
    <FileSet Name="utils_1" Type="Utils" RelSrcDir="$PSRCDIR/utils_1" RelGenDir="$PGENDIR/utils_1">
      <Filter Type="Utils"/>
      <Config>
        <Option Name="TopAutoSet" Val="TRUE"/>
      </Config>
    </FileSet>
  </FileSets>
  <Simulators>
    <Simulator Name="XSim">
      <Option Name="Description" Val="Vivado Simulator"/>
      <Option Name="CompiledLib" Val="0"/>
    </Simulator>
    <Simulator Name="ModelSim">
      <Option Name="Description" Val="ModelSim Simulator"/>
    </Simulator>
    <Simulator Name="Questa">
      <Option Name="Description" Val="Questa Advanced Simulator"/>
    </Simulator>
    <Simulator Name="Riviera">
      <Option Name="Description" Val="Riviera-PRO Simulator"/>
    </Simulator>
    <Simulator Name="ActiveHDL">
      <Option Name="Description" Val="Active-HDL Simulator"/>
    </Simulator>
  </Simulators>
  <Runs Version="1" Minor="22">
    <Run Id="synth_1" Type="Ft3:Synth" SrcSet="sources_1" Part="xc7a100tcsg324-1" ConstrsSet="constrs_1" Description="Vivado Synthesis Defaults" AutoIncrementalCheckpoint="true" WriteIncrSynthDcp="false" State="current" IncludeInArchive="true" IsChild="false" AutoIncrementalDir="$PSRCDIR/utils_1/imports/synth_1" AutoRQSDir="$PSRCDIR/utils_1/imports/synth_1" ParallelReportGen="true">
      <Strategy Version="1" Minor="2">
        <StratHandle Name="Vivado Synthesis Defaults" Flow="Vivado Synthesis 2025">
          <Desc>Vivado Synthesis Defaults</Desc>
        </StratHandle>
        <Step Id="synth_design"/>
      </Strategy>
      <ReportStrategy Name="Vivado Synthesis Default Reports" Flow="Vivado Synthesis 2025"/>
      <Report Name="ROUTE_DESIGN.REPORT_METHODOLOGY" Enabled="1"/>
      <RQSFiles/>
    </Run>
    <Run Id="impl_1" Type="Ft2:EntireDesign" Part="xc7a100tcsg324-1" ConstrsSet="constrs_1" Description="Default settings for Implementation." AutoIncrementalCheckpoint="false" WriteIncrSynthDcp="false" State="current" SynthRun="synth_1" IncludeInArchive="true" IsChild="false" GenFullBitstream="true" AutoIncrementalDir="$PSRCDIR/utils_1/imports/impl_1" AutoRQSDir="$PSRCDIR/utils_1/imports/impl_1" ParallelReportGen="true">
      <Strategy Version="1" Minor="2">
        <StratHandle Name="Vivado Implementation Defaults" Flow="Vivado Implementation 2025">
          <Desc>Default settings for Implementation.</Desc>
        </StratHandle>
        <Step Id="init_design"/>
        <Step Id="opt_design"/>
        <Step Id="power_opt_design"/>
        <Step Id="place_design"/>
        <Step Id="post_place_power_opt_design"/>
        <Step Id="phys_opt_design"/>
        <Step Id="route_design"/>
        <Step Id="post_route_phys_opt_design"/>
        <Step Id="write_bitstream"/>
      </Strategy>
      <ReportStrategy Name="Vivado Implementation Default Reports" Flow="Vivado Implementation 2025"/>
      <Report Name="ROUTE_DESIGN.REPORT_METHODOLOGY" Enabled="1"/>
      <RQSFiles/>
    </Run>
  </Runs>
  <Board/>
  <DashboardSummary Version="1" Minor="0">
    <Dashboards>
      <Dashboard Name="default_dashboard">
        <Gadgets>
          <Gadget Name="drc_1" Type="drc" Version="1" Row="2" Column="0">
            <GadgetParam Name="REPORTS" Type="string_list" Value="impl_1#impl_1_route_report_drc_0 "/>
          </Gadget>
          <Gadget Name="methodology_1" Type="methodology" Version="1" Row="2" Column="1">
            <GadgetParam Name="REPORTS" Type="string_list" Value="impl_1#impl_1_route_report_methodology_0 "/>
          </Gadget>
          <Gadget Name="power_1" Type="power" Version="1" Row="1" Column="0">
            <GadgetParam Name="REPORTS" Type="string_list" Value="impl_1#impl_1_route_report_power_0 "/>
          </Gadget>
          <Gadget Name="timing_1" Type="timing" Version="1" Row="0" Column="1">
            <GadgetParam Name="REPORTS" Type="string_list" Value="impl_1#impl_1_route_report_timing_summary_0 "/>
          </Gadget>
          <Gadget Name="utilization_1" Type="utilization" Version="1" Row="0" Column="0">
            <GadgetParam Name="REPORTS" Type="string_list" Value="synth_1#synth_1_synth_report_utilization_0 "/>
            <GadgetParam Name="RUN.STEP" Type="string" Value="synth_design"/>
            <GadgetParam Name="RUN.TYPE" Type="string" Value="synthesis"/>
          </Gadget>
          <Gadget Name="utilization_2" Type="utilization" Version="1" Row="1" Column="1">
            <GadgetParam Name="REPORTS" Type="string_list" Value="impl_1#impl_1_place_report_utilization_0 "/>
          </Gadget>
        </Gadgets>
      </Dashboard>
      <CurrentDashboard>default_dashboard</CurrentDashboard>
    </Dashboards>
  </DashboardSummary>
</Project>
```
# End of file: sim_vcd/sim_vcd_project.xpr

# File: src/constraints/arty_a7.xdc
```text
## Clock signal 100MHz
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}]

## Switches
set_property -dict { PACKAGE_PIN A8    IOSTANDARD LVCMOS33 } [get_ports { sw[0] }]
set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVCMOS33 } [get_ports { sw[1] }]
set_property -dict { PACKAGE_PIN C10   IOSTANDARD LVCMOS33 } [get_ports { sw[2] }]
set_property -dict { PACKAGE_PIN A10   IOSTANDARD LVCMOS33 } [get_ports { sw[3] }]

## LEDs
set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { led[0] }]
set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { led[1] }]
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { led[2] }]
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { led[3] }]

## Reset button
set_property -dict { PACKAGE_PIN C12   IOSTANDARD LVCMOS33 } [get_ports { rst_n }]
```
# End of file: src/constraints/arty_a7.xdc

# File: src/hdl/data_acq_top.sv
```text

```
# End of file: src/hdl/data_acq_top.sv

# File: src/hdl/top.v
```text
`timescale 1ns / 1ps

module top (
    input clk,
    input rst_n,
    input [3:0] sw,
    output [3:0] led
);

// Just turn all LEDs on - simplest possible test
assign led = 4'b1111;

endmodule
```
# End of file: src/hdl/top.v

# File: src/testbench/tb_top.v
```text
`timescale 1ns / 1ps

module tb_top();
    reg clk;
    reg rst_n;
    reg [3:0] sw;
    wire [3:0] led;
    
    // Instantiate design under test
    top dut (
        .clk(clk),
        .rst_n(rst_n),
        .sw(sw),
        .led(led)
    );
    
    // Clock generation (100MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns period = 100MHz
    end
    
    // Test sequence with more activity
    initial begin
        $display("Starting simulation at time %0t", $time);
        
        // Initialize signals
        rst_n = 0;
        sw = 4'b0000;
        
        // Hold reset for several clocks
        repeat(10) @(posedge clk);
        rst_n = 1;
        $display("Reset released at time %0t", $time);
        
        // Test different switch combinations with clock delays
        repeat(5) @(posedge clk);
        sw = 4'b0001;
        $display("Switch = 0001 at time %0t, LED = %b", $time, led);
        
        repeat(5) @(posedge clk);
        sw = 4'b0010;
        $display("Switch = 0010 at time %0t, LED = %b", $time, led);
        
        repeat(5) @(posedge clk);
        sw = 4'b0100;
        $display("Switch = 0100 at time %0t, LED = %b", $time, led);
        
        repeat(5) @(posedge clk);
        sw = 4'b1000;
        $display("Switch = 1000 at time %0t, LED = %b", $time, led);
        
        repeat(5) @(posedge clk);
        sw = 4'b1111;
        $display("Switch = 1111 at time %0t, LED = %b", $time, led);
        
        repeat(10) @(posedge clk);
        $display("Simulation complete at time %0t", $time);
        $finish;
    end
    
    // Additional monitoring
    always @(posedge clk) begin
        $display("Time=%0t: clk=%b rst_n=%b sw=%b led=%b", $time, clk, rst_n, sw, led);
    end
    
endmodule
```
# End of file: src/testbench/tb_top.v

