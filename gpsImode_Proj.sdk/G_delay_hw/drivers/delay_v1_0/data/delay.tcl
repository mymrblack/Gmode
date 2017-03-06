

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "delay" "NUM_INSTANCES" "DEVICE_ID"  "C_DELAY_AXI_BASEADDR" "C_DELAY_AXI_HIGHADDR"
}
