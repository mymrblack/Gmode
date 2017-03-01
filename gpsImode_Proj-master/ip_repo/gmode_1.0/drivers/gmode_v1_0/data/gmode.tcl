

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "gmode" "NUM_INSTANCES" "DEVICE_ID"  "C_TDC_AXI_BASEADDR" "C_TDC_AXI_HIGHADDR"
}
