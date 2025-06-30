# my_arty_project

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
- **Constraints**: arty_a7.xdc 
- **Target Device**: xc7a100tcsg324-1

# git2text:
git2text . -o output.txt

Built with Vivado non-project mode for clean version control.

# PUSH TOKEN COMMAND

git push https://token_insert_here/fpga_final.git


# clean command in scripts dir
vivado -mode batch -source clean.tcl

# SYN COMMANDS
# Check default module (top)
vivado -mode batch -source synth_only.tcl

# Check specific module  
vivado -mode batch -source synth_only.tcl -tclargs top_clkgen
vivado -mode batch -source synth_only.tcl -tclargs clk_gen


# PROGRAM COMMANDS (replace end of line with module name)
vivado -mode batch -source program.tcl -tclargs top_clkgen  

# sim waves command for vivado gui
export_simulation  -directory "C:/Users/dwang/AppData/Roaming/Xilinx/Vivado/." -simulator xsim 



## in vscode terminal working
& "C:\Xilinx\2025.1\Vivado\bin\vivado.bat" -mode batch -source build.tcl

or

vivado -mode batch -source build.tcl -tclargs clk_gen
vivado -mode batch -source build.tcl -tclargs top

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


scp "C:/Users/dwang/Documents/fpga_dev/my_arty_project/output/waves.vcd" tripod@100.81.165.41:/home/tripod/Desktop/


vivado -mode batch -source simulate_with_vcd.tcl -tclargs tb_clkgen
vivado -mode batch -source simulate_with_vcd.tcl -tclargs tb_top



# Solution 4: Simplified Approach
Since your GUI simulation works, just open Vivado GUI and run:
powershell# Open Vivado GUI, then in Tcl Console:
& "C:\Xilinx\2025.1\Vivado\bin\vivado.bat" -mode gui
Then in GUI Tcl Console:
tclcd C:/Users/dwang/Documents/fpga_dev/my_arty_project/scripts
source simulate_terminal.tcl


# vivado -mode batch -source simulate_with_vcd.tcl -tclargs <testbench_name>
ex: vivado -mode batch -source simulate_with_vcd.tcl -tclargs tb_top





# 1. Test logic first
vivado -mode batch -source simulate_with_vcd.tcl -tclargs tb_clkgen

After sim, run scp command to view waves on rpi

# 2. Quick syntax/timing check (30 seconds)
vivado -mode batch -source synth_only.tcl -tclargs top_clkgen

# 3. If synthesis passes, do full build (2-3 minutes)
vivado -mode batch -source build.tcl -tclargs top_clkgen

# 4. Program and test on hardware


# vnc/gui use from rpi
ssh -L 5900:100.93.4.75:5900 windows-desktop
vncviewer localhost:5900

