# Set Vivado's default project directory
set project_directory_base [file normalize [file join $env(HOME) "Documents" "Vivado"]]
set project_dir [file normalize [file join $project_directory_base $project_name]]

# Set the target device for your project
set device_part "xc7z020clg484-1"  ;# Zedboard and ZedBoard Zynq Evaluation Kit
# set device_part "xc7z010clg400-1"  ;# Zynq-7000 SoC - Zybo, Zybo Z7-10 and Zybo Z7-20

# Define absolute paths for sources and constraints using the directory of the Tcl file
# Normalize the path to make sure it is correct
set sources_dir [file normalize [file join $create_project_dir  $target_hdl $project_name "src"]]
set sim_dir [file normalize [file join $create_project_dir  $target_hdl $project_name "sim"]]
set constrs_dir [file normalize [file join $create_project_dir  $target_hdl $project_name "constrs"]]

################################################################################

exec mkdir -p $project_directory_base

# if $sub_project_name is not defined, create a top-level project
if { [info exists sub_project_name] } {
    create_project $sub_project_name $project_dir -part $device_part
} else {
    create_project $project_name $project_dir -part $device_part
}

set_property board_part avnet.com:zedboard:part0:1.4 [current_project] ;# ZedBoard Zynq Evaluation Kit
#set_property board_part digilentinc.com:zybo-z7-20:part0:1.2 [current_project] ;# Zybo Z7-20

# Set the target language to VHDL or Verilog
set_property target_language $target_hdl [current_project]

################################################################################

# Add design sources
if {[file exists $sources_dir]} {
    add_files -scan_for_includes $sources_dir
}

# Add simulation sources
if {[file exists $sim_dir]} {
    add_files -scan_for_includes -fileset sim_1 $sim_dir
}

# Add constraints
if {[file exists $constrs_dir]} {
    add_files -scan_for_includes -fileset constrs_1 $contrs_dir
}
