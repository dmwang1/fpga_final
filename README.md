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




Solution 4: Simplified Approach
Since your GUI simulation works, just open Vivado GUI and run:
powershell# Open Vivado GUI, then in Tcl Console:
& "C:\Xilinx\2025.1\Vivado\bin\vivado.bat" -mode gui
Then in GUI Tcl Console:
tclcd C:/Users/dwang/Documents/fpga_dev/my_arty_project/scripts
source simulate_terminal.tcl
