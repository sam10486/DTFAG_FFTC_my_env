set search_path      ". /opt/synopsys/CBDK_TSMC40_Arm_f2.0/CIC/SynopsysDC/db/sc9_base_lvt ../mem/sram_40 $search_path"
set target_library   "sc9_cln40g_base_lvt_ff_typical_min_0p99v_125c.db sc9_cln40g_base_lvt_ff_typical_min_0p99v_m40c.db sc9_cln40g_base_lvt_ffg_typical_min_0p99v_125c.db sc9_cln40g_base_lvt_ss_typical_max_0p81v_125c.db sc9_cln40g_base_lvt_ss_typical_max_0p81v_m40c.db sc9_cln40g_base_lvt_tt_typical_max_0p90v_25c.db SRAM_SP_40nm.db"
set link_library     "* $target_library dw_foundation.sldb"
set symbol_library   "tsmc40.sdb generic.sdb"
set synthetic_library "dw_foundation.sldb"

set case_analysis_with_logic_constants true

set hdlin_translate_off_skip_text "TRUE"
#set hdlin_enable_presto_for_vhdl "TRUE"
set edifout_netlist_only "TRUE"
set verilogout_no_tri true
set plot_command {lpr -Plp}
set hdlin_auto_save_templates "TRUE"

#define_name_rules name_rule -allowed {a-z A-Z 0-9 _} -max_length 255 -type cell
#define_name_rules name_rule -allowed {a-z A-Z 0-9 _[]} -max_length 255 -type net
#define_name_rules name_rule -map {{"\*cell\*" "cell"}}
#define_name_rules name_rule -case_insensitive

set view_script_submenu_items [list {Avoid assign statement} {set_fix_multiple_p
ort_nets -all -buffer_constant} {Change Naming Rule} {change_names -rule verilog
 -hierarchy} {Write SDF} {write_sdf -version 2.1 -context verilog chip.sdf}]

set hdlin_while_loop_iterations 2000
        
read_file -autoread -top FFTP {../src_40 ../src_40/DTFAG ../include}	

current_design FFTP                                
link                                                
uniquify        
set_operating_conditions -min_library sc9_cln40g_base_lvt_ff_typical_min_0p99v_m40c -min ff_typical_min_0p99v_m40c  -max_library sc9_cln40g_base_lvt_ss_typical_max_0p81v_125c -max ss_typical_max_0p81v_125c                                    
#set_operating_conditions -min_library sc9_cln40g_base_lvt_tt_typical_max_0p90v_25c -min tt_typical_max_0p90v_25c  -max_library sc9_cln40g_base_lvt_tt_typical_max_0p90v_25c -max tt_typical_max_0p90v_25c
#set_operating_conditions -max slow -max_library slow -min fast -min_library fast               
set_wire_load_mode segmented                  
# 
set auto_wire_load_selection       
#set_wire_load_model -name Zero -library sc9_cln40g_base_lvt_tt_typical_max_0p90v_25c                                                                 
#set_wire_load_model -name tsmc090_wl10 -library slow                                           
#create_clock -period 16 -waveform {0 2.5} [get_ports clk]
create_clock -period 5.0 -waveform {0 2.5} [get_ports clk]
set_dont_touch_network [get_ports clk]                                                          
set_ideal_network [get_ports clk]                                                             
set_ideal_network [get_ports rst_n]                                                             
#set_dont_touch_network [get_ports rst]                                                       
                                                                                                
set_clock_uncertainty -setup 0.1 [get_clocks clk]   
set_load 0.1 [all_outputs]
set_drive 1 [all_inputs]                                            
#set_drive [drive_of typical/DFFX2/Q] [remove_from_collection [all_inputs] [get_ports {clk}]]    
#set_load [load_of typical/DFFX2/D] [all_outputs]                                               
#set_drive [drive_of slow/DFFX2/Q] [remove_from_collection [all_inputs] [get_ports {clk}]]      
#set_load [load_of slow/DFFX2/D] [all_outputs]                                                  
set_input_delay 0.2 -clock clk [remove_from_collection [all_inputs] [get_ports {clk}]]          
set_output_delay 0.2 -max -clock clk [all_outputs]                                              
set_fix_multiple_port_nets -all -buffer_constants     
set_host_options -max_cores 4                                              
#set_case_analysis 1 [get_ports rst]                                                          
#set_max_area 0                                                                                 
                                                                                                
#set_clock_gating_style -sequential_cell latch -max_fanout 3 -num_stage 1 -setup 0.3            
#-control_point before -control_signal se                                                       
#propagate_constraints -gate_clock                                                              
#insert_clock_gating -module                                                                    
#replace_clock_gates                                                                            
   
    
#compile 
#compile -inc -map_effort high                                                                  
#compile -map_effort medium                                                                     
#compile -incremental_mapping -map_effort high -area_effort high -boundary_optimization         
#compile -incremental_mapping -map_effort high -area_effort high -boundary_optimization         
#compile -incremental_mapping -map_effort high -boundary_optimization                           
#compile_ultra -top -timing_high_effort_script -retime     
#compile_ultra
#compile_ultra -area_high_effort_script -retime                                                         
#compile_ultra -no_autoungroup -timing_high_effort_script -retime                                     
#compile_ultra -no_autoungroup -area_high_effort_script 
compile_ultra -no_autoungroup                                         
#compile_ultra -inc -retime 
#optimize_netlist -area 
                                                            
check_design > ../syn/syn_40/design_check.rpt                                 
remove_unconnected_ports -blast_buses [get_cells * -hier]                             
change_names -rule verilog -hierarchy         

#set bus_inference_style {%s[%d]}                                                               
#set bus_naming_style {%s[%d]}                                                                  
#set hdlout_internal_busses true                                                                
#change_names -hierarchy -rule verilog                                                          
#define_name_rules name_rule -allowed "A-Z a-z 0-9 _"-max_length 255 -type cell
#define_name_rules name_rule -allowed "A-Z a-z 0-9 _[]"-max_length 255 -type net
#define_name_rules name_rule -map {{"\*cell\*" "cell"}}
#define_name_rules name_rule -case_insensitive                                                  
#change_names -hierarchy -rule name_rule                      

write_file -format verilog -hier -output ../syn/syn_40/FFTP_syn.v
write_sdf -version 2.1 -context verilog ../syn/syn_40/FFTP_syn.sdf                                                                                                                                                                                                                                  
                                       
                                                                                                 
report_timing -max_paths 20  > ../syn/syn_40/timing.log                                  
report_area > ../syn/syn_40/area.log                                                     
report_power > ../syn/syn_40/power.log                                                   
report_area -hier > ../syn/syn_40/area_hier.log      

exit
                                                                                           

