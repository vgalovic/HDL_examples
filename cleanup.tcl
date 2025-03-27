# Clean up all the variables used in your project setup script

# List of variables to clean up
set vars_to_cleanup {
    base_project_name
    constrs_dir
    create_project_dir
    device_part
    project_dir
    project_directory_base
    project_name
    sim_dir
    sources_dir
    sub_project_name
    target_hdl
}

# Iterate over the list and unset each variable
foreach var $vars_to_cleanup {
    if {[info exists $var]} {
        unset $var
    }
}
