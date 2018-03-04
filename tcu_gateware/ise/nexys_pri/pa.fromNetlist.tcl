
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name nexys_pri -dir "/home/brad/tcu_v2/tcu_gateware/ise/nexys_pri/planAhead_run_1" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/brad/tcu_v2/tcu_gateware/ise/nexys_pri/tcu_top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/brad/tcu_v2/tcu_gateware/ise/nexys_pri} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "/home/brad/tcu_v2/tcu_gateware/constraints/Nexys3_master.ucf" [current_fileset -constrset]
add_files [list {/home/brad/tcu_v2/tcu_gateware/constraints/Nexys3_master.ucf}] -fileset [get_property constrset [current_run]]
link_design
