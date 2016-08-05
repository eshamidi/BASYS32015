# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
  set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Labtools 27-147} -limit 4294967295
create_project -in_memory -part xc7a35tcpg236-1
set_property target_language Verilog [current_project]
set_param project.compositeFile.enableAutoGeneration 0
set_property default_lib xil_defaultlib [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/egh35/Documents/ECEC302/cascade_register_1/cascade_register_1.srcs/sources_1/new/reg.vhd
  C:/Users/egh35/Documents/ECEC302/cascade_register_1/cascade_register_1.srcs/sources_1/new/cascade_reg.vhd
}
read_xdc C:/Users/egh35/Documents/ECEC302/cascade_register_1/cascade_register_1.srcs/constrs_1/imports/basys3_master/Basys3_Master.xdc
set_property used_in_implementation false [get_files C:/Users/egh35/Documents/ECEC302/cascade_register_1/cascade_register_1.srcs/constrs_1/imports/basys3_master/Basys3_Master.xdc]

set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/egh35/Documents/ECEC302/cascade_register_1/cascade_register_1.cache/wt [current_project]
set_property parent.project_dir C:/Users/egh35/Documents/ECEC302/cascade_register_1 [current_project]
catch { write_hwdef -file cascade_reg.hwdef }
synth_design -top cascade_reg -part xc7a35tcpg236-1
write_checkpoint cascade_reg.dcp
report_utilization -file cascade_reg_utilization_synth.rpt -pb cascade_reg_utilization_synth.pb
