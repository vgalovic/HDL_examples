# Define target HDL
set target_hdl "Verilog"

# Define project name
set project_name "memory"

# Set project directory
set create_project_dir [file normalize [file join [file dirname [info script]]  "../.."]]

# Create Vivado project
source $create_project_dir/create_project.tcl

# Clean up all the variables used in your project setup script
source $create_project_dir/cleanup.tcl
