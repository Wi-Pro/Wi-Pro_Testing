
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name SPIII -dir "C:/Users/Adam Vogel/Desktop/spi/SPIII/planAhead_run_2" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Spi.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {SPI.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top Spi $srcset
add_files [list {Spi.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
