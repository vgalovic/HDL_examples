# Define target HDL
set target_hdl "VHDL"

# Define project name
set base_project_name "hierarchical_design"
set sub_project_name "three-digit_decimal_counter"

set project_name "${base_project_name}/${sub_project_name}"

# Set project directory
set create_project_dir [file normalize [file join [file dirname [info script]]  "../../../"]]

# Create Vivado project
source $create_project_dir/create_project.tcl

# Set project properties
set_property top tree_digit_decimal_counter [current_fileset]

# Clean up all the variables used in your project setup script
source $create_project_dir/cleanup.tcl
