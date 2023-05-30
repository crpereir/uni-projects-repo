transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/ring_controller.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/dec.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/reg.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/mux.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/key_scan.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/key_decode.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/counter.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/clkdiv.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/adder.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/key_control.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/fulladder.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/FFD.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/keyboard_reader.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/UsbPort.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/accessControlSystem.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/serial_receiver.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/shift_register.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/serial_control.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/SLCDC.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/dispatcher.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/door_controller.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/SDC.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/RAM.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/MAC.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/ringbuffer.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/outputbuffer.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/buffercontroller.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/mac_counter.vhd}
vcom -93 -work work {C:/Users/Public/projeto-lic/hardware/mux2x1.vhd}

