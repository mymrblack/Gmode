

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "Status" "NUM_INSTANCES" "DEVICE_ID"  "C_STATUS_AXI_BASEADDR" "C_STATUS_AXI_HIGHADDR"
}
