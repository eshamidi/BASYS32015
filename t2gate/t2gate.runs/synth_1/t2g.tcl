# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir E:/ECEC302/Projects/t2gate/t2gate.cache/wt [current_project]
set_property parent.project_path E:/ECEC302/Projects/t2gate/t2gate.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_vhdl -library xil_defaultlib {
  E:/ECEC302/Projects/t2gate/t2gate.srcs/sources_1/new/t2gate.vhd
  E:/ECEC302/Projects/t2gate/t2gate.srcs/sources_1/new/t2g.vhd
}
read_xdc E:/ECEC302/Projects/t2gate/t2gate.srcs/constrs_1/new/cont.xdc
set_property used_in_implementation false [get_files E:/ECEC302/Projects/t2gate/t2gate.srcs/constrs_1/new/cont.xdc]

synth_design -top t2g -part xc7a35tcpg236-1
write_checkpoint -noxdef t2g.dcp
catch { report_utilization -file t2g_utilization_synth.rpt -pb t2g_utilization_synth.pb }
