
################################################################
# This is a generated script based on design: delay_module
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2016.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source delay_module_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg484-1
   set_property BOARD_PART em.avnet.com:zed:part0:1.3 [current_project]
}


# CHANGE DESIGN NAME HERE
set design_name delay_module

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DELAY_AXI [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 DELAY_AXI ]
  set_property -dict [ list \
CONFIG.ADDR_WIDTH {6} \
CONFIG.ARUSER_WIDTH {0} \
CONFIG.AWUSER_WIDTH {0} \
CONFIG.BUSER_WIDTH {0} \
CONFIG.DATA_WIDTH {32} \
CONFIG.HAS_BRESP {1} \
CONFIG.HAS_BURST {0} \
CONFIG.HAS_CACHE {0} \
CONFIG.HAS_LOCK {0} \
CONFIG.HAS_PROT {1} \
CONFIG.HAS_QOS {0} \
CONFIG.HAS_REGION {0} \
CONFIG.HAS_RRESP {1} \
CONFIG.HAS_WSTRB {1} \
CONFIG.ID_WIDTH {0} \
CONFIG.MAX_BURST_LENGTH {1} \
CONFIG.NUM_READ_OUTSTANDING {1} \
CONFIG.NUM_WRITE_OUTSTANDING {1} \
CONFIG.PROTOCOL {AXI4LITE} \
CONFIG.READ_WRITE_MODE {READ_WRITE} \
CONFIG.RUSER_WIDTH {0} \
CONFIG.SUPPORTS_NARROW_BURST {0} \
CONFIG.WUSER_WIDTH {0} \
 ] $DELAY_AXI

  # Create ports
  set ch1 [ create_bd_port -dir O ch1 ]
  set data_flag [ create_bd_port -dir I data_flag ]
  set delay_axi_aclk [ create_bd_port -dir I -type clk delay_axi_aclk ]
  set delay_axi_aresetn [ create_bd_port -dir I -type rst delay_axi_aresetn ]
  set out_1 [ create_bd_port -dir O out_1 ]
  set out_2 [ create_bd_port -dir O out_2 ]
  set out_3 [ create_bd_port -dir O out_3 ]
  set out_4 [ create_bd_port -dir O out_4 ]
  set timedata [ create_bd_port -dir I -from 21 -to 0 timedata ]
  set tstart [ create_bd_port -dir O tstart ]
  set tstart_count [ create_bd_port -dir I -from 31 -to 0 tstart_count ]

  # Create instance: DELAY_OUT_0, and set properties
  set DELAY_OUT_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:DELAY_OUT:1.0 DELAY_OUT_0 ]

  # Create instance: TDC_TO_DELAY_0, and set properties
  set TDC_TO_DELAY_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:TDC_TO_DELAY:1.0 TDC_TO_DELAY_0 ]

  # Create instance: delay_0, and set properties
  set delay_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:delay:1.0 delay_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net DELAY_AXI_1 [get_bd_intf_ports DELAY_AXI] [get_bd_intf_pins delay_0/DELAY_AXI]

  # Create port connections
  connect_bd_net -net DELAY_OUT_0_ch1 [get_bd_ports ch1] [get_bd_pins DELAY_OUT_0/ch1]
  connect_bd_net -net DELAY_OUT_0_out_1 [get_bd_ports out_1] [get_bd_pins DELAY_OUT_0/out_1]
  connect_bd_net -net DELAY_OUT_0_out_2 [get_bd_ports out_2] [get_bd_pins DELAY_OUT_0/out_2]
  connect_bd_net -net DELAY_OUT_0_out_3 [get_bd_ports out_3] [get_bd_pins DELAY_OUT_0/out_3]
  connect_bd_net -net DELAY_OUT_0_out_4 [get_bd_ports out_4] [get_bd_pins DELAY_OUT_0/out_4]
  connect_bd_net -net DELAY_OUT_0_tstart [get_bd_ports tstart] [get_bd_pins DELAY_OUT_0/tstart]
  connect_bd_net -net TDC_TO_DELAY_0_data_out_flag [get_bd_pins DELAY_OUT_0/tdc_data_flag] [get_bd_pins TDC_TO_DELAY_0/data_out_flag]
  connect_bd_net -net TDC_TO_DELAY_0_delaydata [get_bd_pins DELAY_OUT_0/tdc_data] [get_bd_pins TDC_TO_DELAY_0/delaydata]
  connect_bd_net -net data_flag_1 [get_bd_ports data_flag] [get_bd_pins TDC_TO_DELAY_0/data_flag]
  connect_bd_net -net delay_0_init_wr [get_bd_pins DELAY_OUT_0/init] [get_bd_pins delay_0/init_wr]
  connect_bd_net -net delay_0_out_1_delay [get_bd_pins DELAY_OUT_0/delay_1] [get_bd_pins delay_0/out_1_delay]
  connect_bd_net -net delay_0_out_1_width [get_bd_pins DELAY_OUT_0/out_1_width] [get_bd_pins delay_0/out_1_width]
  connect_bd_net -net delay_0_out_2_delay [get_bd_pins DELAY_OUT_0/delay_2] [get_bd_pins delay_0/out_2_delay]
  connect_bd_net -net delay_0_out_2_width [get_bd_pins DELAY_OUT_0/out_2_width] [get_bd_pins delay_0/out_2_width]
  connect_bd_net -net delay_0_out_3_delay [get_bd_pins DELAY_OUT_0/delay_3] [get_bd_pins delay_0/out_3_delay]
  connect_bd_net -net delay_0_out_3_width [get_bd_pins DELAY_OUT_0/out_3_width] [get_bd_pins delay_0/out_3_width]
  connect_bd_net -net delay_0_out_4_delay [get_bd_pins DELAY_OUT_0/delay_4] [get_bd_pins delay_0/out_4_delay]
  connect_bd_net -net delay_0_out_4_width [get_bd_pins DELAY_OUT_0/out_4_width] [get_bd_pins delay_0/out_4_width]
  connect_bd_net -net delay_0_tstart_cycle [get_bd_pins DELAY_OUT_0/cycle] [get_bd_pins delay_0/tstart_cycle]
  connect_bd_net -net delay_0_tstart_width [get_bd_pins DELAY_OUT_0/tstart_width] [get_bd_pins delay_0/tstart_width]
  connect_bd_net -net delay_axi_aclk_1 [get_bd_ports delay_axi_aclk] [get_bd_pins DELAY_OUT_0/clk] [get_bd_pins TDC_TO_DELAY_0/clk] [get_bd_pins delay_0/delay_axi_aclk]
  connect_bd_net -net delay_axi_aresetn_1 [get_bd_ports delay_axi_aresetn] [get_bd_pins DELAY_OUT_0/resetn] [get_bd_pins TDC_TO_DELAY_0/resetn] [get_bd_pins delay_0/delay_axi_aresetn]
  connect_bd_net -net timedata_1 [get_bd_ports timedata] [get_bd_pins TDC_TO_DELAY_0/timedata]
  connect_bd_net -net tstart_count_1 [get_bd_ports tstart_count] [get_bd_pins DELAY_OUT_0/tstart_count]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.12  2016-01-29 bk=1.3547 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port delay_axi_aresetn -pg 1 -y 80 -defaultsOSRD
preplace port ch1 -pg 1 -y 270 -defaultsOSRD
preplace port tstart -pg 1 -y 180 -defaultsOSRD
preplace port out_1 -pg 1 -y 200 -defaultsOSRD
preplace port data_flag -pg 1 -y 130 -defaultsOSRD
preplace port out_2 -pg 1 -y 220 -defaultsOSRD
preplace port out_3 -pg 1 -y 240 -defaultsOSRD
preplace port DELAY_AXI -pg 1 -y 300 -defaultsOSRD
preplace port out_4 -pg 1 -y 290 -defaultsOSRD
preplace port delay_axi_aclk -pg 1 -y 20 -defaultsOSRD
preplace portBus tstart_count -pg 1 -y 110 -defaultsOSRD
preplace portBus timedata -pg 1 -y 60 -defaultsOSRD
preplace inst delay_0 -pg 1 -lvl 1 -y 330 -defaultsOSRD
preplace inst TDC_TO_DELAY_0 -pg 1 -lvl 1 -y 90 -defaultsOSRD
preplace inst DELAY_OUT_0 -pg 1 -lvl 2 -y 220 -defaultsOSRD
preplace netloc DELAY_OUT_0_out_3 1 2 1 NJ
preplace netloc DELAY_OUT_0_out_4 1 2 1 NJ
preplace netloc delay_0_out_1_width 1 1 1 360
preplace netloc delay_0_out_1_delay 1 1 1 N
preplace netloc delay_0_tstart_width 1 1 1 400
preplace netloc delay_0_out_2_delay 1 1 1 350
preplace netloc delay_axi_aclk_1 1 0 2 30 170 330
preplace netloc delay_0_out_4_width 1 1 1 N
preplace netloc delay_0_out_4_delay 1 1 1 330
preplace netloc delay_0_init_wr 1 1 1 380
preplace netloc delay_axi_aresetn_1 1 0 2 40 180 340
preplace netloc TDC_TO_DELAY_0_delaydata 1 1 1 370
preplace netloc delay_0_out_2_width 1 1 1 390
preplace netloc delay_0_tstart_cycle 1 1 1 370
preplace netloc data_flag_1 1 0 1 NJ
preplace netloc tstart_count_1 1 0 2 NJ 10 NJ
preplace netloc DELAY_OUT_0_tstart 1 2 1 NJ
preplace netloc delay_0_out_3_width 1 1 1 410
preplace netloc delay_0_out_3_delay 1 1 1 340
preplace netloc DELAY_AXI_1 1 0 1 NJ
preplace netloc DELAY_OUT_0_out_1 1 2 1 NJ
preplace netloc timedata_1 1 0 1 NJ
preplace netloc DELAY_OUT_0_ch1 1 2 1 N
preplace netloc DELAY_OUT_0_out_2 1 2 1 NJ
preplace netloc TDC_TO_DELAY_0_data_out_flag 1 1 1 400
levelinfo -pg 1 -10 190 520 650 -top 0 -bot 480
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


