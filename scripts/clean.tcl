# Enhanced clean script for FPGA project
puts "Cleaning project files..."

# Remove output directory
if {[file exists ../output]} {
    puts "Removing output directory..."
    file delete -force ../output
}

# Remove ALL simulation project directories (ENHANCED)
set sim_dirs {../sim_auto ../sim_gtk ../sim_vcd ../sim_terminal ../sim}
foreach sim_dir $sim_dirs {
    if {[file exists $sim_dir]} {
        puts "Removing simulation directory: $sim_dir"
        file delete -force $sim_dir
    }
}

# Clean Xilinx generated files in scripts directory
if {[file exists .Xil]} {
    puts "Removing .Xil directory..."
    file delete -force .Xil
}

# Remove individual generated files in scripts
set cleanup_files {clockInfo.txt dfx_runtime.txt xelab.pb}
foreach file $cleanup_files {
    if {[file exists $file]} {
        puts "Removing $file"
        file delete -force $file
    }
}

# Try to remove log files (may fail if Vivado is using them - that's OK)
set log_files {vivado.jou vivado.log}
foreach file $log_files {
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
set log_files_root [glob -nocomplain ../*.log]
foreach file $log_files_root {
    puts "Removing log: $file"
    file delete -force $file
}

# Remove any journal files in project root (ADDED)
set jou_files [glob -nocomplain ../*.jou]
foreach file $jou_files {
    puts "Removing journal: $file"
    file delete -force $file
}

# Clean up any VCD files that might be left in root (ADDED)
set vcd_files [glob -nocomplain ../*.vcd]
foreach file $vcd_files {
    puts "Removing VCD file: $file"
    file delete -force $file
}

puts "Clean complete!"
puts "All generated files have been removed."
puts "Source files and constraints are preserved."
puts ""
puts "Directories cleaned:"
puts "  - output/"
puts "  - sim_*/ (all simulation projects)"
puts "  - .Xil/"
puts "Files cleaned:"
puts "  - *.log, *.jou, *.dcp, *.vcd"
puts "  - dfx_runtime.txt, xelab.pb"