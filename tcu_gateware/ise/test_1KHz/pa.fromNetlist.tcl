
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name test_1KHz -dir "/home/brad/tcu_v2/tcu_gateware/ise/test_1KHz/planAhead_run_2" -part xc6slx150tfgg676-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/brad/tcu_v2/tcu_gateware/ise/test_1KHz/tcu_top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/brad/tcu_v2/tcu_gateware/ise/test_1KHz} }
set_property target_constrs_file "/home/brad/tcu_v2/tcu_gateware/constraints/test_1KHz.ucf" [current_fileset -constrset]
add_files [list {/home/brad/tcu_v2/tcu_gateware/constraints/test_1KHz.ucf}] -fileset [get_property constrset [current_run]]
link_design
