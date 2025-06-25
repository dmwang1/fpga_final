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