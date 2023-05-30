-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "05/28/2023 20:29:51"

-- 
-- Device: Altera 10M50DAF484C6GES Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	accessControlSystem IS
    PORT (
	altera_reserved_tms : IN std_logic := '0';
	altera_reserved_tck : IN std_logic := '0';
	altera_reserved_tdi : IN std_logic := '0';
	altera_reserved_tdo : OUT std_logic;
	Mclk : IN std_logic;
	reset : IN std_logic;
	Lines : IN std_logic_vector(3 DOWNTO 0);
	sopen : IN std_logic;
	sclose : IN std_logic;
	psensor : IN std_logic;
	M : IN std_logic;
	Columns : OUT std_logic_vector(2 DOWNTO 0);
	rs : OUT std_logic;
	en : OUT std_logic;
	data : OUT std_logic_vector(7 DOWNTO 4);
	D : OUT std_logic_vector(3 DOWNTO 0);
	V : OUT std_logic_vector(3 DOWNTO 0);
	leds : OUT std_logic_vector(5 DOWNTO 0);
	openclose : OUT std_logic;
	onoff : OUT std_logic
	);
END accessControlSystem;

-- Design Ports Information
-- Columns[0]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Columns[1]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Columns[2]	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- en	=>  Location: PIN_V5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[4]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[5]	=>  Location: PIN_Y20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[6]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[7]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[0]	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[1]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[2]	=>  Location: PIN_Y8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[3]	=>  Location: PIN_Y7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V[0]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V[1]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V[2]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V[3]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[0]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[1]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[2]	=>  Location: PIN_V12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[3]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[4]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[5]	=>  Location: PIN_H11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- openclose	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- onoff	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- M	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Lines[2]	=>  Location: PIN_W12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Lines[0]	=>  Location: PIN_W5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Lines[3]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Lines[1]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sopen	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- psensor	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sclose	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Mclk	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- altera_reserved_tms	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- altera_reserved_tck	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- altera_reserved_tdi	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- altera_reserved_tdo	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF accessControlSystem IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_altera_reserved_tms : std_logic;
SIGNAL ww_altera_reserved_tck : std_logic;
SIGNAL ww_altera_reserved_tdi : std_logic;
SIGNAL ww_altera_reserved_tdo : std_logic;
SIGNAL ww_Mclk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_Lines : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_sopen : std_logic;
SIGNAL ww_sclose : std_logic;
SIGNAL ww_psensor : std_logic;
SIGNAL ww_M : std_logic;
SIGNAL ww_Columns : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_rs : std_logic;
SIGNAL ww_en : std_logic;
SIGNAL ww_data : std_logic_vector(7 DOWNTO 4);
SIGNAL ww_D : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_V : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_leds : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_openclose : std_logic;
SIGNAL ww_onoff : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \rtl~2clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|tmp~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~1clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_SLCDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~5clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_SDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \altera_internal_jtag~TCKUTAPclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_SDC|u_clkdiv|tmp~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~7clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~4clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Mclk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~3clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rtl~6clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][6]~q\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][7]~q\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena~1_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_proc~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena~2_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena~3_combout\ : std_logic;
SIGNAL \auto_hub|~GND~combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~_wirecell_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~_wirecell_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][6]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][7]~feeder_combout\ : std_logic;
SIGNAL \Mclk~input_o\ : std_logic;
SIGNAL \Mclk~inputclkctrl_outclk\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|count[0]~5_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~1\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~2_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Equal0~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~3\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~4_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~5\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~6_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|count~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~7\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~8_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~9\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~10_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~11\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~12_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~13\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~14_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|count~1_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Equal0~1_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Equal0~2_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~15\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~16_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|count~2_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~17\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~18_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|count~3_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~19\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~20_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~21\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~22_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~23\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~24_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|count~4_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~25\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~26_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~27\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~28_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~29\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~30_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Equal0~4_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~31\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~32_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~33\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~34_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~35\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~36_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~37\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~38_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~39\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~40_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~41\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~42_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~43\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~44_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~45\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~46_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~47\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~48_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~49\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~50_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~51\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~52_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~53\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~54_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Equal0~7_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Equal0~5_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Equal0~6_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~55\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~56_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~57\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~58_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~59\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~60_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~61\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Add0~62_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Equal0~8_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Equal0~9_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Equal0~3_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|Equal0~10_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|tmp~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|tmp~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|tmp~clkctrl_outclk\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~1_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\ : std_logic;
SIGNAL \Lines[0]~input_o\ : std_logic;
SIGNAL \Lines[2]~input_o\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\ : std_logic;
SIGNAL \Lines[1]~input_o\ : std_logic;
SIGNAL \Lines[3]~input_o\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~1_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~2_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_1~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_1~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_control|currentState.STATE_PRESSING~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder1|S~combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD1|Q~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder2|S~combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD2|Q~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder2|Cout~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder3|S~combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD3|Q~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~1_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~2_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|ce_s~combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|full~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_READING~0_combout\ : std_logic;
SIGNAL \altera_reserved_tms~input_o\ : std_logic;
SIGNAL \altera_reserved_tck~input_o\ : std_logic;
SIGNAL \altera_reserved_tdi~input_o\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~7_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~11_combout\ : std_logic;
SIGNAL \altera_internal_jtag~TMSUTAP\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_proc~1_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~9_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~10_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~11_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~12_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~13_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_dr_scan_proc~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[15]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt~1_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt~2_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~1_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~2_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~3_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~4_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~5_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~6_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~7_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~8_combout\ : std_logic;
SIGNAL \altera_internal_jtag~TDIUTAP\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[9]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[7]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[6]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[4]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[3]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2]~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[1]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0]~1_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal0~1_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal0~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal1~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~19_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal0~2_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~12_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~8\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~9_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~10\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~13_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~14\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]~15_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]~16\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~17_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~4_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~5_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~feeder_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ring_controller|sel_pg~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD0|Q~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD0|Q~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD1|Q~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD1|Q~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_PUT~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD0|Q~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD0|Q~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD1|Q~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD1|Q~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD2|Q~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD2|Q~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD2|Q~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD2|Q~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\ : std_logic;
SIGNAL \rtl~1_combout\ : std_logic;
SIGNAL \rtl~1clkctrl_outclk\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~5_combout\ : std_logic;
SIGNAL \rtl~2_combout\ : std_logic;
SIGNAL \rtl~2clkctrl_outclk\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~1_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~39_combout\ : std_logic;
SIGNAL \rtl~0_combout\ : std_logic;
SIGNAL \rtl~0clkctrl_outclk\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~9_combout\ : std_logic;
SIGNAL \rtl~3_combout\ : std_logic;
SIGNAL \rtl~3clkctrl_outclk\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~13_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~40_combout\ : std_logic;
SIGNAL \rtl~6_combout\ : std_logic;
SIGNAL \rtl~6clkctrl_outclk\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~17_combout\ : std_logic;
SIGNAL \rtl~5_combout\ : std_logic;
SIGNAL \rtl~5clkctrl_outclk\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~25_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~37_combout\ : std_logic;
SIGNAL \rtl~7_combout\ : std_logic;
SIGNAL \rtl~7clkctrl_outclk\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~29_combout\ : std_logic;
SIGNAL \rtl~4_combout\ : std_logic;
SIGNAL \rtl~4clkctrl_outclk\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~21_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~38_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~41_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.STATE_REGISTERING~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_outputbuffer|u_OutputRegister|u_FFD1|Q~q\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~5_combout\ : std_logic;
SIGNAL \~QIC_CREATED_GND~I_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~4_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~34_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~8_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~12_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~35_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~20_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~16_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~24_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~32_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~28_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~33_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~36_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_outputbuffer|u_OutputRegister|u_FFD0|Q~q\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~3_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg_proc~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[0]~6_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[0]~7_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~1_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~2_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.STATE_CONSUME~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~2_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~1_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~3_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~4_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg~q\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~5_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg_proc~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~7_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~8_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~10_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~14_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~6_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~2_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~44_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~45_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~18_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~26_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~42_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~22_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~30_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~43_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~46_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_outputbuffer|u_OutputRegister|u_FFD2|Q~q\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~13_combout\ : std_logic;
SIGNAL \M~input_o\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~12_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~1_cout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~2_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|count~0_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~3\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~4_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~5\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~6_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|count~1_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~7\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~8_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|count~2_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~9\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~10_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|count~3_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~11\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~12_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|count~4_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~13\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~14_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|count~5_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~15\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~16_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~17\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~18_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~19\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~20_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Equal0~2_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~21\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~22_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~23\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~24_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~25\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~26_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~27\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~28_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~29\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~30_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~31\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~32_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~33\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~34_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~35\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~36_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~37\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~38_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~39\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~40_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~41\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~42_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~43\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~44_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~45\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~46_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~47\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~48_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~49\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~50_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~51\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~52_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Equal0~6_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~53\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~54_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~55\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~56_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~57\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~58_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~59\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Add0~60_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Equal0~7_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Equal0~5_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Equal0~4_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Equal0~8_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Equal0~3_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Equal0~0_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Equal0~1_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|Equal0~9_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|tmp~0_combout\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|tmp~q\ : std_logic;
SIGNAL \u_SDC|u_clkdiv|tmp~clkctrl_outclk\ : std_logic;
SIGNAL \sclose~input_o\ : std_logic;
SIGNAL \sopen~input_o\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~q\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1]~q\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_shift_register|u_ffd0|Q~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][5]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][5]~q\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~0_combout\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~0_combout\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0_combout\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0clkctrl_outclk\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~0_combout\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~0_combout\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~q\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~1_combout\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~2_combout\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_serial_control|wr~0_combout\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_shift_register|u_ffd0|Q~q\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_shift_register|u_ffd1|Q~feeder_combout\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_shift_register|u_ffd1|Q~q\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_shift_register|u_ffd2|Q~feeder_combout\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_shift_register|u_ffd2|Q~q\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_shift_register|u_ffd3|Q~feeder_combout\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_shift_register|u_ffd3|Q~q\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_shift_register|u_ffd4|Q~feeder_combout\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_shift_register|u_ffd4|Q~q\ : std_logic;
SIGNAL \psensor~input_o\ : std_logic;
SIGNAL \u_SDC|u_door_controller|currentState.state_bit_1~0_combout\ : std_logic;
SIGNAL \u_SDC|u_door_controller|currentState.state_bit_0~3_combout\ : std_logic;
SIGNAL \u_SDC|u_door_controller|currentState.state_bit_1~1_combout\ : std_logic;
SIGNAL \u_SDC|u_door_controller|currentState.state_bit_1~q\ : std_logic;
SIGNAL \u_SDC|u_door_controller|currentState.state_bit_0~0_combout\ : std_logic;
SIGNAL \u_SDC|u_door_controller|currentState.state_bit_0~1_combout\ : std_logic;
SIGNAL \u_SDC|u_door_controller|currentState.state_bit_0~2_combout\ : std_logic;
SIGNAL \u_SDC|u_door_controller|currentState.state_bit_0~q\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~0_combout\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~1_combout\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~2_combout\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~11_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~15_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~11_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~7_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~3_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~49_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~50_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~31_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~23_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~19_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~27_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~47_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~48_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ram|ram~51_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_outputbuffer|u_OutputRegister|u_FFD3|Q~q\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~10_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~6_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~9_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~4_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~1_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[2]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[1]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[0]~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~6_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~7_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[1]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~14_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~15_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~8_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[1]~1_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[2]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~10_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~9_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~11_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~2_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~12_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~13_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[3]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[3]~3_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_proc~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg_ena~combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~7_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~8_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg~3_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg_ena~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg~2_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg~1_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~9_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|clear_signal~combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3]~17\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[4]~18_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~20_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~5_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~13_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~10\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~11_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~12\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2]~14_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2]~15\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3]~16_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~8_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~9_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~6_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~12_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~13_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~14_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[0]~15_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~10_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~11_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~7_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~4_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~5_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~6_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~2_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~q\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~1_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~3_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~4_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~9_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~q\ : std_logic;
SIGNAL \altera_internal_jtag~TCKUTAP\ : std_logic;
SIGNAL \altera_internal_jtag~TCKUTAPclkctrl_outclk\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ring_controller|nextState.STATE_SET_GET~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ring_controller|nextState.STATE_SET_GET~1_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~1_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_DAC~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~q\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~0_combout\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd0|Q~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~q\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~0_combout\ : std_logic;
SIGNAL \u_SLCDC|u_dispatcher|currentState.state_bit_0~0_combout\ : std_logic;
SIGNAL \u_SLCDC|u_dispatcher|currentState.state_bit_0~q\ : std_logic;
SIGNAL \u_SLCDC|u_dispatcher|currentState.state_bit_1~0_combout\ : std_logic;
SIGNAL \u_SLCDC|u_dispatcher|currentState.state_bit_1~q\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~0_combout\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~1_combout\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0_combout\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0clkctrl_outclk\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~0_combout\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~0_combout\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~q\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~0_combout\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~1_combout\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~2_combout\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_serial_control|wr~0_combout\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd0|Q~q\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd1|Q~feeder_combout\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd1|Q~q\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd2|Q~feeder_combout\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd2|Q~q\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd3|Q~feeder_combout\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd3|Q~q\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd4|Q~feeder_combout\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd4|Q~q\ : std_logic;
SIGNAL \u_SLCDC|u_dispatcher|currentState.STATE_WAITING~0_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][4]~feeder_combout\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][4]~q\ : std_logic;
SIGNAL \u_SDC|u_door_controller|currentState.STATE_OPEN~0_combout\ : std_logic;
SIGNAL \altera_internal_jtag~TDO\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_scan|u_dec|CL\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \u_keyboard_reader|u_key_decode|u_clk|count\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \u_SDC|u_clkdiv|count\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|splitter_nodes_receive_0\ : std_logic_vector(30 DOWNTO 0);
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_altera_internal_jtag~TCKUTAPclkctrl_outclk\ : std_logic;
SIGNAL \u_SDC|u_serial_receiver|u_serial_control|ALT_INV_currentState.STATE_CLEAR~0clkctrl_outclk\ : std_logic;
SIGNAL \u_SLCDC|u_serial_receiver|u_serial_control|ALT_INV_currentState.STATE_CLEAR~0clkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\ : std_logic;
SIGNAL \ALT_INV_altera_internal_jtag~TMSUTAP\ : std_logic;
SIGNAL \u_keyboard_reader|u_key_decode|u_key_scan|u_dec|ALT_INV_CL\ : std_logic_vector(2 DOWNTO 1);

BEGIN

ww_altera_reserved_tms <= altera_reserved_tms;
ww_altera_reserved_tck <= altera_reserved_tck;
ww_altera_reserved_tdi <= altera_reserved_tdi;
altera_reserved_tdo <= ww_altera_reserved_tdo;
ww_Mclk <= Mclk;
ww_reset <= reset;
ww_Lines <= Lines;
ww_sopen <= sopen;
ww_sclose <= sclose;
ww_psensor <= psensor;
ww_M <= M;
Columns <= ww_Columns;
rs <= ww_rs;
en <= ww_en;
data <= ww_data;
D <= ww_D;
V <= ww_V;
leds <= ww_leds;
openclose <= ww_openclose;
onoff <= ww_onoff;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\rtl~2clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~2_combout\);

\rtl~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~0_combout\);

\u_keyboard_reader|u_key_decode|u_clk|tmp~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \u_keyboard_reader|u_key_decode|u_clk|tmp~q\);

\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & 
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~q\);

\rtl~1clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~1_combout\);

\u_SLCDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \u_SLCDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0_combout\);

\rtl~5clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~5_combout\);

\u_SDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \u_SDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0_combout\);

\altera_internal_jtag~TCKUTAPclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \altera_internal_jtag~TCKUTAP\);

\u_SDC|u_clkdiv|tmp~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \u_SDC|u_clkdiv|tmp~q\);

\rtl~7clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~7_combout\);

\rtl~4clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~4_combout\);

\Mclk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Mclk~input_o\);

\rtl~3clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~3_combout\);

\rtl~6clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rtl~6_combout\);
\ALT_INV_altera_internal_jtag~TCKUTAPclkctrl_outclk\ <= NOT \altera_internal_jtag~TCKUTAPclkctrl_outclk\;
\u_SDC|u_serial_receiver|u_serial_control|ALT_INV_currentState.STATE_CLEAR~0clkctrl_outclk\ <= NOT \u_SDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0clkctrl_outclk\;
\u_SLCDC|u_serial_receiver|u_serial_control|ALT_INV_currentState.STATE_CLEAR~0clkctrl_outclk\ <= NOT \u_SLCDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0clkctrl_outclk\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\ <= NOT \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q\;
\ALT_INV_altera_internal_jtag~TMSUTAP\ <= NOT \altera_internal_jtag~TMSUTAP\;
\u_keyboard_reader|u_key_decode|u_key_scan|u_dec|ALT_INV_CL\(2) <= NOT \u_keyboard_reader|u_key_decode|u_key_scan|u_dec|CL\(2);
\u_keyboard_reader|u_key_decode|u_key_scan|u_dec|ALT_INV_CL\(1) <= NOT \u_keyboard_reader|u_key_decode|u_key_scan|u_dec|CL\(1);

-- Location: FF_X46_Y40_N13
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|splitter_nodes_receive_0[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena~3_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|splitter_nodes_receive_0\(3));

-- Location: LCCOMB_X45_Y40_N28
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	datab => \altera_internal_jtag~TDIUTAP\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(8),
	datad => \altera_internal_jtag~TMSUTAP\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena~0_combout\);

-- Location: LCCOMB_X45_Y40_N22
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena~1\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \altera_internal_jtag~TMSUTAP\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg\(1),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(2),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena~0_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena~1_combout\);

-- Location: LCCOMB_X46_Y40_N6
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_proc~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \altera_internal_jtag~TMSUTAP\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_proc~0_combout\);

-- Location: LCCOMB_X46_Y40_N24
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena~2\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_proc~0_combout\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(15),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena~2_combout\);

-- Location: LCCOMB_X46_Y40_N12
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena~3\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena~1_combout\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena~2_combout\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|splitter_nodes_receive_0\(3),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_proc~1_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena~3_combout\);

-- Location: LCCOMB_X44_Y49_N8
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: LCCOMB_X44_Y42_N0
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][6]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(6),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][6]~feeder_combout\);

-- Location: LCCOMB_X44_Y42_N14
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][7]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(7),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][7]~feeder_combout\);

-- Location: IOOBUF_X38_Y0_N9
\Columns[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_keyboard_reader|u_key_decode|u_key_scan|u_dec|CL\(0),
	devoe => ww_devoe,
	o => ww_Columns(0));

-- Location: IOOBUF_X38_Y0_N16
\Columns[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_keyboard_reader|u_key_decode|u_key_scan|u_dec|ALT_INV_CL\(1),
	devoe => ww_devoe,
	o => ww_Columns(1));

-- Location: IOOBUF_X34_Y0_N23
\Columns[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_keyboard_reader|u_key_decode|u_key_scan|u_dec|ALT_INV_CL\(2),
	devoe => ww_devoe,
	o => ww_Columns(2));

-- Location: IOOBUF_X24_Y0_N2
\rs~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd4|Q~q\,
	devoe => ww_devoe,
	o => ww_rs);

-- Location: IOOBUF_X14_Y0_N9
\en~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SLCDC|u_dispatcher|currentState.STATE_WAITING~0_combout\,
	devoe => ww_devoe,
	o => ww_en);

-- Location: IOOBUF_X36_Y39_N30
\data[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][4]~q\,
	devoe => ww_devoe,
	o => ww_data(4));

-- Location: IOOBUF_X78_Y16_N9
\data[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_data(5));

-- Location: IOOBUF_X78_Y44_N16
\data[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_data(6));

-- Location: IOOBUF_X49_Y0_N2
\data[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_data(7));

-- Location: IOOBUF_X36_Y0_N9
\D[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd3|Q~q\,
	devoe => ww_devoe,
	o => ww_D(0));

-- Location: IOOBUF_X34_Y0_N2
\D[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd2|Q~q\,
	devoe => ww_devoe,
	o => ww_D(1));

-- Location: IOOBUF_X20_Y0_N2
\D[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd1|Q~q\,
	devoe => ww_devoe,
	o => ww_D(2));

-- Location: IOOBUF_X20_Y0_N9
\D[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd0|Q~q\,
	devoe => ww_devoe,
	o => ww_D(3));

-- Location: IOOBUF_X46_Y54_N2
\V[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SDC|u_serial_receiver|u_shift_register|u_ffd3|Q~q\,
	devoe => ww_devoe,
	o => ww_V(0));

-- Location: IOOBUF_X46_Y54_N23
\V[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SDC|u_serial_receiver|u_shift_register|u_ffd2|Q~q\,
	devoe => ww_devoe,
	o => ww_V(1));

-- Location: IOOBUF_X51_Y54_N16
\V[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SDC|u_serial_receiver|u_shift_register|u_ffd1|Q~q\,
	devoe => ww_devoe,
	o => ww_V(2));

-- Location: IOOBUF_X46_Y54_N9
\V[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SDC|u_serial_receiver|u_shift_register|u_ffd0|Q~q\,
	devoe => ww_devoe,
	o => ww_V(3));

-- Location: IOOBUF_X40_Y0_N16
\leds[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd3|Q~q\,
	devoe => ww_devoe,
	o => ww_leds(0));

-- Location: IOOBUF_X36_Y39_N16
\leds[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd2|Q~q\,
	devoe => ww_devoe,
	o => ww_leds(1));

-- Location: IOOBUF_X38_Y0_N23
\leds[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd1|Q~q\,
	devoe => ww_devoe,
	o => ww_leds(2));

-- Location: IOOBUF_X22_Y0_N23
\leds[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd0|Q~q\,
	devoe => ww_devoe,
	o => ww_leds(3));

-- Location: IOOBUF_X34_Y39_N23
\leds[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd4|Q~q\,
	devoe => ww_devoe,
	o => ww_leds(4));

-- Location: IOOBUF_X34_Y39_N16
\leds[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SLCDC|u_dispatcher|currentState.STATE_WAITING~0_combout\,
	devoe => ww_devoe,
	o => ww_leds(5));

-- Location: IOOBUF_X56_Y54_N30
\openclose~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SDC|u_door_controller|currentState.STATE_OPEN~0_combout\,
	devoe => ww_devoe,
	o => ww_openclose);

-- Location: IOOBUF_X58_Y54_N23
\onoff~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SDC|u_door_controller|currentState.state_bit_0~q\,
	devoe => ww_devoe,
	o => ww_onoff);

-- Location: IOOBUF_X0_Y28_N23
\altera_reserved_tdo~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altera_internal_jtag~TDO\,
	devoe => ww_devoe,
	o => ww_altera_reserved_tdo);

-- Location: IOIBUF_X34_Y0_N29
\Mclk~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mclk,
	o => \Mclk~input_o\);

-- Location: CLKCTRL_G19
\Mclk~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Mclk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Mclk~inputclkctrl_outclk\);

-- Location: LCCOMB_X22_Y25_N0
\u_keyboard_reader|u_key_decode|u_clk|Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~0_combout\ = \u_keyboard_reader|u_key_decode|u_clk|count\(0) $ (GND)
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~1\ = CARRY(!\u_keyboard_reader|u_key_decode|u_clk|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(0),
	datad => VCC,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~0_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~1\);

-- Location: LCCOMB_X21_Y27_N8
\u_keyboard_reader|u_key_decode|u_clk|count[0]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|count[0]~5_combout\ = !\u_keyboard_reader|u_key_decode|u_clk|Add0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_keyboard_reader|u_key_decode|u_clk|Add0~0_combout\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|count[0]~5_combout\);

-- Location: FF_X21_Y27_N9
\u_keyboard_reader|u_key_decode|u_clk|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|count[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(0));

-- Location: LCCOMB_X22_Y25_N2
\u_keyboard_reader|u_key_decode|u_clk|Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~2_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(1) & (!\u_keyboard_reader|u_key_decode|u_clk|Add0~1\)) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(1) & 
-- ((\u_keyboard_reader|u_key_decode|u_clk|Add0~1\) # (GND)))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~3\ = CARRY((!\u_keyboard_reader|u_key_decode|u_clk|Add0~1\) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(1),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~1\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~2_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~3\);

-- Location: FF_X22_Y25_N3
\u_keyboard_reader|u_key_decode|u_clk|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(1));

-- Location: LCCOMB_X23_Y25_N18
\u_keyboard_reader|u_key_decode|u_clk|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Equal0~0_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(0) & !\u_keyboard_reader|u_key_decode|u_clk|count\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_keyboard_reader|u_key_decode|u_clk|count\(0),
	datad => \u_keyboard_reader|u_key_decode|u_clk|count\(1),
	combout => \u_keyboard_reader|u_key_decode|u_clk|Equal0~0_combout\);

-- Location: LCCOMB_X22_Y25_N4
\u_keyboard_reader|u_key_decode|u_clk|Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~4_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(2) & (\u_keyboard_reader|u_key_decode|u_clk|Add0~3\ $ (GND))) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(2) & 
-- (!\u_keyboard_reader|u_key_decode|u_clk|Add0~3\ & VCC))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~5\ = CARRY((\u_keyboard_reader|u_key_decode|u_clk|count\(2) & !\u_keyboard_reader|u_key_decode|u_clk|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(2),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~3\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~4_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~5\);

-- Location: FF_X22_Y25_N5
\u_keyboard_reader|u_key_decode|u_clk|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(2));

-- Location: LCCOMB_X22_Y25_N6
\u_keyboard_reader|u_key_decode|u_clk|Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~6_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(3) & (!\u_keyboard_reader|u_key_decode|u_clk|Add0~5\)) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(3) & 
-- ((\u_keyboard_reader|u_key_decode|u_clk|Add0~5\) # (GND)))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~7\ = CARRY((!\u_keyboard_reader|u_key_decode|u_clk|Add0~5\) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(3),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~5\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~6_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~7\);

-- Location: LCCOMB_X23_Y25_N4
\u_keyboard_reader|u_key_decode|u_clk|count~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|count~0_combout\ = (!\u_keyboard_reader|u_key_decode|u_clk|Equal0~10_combout\ & \u_keyboard_reader|u_key_decode|u_clk|Add0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|Equal0~10_combout\,
	datac => \u_keyboard_reader|u_key_decode|u_clk|Add0~6_combout\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|count~0_combout\);

-- Location: FF_X23_Y25_N5
\u_keyboard_reader|u_key_decode|u_clk|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(3));

-- Location: LCCOMB_X22_Y25_N8
\u_keyboard_reader|u_key_decode|u_clk|Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~8_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(4) & (\u_keyboard_reader|u_key_decode|u_clk|Add0~7\ $ (GND))) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(4) & 
-- (!\u_keyboard_reader|u_key_decode|u_clk|Add0~7\ & VCC))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~9\ = CARRY((\u_keyboard_reader|u_key_decode|u_clk|count\(4) & !\u_keyboard_reader|u_key_decode|u_clk|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(4),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~7\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~8_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~9\);

-- Location: FF_X22_Y25_N9
\u_keyboard_reader|u_key_decode|u_clk|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(4));

-- Location: LCCOMB_X22_Y25_N10
\u_keyboard_reader|u_key_decode|u_clk|Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~10_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(5) & (!\u_keyboard_reader|u_key_decode|u_clk|Add0~9\)) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(5) & 
-- ((\u_keyboard_reader|u_key_decode|u_clk|Add0~9\) # (GND)))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~11\ = CARRY((!\u_keyboard_reader|u_key_decode|u_clk|Add0~9\) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(5),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~9\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~10_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~11\);

-- Location: FF_X22_Y25_N11
\u_keyboard_reader|u_key_decode|u_clk|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(5));

-- Location: LCCOMB_X22_Y25_N12
\u_keyboard_reader|u_key_decode|u_clk|Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~12_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(6) & (\u_keyboard_reader|u_key_decode|u_clk|Add0~11\ $ (GND))) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(6) & 
-- (!\u_keyboard_reader|u_key_decode|u_clk|Add0~11\ & VCC))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~13\ = CARRY((\u_keyboard_reader|u_key_decode|u_clk|count\(6) & !\u_keyboard_reader|u_key_decode|u_clk|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(6),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~11\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~12_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~13\);

-- Location: FF_X22_Y25_N13
\u_keyboard_reader|u_key_decode|u_clk|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(6));

-- Location: LCCOMB_X22_Y25_N14
\u_keyboard_reader|u_key_decode|u_clk|Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~14_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(7) & (!\u_keyboard_reader|u_key_decode|u_clk|Add0~13\)) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(7) & 
-- ((\u_keyboard_reader|u_key_decode|u_clk|Add0~13\) # (GND)))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~15\ = CARRY((!\u_keyboard_reader|u_key_decode|u_clk|Add0~13\) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(7),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~13\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~14_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~15\);

-- Location: LCCOMB_X23_Y25_N30
\u_keyboard_reader|u_key_decode|u_clk|count~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|count~1_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|Add0~14_combout\ & !\u_keyboard_reader|u_key_decode|u_clk|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|Add0~14_combout\,
	datac => \u_keyboard_reader|u_key_decode|u_clk|Equal0~10_combout\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|count~1_combout\);

-- Location: FF_X23_Y25_N31
\u_keyboard_reader|u_key_decode|u_clk|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(7));

-- Location: LCCOMB_X23_Y25_N16
\u_keyboard_reader|u_key_decode|u_clk|Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Equal0~1_combout\ = (!\u_keyboard_reader|u_key_decode|u_clk|count\(6) & (!\u_keyboard_reader|u_key_decode|u_clk|count\(5) & (\u_keyboard_reader|u_key_decode|u_clk|count\(7) & 
-- !\u_keyboard_reader|u_key_decode|u_clk|count\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(6),
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(5),
	datac => \u_keyboard_reader|u_key_decode|u_clk|count\(7),
	datad => \u_keyboard_reader|u_key_decode|u_clk|count\(4),
	combout => \u_keyboard_reader|u_key_decode|u_clk|Equal0~1_combout\);

-- Location: LCCOMB_X23_Y25_N10
\u_keyboard_reader|u_key_decode|u_clk|Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Equal0~2_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|Equal0~0_combout\ & (!\u_keyboard_reader|u_key_decode|u_clk|count\(2) & (\u_keyboard_reader|u_key_decode|u_clk|count\(3) & 
-- \u_keyboard_reader|u_key_decode|u_clk|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|Equal0~0_combout\,
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(2),
	datac => \u_keyboard_reader|u_key_decode|u_clk|count\(3),
	datad => \u_keyboard_reader|u_key_decode|u_clk|Equal0~1_combout\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Equal0~2_combout\);

-- Location: LCCOMB_X22_Y25_N16
\u_keyboard_reader|u_key_decode|u_clk|Add0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~16_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(8) & (\u_keyboard_reader|u_key_decode|u_clk|Add0~15\ $ (GND))) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(8) & 
-- (!\u_keyboard_reader|u_key_decode|u_clk|Add0~15\ & VCC))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~17\ = CARRY((\u_keyboard_reader|u_key_decode|u_clk|count\(8) & !\u_keyboard_reader|u_key_decode|u_clk|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(8),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~15\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~16_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~17\);

-- Location: LCCOMB_X23_Y25_N20
\u_keyboard_reader|u_key_decode|u_clk|count~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|count~2_combout\ = (!\u_keyboard_reader|u_key_decode|u_clk|Equal0~10_combout\ & \u_keyboard_reader|u_key_decode|u_clk|Add0~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|Equal0~10_combout\,
	datac => \u_keyboard_reader|u_key_decode|u_clk|Add0~16_combout\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|count~2_combout\);

-- Location: FF_X23_Y25_N21
\u_keyboard_reader|u_key_decode|u_clk|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(8));

-- Location: LCCOMB_X22_Y25_N18
\u_keyboard_reader|u_key_decode|u_clk|Add0~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~18_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(9) & (!\u_keyboard_reader|u_key_decode|u_clk|Add0~17\)) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(9) & 
-- ((\u_keyboard_reader|u_key_decode|u_clk|Add0~17\) # (GND)))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~19\ = CARRY((!\u_keyboard_reader|u_key_decode|u_clk|Add0~17\) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(9),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~17\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~18_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~19\);

-- Location: LCCOMB_X23_Y25_N6
\u_keyboard_reader|u_key_decode|u_clk|count~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|count~3_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|Add0~18_combout\ & !\u_keyboard_reader|u_key_decode|u_clk|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_clk|Add0~18_combout\,
	datac => \u_keyboard_reader|u_key_decode|u_clk|Equal0~10_combout\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|count~3_combout\);

-- Location: FF_X23_Y25_N7
\u_keyboard_reader|u_key_decode|u_clk|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|count~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(9));

-- Location: LCCOMB_X22_Y25_N20
\u_keyboard_reader|u_key_decode|u_clk|Add0~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~20_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(10) & (\u_keyboard_reader|u_key_decode|u_clk|Add0~19\ $ (GND))) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(10) & 
-- (!\u_keyboard_reader|u_key_decode|u_clk|Add0~19\ & VCC))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~21\ = CARRY((\u_keyboard_reader|u_key_decode|u_clk|count\(10) & !\u_keyboard_reader|u_key_decode|u_clk|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(10),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~19\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~20_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~21\);

-- Location: FF_X22_Y25_N21
\u_keyboard_reader|u_key_decode|u_clk|count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(10));

-- Location: LCCOMB_X22_Y25_N22
\u_keyboard_reader|u_key_decode|u_clk|Add0~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~22_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(11) & (!\u_keyboard_reader|u_key_decode|u_clk|Add0~21\)) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(11) & 
-- ((\u_keyboard_reader|u_key_decode|u_clk|Add0~21\) # (GND)))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~23\ = CARRY((!\u_keyboard_reader|u_key_decode|u_clk|Add0~21\) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(11),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~21\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~22_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~23\);

-- Location: FF_X22_Y25_N23
\u_keyboard_reader|u_key_decode|u_clk|count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(11));

-- Location: LCCOMB_X22_Y25_N24
\u_keyboard_reader|u_key_decode|u_clk|Add0~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~24_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(12) & (\u_keyboard_reader|u_key_decode|u_clk|Add0~23\ $ (GND))) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(12) & 
-- (!\u_keyboard_reader|u_key_decode|u_clk|Add0~23\ & VCC))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~25\ = CARRY((\u_keyboard_reader|u_key_decode|u_clk|count\(12) & !\u_keyboard_reader|u_key_decode|u_clk|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(12),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~23\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~24_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~25\);

-- Location: LCCOMB_X23_Y25_N2
\u_keyboard_reader|u_key_decode|u_clk|count~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|count~4_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|Add0~24_combout\ & !\u_keyboard_reader|u_key_decode|u_clk|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_clk|Add0~24_combout\,
	datac => \u_keyboard_reader|u_key_decode|u_clk|Equal0~10_combout\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|count~4_combout\);

-- Location: FF_X23_Y25_N3
\u_keyboard_reader|u_key_decode|u_clk|count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|count~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(12));

-- Location: LCCOMB_X22_Y25_N26
\u_keyboard_reader|u_key_decode|u_clk|Add0~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~26_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(13) & (!\u_keyboard_reader|u_key_decode|u_clk|Add0~25\)) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(13) & 
-- ((\u_keyboard_reader|u_key_decode|u_clk|Add0~25\) # (GND)))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~27\ = CARRY((!\u_keyboard_reader|u_key_decode|u_clk|Add0~25\) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(13),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~25\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~26_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~27\);

-- Location: FF_X22_Y25_N27
\u_keyboard_reader|u_key_decode|u_clk|count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(13));

-- Location: LCCOMB_X22_Y25_N28
\u_keyboard_reader|u_key_decode|u_clk|Add0~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~28_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(14) & (\u_keyboard_reader|u_key_decode|u_clk|Add0~27\ $ (GND))) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(14) & 
-- (!\u_keyboard_reader|u_key_decode|u_clk|Add0~27\ & VCC))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~29\ = CARRY((\u_keyboard_reader|u_key_decode|u_clk|count\(14) & !\u_keyboard_reader|u_key_decode|u_clk|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(14),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~27\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~28_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~29\);

-- Location: FF_X22_Y25_N29
\u_keyboard_reader|u_key_decode|u_clk|count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(14));

-- Location: LCCOMB_X22_Y25_N30
\u_keyboard_reader|u_key_decode|u_clk|Add0~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~30_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(15) & (!\u_keyboard_reader|u_key_decode|u_clk|Add0~29\)) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(15) & 
-- ((\u_keyboard_reader|u_key_decode|u_clk|Add0~29\) # (GND)))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~31\ = CARRY((!\u_keyboard_reader|u_key_decode|u_clk|Add0~29\) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(15),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~29\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~30_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~31\);

-- Location: FF_X22_Y25_N31
\u_keyboard_reader|u_key_decode|u_clk|count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(15));

-- Location: LCCOMB_X23_Y25_N28
\u_keyboard_reader|u_key_decode|u_clk|Equal0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Equal0~4_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(12) & (!\u_keyboard_reader|u_key_decode|u_clk|count\(15) & (!\u_keyboard_reader|u_key_decode|u_clk|count\(13) & 
-- !\u_keyboard_reader|u_key_decode|u_clk|count\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(12),
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(15),
	datac => \u_keyboard_reader|u_key_decode|u_clk|count\(13),
	datad => \u_keyboard_reader|u_key_decode|u_clk|count\(14),
	combout => \u_keyboard_reader|u_key_decode|u_clk|Equal0~4_combout\);

-- Location: LCCOMB_X22_Y24_N0
\u_keyboard_reader|u_key_decode|u_clk|Add0~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~32_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(16) & (\u_keyboard_reader|u_key_decode|u_clk|Add0~31\ $ (GND))) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(16) & 
-- (!\u_keyboard_reader|u_key_decode|u_clk|Add0~31\ & VCC))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~33\ = CARRY((\u_keyboard_reader|u_key_decode|u_clk|count\(16) & !\u_keyboard_reader|u_key_decode|u_clk|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(16),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~31\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~32_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~33\);

-- Location: FF_X22_Y24_N1
\u_keyboard_reader|u_key_decode|u_clk|count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(16));

-- Location: LCCOMB_X22_Y24_N2
\u_keyboard_reader|u_key_decode|u_clk|Add0~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~34_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(17) & (!\u_keyboard_reader|u_key_decode|u_clk|Add0~33\)) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(17) & 
-- ((\u_keyboard_reader|u_key_decode|u_clk|Add0~33\) # (GND)))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~35\ = CARRY((!\u_keyboard_reader|u_key_decode|u_clk|Add0~33\) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(17),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~33\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~34_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~35\);

-- Location: FF_X22_Y24_N3
\u_keyboard_reader|u_key_decode|u_clk|count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(17));

-- Location: LCCOMB_X22_Y24_N4
\u_keyboard_reader|u_key_decode|u_clk|Add0~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~36_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(18) & (\u_keyboard_reader|u_key_decode|u_clk|Add0~35\ $ (GND))) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(18) & 
-- (!\u_keyboard_reader|u_key_decode|u_clk|Add0~35\ & VCC))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~37\ = CARRY((\u_keyboard_reader|u_key_decode|u_clk|count\(18) & !\u_keyboard_reader|u_key_decode|u_clk|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(18),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~35\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~36_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~37\);

-- Location: FF_X22_Y24_N5
\u_keyboard_reader|u_key_decode|u_clk|count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(18));

-- Location: LCCOMB_X22_Y24_N6
\u_keyboard_reader|u_key_decode|u_clk|Add0~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~38_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(19) & (!\u_keyboard_reader|u_key_decode|u_clk|Add0~37\)) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(19) & 
-- ((\u_keyboard_reader|u_key_decode|u_clk|Add0~37\) # (GND)))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~39\ = CARRY((!\u_keyboard_reader|u_key_decode|u_clk|Add0~37\) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(19),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~37\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~38_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~39\);

-- Location: FF_X22_Y24_N7
\u_keyboard_reader|u_key_decode|u_clk|count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(19));

-- Location: LCCOMB_X22_Y24_N8
\u_keyboard_reader|u_key_decode|u_clk|Add0~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~40_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(20) & (\u_keyboard_reader|u_key_decode|u_clk|Add0~39\ $ (GND))) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(20) & 
-- (!\u_keyboard_reader|u_key_decode|u_clk|Add0~39\ & VCC))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~41\ = CARRY((\u_keyboard_reader|u_key_decode|u_clk|count\(20) & !\u_keyboard_reader|u_key_decode|u_clk|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(20),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~39\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~40_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~41\);

-- Location: FF_X22_Y24_N9
\u_keyboard_reader|u_key_decode|u_clk|count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(20));

-- Location: LCCOMB_X22_Y24_N10
\u_keyboard_reader|u_key_decode|u_clk|Add0~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~42_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(21) & (!\u_keyboard_reader|u_key_decode|u_clk|Add0~41\)) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(21) & 
-- ((\u_keyboard_reader|u_key_decode|u_clk|Add0~41\) # (GND)))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~43\ = CARRY((!\u_keyboard_reader|u_key_decode|u_clk|Add0~41\) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(21),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~41\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~42_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~43\);

-- Location: FF_X22_Y24_N11
\u_keyboard_reader|u_key_decode|u_clk|count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(21));

-- Location: LCCOMB_X22_Y24_N12
\u_keyboard_reader|u_key_decode|u_clk|Add0~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~44_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(22) & (\u_keyboard_reader|u_key_decode|u_clk|Add0~43\ $ (GND))) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(22) & 
-- (!\u_keyboard_reader|u_key_decode|u_clk|Add0~43\ & VCC))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~45\ = CARRY((\u_keyboard_reader|u_key_decode|u_clk|count\(22) & !\u_keyboard_reader|u_key_decode|u_clk|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(22),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~43\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~44_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~45\);

-- Location: FF_X22_Y24_N13
\u_keyboard_reader|u_key_decode|u_clk|count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(22));

-- Location: LCCOMB_X22_Y24_N14
\u_keyboard_reader|u_key_decode|u_clk|Add0~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~46_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(23) & (!\u_keyboard_reader|u_key_decode|u_clk|Add0~45\)) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(23) & 
-- ((\u_keyboard_reader|u_key_decode|u_clk|Add0~45\) # (GND)))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~47\ = CARRY((!\u_keyboard_reader|u_key_decode|u_clk|Add0~45\) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(23),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~45\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~46_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~47\);

-- Location: FF_X22_Y24_N15
\u_keyboard_reader|u_key_decode|u_clk|count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(23));

-- Location: LCCOMB_X22_Y24_N16
\u_keyboard_reader|u_key_decode|u_clk|Add0~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~48_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(24) & (\u_keyboard_reader|u_key_decode|u_clk|Add0~47\ $ (GND))) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(24) & 
-- (!\u_keyboard_reader|u_key_decode|u_clk|Add0~47\ & VCC))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~49\ = CARRY((\u_keyboard_reader|u_key_decode|u_clk|count\(24) & !\u_keyboard_reader|u_key_decode|u_clk|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(24),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~47\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~48_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~49\);

-- Location: FF_X22_Y24_N17
\u_keyboard_reader|u_key_decode|u_clk|count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(24));

-- Location: LCCOMB_X22_Y24_N18
\u_keyboard_reader|u_key_decode|u_clk|Add0~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~50_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(25) & (!\u_keyboard_reader|u_key_decode|u_clk|Add0~49\)) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(25) & 
-- ((\u_keyboard_reader|u_key_decode|u_clk|Add0~49\) # (GND)))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~51\ = CARRY((!\u_keyboard_reader|u_key_decode|u_clk|Add0~49\) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(25),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~49\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~50_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~51\);

-- Location: FF_X22_Y24_N19
\u_keyboard_reader|u_key_decode|u_clk|count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(25));

-- Location: LCCOMB_X22_Y24_N20
\u_keyboard_reader|u_key_decode|u_clk|Add0~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~52_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(26) & (\u_keyboard_reader|u_key_decode|u_clk|Add0~51\ $ (GND))) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(26) & 
-- (!\u_keyboard_reader|u_key_decode|u_clk|Add0~51\ & VCC))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~53\ = CARRY((\u_keyboard_reader|u_key_decode|u_clk|count\(26) & !\u_keyboard_reader|u_key_decode|u_clk|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(26),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~51\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~52_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~53\);

-- Location: FF_X22_Y24_N21
\u_keyboard_reader|u_key_decode|u_clk|count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(26));

-- Location: LCCOMB_X22_Y24_N22
\u_keyboard_reader|u_key_decode|u_clk|Add0~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~54_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(27) & (!\u_keyboard_reader|u_key_decode|u_clk|Add0~53\)) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(27) & 
-- ((\u_keyboard_reader|u_key_decode|u_clk|Add0~53\) # (GND)))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~55\ = CARRY((!\u_keyboard_reader|u_key_decode|u_clk|Add0~53\) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(27),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~53\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~54_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~55\);

-- Location: FF_X22_Y24_N23
\u_keyboard_reader|u_key_decode|u_clk|count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(27));

-- Location: LCCOMB_X23_Y24_N12
\u_keyboard_reader|u_key_decode|u_clk|Equal0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Equal0~7_combout\ = (!\u_keyboard_reader|u_key_decode|u_clk|count\(27) & (!\u_keyboard_reader|u_key_decode|u_clk|count\(26) & (!\u_keyboard_reader|u_key_decode|u_clk|count\(24) & 
-- !\u_keyboard_reader|u_key_decode|u_clk|count\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(27),
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(26),
	datac => \u_keyboard_reader|u_key_decode|u_clk|count\(24),
	datad => \u_keyboard_reader|u_key_decode|u_clk|count\(25),
	combout => \u_keyboard_reader|u_key_decode|u_clk|Equal0~7_combout\);

-- Location: LCCOMB_X23_Y24_N24
\u_keyboard_reader|u_key_decode|u_clk|Equal0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Equal0~5_combout\ = (!\u_keyboard_reader|u_key_decode|u_clk|count\(16) & (!\u_keyboard_reader|u_key_decode|u_clk|count\(18) & (!\u_keyboard_reader|u_key_decode|u_clk|count\(19) & 
-- !\u_keyboard_reader|u_key_decode|u_clk|count\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(16),
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(18),
	datac => \u_keyboard_reader|u_key_decode|u_clk|count\(19),
	datad => \u_keyboard_reader|u_key_decode|u_clk|count\(17),
	combout => \u_keyboard_reader|u_key_decode|u_clk|Equal0~5_combout\);

-- Location: LCCOMB_X23_Y24_N10
\u_keyboard_reader|u_key_decode|u_clk|Equal0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Equal0~6_combout\ = (!\u_keyboard_reader|u_key_decode|u_clk|count\(21) & (!\u_keyboard_reader|u_key_decode|u_clk|count\(23) & (!\u_keyboard_reader|u_key_decode|u_clk|count\(22) & 
-- !\u_keyboard_reader|u_key_decode|u_clk|count\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(21),
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(23),
	datac => \u_keyboard_reader|u_key_decode|u_clk|count\(22),
	datad => \u_keyboard_reader|u_key_decode|u_clk|count\(20),
	combout => \u_keyboard_reader|u_key_decode|u_clk|Equal0~6_combout\);

-- Location: LCCOMB_X22_Y24_N24
\u_keyboard_reader|u_key_decode|u_clk|Add0~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~56_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(28) & (\u_keyboard_reader|u_key_decode|u_clk|Add0~55\ $ (GND))) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(28) & 
-- (!\u_keyboard_reader|u_key_decode|u_clk|Add0~55\ & VCC))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~57\ = CARRY((\u_keyboard_reader|u_key_decode|u_clk|count\(28) & !\u_keyboard_reader|u_key_decode|u_clk|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(28),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~55\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~56_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~57\);

-- Location: FF_X22_Y24_N25
\u_keyboard_reader|u_key_decode|u_clk|count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(28));

-- Location: LCCOMB_X22_Y24_N26
\u_keyboard_reader|u_key_decode|u_clk|Add0~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~58_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(29) & (!\u_keyboard_reader|u_key_decode|u_clk|Add0~57\)) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(29) & 
-- ((\u_keyboard_reader|u_key_decode|u_clk|Add0~57\) # (GND)))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~59\ = CARRY((!\u_keyboard_reader|u_key_decode|u_clk|Add0~57\) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(29),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~57\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~58_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~59\);

-- Location: FF_X22_Y24_N27
\u_keyboard_reader|u_key_decode|u_clk|count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(29));

-- Location: LCCOMB_X22_Y24_N28
\u_keyboard_reader|u_key_decode|u_clk|Add0~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~60_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(30) & (\u_keyboard_reader|u_key_decode|u_clk|Add0~59\ $ (GND))) # (!\u_keyboard_reader|u_key_decode|u_clk|count\(30) & 
-- (!\u_keyboard_reader|u_key_decode|u_clk|Add0~59\ & VCC))
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~61\ = CARRY((\u_keyboard_reader|u_key_decode|u_clk|count\(30) & !\u_keyboard_reader|u_key_decode|u_clk|Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(30),
	datad => VCC,
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~59\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~60_combout\,
	cout => \u_keyboard_reader|u_key_decode|u_clk|Add0~61\);

-- Location: FF_X22_Y24_N29
\u_keyboard_reader|u_key_decode|u_clk|count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(30));

-- Location: LCCOMB_X22_Y24_N30
\u_keyboard_reader|u_key_decode|u_clk|Add0~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Add0~62_combout\ = \u_keyboard_reader|u_key_decode|u_clk|count\(31) $ (\u_keyboard_reader|u_key_decode|u_clk|Add0~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(31),
	cin => \u_keyboard_reader|u_key_decode|u_clk|Add0~61\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Add0~62_combout\);

-- Location: FF_X22_Y24_N31
\u_keyboard_reader|u_key_decode|u_clk|count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|Add0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|count\(31));

-- Location: LCCOMB_X23_Y24_N6
\u_keyboard_reader|u_key_decode|u_clk|Equal0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Equal0~8_combout\ = (!\u_keyboard_reader|u_key_decode|u_clk|count\(31) & (!\u_keyboard_reader|u_key_decode|u_clk|count\(28) & (!\u_keyboard_reader|u_key_decode|u_clk|count\(29) & 
-- !\u_keyboard_reader|u_key_decode|u_clk|count\(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(31),
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(28),
	datac => \u_keyboard_reader|u_key_decode|u_clk|count\(29),
	datad => \u_keyboard_reader|u_key_decode|u_clk|count\(30),
	combout => \u_keyboard_reader|u_key_decode|u_clk|Equal0~8_combout\);

-- Location: LCCOMB_X23_Y24_N0
\u_keyboard_reader|u_key_decode|u_clk|Equal0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Equal0~9_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|Equal0~7_combout\ & (\u_keyboard_reader|u_key_decode|u_clk|Equal0~5_combout\ & (\u_keyboard_reader|u_key_decode|u_clk|Equal0~6_combout\ & 
-- \u_keyboard_reader|u_key_decode|u_clk|Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|Equal0~7_combout\,
	datab => \u_keyboard_reader|u_key_decode|u_clk|Equal0~5_combout\,
	datac => \u_keyboard_reader|u_key_decode|u_clk|Equal0~6_combout\,
	datad => \u_keyboard_reader|u_key_decode|u_clk|Equal0~8_combout\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Equal0~9_combout\);

-- Location: LCCOMB_X23_Y25_N24
\u_keyboard_reader|u_key_decode|u_clk|Equal0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Equal0~3_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|count\(9) & (!\u_keyboard_reader|u_key_decode|u_clk|count\(11) & (\u_keyboard_reader|u_key_decode|u_clk|count\(8) & 
-- !\u_keyboard_reader|u_key_decode|u_clk|count\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(9),
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(11),
	datac => \u_keyboard_reader|u_key_decode|u_clk|count\(8),
	datad => \u_keyboard_reader|u_key_decode|u_clk|count\(10),
	combout => \u_keyboard_reader|u_key_decode|u_clk|Equal0~3_combout\);

-- Location: LCCOMB_X23_Y25_N22
\u_keyboard_reader|u_key_decode|u_clk|Equal0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|Equal0~10_combout\ = (\u_keyboard_reader|u_key_decode|u_clk|Equal0~2_combout\ & (\u_keyboard_reader|u_key_decode|u_clk|Equal0~4_combout\ & (\u_keyboard_reader|u_key_decode|u_clk|Equal0~9_combout\ & 
-- \u_keyboard_reader|u_key_decode|u_clk|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|Equal0~2_combout\,
	datab => \u_keyboard_reader|u_key_decode|u_clk|Equal0~4_combout\,
	datac => \u_keyboard_reader|u_key_decode|u_clk|Equal0~9_combout\,
	datad => \u_keyboard_reader|u_key_decode|u_clk|Equal0~3_combout\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|Equal0~10_combout\);

-- Location: LCCOMB_X23_Y25_N0
\u_keyboard_reader|u_key_decode|u_clk|tmp~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_clk|tmp~0_combout\ = \u_keyboard_reader|u_key_decode|u_clk|Equal0~10_combout\ $ (\u_keyboard_reader|u_key_decode|u_clk|tmp~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|Equal0~10_combout\,
	datac => \u_keyboard_reader|u_key_decode|u_clk|tmp~q\,
	combout => \u_keyboard_reader|u_key_decode|u_clk|tmp~0_combout\);

-- Location: FF_X23_Y25_N1
\u_keyboard_reader|u_key_decode|u_clk|tmp\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_clk|tmp~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_clk|tmp~q\);

-- Location: CLKCTRL_G1
\u_keyboard_reader|u_key_decode|u_clk|tmp~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \u_keyboard_reader|u_key_decode|u_clk|tmp~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \u_keyboard_reader|u_key_decode|u_clk|tmp~clkctrl_outclk\);

-- Location: LCCOMB_X45_Y39_N6
\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~1_combout\ = \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~0_combout\ $ (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~0_combout\,
	datac => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\,
	combout => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~1_combout\);

-- Location: IOIBUF_X51_Y54_N29
\reset~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X45_Y39_N7
\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_keyboard_reader|u_key_decode|u_clk|tmp~clkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\);

-- Location: IOIBUF_X14_Y0_N1
\Lines[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Lines(0),
	o => \Lines[0]~input_o\);

-- Location: IOIBUF_X46_Y0_N8
\Lines[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Lines(2),
	o => \Lines[2]~input_o\);

-- Location: LCCOMB_X45_Y36_N2
\u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~0_combout\ = (!\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\ & ((\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\ & ((\Lines[2]~input_o\))) # 
-- (!\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\ & (\Lines[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\,
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\,
	datac => \Lines[0]~input_o\,
	datad => \Lines[2]~input_o\,
	combout => \u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~0_combout\);

-- Location: LCCOMB_X45_Y36_N24
\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~0_combout\ = \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\ $ (((!\u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~q\ & 
-- ((\u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~1_combout\) # (\u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~q\,
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~1_combout\,
	datac => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\,
	datad => \u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~0_combout\,
	combout => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~0_combout\);

-- Location: FF_X45_Y36_N25
\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_keyboard_reader|u_key_decode|u_clk|tmp~clkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\);

-- Location: IOIBUF_X51_Y0_N22
\Lines[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Lines(1),
	o => \Lines[1]~input_o\);

-- Location: IOIBUF_X40_Y0_N22
\Lines[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Lines(3),
	o => \Lines[3]~input_o\);

-- Location: LCCOMB_X45_Y36_N4
\u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~1_combout\ = (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\ & ((\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\ & ((\Lines[3]~input_o\))) # 
-- (!\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\ & (\Lines[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\,
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\,
	datac => \Lines[1]~input_o\,
	datad => \Lines[3]~input_o\,
	combout => \u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~1_combout\);

-- Location: LCCOMB_X45_Y36_N30
\u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~2_combout\ = (\u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~1_combout\) # (\u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~1_combout\,
	datad => \u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~0_combout\,
	combout => \u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~2_combout\);

-- Location: LCCOMB_X49_Y39_N16
\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~0_combout\ = !\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~0_combout\);

-- Location: LCCOMB_X45_Y36_N12
\u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_1~0_combout\ = (\u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~q\ & (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_DAC~0_combout\ & 
-- ((\u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~2_combout\) # (\u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~q\,
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~2_combout\,
	datac => \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_1~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_DAC~0_combout\,
	combout => \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_1~0_combout\);

-- Location: FF_X45_Y36_N13
\u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_keyboard_reader|u_key_decode|u_clk|tmp~clkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_1~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_1~q\);

-- Location: LCCOMB_X45_Y36_N10
\u_keyboard_reader|u_key_decode|u_key_control|currentState.STATE_PRESSING~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_key_control|currentState.STATE_PRESSING~0_combout\ = (\u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~q\ & !\u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~q\,
	datad => \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_1~q\,
	combout => \u_keyboard_reader|u_key_decode|u_key_control|currentState.STATE_PRESSING~0_combout\);

-- Location: LCCOMB_X45_Y36_N18
\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~0_combout\ = ((\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\) # ((\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\ & 
-- !\u_keyboard_reader|u_key_decode|u_key_control|currentState.STATE_PRESSING~0_combout\))) # (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\,
	datad => \u_keyboard_reader|u_key_decode|u_key_control|currentState.STATE_PRESSING~0_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~0_combout\);

-- Location: LCCOMB_X46_Y39_N16
\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~0_combout\ = ((\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\ & (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\)) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\ & ((\u_keyboard_reader|u_ringbuffer|u_ring_controller|nextState.STATE_SET_GET~1_combout\)))) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~0_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|nextState.STATE_SET_GET~1_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~0_combout\);

-- Location: FF_X46_Y39_N17
\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\);

-- Location: LCCOMB_X46_Y39_N28
\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0_combout\ = (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\ & (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\ & 
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0_combout\);

-- Location: LCCOMB_X49_Y39_N18
\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder1|S\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder1|S~combout\ = \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0_combout\ $ (\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD1|Q~q\ $ 
-- (\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD1|Q~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder1|S~combout\);

-- Location: FF_X49_Y39_N19
\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder1|S~combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_keyboard_reader|u_ringbuffer|u_mac|ce_s~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD1|Q~q\);

-- Location: LCCOMB_X49_Y39_N14
\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder2|S\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder2|S~combout\ = \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD2|Q~q\ $ (((\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0_combout\ & 
-- (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~q\ & !\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD1|Q~q\)) # (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0_combout\ & 
-- (\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~q\ & \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD1|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010011010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD2|Q~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD1|Q~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder2|S~combout\);

-- Location: FF_X49_Y39_N15
\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder2|S~combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_keyboard_reader|u_ringbuffer|u_mac|ce_s~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD2|Q~q\);

-- Location: LCCOMB_X49_Y39_N22
\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder2|Cout~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder2|Cout~0_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~q\) # 
-- ((\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD2|Q~q\) # (\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD1|Q~q\)))) # (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0_combout\ & 
-- (\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~q\ & (\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD2|Q~q\ & \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD1|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD2|Q~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD1|Q~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder2|Cout~0_combout\);

-- Location: LCCOMB_X49_Y39_N20
\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder3|S\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder3|S~combout\ = \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder2|Cout~0_combout\ $ 
-- (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0_combout\ $ (\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD3|Q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder2|Cout~0_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD3|Q~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder3|S~combout\);

-- Location: FF_X49_Y39_N21
\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD3|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_adder|u_fulladder3|S~combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_keyboard_reader|u_ringbuffer|u_mac|ce_s~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD3|Q~q\);

-- Location: LCCOMB_X45_Y36_N14
\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~0_combout\ = (\u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_1~q\) # ((\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD3|Q~q\ & 
-- \u_keyboard_reader|u_ringbuffer|u_mac|full~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD3|Q~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|full~0_combout\,
	datad => \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_1~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~0_combout\);

-- Location: LCCOMB_X45_Y36_N8
\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~1_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\ & ((\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\ $ 
-- (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\)))) # (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\ & (\u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~q\ & 
-- (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\ & !\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~q\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~1_combout\);

-- Location: LCCOMB_X45_Y36_N26
\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~2_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\ & 
-- (((!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~1_combout\)))) # (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\ & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ring_controller|nextState.STATE_SET_GET~1_combout\) # ((!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~0_combout\ & 
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~0_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~1_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|nextState.STATE_SET_GET~1_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~2_combout\);

-- Location: FF_X45_Y36_N27
\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\);

-- Location: LCCOMB_X46_Y39_N30
\u_keyboard_reader|u_ringbuffer|u_mac|ce_s\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_mac|ce_s~combout\ = (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\ & (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\ $ 
-- (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_mac|ce_s~combout\);

-- Location: FF_X49_Y39_N17
\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_keyboard_reader|u_ringbuffer|u_mac|ce_s~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~q\);

-- Location: LCCOMB_X49_Y39_N28
\u_keyboard_reader|u_ringbuffer|u_mac|full~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_mac|full~0_combout\ = (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~q\ & (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD2|Q~q\ & 
-- !\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD1|Q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD0|Q~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD2|Q~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD1|Q~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_mac|full~0_combout\);

-- Location: LCCOMB_X49_Y39_N6
\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_READING~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_READING~0_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\ & (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\ & 
-- !\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_READING~0_combout\);

-- Location: IOIBUF_X0_Y29_N15
\altera_reserved_tms~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_altera_reserved_tms,
	o => \altera_reserved_tms~input_o\);

-- Location: IOIBUF_X0_Y29_N22
\altera_reserved_tck~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_altera_reserved_tck,
	o => \altera_reserved_tck~input_o\);

-- Location: IOIBUF_X0_Y28_N15
\altera_reserved_tdi~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_altera_reserved_tdi,
	o => \altera_reserved_tdi~input_o\);

-- Location: LCCOMB_X46_Y42_N14
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~7\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(0),
	datad => VCC,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~7_combout\,
	cout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~8\);

-- Location: LCCOMB_X46_Y42_N30
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~11\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(4),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(1),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(0),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~11_combout\);

-- Location: JTAG_X43_Y40_N0
altera_internal_jtag : fiftyfivenm_jtag
PORT MAP (
	tms => \altera_reserved_tms~input_o\,
	tck => \altera_reserved_tck~input_o\,
	tdi => \altera_reserved_tdi~input_o\,
	tdouser => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~q\,
	tdo => \altera_internal_jtag~TDO\,
	tmsutap => \altera_internal_jtag~TMSUTAP\,
	tckutap => \altera_internal_jtag~TCKUTAP\,
	tdiutap => \altera_internal_jtag~TDIUTAP\);

-- Location: LCCOMB_X47_Y40_N28
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_proc~1\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(2),
	datac => \altera_internal_jtag~TMSUTAP\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_proc~1_combout\);

-- Location: FF_X47_Y40_N29
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_proc~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(9));

-- Location: LCCOMB_X47_Y40_N6
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~9\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(9),
	datac => \altera_internal_jtag~TMSUTAP\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~9_combout\);

-- Location: FF_X47_Y40_N7
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(10));

-- Location: LCCOMB_X47_Y40_N26
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~10\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(10),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(11),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(14),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~10_combout\);

-- Location: FF_X47_Y40_N27
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~10_combout\,
	sclr => \altera_internal_jtag~TMSUTAP\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(11));

-- Location: LCCOMB_X47_Y40_N0
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~11\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(10),
	datac => \altera_internal_jtag~TMSUTAP\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(11),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~11_combout\);

-- Location: FF_X47_Y40_N1
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(12));

-- Location: LCCOMB_X47_Y40_N20
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~12\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(12),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(13),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~12_combout\);

-- Location: FF_X47_Y40_N21
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~12_combout\,
	sclr => \altera_internal_jtag~TMSUTAP\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(13));

-- Location: LCCOMB_X47_Y40_N18
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~13\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(13),
	datac => \altera_internal_jtag~TMSUTAP\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~13_combout\);

-- Location: FF_X47_Y40_N19
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(14));

-- Location: LCCOMB_X47_Y40_N30
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_dr_scan_proc~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \altera_internal_jtag~TMSUTAP\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(14),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(12),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_dr_scan_proc~0_combout\);

-- Location: LCCOMB_X47_Y40_N12
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[15]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_dr_scan_proc~0_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[15]~feeder_combout\);

-- Location: FF_X47_Y40_N13
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[15]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(15));

-- Location: LCCOMB_X47_Y40_N8
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt~1\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \altera_internal_jtag~TMSUTAP\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt\(0),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt~1_combout\);

-- Location: FF_X47_Y40_N9
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt\(0));

-- Location: LCCOMB_X47_Y39_N10
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt~2\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt\(1),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt\(0),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt~2_combout\);

-- Location: FF_X47_Y39_N11
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt~2_combout\,
	sclr => \ALT_INV_altera_internal_jtag~TMSUTAP\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt\(1));

-- Location: LCCOMB_X47_Y39_N0
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt\(1),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt\(2),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt\(0),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt~0_combout\);

-- Location: FF_X47_Y39_N1
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt~0_combout\,
	sclr => \ALT_INV_altera_internal_jtag~TMSUTAP\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt\(2));

-- Location: LCCOMB_X47_Y40_N16
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt\(2),
	datab => \altera_internal_jtag~TMSUTAP\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(0),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(9),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~0_combout\);

-- Location: FF_X47_Y40_N17
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(0));

-- Location: LCCOMB_X47_Y40_N24
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~1\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(15),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(8),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(1),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(0),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~1_combout\);

-- Location: FF_X47_Y40_N25
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~1_combout\,
	sclr => \altera_internal_jtag~TMSUTAP\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(1));

-- Location: LCCOMB_X47_Y40_N10
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~2\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(15),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(1),
	datac => \altera_internal_jtag~TMSUTAP\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(8),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~2_combout\);

-- Location: FF_X47_Y40_N11
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(2));

-- Location: LCCOMB_X45_Y40_N14
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~3\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(2),
	datad => \altera_internal_jtag~TMSUTAP\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~3_combout\);

-- Location: FF_X45_Y40_N15
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3));

-- Location: LCCOMB_X45_Y40_N26
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~4\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(7),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~4_combout\);

-- Location: FF_X45_Y40_N27
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~4_combout\,
	sclr => \altera_internal_jtag~TMSUTAP\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4));

-- Location: LCCOMB_X46_Y40_N4
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~5\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \altera_internal_jtag~TMSUTAP\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~5_combout\);

-- Location: FF_X46_Y40_N5
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(5));

-- Location: LCCOMB_X45_Y40_N4
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~6\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(6),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(5),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~6_combout\);

-- Location: FF_X45_Y40_N5
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~6_combout\,
	sclr => \altera_internal_jtag~TMSUTAP\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(6));

-- Location: LCCOMB_X45_Y40_N24
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~7\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \altera_internal_jtag~TMSUTAP\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(6),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~7_combout\);

-- Location: FF_X45_Y40_N25
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(7));

-- Location: LCCOMB_X46_Y40_N10
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~8\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \altera_internal_jtag~TMSUTAP\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(7),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(5),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~8_combout\);

-- Location: FF_X46_Y41_N11
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	asdata => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~8_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(8));

-- Location: LCCOMB_X49_Y41_N4
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[9]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \altera_internal_jtag~TDIUTAP\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[9]~feeder_combout\);

-- Location: FF_X49_Y41_N5
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[9]~feeder_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(0),
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(9));

-- Location: FF_X49_Y41_N31
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	asdata => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(9),
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(0),
	sload => VCC,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(8));

-- Location: LCCOMB_X49_Y41_N24
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[7]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(8),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[7]~feeder_combout\);

-- Location: FF_X49_Y41_N25
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[7]~feeder_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(0),
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(7));

-- Location: LCCOMB_X49_Y41_N26
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[6]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(7),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[6]~feeder_combout\);

-- Location: FF_X49_Y41_N27
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[6]~feeder_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(0),
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(6));

-- Location: FF_X49_Y41_N23
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	asdata => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(6),
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(0),
	sload => VCC,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(5));

-- Location: LCCOMB_X49_Y41_N16
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[4]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(5),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[4]~feeder_combout\);

-- Location: FF_X49_Y41_N17
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[4]~feeder_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(0),
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(4));

-- Location: LCCOMB_X49_Y41_N28
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[3]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(4),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[3]~feeder_combout\);

-- Location: FF_X49_Y41_N29
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[3]~feeder_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(0),
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(3));

-- Location: LCCOMB_X49_Y41_N10
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2]~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2]~0_combout\);

-- Location: FF_X49_Y41_N11
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2]~0_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(0),
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(2));

-- Location: LCCOMB_X49_Y41_N12
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[1]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(2),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[1]~feeder_combout\);

-- Location: FF_X49_Y41_N13
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[1]~feeder_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(0),
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(1));

-- Location: LCCOMB_X49_Y41_N14
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0]~1\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(1),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0]~1_combout\);

-- Location: FF_X49_Y41_N15
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0]~1_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(0),
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(0));

-- Location: LCCOMB_X49_Y41_N22
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal0~1\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(2),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(4),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(5),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal0~1_combout\);

-- Location: LCCOMB_X49_Y41_N30
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal0~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(6),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(9),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(8),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(7),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal0~0_combout\);

-- Location: LCCOMB_X49_Y41_N0
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal1~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(1),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(0),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal0~1_combout\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal0~0_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal1~0_combout\);

-- Location: FF_X49_Y41_N1
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal1~0_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(0),
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_dr_scan_proc~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q\);

-- Location: LCCOMB_X46_Y40_N16
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~19\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~11_combout\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(8),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(2),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~19_combout\);

-- Location: LCCOMB_X49_Y41_N18
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal0~2\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(1),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg\(0),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal0~1_combout\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal0~0_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal0~2_combout\);

-- Location: FF_X49_Y41_N19
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Equal0~2_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(0),
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_dr_scan_proc~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q\);

-- Location: LCCOMB_X46_Y40_N2
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~12\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(8),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~12_combout\);

-- Location: FF_X46_Y42_N15
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~7_combout\,
	asdata => VCC,
	sload => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~19_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(0));

-- Location: LCCOMB_X46_Y42_N16
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~9\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(1),
	datad => VCC,
	cin => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~8\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~9_combout\,
	cout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~10\);

-- Location: FF_X46_Y42_N17
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~9_combout\,
	asdata => VCC,
	sload => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~19_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(1));

-- Location: LCCOMB_X46_Y42_N18
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~13\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(2),
	datad => VCC,
	cin => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~10\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~13_combout\,
	cout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~14\);

-- Location: FF_X46_Y42_N19
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~13_combout\,
	asdata => VCC,
	sload => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~19_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(2));

-- Location: LCCOMB_X46_Y42_N20
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]~15\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(3),
	datad => VCC,
	cin => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~14\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]~15_combout\,
	cout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]~16\);

-- Location: FF_X46_Y42_N21
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]~15_combout\,
	asdata => VCC,
	sload => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~19_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(3));

-- Location: LCCOMB_X46_Y42_N22
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~17\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(4),
	cin => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]~16\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~17_combout\);

-- Location: FF_X46_Y42_N23
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~17_combout\,
	asdata => VCC,
	sload => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~19_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(4));

-- Location: LCCOMB_X46_Y42_N8
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~4\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(4),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(1),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(0),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(2),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~4_combout\);

-- Location: LCCOMB_X46_Y42_N10
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~5\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(4),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(1),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(0),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(2),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~5_combout\);

-- Location: LCCOMB_X47_Y41_N22
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \altera_internal_jtag~TDIUTAP\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~feeder_combout\);

-- Location: LCCOMB_X46_Y39_N0
\u_keyboard_reader|u_ringbuffer|u_ring_controller|sel_pg~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|sel_pg~0_combout\ = (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\ & ((\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\) # 
-- (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ring_controller|sel_pg~0_combout\);

-- Location: LCCOMB_X46_Y39_N6
\u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD0|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD0|Q~0_combout\ = \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD0|Q~q\ $ (((!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\ & 
-- (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\ & \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD0|Q~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD0|Q~0_combout\);

-- Location: FF_X46_Y39_N7
\u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD0|Q~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD0|Q~q\);

-- Location: LCCOMB_X46_Y39_N22
\u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD1|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD1|Q~0_combout\ = \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD1|Q~q\ $ (((\u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD0|Q~q\ & 
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD0|Q~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD1|Q~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD1|Q~0_combout\);

-- Location: FF_X46_Y39_N23
\u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD1|Q~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD1|Q~q\);

-- Location: LCCOMB_X46_Y39_N26
\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_PUT~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_PUT~0_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\ & (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\ & 
-- !\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_PUT~0_combout\);

-- Location: LCCOMB_X46_Y39_N12
\u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD0|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD0|Q~0_combout\ = \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD0|Q~q\ $ (((!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\ & 
-- (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\ & !\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD0|Q~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD0|Q~0_combout\);

-- Location: FF_X46_Y39_N13
\u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD0|Q~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD0|Q~q\);

-- Location: LCCOMB_X46_Y39_N20
\u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD1|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD1|Q~0_combout\ = \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD1|Q~q\ $ (((\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_PUT~0_combout\ & 
-- \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD0|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_PUT~0_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD1|Q~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD0|Q~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD1|Q~0_combout\);

-- Location: FF_X46_Y39_N21
\u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD1|Q~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD1|Q~q\);

-- Location: LCCOMB_X46_Y39_N24
\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ring_controller|sel_pg~0_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD1|Q~q\))) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|sel_pg~0_combout\ & (\u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD1|Q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|sel_pg~0_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD1|Q~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD1|Q~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\);

-- Location: LCCOMB_X46_Y39_N4
\u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD2|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD2|Q~0_combout\ = \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD2|Q~q\ $ (((\u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD1|Q~q\ & 
-- (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0_combout\ & \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD0|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD1|Q~q\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_GET~0_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD2|Q~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD0|Q~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD2|Q~0_combout\);

-- Location: FF_X46_Y39_N5
\u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD2|Q~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD2|Q~q\);

-- Location: LCCOMB_X46_Y39_N2
\u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD2|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD2|Q~0_combout\ = \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD2|Q~q\ $ (((\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_PUT~0_combout\ & 
-- (\u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD1|Q~q\ & \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD0|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_PUT~0_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD1|Q~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD2|Q~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD0|Q~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD2|Q~0_combout\);

-- Location: FF_X46_Y39_N3
\u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD2|Q~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD2|Q~q\);

-- Location: LCCOMB_X46_Y39_N14
\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ring_controller|sel_pg~0_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD2|Q~q\))) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|sel_pg~0_combout\ & (\u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD2|Q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|sel_pg~0_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD2|Q~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD2|Q~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\);

-- Location: LCCOMB_X46_Y39_N10
\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ring_controller|sel_pg~0_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD0|Q~q\))) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|sel_pg~0_combout\ & (\u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD0|Q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterGet|u_reg|u_FFD0|Q~q\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|sel_pg~0_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_counterPut|u_reg|u_FFD0|Q~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\);

-- Location: LCCOMB_X46_Y39_N8
\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\ & (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\ & 
-- !\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\);

-- Location: LCCOMB_X45_Y38_N14
\rtl~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~1_combout\ = (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\ & (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & 
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\,
	combout => \rtl~1_combout\);

-- Location: CLKCTRL_G13
\rtl~1clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~1clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~1clkctrl_outclk\);

-- Location: LCCOMB_X44_Y38_N0
\u_keyboard_reader|u_ringbuffer|u_ram|ram~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~5_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\,
	datac => \rtl~1clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~5_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~5_combout\);

-- Location: LCCOMB_X45_Y38_N0
\rtl~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~2_combout\ = (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\ & (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & 
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\,
	combout => \rtl~2_combout\);

-- Location: CLKCTRL_G5
\rtl~2clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~2clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~2clkctrl_outclk\);

-- Location: LCCOMB_X44_Y38_N10
\u_keyboard_reader|u_ringbuffer|u_ram|ram~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~1_combout\ = (GLOBAL(\rtl~2clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\)) # (!GLOBAL(\rtl~2clkctrl_outclk\) & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\,
	datac => \rtl~2clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~1_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~1_combout\);

-- Location: LCCOMB_X45_Y38_N26
\u_keyboard_reader|u_ringbuffer|u_ram|ram~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~39_combout\ = (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~5_combout\) # ((\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\)))) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & (((\u_keyboard_reader|u_ringbuffer|u_ram|ram~1_combout\ & !\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ram|ram~5_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ram|ram~1_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~39_combout\);

-- Location: LCCOMB_X45_Y38_N4
\rtl~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~0_combout\ = (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\ & (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & 
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\,
	combout => \rtl~0_combout\);

-- Location: CLKCTRL_G6
\rtl~0clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~0clkctrl_outclk\);

-- Location: LCCOMB_X45_Y40_N16
\u_keyboard_reader|u_ringbuffer|u_ram|ram~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~9_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\,
	datac => \rtl~0clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~9_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~9_combout\);

-- Location: LCCOMB_X45_Y38_N18
\rtl~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~3_combout\ = (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\ & (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & 
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\,
	combout => \rtl~3_combout\);

-- Location: CLKCTRL_G16
\rtl~3clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~3clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~3clkctrl_outclk\);

-- Location: LCCOMB_X45_Y39_N2
\u_keyboard_reader|u_ringbuffer|u_ram|ram~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~13_combout\ = (GLOBAL(\rtl~3clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\)) # (!GLOBAL(\rtl~3clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\,
	datab => \rtl~3clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~13_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~13_combout\);

-- Location: LCCOMB_X45_Y38_N12
\u_keyboard_reader|u_ringbuffer|u_ram|ram~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~40_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ram|ram~39_combout\ & (((\u_keyboard_reader|u_ringbuffer|u_ram|ram~13_combout\) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\)))) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_ram|ram~39_combout\ & (\u_keyboard_reader|u_ringbuffer|u_ram|ram~9_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ram|ram~39_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ram|ram~9_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ram|ram~13_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~40_combout\);

-- Location: LCCOMB_X45_Y39_N16
\rtl~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~6_combout\ = (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\ & 
-- \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\,
	combout => \rtl~6_combout\);

-- Location: CLKCTRL_G8
\rtl~6clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~6clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~6clkctrl_outclk\);

-- Location: LCCOMB_X46_Y37_N0
\u_keyboard_reader|u_ringbuffer|u_ram|ram~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~17_combout\ = (GLOBAL(\rtl~6clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\)) # (!GLOBAL(\rtl~6clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\,
	datac => \rtl~6clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~17_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~17_combout\);

-- Location: LCCOMB_X45_Y38_N8
\rtl~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~5_combout\ = (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\ & (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & 
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\,
	combout => \rtl~5_combout\);

-- Location: CLKCTRL_G7
\rtl~5clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~5clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~5clkctrl_outclk\);

-- Location: LCCOMB_X46_Y38_N18
\u_keyboard_reader|u_ringbuffer|u_ram|ram~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~25_combout\ = (GLOBAL(\rtl~5clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\)) # (!GLOBAL(\rtl~5clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\,
	datac => \rtl~5clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~25_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~25_combout\);

-- Location: LCCOMB_X46_Y38_N4
\u_keyboard_reader|u_ringbuffer|u_ram|ram~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~37_combout\ = (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & (((\u_keyboard_reader|u_ringbuffer|u_ram|ram~25_combout\) # (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\)))) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & (\u_keyboard_reader|u_ringbuffer|u_ram|ram~17_combout\ & ((!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ram|ram~17_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ram|ram~25_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~37_combout\);

-- Location: LCCOMB_X45_Y38_N2
\rtl~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~7_combout\ = (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\ & (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & 
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\,
	combout => \rtl~7_combout\);

-- Location: CLKCTRL_G0
\rtl~7clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~7clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~7clkctrl_outclk\);

-- Location: LCCOMB_X46_Y38_N20
\u_keyboard_reader|u_ringbuffer|u_ram|ram~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~29_combout\ = (GLOBAL(\rtl~7clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\)) # (!GLOBAL(\rtl~7clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~29_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\,
	datac => \rtl~7clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~29_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~29_combout\);

-- Location: LCCOMB_X45_Y38_N22
\rtl~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rtl~4_combout\ = (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\ & (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & 
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_WRITING~0_combout\,
	combout => \rtl~4_combout\);

-- Location: CLKCTRL_G14
\rtl~4clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rtl~4clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rtl~4clkctrl_outclk\);

-- Location: LCCOMB_X46_Y38_N24
\u_keyboard_reader|u_ringbuffer|u_ram|ram~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~21_combout\ = (GLOBAL(\rtl~4clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\)) # (!GLOBAL(\rtl~4clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~4clkctrl_outclk\,
	datac => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~21_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~21_combout\);

-- Location: LCCOMB_X46_Y38_N22
\u_keyboard_reader|u_ringbuffer|u_ram|ram~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~38_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ram|ram~37_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~29_combout\) # ((!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\)))) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_ram|ram~37_combout\ & (((\u_keyboard_reader|u_ringbuffer|u_ram|ram~21_combout\ & \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ram|ram~37_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ram|ram~29_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ram|ram~21_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~38_combout\);

-- Location: LCCOMB_X45_Y38_N10
\u_keyboard_reader|u_ringbuffer|u_ram|ram~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~41_combout\ = (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~38_combout\))) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\ & 
-- (\u_keyboard_reader|u_ringbuffer|u_ram|ram~40_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ram|ram~40_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ram|ram~38_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~41_combout\);

-- Location: LCCOMB_X49_Y39_N10
\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~0_combout\ = (\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~q\ & (((\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~q\) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_READING~0_combout\)))) # (!\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~q\ & 
-- (\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~q\ & 
-- (\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~q\,
	datab => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~q\,
	datac => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_READING~0_combout\,
	combout => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~0_combout\);

-- Location: FF_X49_Y39_N11
\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~q\);

-- Location: LCCOMB_X49_Y39_N8
\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.STATE_REGISTERING~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.STATE_REGISTERING~0_combout\ = (\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~q\ & !\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~q\,
	datad => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~q\,
	combout => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.STATE_REGISTERING~0_combout\);

-- Location: FF_X45_Y38_N11
\u_keyboard_reader|u_outputbuffer|u_OutputRegister|u_FFD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_ringbuffer|u_ram|ram~41_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.STATE_REGISTERING~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_outputbuffer|u_OutputRegister|u_FFD1|Q~q\);

-- Location: LCCOMB_X46_Y40_N0
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~5\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(8),
	datad => \altera_internal_jtag~TDIUTAP\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~5_combout\);

-- Location: LCCOMB_X46_Y40_N26
\~QIC_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QIC_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QIC_CREATED_GND~I_combout\);

-- Location: LCCOMB_X45_Y38_N28
\u_keyboard_reader|u_ringbuffer|u_ram|ram~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~0_combout\ = (GLOBAL(\rtl~2clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\)) # (!GLOBAL(\rtl~2clkctrl_outclk\) & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\,
	datac => \rtl~2clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~0_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~0_combout\);

-- Location: LCCOMB_X45_Y37_N0
\u_keyboard_reader|u_ringbuffer|u_ram|ram~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~4_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\,
	datac => \rtl~1clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~4_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~4_combout\);

-- Location: LCCOMB_X45_Y38_N6
\u_keyboard_reader|u_ringbuffer|u_ram|ram~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~34_combout\ = (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & (((\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\)))) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & 
-- ((\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~4_combout\))) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & (\u_keyboard_reader|u_ringbuffer|u_ram|ram~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ram|ram~0_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~4_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~34_combout\);

-- Location: LCCOMB_X46_Y36_N0
\u_keyboard_reader|u_ringbuffer|u_ram|ram~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~8_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\,
	datac => \rtl~0clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~8_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~8_combout\);

-- Location: LCCOMB_X45_Y37_N10
\u_keyboard_reader|u_ringbuffer|u_ram|ram~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~12_combout\ = (GLOBAL(\rtl~3clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\)) # (!GLOBAL(\rtl~3clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\,
	datac => \rtl~3clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~12_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~12_combout\);

-- Location: LCCOMB_X45_Y38_N24
\u_keyboard_reader|u_ringbuffer|u_ram|ram~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~35_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ram|ram~34_combout\ & (((\u_keyboard_reader|u_ringbuffer|u_ram|ram~12_combout\) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\)))) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_ram|ram~34_combout\ & (\u_keyboard_reader|u_ringbuffer|u_ram|ram~8_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ram|ram~34_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ram|ram~8_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ram|ram~12_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~35_combout\);

-- Location: LCCOMB_X46_Y38_N26
\u_keyboard_reader|u_ringbuffer|u_ram|ram~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~20_combout\ = (GLOBAL(\rtl~4clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\)) # (!GLOBAL(\rtl~4clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ram|ram~20_combout\,
	datad => \rtl~4clkctrl_outclk\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~20_combout\);

-- Location: LCCOMB_X45_Y36_N28
\u_keyboard_reader|u_ringbuffer|u_ram|ram~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~16_combout\ = (GLOBAL(\rtl~6clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\)) # (!GLOBAL(\rtl~6clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\,
	datac => \rtl~6clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~16_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~16_combout\);

-- Location: LCCOMB_X46_Y38_N12
\u_keyboard_reader|u_ringbuffer|u_ram|ram~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~24_combout\ = (GLOBAL(\rtl~5clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\)) # (!GLOBAL(\rtl~5clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\,
	datac => \rtl~5clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~24_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~24_combout\);

-- Location: LCCOMB_X46_Y38_N0
\u_keyboard_reader|u_ringbuffer|u_ram|ram~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~32_combout\ = (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & (((\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\)))) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & 
-- ((\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~24_combout\))) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & (\u_keyboard_reader|u_ringbuffer|u_ram|ram~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ram|ram~16_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~24_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~32_combout\);

-- Location: LCCOMB_X46_Y38_N14
\u_keyboard_reader|u_ringbuffer|u_ram|ram~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~28_combout\ = (GLOBAL(\rtl~7clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\)) # (!GLOBAL(\rtl~7clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~28_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ram|ram~28_combout\,
	datad => \rtl~7clkctrl_outclk\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~28_combout\);

-- Location: LCCOMB_X46_Y38_N10
\u_keyboard_reader|u_ringbuffer|u_ram|ram~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~33_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ram|ram~32_combout\ & (((\u_keyboard_reader|u_ringbuffer|u_ram|ram~28_combout\) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\)))) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_ram|ram~32_combout\ & (\u_keyboard_reader|u_ringbuffer|u_ram|ram~20_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ram|ram~20_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ram|ram~32_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ram|ram~28_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~33_combout\);

-- Location: LCCOMB_X45_Y38_N16
\u_keyboard_reader|u_ringbuffer|u_ram|ram~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~36_combout\ = (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~33_combout\))) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\ & 
-- (\u_keyboard_reader|u_ringbuffer|u_ram|ram~35_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_ringbuffer|u_ram|ram~35_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ram|ram~33_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~36_combout\);

-- Location: FF_X45_Y38_N17
\u_keyboard_reader|u_outputbuffer|u_OutputRegister|u_FFD0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_ringbuffer|u_ram|ram~36_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.STATE_REGISTERING~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_outputbuffer|u_OutputRegister|u_FFD0|Q~q\);

-- Location: LCCOMB_X45_Y42_N20
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~3\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(2),
	datab => \u_keyboard_reader|u_outputbuffer|u_OutputRegister|u_FFD0|Q~q\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~3_combout\);

-- Location: LCCOMB_X46_Y40_N28
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg_proc~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \altera_internal_jtag~TMSUTAP\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(7),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(5),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg_proc~0_combout\);

-- Location: LCCOMB_X46_Y41_N12
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[0]~6\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(2),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(0),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(1),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(8),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[0]~6_combout\);

-- Location: LCCOMB_X46_Y40_N22
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[0]~7\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg_proc~0_combout\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg\(0),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[0]~6_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[0]~7_combout\);

-- Location: FF_X46_Y40_N23
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[0]~7_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg\(0));

-- Location: LCCOMB_X45_Y40_N0
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~1\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg\(0),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(8),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~1_combout\);

-- Location: LCCOMB_X45_Y40_N10
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~2\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~1_combout\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~2_combout\);

-- Location: FF_X45_Y42_N21
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~3_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(1));

-- Location: LCCOMB_X49_Y39_N4
\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.STATE_CONSUME~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.STATE_CONSUME~0_combout\ = (\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~q\ & \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~q\,
	datad => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~q\,
	combout => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.STATE_CONSUME~0_combout\);

-- Location: LCCOMB_X45_Y42_N10
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(1),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datad => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.STATE_CONSUME~0_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~0_combout\);

-- Location: FF_X45_Y42_N11
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~0_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(0));

-- Location: LCCOMB_X46_Y41_N22
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(2),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(0),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(1),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~0_combout\);

-- Location: LCCOMB_X46_Y41_N2
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~2\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(2),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(1),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg\(1),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(0),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~2_combout\);

-- Location: LCCOMB_X46_Y41_N16
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~1\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state~8_combout\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(8),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~1_combout\);

-- Location: LCCOMB_X46_Y41_N20
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~3\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~0_combout\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~2_combout\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg\(1),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~1_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~3_combout\);

-- Location: FF_X46_Y41_N21
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~3_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg\(1));

-- Location: LCCOMB_X45_Y42_N12
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~4\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(8),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg\(1),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~4_combout\);

-- Location: LCCOMB_X46_Y40_N8
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg_proc~0_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg~feeder_combout\);

-- Location: FF_X46_Y40_N9
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg~q\);

-- Location: LCCOMB_X45_Y42_N0
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~5\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~4_combout\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg~q\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg\(2),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~0_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~5_combout\);

-- Location: FF_X45_Y42_N1
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~5_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg\(2));

-- Location: LCCOMB_X47_Y40_N22
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg_proc~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg\(2),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(1),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg_proc~0_combout\);

-- Location: FF_X47_Y40_N23
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg_proc~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q\);

-- Location: FF_X46_Y40_N1
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~5_combout\,
	asdata => \~QIC_CREATED_GND~I_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	sload => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(8));

-- Location: LCCOMB_X45_Y40_N8
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~7\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg\(0),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~7_combout\);

-- Location: LCCOMB_X45_Y40_N18
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~8\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(3),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(8),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~7_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~8_combout\);

-- Location: LCCOMB_X45_Y39_N30
\u_keyboard_reader|u_ringbuffer|u_ram|ram~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~10_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ram|ram~10_combout\,
	datad => \rtl~0clkctrl_outclk\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~10_combout\);

-- Location: LCCOMB_X45_Y39_N0
\u_keyboard_reader|u_ringbuffer|u_ram|ram~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~14_combout\ = (GLOBAL(\rtl~3clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\)) # (!GLOBAL(\rtl~3clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rtl~3clkctrl_outclk\,
	datac => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~14_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~14_combout\);

-- Location: LCCOMB_X43_Y35_N12
\u_keyboard_reader|u_ringbuffer|u_ram|ram~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~6_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\,
	datac => \rtl~1clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~6_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~6_combout\);

-- Location: LCCOMB_X43_Y35_N6
\u_keyboard_reader|u_ringbuffer|u_ram|ram~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~2_combout\ = (GLOBAL(\rtl~2clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\)) # (!GLOBAL(\rtl~2clkctrl_outclk\) & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\,
	datac => \rtl~2clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~2_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~2_combout\);

-- Location: LCCOMB_X43_Y35_N30
\u_keyboard_reader|u_ringbuffer|u_ram|ram~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~44_combout\ = (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & (((\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\)))) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & 
-- ((\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & (\u_keyboard_reader|u_ringbuffer|u_ram|ram~6_combout\)) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ram|ram~6_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~2_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~44_combout\);

-- Location: LCCOMB_X45_Y39_N12
\u_keyboard_reader|u_ringbuffer|u_ram|ram~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~45_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ram|ram~44_combout\ & (((\u_keyboard_reader|u_ringbuffer|u_ram|ram~14_combout\) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\)))) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_ram|ram~44_combout\ & (\u_keyboard_reader|u_ringbuffer|u_ram|ram~10_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ram|ram~10_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ram|ram~14_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ram|ram~44_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~45_combout\);

-- Location: LCCOMB_X45_Y39_N20
\u_keyboard_reader|u_ringbuffer|u_ram|ram~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~18_combout\ = (GLOBAL(\rtl~6clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\)) # (!GLOBAL(\rtl~6clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\,
	datac => \rtl~6clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~18_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~18_combout\);

-- Location: LCCOMB_X46_Y38_N16
\u_keyboard_reader|u_ringbuffer|u_ram|ram~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~26_combout\ = (GLOBAL(\rtl~5clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\)) # (!GLOBAL(\rtl~5clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\,
	datac => \rtl~5clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~26_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~26_combout\);

-- Location: LCCOMB_X45_Y39_N8
\u_keyboard_reader|u_ringbuffer|u_ram|ram~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~42_combout\ = (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & (((\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\)))) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & 
-- ((\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~26_combout\))) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & (\u_keyboard_reader|u_ringbuffer|u_ram|ram~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ram|ram~18_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ram|ram~26_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~42_combout\);

-- Location: LCCOMB_X46_Y38_N30
\u_keyboard_reader|u_ringbuffer|u_ram|ram~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~22_combout\ = (GLOBAL(\rtl~4clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\)) # (!GLOBAL(\rtl~4clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ram|ram~22_combout\,
	datad => \rtl~4clkctrl_outclk\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~22_combout\);

-- Location: LCCOMB_X46_Y38_N2
\u_keyboard_reader|u_ringbuffer|u_ram|ram~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~30_combout\ = (GLOBAL(\rtl~7clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\)) # (!GLOBAL(\rtl~7clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~30_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\,
	datac => \rtl~7clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~30_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~30_combout\);

-- Location: LCCOMB_X45_Y39_N26
\u_keyboard_reader|u_ringbuffer|u_ram|ram~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~43_combout\ = (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~42_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~30_combout\))) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_ram|ram~42_combout\ & (\u_keyboard_reader|u_ringbuffer|u_ram|ram~22_combout\)))) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & (\u_keyboard_reader|u_ringbuffer|u_ram|ram~42_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ram|ram~42_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ram|ram~22_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~30_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~43_combout\);

-- Location: LCCOMB_X45_Y39_N4
\u_keyboard_reader|u_ringbuffer|u_ram|ram~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~46_combout\ = (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~43_combout\))) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\ & 
-- (\u_keyboard_reader|u_ringbuffer|u_ram|ram~45_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ram|ram~45_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ram|ram~43_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~46_combout\);

-- Location: FF_X45_Y39_N5
\u_keyboard_reader|u_outputbuffer|u_OutputRegister|u_FFD2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_ringbuffer|u_ram|ram~46_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.STATE_REGISTERING~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_outputbuffer|u_OutputRegister|u_FFD2|Q~q\);

-- Location: LCCOMB_X45_Y42_N8
\~GND\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X45_Y42_N2
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~13\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \~GND~combout\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(8),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~13_combout\);

-- Location: FF_X45_Y42_N3
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~13_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(7));

-- Location: IOIBUF_X36_Y39_N22
\M~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_M,
	o => \M~input_o\);

-- Location: LCCOMB_X45_Y42_N24
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~12\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(7),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datad => \M~input_o\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~12_combout\);

-- Location: FF_X45_Y42_N25
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~12_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(6));

-- Location: LCCOMB_X24_Y28_N2
\u_SDC|u_clkdiv|Add0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~1_cout\ = CARRY((!\u_keyboard_reader|u_key_decode|u_clk|count\(0) & \u_keyboard_reader|u_key_decode|u_clk|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_clk|count\(0),
	datab => \u_keyboard_reader|u_key_decode|u_clk|count\(1),
	datad => VCC,
	cout => \u_SDC|u_clkdiv|Add0~1_cout\);

-- Location: LCCOMB_X24_Y28_N4
\u_SDC|u_clkdiv|Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~2_combout\ = (\u_SDC|u_clkdiv|count\(2) & (!\u_SDC|u_clkdiv|Add0~1_cout\)) # (!\u_SDC|u_clkdiv|count\(2) & ((\u_SDC|u_clkdiv|Add0~1_cout\) # (GND)))
-- \u_SDC|u_clkdiv|Add0~3\ = CARRY((!\u_SDC|u_clkdiv|Add0~1_cout\) # (!\u_SDC|u_clkdiv|count\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(2),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~1_cout\,
	combout => \u_SDC|u_clkdiv|Add0~2_combout\,
	cout => \u_SDC|u_clkdiv|Add0~3\);

-- Location: LCCOMB_X24_Y25_N10
\u_SDC|u_clkdiv|count~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|count~0_combout\ = (!\u_SDC|u_clkdiv|Equal0~9_combout\ & \u_SDC|u_clkdiv|Add0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_SDC|u_clkdiv|Equal0~9_combout\,
	datad => \u_SDC|u_clkdiv|Add0~2_combout\,
	combout => \u_SDC|u_clkdiv|count~0_combout\);

-- Location: FF_X24_Y25_N11
\u_SDC|u_clkdiv|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(2));

-- Location: LCCOMB_X24_Y28_N6
\u_SDC|u_clkdiv|Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~4_combout\ = (\u_SDC|u_clkdiv|count\(3) & (\u_SDC|u_clkdiv|Add0~3\ $ (GND))) # (!\u_SDC|u_clkdiv|count\(3) & (!\u_SDC|u_clkdiv|Add0~3\ & VCC))
-- \u_SDC|u_clkdiv|Add0~5\ = CARRY((\u_SDC|u_clkdiv|count\(3) & !\u_SDC|u_clkdiv|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(3),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~3\,
	combout => \u_SDC|u_clkdiv|Add0~4_combout\,
	cout => \u_SDC|u_clkdiv|Add0~5\);

-- Location: FF_X24_Y28_N7
\u_SDC|u_clkdiv|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(3));

-- Location: LCCOMB_X24_Y28_N8
\u_SDC|u_clkdiv|Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~6_combout\ = (\u_SDC|u_clkdiv|count\(4) & (!\u_SDC|u_clkdiv|Add0~5\)) # (!\u_SDC|u_clkdiv|count\(4) & ((\u_SDC|u_clkdiv|Add0~5\) # (GND)))
-- \u_SDC|u_clkdiv|Add0~7\ = CARRY((!\u_SDC|u_clkdiv|Add0~5\) # (!\u_SDC|u_clkdiv|count\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(4),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~5\,
	combout => \u_SDC|u_clkdiv|Add0~6_combout\,
	cout => \u_SDC|u_clkdiv|Add0~7\);

-- Location: LCCOMB_X24_Y25_N12
\u_SDC|u_clkdiv|count~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|count~1_combout\ = (!\u_SDC|u_clkdiv|Equal0~9_combout\ & \u_SDC|u_clkdiv|Add0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_SDC|u_clkdiv|Equal0~9_combout\,
	datad => \u_SDC|u_clkdiv|Add0~6_combout\,
	combout => \u_SDC|u_clkdiv|count~1_combout\);

-- Location: FF_X24_Y25_N13
\u_SDC|u_clkdiv|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(4));

-- Location: LCCOMB_X24_Y28_N10
\u_SDC|u_clkdiv|Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~8_combout\ = (\u_SDC|u_clkdiv|count\(5) & (\u_SDC|u_clkdiv|Add0~7\ $ (GND))) # (!\u_SDC|u_clkdiv|count\(5) & (!\u_SDC|u_clkdiv|Add0~7\ & VCC))
-- \u_SDC|u_clkdiv|Add0~9\ = CARRY((\u_SDC|u_clkdiv|count\(5) & !\u_SDC|u_clkdiv|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(5),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~7\,
	combout => \u_SDC|u_clkdiv|Add0~8_combout\,
	cout => \u_SDC|u_clkdiv|Add0~9\);

-- Location: LCCOMB_X24_Y25_N6
\u_SDC|u_clkdiv|count~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|count~2_combout\ = (!\u_SDC|u_clkdiv|Equal0~9_combout\ & \u_SDC|u_clkdiv|Add0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|Equal0~9_combout\,
	datac => \u_SDC|u_clkdiv|Add0~8_combout\,
	combout => \u_SDC|u_clkdiv|count~2_combout\);

-- Location: FF_X24_Y25_N7
\u_SDC|u_clkdiv|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(5));

-- Location: LCCOMB_X24_Y28_N12
\u_SDC|u_clkdiv|Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~10_combout\ = (\u_SDC|u_clkdiv|count\(6) & (!\u_SDC|u_clkdiv|Add0~9\)) # (!\u_SDC|u_clkdiv|count\(6) & ((\u_SDC|u_clkdiv|Add0~9\) # (GND)))
-- \u_SDC|u_clkdiv|Add0~11\ = CARRY((!\u_SDC|u_clkdiv|Add0~9\) # (!\u_SDC|u_clkdiv|count\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(6),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~9\,
	combout => \u_SDC|u_clkdiv|Add0~10_combout\,
	cout => \u_SDC|u_clkdiv|Add0~11\);

-- Location: LCCOMB_X24_Y25_N24
\u_SDC|u_clkdiv|count~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|count~3_combout\ = (!\u_SDC|u_clkdiv|Equal0~9_combout\ & \u_SDC|u_clkdiv|Add0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|Equal0~9_combout\,
	datac => \u_SDC|u_clkdiv|Add0~10_combout\,
	combout => \u_SDC|u_clkdiv|count~3_combout\);

-- Location: FF_X24_Y25_N25
\u_SDC|u_clkdiv|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|count~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(6));

-- Location: LCCOMB_X24_Y28_N14
\u_SDC|u_clkdiv|Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~12_combout\ = (\u_SDC|u_clkdiv|count\(7) & (\u_SDC|u_clkdiv|Add0~11\ $ (GND))) # (!\u_SDC|u_clkdiv|count\(7) & (!\u_SDC|u_clkdiv|Add0~11\ & VCC))
-- \u_SDC|u_clkdiv|Add0~13\ = CARRY((\u_SDC|u_clkdiv|count\(7) & !\u_SDC|u_clkdiv|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(7),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~11\,
	combout => \u_SDC|u_clkdiv|Add0~12_combout\,
	cout => \u_SDC|u_clkdiv|Add0~13\);

-- Location: LCCOMB_X24_Y25_N18
\u_SDC|u_clkdiv|count~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|count~4_combout\ = (!\u_SDC|u_clkdiv|Equal0~9_combout\ & \u_SDC|u_clkdiv|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|Equal0~9_combout\,
	datac => \u_SDC|u_clkdiv|Add0~12_combout\,
	combout => \u_SDC|u_clkdiv|count~4_combout\);

-- Location: FF_X24_Y25_N19
\u_SDC|u_clkdiv|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|count~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(7));

-- Location: LCCOMB_X24_Y28_N16
\u_SDC|u_clkdiv|Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~14_combout\ = (\u_SDC|u_clkdiv|count\(8) & (!\u_SDC|u_clkdiv|Add0~13\)) # (!\u_SDC|u_clkdiv|count\(8) & ((\u_SDC|u_clkdiv|Add0~13\) # (GND)))
-- \u_SDC|u_clkdiv|Add0~15\ = CARRY((!\u_SDC|u_clkdiv|Add0~13\) # (!\u_SDC|u_clkdiv|count\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(8),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~13\,
	combout => \u_SDC|u_clkdiv|Add0~14_combout\,
	cout => \u_SDC|u_clkdiv|Add0~15\);

-- Location: LCCOMB_X24_Y25_N16
\u_SDC|u_clkdiv|count~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|count~5_combout\ = (!\u_SDC|u_clkdiv|Equal0~9_combout\ & \u_SDC|u_clkdiv|Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_SDC|u_clkdiv|Equal0~9_combout\,
	datad => \u_SDC|u_clkdiv|Add0~14_combout\,
	combout => \u_SDC|u_clkdiv|count~5_combout\);

-- Location: FF_X24_Y25_N17
\u_SDC|u_clkdiv|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|count~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(8));

-- Location: LCCOMB_X24_Y28_N18
\u_SDC|u_clkdiv|Add0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~16_combout\ = (\u_SDC|u_clkdiv|count\(9) & (\u_SDC|u_clkdiv|Add0~15\ $ (GND))) # (!\u_SDC|u_clkdiv|count\(9) & (!\u_SDC|u_clkdiv|Add0~15\ & VCC))
-- \u_SDC|u_clkdiv|Add0~17\ = CARRY((\u_SDC|u_clkdiv|count\(9) & !\u_SDC|u_clkdiv|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(9),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~15\,
	combout => \u_SDC|u_clkdiv|Add0~16_combout\,
	cout => \u_SDC|u_clkdiv|Add0~17\);

-- Location: FF_X24_Y28_N19
\u_SDC|u_clkdiv|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(9));

-- Location: LCCOMB_X24_Y28_N20
\u_SDC|u_clkdiv|Add0~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~18_combout\ = (\u_SDC|u_clkdiv|count\(10) & (!\u_SDC|u_clkdiv|Add0~17\)) # (!\u_SDC|u_clkdiv|count\(10) & ((\u_SDC|u_clkdiv|Add0~17\) # (GND)))
-- \u_SDC|u_clkdiv|Add0~19\ = CARRY((!\u_SDC|u_clkdiv|Add0~17\) # (!\u_SDC|u_clkdiv|count\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(10),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~17\,
	combout => \u_SDC|u_clkdiv|Add0~18_combout\,
	cout => \u_SDC|u_clkdiv|Add0~19\);

-- Location: FF_X24_Y28_N21
\u_SDC|u_clkdiv|count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(10));

-- Location: LCCOMB_X24_Y28_N22
\u_SDC|u_clkdiv|Add0~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~20_combout\ = (\u_SDC|u_clkdiv|count\(11) & (\u_SDC|u_clkdiv|Add0~19\ $ (GND))) # (!\u_SDC|u_clkdiv|count\(11) & (!\u_SDC|u_clkdiv|Add0~19\ & VCC))
-- \u_SDC|u_clkdiv|Add0~21\ = CARRY((\u_SDC|u_clkdiv|count\(11) & !\u_SDC|u_clkdiv|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(11),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~19\,
	combout => \u_SDC|u_clkdiv|Add0~20_combout\,
	cout => \u_SDC|u_clkdiv|Add0~21\);

-- Location: FF_X24_Y28_N23
\u_SDC|u_clkdiv|count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(11));

-- Location: LCCOMB_X24_Y25_N26
\u_SDC|u_clkdiv|Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Equal0~2_combout\ = (!\u_SDC|u_clkdiv|count\(11) & (\u_SDC|u_clkdiv|count\(8) & (!\u_SDC|u_clkdiv|count\(9) & !\u_SDC|u_clkdiv|count\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(11),
	datab => \u_SDC|u_clkdiv|count\(8),
	datac => \u_SDC|u_clkdiv|count\(9),
	datad => \u_SDC|u_clkdiv|count\(10),
	combout => \u_SDC|u_clkdiv|Equal0~2_combout\);

-- Location: LCCOMB_X24_Y28_N24
\u_SDC|u_clkdiv|Add0~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~22_combout\ = (\u_SDC|u_clkdiv|count\(12) & (!\u_SDC|u_clkdiv|Add0~21\)) # (!\u_SDC|u_clkdiv|count\(12) & ((\u_SDC|u_clkdiv|Add0~21\) # (GND)))
-- \u_SDC|u_clkdiv|Add0~23\ = CARRY((!\u_SDC|u_clkdiv|Add0~21\) # (!\u_SDC|u_clkdiv|count\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(12),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~21\,
	combout => \u_SDC|u_clkdiv|Add0~22_combout\,
	cout => \u_SDC|u_clkdiv|Add0~23\);

-- Location: FF_X24_Y28_N25
\u_SDC|u_clkdiv|count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(12));

-- Location: LCCOMB_X24_Y28_N26
\u_SDC|u_clkdiv|Add0~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~24_combout\ = (\u_SDC|u_clkdiv|count\(13) & (\u_SDC|u_clkdiv|Add0~23\ $ (GND))) # (!\u_SDC|u_clkdiv|count\(13) & (!\u_SDC|u_clkdiv|Add0~23\ & VCC))
-- \u_SDC|u_clkdiv|Add0~25\ = CARRY((\u_SDC|u_clkdiv|count\(13) & !\u_SDC|u_clkdiv|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(13),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~23\,
	combout => \u_SDC|u_clkdiv|Add0~24_combout\,
	cout => \u_SDC|u_clkdiv|Add0~25\);

-- Location: FF_X24_Y28_N27
\u_SDC|u_clkdiv|count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(13));

-- Location: LCCOMB_X24_Y28_N28
\u_SDC|u_clkdiv|Add0~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~26_combout\ = (\u_SDC|u_clkdiv|count\(14) & (!\u_SDC|u_clkdiv|Add0~25\)) # (!\u_SDC|u_clkdiv|count\(14) & ((\u_SDC|u_clkdiv|Add0~25\) # (GND)))
-- \u_SDC|u_clkdiv|Add0~27\ = CARRY((!\u_SDC|u_clkdiv|Add0~25\) # (!\u_SDC|u_clkdiv|count\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(14),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~25\,
	combout => \u_SDC|u_clkdiv|Add0~26_combout\,
	cout => \u_SDC|u_clkdiv|Add0~27\);

-- Location: FF_X24_Y28_N29
\u_SDC|u_clkdiv|count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(14));

-- Location: LCCOMB_X24_Y28_N30
\u_SDC|u_clkdiv|Add0~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~28_combout\ = (\u_SDC|u_clkdiv|count\(15) & (\u_SDC|u_clkdiv|Add0~27\ $ (GND))) # (!\u_SDC|u_clkdiv|count\(15) & (!\u_SDC|u_clkdiv|Add0~27\ & VCC))
-- \u_SDC|u_clkdiv|Add0~29\ = CARRY((\u_SDC|u_clkdiv|count\(15) & !\u_SDC|u_clkdiv|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(15),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~27\,
	combout => \u_SDC|u_clkdiv|Add0~28_combout\,
	cout => \u_SDC|u_clkdiv|Add0~29\);

-- Location: FF_X24_Y28_N31
\u_SDC|u_clkdiv|count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(15));

-- Location: LCCOMB_X24_Y27_N0
\u_SDC|u_clkdiv|Add0~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~30_combout\ = (\u_SDC|u_clkdiv|count\(16) & (!\u_SDC|u_clkdiv|Add0~29\)) # (!\u_SDC|u_clkdiv|count\(16) & ((\u_SDC|u_clkdiv|Add0~29\) # (GND)))
-- \u_SDC|u_clkdiv|Add0~31\ = CARRY((!\u_SDC|u_clkdiv|Add0~29\) # (!\u_SDC|u_clkdiv|count\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(16),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~29\,
	combout => \u_SDC|u_clkdiv|Add0~30_combout\,
	cout => \u_SDC|u_clkdiv|Add0~31\);

-- Location: FF_X24_Y27_N1
\u_SDC|u_clkdiv|count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(16));

-- Location: LCCOMB_X24_Y27_N2
\u_SDC|u_clkdiv|Add0~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~32_combout\ = (\u_SDC|u_clkdiv|count\(17) & (\u_SDC|u_clkdiv|Add0~31\ $ (GND))) # (!\u_SDC|u_clkdiv|count\(17) & (!\u_SDC|u_clkdiv|Add0~31\ & VCC))
-- \u_SDC|u_clkdiv|Add0~33\ = CARRY((\u_SDC|u_clkdiv|count\(17) & !\u_SDC|u_clkdiv|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(17),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~31\,
	combout => \u_SDC|u_clkdiv|Add0~32_combout\,
	cout => \u_SDC|u_clkdiv|Add0~33\);

-- Location: FF_X24_Y27_N3
\u_SDC|u_clkdiv|count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(17));

-- Location: LCCOMB_X24_Y27_N4
\u_SDC|u_clkdiv|Add0~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~34_combout\ = (\u_SDC|u_clkdiv|count\(18) & (!\u_SDC|u_clkdiv|Add0~33\)) # (!\u_SDC|u_clkdiv|count\(18) & ((\u_SDC|u_clkdiv|Add0~33\) # (GND)))
-- \u_SDC|u_clkdiv|Add0~35\ = CARRY((!\u_SDC|u_clkdiv|Add0~33\) # (!\u_SDC|u_clkdiv|count\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(18),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~33\,
	combout => \u_SDC|u_clkdiv|Add0~34_combout\,
	cout => \u_SDC|u_clkdiv|Add0~35\);

-- Location: FF_X24_Y27_N5
\u_SDC|u_clkdiv|count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(18));

-- Location: LCCOMB_X24_Y27_N6
\u_SDC|u_clkdiv|Add0~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~36_combout\ = (\u_SDC|u_clkdiv|count\(19) & (\u_SDC|u_clkdiv|Add0~35\ $ (GND))) # (!\u_SDC|u_clkdiv|count\(19) & (!\u_SDC|u_clkdiv|Add0~35\ & VCC))
-- \u_SDC|u_clkdiv|Add0~37\ = CARRY((\u_SDC|u_clkdiv|count\(19) & !\u_SDC|u_clkdiv|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(19),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~35\,
	combout => \u_SDC|u_clkdiv|Add0~36_combout\,
	cout => \u_SDC|u_clkdiv|Add0~37\);

-- Location: FF_X24_Y27_N7
\u_SDC|u_clkdiv|count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(19));

-- Location: LCCOMB_X24_Y27_N8
\u_SDC|u_clkdiv|Add0~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~38_combout\ = (\u_SDC|u_clkdiv|count\(20) & (!\u_SDC|u_clkdiv|Add0~37\)) # (!\u_SDC|u_clkdiv|count\(20) & ((\u_SDC|u_clkdiv|Add0~37\) # (GND)))
-- \u_SDC|u_clkdiv|Add0~39\ = CARRY((!\u_SDC|u_clkdiv|Add0~37\) # (!\u_SDC|u_clkdiv|count\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(20),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~37\,
	combout => \u_SDC|u_clkdiv|Add0~38_combout\,
	cout => \u_SDC|u_clkdiv|Add0~39\);

-- Location: FF_X24_Y27_N9
\u_SDC|u_clkdiv|count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(20));

-- Location: LCCOMB_X24_Y27_N10
\u_SDC|u_clkdiv|Add0~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~40_combout\ = (\u_SDC|u_clkdiv|count\(21) & (\u_SDC|u_clkdiv|Add0~39\ $ (GND))) # (!\u_SDC|u_clkdiv|count\(21) & (!\u_SDC|u_clkdiv|Add0~39\ & VCC))
-- \u_SDC|u_clkdiv|Add0~41\ = CARRY((\u_SDC|u_clkdiv|count\(21) & !\u_SDC|u_clkdiv|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(21),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~39\,
	combout => \u_SDC|u_clkdiv|Add0~40_combout\,
	cout => \u_SDC|u_clkdiv|Add0~41\);

-- Location: FF_X24_Y27_N11
\u_SDC|u_clkdiv|count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(21));

-- Location: LCCOMB_X24_Y27_N12
\u_SDC|u_clkdiv|Add0~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~42_combout\ = (\u_SDC|u_clkdiv|count\(22) & (!\u_SDC|u_clkdiv|Add0~41\)) # (!\u_SDC|u_clkdiv|count\(22) & ((\u_SDC|u_clkdiv|Add0~41\) # (GND)))
-- \u_SDC|u_clkdiv|Add0~43\ = CARRY((!\u_SDC|u_clkdiv|Add0~41\) # (!\u_SDC|u_clkdiv|count\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(22),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~41\,
	combout => \u_SDC|u_clkdiv|Add0~42_combout\,
	cout => \u_SDC|u_clkdiv|Add0~43\);

-- Location: FF_X24_Y27_N13
\u_SDC|u_clkdiv|count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(22));

-- Location: LCCOMB_X24_Y27_N14
\u_SDC|u_clkdiv|Add0~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~44_combout\ = (\u_SDC|u_clkdiv|count\(23) & (\u_SDC|u_clkdiv|Add0~43\ $ (GND))) # (!\u_SDC|u_clkdiv|count\(23) & (!\u_SDC|u_clkdiv|Add0~43\ & VCC))
-- \u_SDC|u_clkdiv|Add0~45\ = CARRY((\u_SDC|u_clkdiv|count\(23) & !\u_SDC|u_clkdiv|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(23),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~43\,
	combout => \u_SDC|u_clkdiv|Add0~44_combout\,
	cout => \u_SDC|u_clkdiv|Add0~45\);

-- Location: FF_X24_Y27_N15
\u_SDC|u_clkdiv|count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(23));

-- Location: LCCOMB_X24_Y27_N16
\u_SDC|u_clkdiv|Add0~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~46_combout\ = (\u_SDC|u_clkdiv|count\(24) & (!\u_SDC|u_clkdiv|Add0~45\)) # (!\u_SDC|u_clkdiv|count\(24) & ((\u_SDC|u_clkdiv|Add0~45\) # (GND)))
-- \u_SDC|u_clkdiv|Add0~47\ = CARRY((!\u_SDC|u_clkdiv|Add0~45\) # (!\u_SDC|u_clkdiv|count\(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(24),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~45\,
	combout => \u_SDC|u_clkdiv|Add0~46_combout\,
	cout => \u_SDC|u_clkdiv|Add0~47\);

-- Location: FF_X24_Y27_N17
\u_SDC|u_clkdiv|count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(24));

-- Location: LCCOMB_X24_Y27_N18
\u_SDC|u_clkdiv|Add0~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~48_combout\ = (\u_SDC|u_clkdiv|count\(25) & (\u_SDC|u_clkdiv|Add0~47\ $ (GND))) # (!\u_SDC|u_clkdiv|count\(25) & (!\u_SDC|u_clkdiv|Add0~47\ & VCC))
-- \u_SDC|u_clkdiv|Add0~49\ = CARRY((\u_SDC|u_clkdiv|count\(25) & !\u_SDC|u_clkdiv|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(25),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~47\,
	combout => \u_SDC|u_clkdiv|Add0~48_combout\,
	cout => \u_SDC|u_clkdiv|Add0~49\);

-- Location: FF_X24_Y27_N19
\u_SDC|u_clkdiv|count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(25));

-- Location: LCCOMB_X24_Y27_N20
\u_SDC|u_clkdiv|Add0~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~50_combout\ = (\u_SDC|u_clkdiv|count\(26) & (!\u_SDC|u_clkdiv|Add0~49\)) # (!\u_SDC|u_clkdiv|count\(26) & ((\u_SDC|u_clkdiv|Add0~49\) # (GND)))
-- \u_SDC|u_clkdiv|Add0~51\ = CARRY((!\u_SDC|u_clkdiv|Add0~49\) # (!\u_SDC|u_clkdiv|count\(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(26),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~49\,
	combout => \u_SDC|u_clkdiv|Add0~50_combout\,
	cout => \u_SDC|u_clkdiv|Add0~51\);

-- Location: FF_X24_Y27_N21
\u_SDC|u_clkdiv|count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(26));

-- Location: LCCOMB_X24_Y27_N22
\u_SDC|u_clkdiv|Add0~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~52_combout\ = (\u_SDC|u_clkdiv|count\(27) & (\u_SDC|u_clkdiv|Add0~51\ $ (GND))) # (!\u_SDC|u_clkdiv|count\(27) & (!\u_SDC|u_clkdiv|Add0~51\ & VCC))
-- \u_SDC|u_clkdiv|Add0~53\ = CARRY((\u_SDC|u_clkdiv|count\(27) & !\u_SDC|u_clkdiv|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(27),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~51\,
	combout => \u_SDC|u_clkdiv|Add0~52_combout\,
	cout => \u_SDC|u_clkdiv|Add0~53\);

-- Location: FF_X24_Y27_N23
\u_SDC|u_clkdiv|count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(27));

-- Location: LCCOMB_X24_Y25_N8
\u_SDC|u_clkdiv|Equal0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Equal0~6_combout\ = (!\u_SDC|u_clkdiv|count\(24) & (!\u_SDC|u_clkdiv|count\(25) & (!\u_SDC|u_clkdiv|count\(27) & !\u_SDC|u_clkdiv|count\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(24),
	datab => \u_SDC|u_clkdiv|count\(25),
	datac => \u_SDC|u_clkdiv|count\(27),
	datad => \u_SDC|u_clkdiv|count\(26),
	combout => \u_SDC|u_clkdiv|Equal0~6_combout\);

-- Location: LCCOMB_X24_Y27_N24
\u_SDC|u_clkdiv|Add0~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~54_combout\ = (\u_SDC|u_clkdiv|count\(28) & (!\u_SDC|u_clkdiv|Add0~53\)) # (!\u_SDC|u_clkdiv|count\(28) & ((\u_SDC|u_clkdiv|Add0~53\) # (GND)))
-- \u_SDC|u_clkdiv|Add0~55\ = CARRY((!\u_SDC|u_clkdiv|Add0~53\) # (!\u_SDC|u_clkdiv|count\(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(28),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~53\,
	combout => \u_SDC|u_clkdiv|Add0~54_combout\,
	cout => \u_SDC|u_clkdiv|Add0~55\);

-- Location: FF_X24_Y27_N25
\u_SDC|u_clkdiv|count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(28));

-- Location: LCCOMB_X24_Y27_N26
\u_SDC|u_clkdiv|Add0~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~56_combout\ = (\u_SDC|u_clkdiv|count\(29) & (\u_SDC|u_clkdiv|Add0~55\ $ (GND))) # (!\u_SDC|u_clkdiv|count\(29) & (!\u_SDC|u_clkdiv|Add0~55\ & VCC))
-- \u_SDC|u_clkdiv|Add0~57\ = CARRY((\u_SDC|u_clkdiv|count\(29) & !\u_SDC|u_clkdiv|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(29),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~55\,
	combout => \u_SDC|u_clkdiv|Add0~56_combout\,
	cout => \u_SDC|u_clkdiv|Add0~57\);

-- Location: FF_X24_Y27_N27
\u_SDC|u_clkdiv|count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(29));

-- Location: LCCOMB_X24_Y27_N28
\u_SDC|u_clkdiv|Add0~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~58_combout\ = (\u_SDC|u_clkdiv|count\(30) & (!\u_SDC|u_clkdiv|Add0~57\)) # (!\u_SDC|u_clkdiv|count\(30) & ((\u_SDC|u_clkdiv|Add0~57\) # (GND)))
-- \u_SDC|u_clkdiv|Add0~59\ = CARRY((!\u_SDC|u_clkdiv|Add0~57\) # (!\u_SDC|u_clkdiv|count\(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_clkdiv|count\(30),
	datad => VCC,
	cin => \u_SDC|u_clkdiv|Add0~57\,
	combout => \u_SDC|u_clkdiv|Add0~58_combout\,
	cout => \u_SDC|u_clkdiv|Add0~59\);

-- Location: FF_X24_Y27_N29
\u_SDC|u_clkdiv|count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(30));

-- Location: LCCOMB_X24_Y27_N30
\u_SDC|u_clkdiv|Add0~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Add0~60_combout\ = \u_SDC|u_clkdiv|count\(31) $ (!\u_SDC|u_clkdiv|Add0~59\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(31),
	cin => \u_SDC|u_clkdiv|Add0~59\,
	combout => \u_SDC|u_clkdiv|Add0~60_combout\);

-- Location: FF_X24_Y27_N31
\u_SDC|u_clkdiv|count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|Add0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|count\(31));

-- Location: LCCOMB_X24_Y25_N2
\u_SDC|u_clkdiv|Equal0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Equal0~7_combout\ = (!\u_SDC|u_clkdiv|count\(31) & (!\u_SDC|u_clkdiv|count\(28) & (!\u_SDC|u_clkdiv|count\(30) & !\u_SDC|u_clkdiv|count\(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(31),
	datab => \u_SDC|u_clkdiv|count\(28),
	datac => \u_SDC|u_clkdiv|count\(30),
	datad => \u_SDC|u_clkdiv|count\(29),
	combout => \u_SDC|u_clkdiv|Equal0~7_combout\);

-- Location: LCCOMB_X24_Y25_N14
\u_SDC|u_clkdiv|Equal0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Equal0~5_combout\ = (!\u_SDC|u_clkdiv|count\(21) & (!\u_SDC|u_clkdiv|count\(22) & (!\u_SDC|u_clkdiv|count\(23) & !\u_SDC|u_clkdiv|count\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(21),
	datab => \u_SDC|u_clkdiv|count\(22),
	datac => \u_SDC|u_clkdiv|count\(23),
	datad => \u_SDC|u_clkdiv|count\(20),
	combout => \u_SDC|u_clkdiv|Equal0~5_combout\);

-- Location: LCCOMB_X24_Y25_N20
\u_SDC|u_clkdiv|Equal0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Equal0~4_combout\ = (!\u_SDC|u_clkdiv|count\(16) & (!\u_SDC|u_clkdiv|count\(19) & (!\u_SDC|u_clkdiv|count\(18) & !\u_SDC|u_clkdiv|count\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(16),
	datab => \u_SDC|u_clkdiv|count\(19),
	datac => \u_SDC|u_clkdiv|count\(18),
	datad => \u_SDC|u_clkdiv|count\(17),
	combout => \u_SDC|u_clkdiv|Equal0~4_combout\);

-- Location: LCCOMB_X24_Y25_N28
\u_SDC|u_clkdiv|Equal0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Equal0~8_combout\ = (\u_SDC|u_clkdiv|Equal0~6_combout\ & (\u_SDC|u_clkdiv|Equal0~7_combout\ & (\u_SDC|u_clkdiv|Equal0~5_combout\ & \u_SDC|u_clkdiv|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|Equal0~6_combout\,
	datab => \u_SDC|u_clkdiv|Equal0~7_combout\,
	datac => \u_SDC|u_clkdiv|Equal0~5_combout\,
	datad => \u_SDC|u_clkdiv|Equal0~4_combout\,
	combout => \u_SDC|u_clkdiv|Equal0~8_combout\);

-- Location: LCCOMB_X24_Y28_N0
\u_SDC|u_clkdiv|Equal0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Equal0~3_combout\ = (!\u_SDC|u_clkdiv|count\(13) & (!\u_SDC|u_clkdiv|count\(14) & (!\u_SDC|u_clkdiv|count\(15) & !\u_SDC|u_clkdiv|count\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(13),
	datab => \u_SDC|u_clkdiv|count\(14),
	datac => \u_SDC|u_clkdiv|count\(15),
	datad => \u_SDC|u_clkdiv|count\(12),
	combout => \u_SDC|u_clkdiv|Equal0~3_combout\);

-- Location: LCCOMB_X24_Y25_N4
\u_SDC|u_clkdiv|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Equal0~0_combout\ = (\u_SDC|u_clkdiv|count\(5) & (\u_SDC|u_clkdiv|count\(6) & (\u_SDC|u_clkdiv|count\(4) & \u_SDC|u_clkdiv|count\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(5),
	datab => \u_SDC|u_clkdiv|count\(6),
	datac => \u_SDC|u_clkdiv|count\(4),
	datad => \u_SDC|u_clkdiv|count\(7),
	combout => \u_SDC|u_clkdiv|Equal0~0_combout\);

-- Location: LCCOMB_X24_Y25_N30
\u_SDC|u_clkdiv|Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Equal0~1_combout\ = (\u_SDC|u_clkdiv|count\(2) & (\u_keyboard_reader|u_key_decode|u_clk|Equal0~0_combout\ & (\u_SDC|u_clkdiv|Equal0~0_combout\ & !\u_SDC|u_clkdiv|count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|count\(2),
	datab => \u_keyboard_reader|u_key_decode|u_clk|Equal0~0_combout\,
	datac => \u_SDC|u_clkdiv|Equal0~0_combout\,
	datad => \u_SDC|u_clkdiv|count\(3),
	combout => \u_SDC|u_clkdiv|Equal0~1_combout\);

-- Location: LCCOMB_X24_Y25_N22
\u_SDC|u_clkdiv|Equal0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|Equal0~9_combout\ = (\u_SDC|u_clkdiv|Equal0~2_combout\ & (\u_SDC|u_clkdiv|Equal0~8_combout\ & (\u_SDC|u_clkdiv|Equal0~3_combout\ & \u_SDC|u_clkdiv|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|Equal0~2_combout\,
	datab => \u_SDC|u_clkdiv|Equal0~8_combout\,
	datac => \u_SDC|u_clkdiv|Equal0~3_combout\,
	datad => \u_SDC|u_clkdiv|Equal0~1_combout\,
	combout => \u_SDC|u_clkdiv|Equal0~9_combout\);

-- Location: LCCOMB_X24_Y25_N0
\u_SDC|u_clkdiv|tmp~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_clkdiv|tmp~0_combout\ = \u_SDC|u_clkdiv|Equal0~9_combout\ $ (\u_SDC|u_clkdiv|tmp~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_clkdiv|Equal0~9_combout\,
	datac => \u_SDC|u_clkdiv|tmp~q\,
	combout => \u_SDC|u_clkdiv|tmp~0_combout\);

-- Location: FF_X24_Y25_N1
\u_SDC|u_clkdiv|tmp\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_clkdiv|tmp~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_clkdiv|tmp~q\);

-- Location: CLKCTRL_G4
\u_SDC|u_clkdiv|tmp~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \u_SDC|u_clkdiv|tmp~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \u_SDC|u_clkdiv|tmp~clkctrl_outclk\);

-- Location: IOIBUF_X51_Y54_N1
\sclose~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sclose,
	o => \sclose~input_o\);

-- Location: IOIBUF_X51_Y54_N22
\sopen~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sopen,
	o => \sopen~input_o\);

-- Location: LCCOMB_X44_Y42_N10
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~feeder_combout\);

-- Location: LCCOMB_X44_Y42_N8
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg_proc~0_combout\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(8),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~0_combout\);

-- Location: FF_X44_Y42_N11
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAP\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~feeder_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~q\);

-- Location: CLKCTRL_G11
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\);

-- Location: LCCOMB_X44_Y42_N26
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(1),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1]~feeder_combout\);

-- Location: FF_X44_Y42_N27
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1]~feeder_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1]~q\);

-- Location: LCCOMB_X45_Y43_N24
\u_SDC|u_serial_receiver|u_shift_register|u_ffd0|Q~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_serial_receiver|u_shift_register|u_ffd0|Q~feeder_combout\ = \auto_hub|i
-- nstrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1]~q\,
	combout => \u_SDC|u_serial_receiver|u_shift_register|u_ffd0|Q~feeder_combout\);

-- Location: LCCOMB_X44_Y42_N22
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][5]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(5),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][5]~feeder_combout\);

-- Location: FF_X44_Y42_N23
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][5]~feeder_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][5]~q\);

-- Location: LCCOMB_X44_Y42_N6
\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~0_combout\ = (\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\ & (\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\ & 
-- ((\u_SDC|u_door_controller|currentState.state_bit_0~q\) # (!\u_SDC|u_door_controller|currentState.state_bit_1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\,
	datab => \u_SDC|u_door_controller|currentState.state_bit_1~q\,
	datac => \u_SDC|u_door_controller|currentState.state_bit_0~q\,
	datad => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\,
	combout => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~0_combout\);

-- Location: LCCOMB_X44_Y46_N24
\u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~0_combout\ = !\u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\,
	combout => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~0_combout\);

-- Location: LCCOMB_X44_Y42_N4
\u_SDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0_combout\ = (!\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\ & !\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\,
	datad => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\,
	combout => \u_SDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0_combout\);

-- Location: CLKCTRL_G9
\u_SDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \u_SDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \u_SDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0clkctrl_outclk\);

-- Location: FF_X44_Y46_N25
\u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\,
	d => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~0_combout\,
	clrn => \u_SDC|u_serial_receiver|u_serial_control|ALT_INV_currentState.STATE_CLEAR~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\);

-- Location: LCCOMB_X44_Y46_N12
\u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~0_combout\ = \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\ $ (\u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\,
	datad => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\,
	combout => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~0_combout\);

-- Location: FF_X44_Y46_N13
\u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\,
	d => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~0_combout\,
	clrn => \u_SDC|u_serial_receiver|u_serial_control|ALT_INV_currentState.STATE_CLEAR~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\);

-- Location: LCCOMB_X44_Y46_N10
\u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~0_combout\ = \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~q\ $ (((\u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\ & \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\,
	datac => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~q\,
	datad => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\,
	combout => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~0_combout\);

-- Location: FF_X44_Y46_N11
\u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\,
	d => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~0_combout\,
	clrn => \u_SDC|u_serial_receiver|u_serial_control|ALT_INV_currentState.STATE_CLEAR~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~q\);

-- Location: LCCOMB_X44_Y46_N16
\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~1_combout\ = (\u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~q\ & (\u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\ & (!\u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\ & 
-- \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~q\,
	datab => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\,
	datac => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\,
	datad => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\,
	combout => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~1_combout\);

-- Location: LCCOMB_X45_Y48_N18
\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~2_combout\ = (\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~0_combout\) # ((!\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\ & 
-- ((\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~1_combout\) # 
-- (!\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][5]~q\,
	datab => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~0_combout\,
	datac => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\,
	datad => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~1_combout\,
	combout => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~2_combout\);

-- Location: FF_X45_Y48_N19
\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\);

-- Location: LCCOMB_X44_Y42_N18
\u_SDC|u_serial_receiver|u_serial_control|wr~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_serial_receiver|u_serial_control|wr~0_combout\ = (!\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\ & 
-- (!\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][5]~q\ & 
-- \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][5]~q\,
	datad => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\,
	combout => \u_SDC|u_serial_receiver|u_serial_control|wr~0_combout\);

-- Location: FF_X45_Y43_N25
\u_SDC|u_serial_receiver|u_shift_register|u_ffd0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\,
	d => \u_SDC|u_serial_receiver|u_shift_register|u_ffd0|Q~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_SDC|u_serial_receiver|u_serial_control|wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_serial_receiver|u_shift_register|u_ffd0|Q~q\);

-- Location: LCCOMB_X45_Y43_N6
\u_SDC|u_serial_receiver|u_shift_register|u_ffd1|Q~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_serial_receiver|u_shift_register|u_ffd1|Q~feeder_combout\ = \u_SDC|u_serial_receiver|u_shift_register|u_ffd0|Q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_SDC|u_serial_receiver|u_shift_register|u_ffd0|Q~q\,
	combout => \u_SDC|u_serial_receiver|u_shift_register|u_ffd1|Q~feeder_combout\);

-- Location: FF_X45_Y43_N7
\u_SDC|u_serial_receiver|u_shift_register|u_ffd1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\,
	d => \u_SDC|u_serial_receiver|u_shift_register|u_ffd1|Q~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_SDC|u_serial_receiver|u_serial_control|wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_serial_receiver|u_shift_register|u_ffd1|Q~q\);

-- Location: LCCOMB_X45_Y43_N28
\u_SDC|u_serial_receiver|u_shift_register|u_ffd2|Q~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_serial_receiver|u_shift_register|u_ffd2|Q~feeder_combout\ = \u_SDC|u_serial_receiver|u_shift_register|u_ffd1|Q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_SDC|u_serial_receiver|u_shift_register|u_ffd1|Q~q\,
	combout => \u_SDC|u_serial_receiver|u_shift_register|u_ffd2|Q~feeder_combout\);

-- Location: FF_X45_Y43_N29
\u_SDC|u_serial_receiver|u_shift_register|u_ffd2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\,
	d => \u_SDC|u_serial_receiver|u_shift_register|u_ffd2|Q~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_SDC|u_serial_receiver|u_serial_control|wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_serial_receiver|u_shift_register|u_ffd2|Q~q\);

-- Location: LCCOMB_X45_Y43_N26
\u_SDC|u_serial_receiver|u_shift_register|u_ffd3|Q~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_serial_receiver|u_shift_register|u_ffd3|Q~feeder_combout\ = \u_SDC|u_serial_receiver|u_shift_register|u_ffd2|Q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_SDC|u_serial_receiver|u_shift_register|u_ffd2|Q~q\,
	combout => \u_SDC|u_serial_receiver|u_shift_register|u_ffd3|Q~feeder_combout\);

-- Location: FF_X45_Y43_N27
\u_SDC|u_serial_receiver|u_shift_register|u_ffd3|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\,
	d => \u_SDC|u_serial_receiver|u_shift_register|u_ffd3|Q~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_SDC|u_serial_receiver|u_serial_control|wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_serial_receiver|u_shift_register|u_ffd3|Q~q\);

-- Location: LCCOMB_X45_Y43_N2
\u_SDC|u_serial_receiver|u_shift_register|u_ffd4|Q~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_serial_receiver|u_shift_register|u_ffd4|Q~feeder_combout\ = \u_SDC|u_serial_receiver|u_shift_register|u_ffd3|Q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_SDC|u_serial_receiver|u_shift_register|u_ffd3|Q~q\,
	combout => \u_SDC|u_serial_receiver|u_shift_register|u_ffd4|Q~feeder_combout\);

-- Location: FF_X45_Y43_N3
\u_SDC|u_serial_receiver|u_shift_register|u_ffd4|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\,
	d => \u_SDC|u_serial_receiver|u_shift_register|u_ffd4|Q~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_SDC|u_serial_receiver|u_serial_control|wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_serial_receiver|u_shift_register|u_ffd4|Q~q\);

-- Location: IOIBUF_X54_Y54_N29
\psensor~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_psensor,
	o => \psensor~input_o\);

-- Location: LCCOMB_X45_Y48_N14
\u_SDC|u_door_controller|currentState.state_bit_1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_door_controller|currentState.state_bit_1~0_combout\ = (\u_SDC|u_door_controller|currentState.state_bit_0~q\ & ((\u_SDC|u_door_controller|currentState.state_bit_1~q\ & ((!\psensor~input_o\))) # 
-- (!\u_SDC|u_door_controller|currentState.state_bit_1~q\ & (\sopen~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_door_controller|currentState.state_bit_0~q\,
	datab => \sopen~input_o\,
	datac => \u_SDC|u_door_controller|currentState.state_bit_1~q\,
	datad => \psensor~input_o\,
	combout => \u_SDC|u_door_controller|currentState.state_bit_1~0_combout\);

-- Location: LCCOMB_X45_Y48_N0
\u_SDC|u_door_controller|currentState.state_bit_0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_door_controller|currentState.state_bit_0~3_combout\ = (!\u_SDC|u_door_controller|currentState.state_bit_0~q\ & (\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\ & 
-- \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_door_controller|currentState.state_bit_0~q\,
	datac => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\,
	datad => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\,
	combout => \u_SDC|u_door_controller|currentState.state_bit_0~3_combout\);

-- Location: LCCOMB_X45_Y48_N8
\u_SDC|u_door_controller|currentState.state_bit_1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_door_controller|currentState.state_bit_1~1_combout\ = (\u_SDC|u_door_controller|currentState.state_bit_1~0_combout\) # ((\u_SDC|u_door_controller|currentState.state_bit_0~3_combout\ & ((\u_SDC|u_door_controller|currentState.state_bit_1~q\) # 
-- (!\u_SDC|u_serial_receiver|u_shift_register|u_ffd4|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_serial_receiver|u_shift_register|u_ffd4|Q~q\,
	datab => \u_SDC|u_door_controller|currentState.state_bit_1~0_combout\,
	datac => \u_SDC|u_door_controller|currentState.state_bit_1~q\,
	datad => \u_SDC|u_door_controller|currentState.state_bit_0~3_combout\,
	combout => \u_SDC|u_door_controller|currentState.state_bit_1~1_combout\);

-- Location: FF_X45_Y48_N9
\u_SDC|u_door_controller|currentState.state_bit_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_SDC|u_clkdiv|tmp~clkctrl_outclk\,
	d => \u_SDC|u_door_controller|currentState.state_bit_1~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_door_controller|currentState.state_bit_1~q\);

-- Location: LCCOMB_X45_Y48_N20
\u_SDC|u_door_controller|currentState.state_bit_0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_door_controller|currentState.state_bit_0~0_combout\ = (\u_SDC|u_door_controller|currentState.state_bit_1~q\ & (((\psensor~input_o\)) # (!\sclose~input_o\))) # (!\u_SDC|u_door_controller|currentState.state_bit_1~q\ & (((!\sopen~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001101010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sclose~input_o\,
	datab => \sopen~input_o\,
	datac => \u_SDC|u_door_controller|currentState.state_bit_1~q\,
	datad => \psensor~input_o\,
	combout => \u_SDC|u_door_controller|currentState.state_bit_0~0_combout\);

-- Location: LCCOMB_X44_Y42_N2
\u_SDC|u_door_controller|currentState.state_bit_0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_door_controller|currentState.state_bit_0~1_combout\ = (!\u_SDC|u_door_controller|currentState.state_bit_1~q\ & ((\u_SDC|u_door_controller|currentState.state_bit_0~q\ & ((!\u_SDC|u_serial_receiver|u_shift_register|u_ffd4|Q~q\))) # 
-- (!\u_SDC|u_door_controller|currentState.state_bit_0~q\ & (\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\,
	datab => \u_SDC|u_door_controller|currentState.state_bit_0~q\,
	datac => \u_SDC|u_serial_receiver|u_shift_register|u_ffd4|Q~q\,
	datad => \u_SDC|u_door_controller|currentState.state_bit_1~q\,
	combout => \u_SDC|u_door_controller|currentState.state_bit_0~1_combout\);

-- Location: LCCOMB_X45_Y48_N6
\u_SDC|u_door_controller|currentState.state_bit_0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_door_controller|currentState.state_bit_0~2_combout\ = (\u_SDC|u_door_controller|currentState.state_bit_0~q\ & (((\u_SDC|u_door_controller|currentState.state_bit_0~0_combout\) # (\u_SDC|u_door_controller|currentState.state_bit_0~1_combout\)))) # 
-- (!\u_SDC|u_door_controller|currentState.state_bit_0~q\ & (\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\ & ((\u_SDC|u_door_controller|currentState.state_bit_0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\,
	datab => \u_SDC|u_door_controller|currentState.state_bit_0~0_combout\,
	datac => \u_SDC|u_door_controller|currentState.state_bit_0~q\,
	datad => \u_SDC|u_door_controller|currentState.state_bit_0~1_combout\,
	combout => \u_SDC|u_door_controller|currentState.state_bit_0~2_combout\);

-- Location: FF_X45_Y48_N7
\u_SDC|u_door_controller|currentState.state_bit_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_SDC|u_clkdiv|tmp~clkctrl_outclk\,
	d => \u_SDC|u_door_controller|currentState.state_bit_0~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_door_controller|currentState.state_bit_0~q\);

-- Location: LCCOMB_X44_Y42_N16
\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~0_combout\ = (\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\ & (!\u_SDC|u_door_controller|currentState.state_bit_0~q\ & 
-- \u_SDC|u_door_controller|currentState.state_bit_1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\,
	datab => \u_SDC|u_door_controller|currentState.state_bit_0~q\,
	datad => \u_SDC|u_door_controller|currentState.state_bit_1~q\,
	combout => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~0_combout\);

-- Location: LCCOMB_X44_Y46_N14
\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~1_combout\ = (\u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~q\ & 
-- (\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][5]~q\ & 
-- (!\u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\ & \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~q\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][5]~q\,
	datac => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\,
	datad => \u_SDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\,
	combout => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~1_combout\);

-- Location: LCCOMB_X45_Y48_N26
\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~2_combout\ = (\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~0_combout\) # ((\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\ & 
-- ((\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\) # (\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~0_combout\,
	datab => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\,
	datac => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\,
	datad => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~1_combout\,
	combout => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~2_combout\);

-- Location: FF_X45_Y48_N27
\u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\);

-- Location: LCCOMB_X45_Y42_N22
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~11\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(6),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datac => \u_SDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~11_combout\);

-- Location: FF_X45_Y42_N23
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~11_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(5));

-- Location: LCCOMB_X45_Y39_N10
\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~0_combout\ = \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\ $ (((\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~0_combout\ & 
-- (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\ & \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~0_combout\,
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\,
	datac => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\,
	datad => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\,
	combout => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~0_combout\);

-- Location: FF_X45_Y39_N11
\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_keyboard_reader|u_key_decode|u_clk|tmp~clkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\);

-- Location: LCCOMB_X45_Y39_N28
\u_keyboard_reader|u_ringbuffer|u_ram|ram~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~15_combout\ = (GLOBAL(\rtl~3clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\)) # (!GLOBAL(\rtl~3clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\,
	datab => \rtl~3clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~15_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~15_combout\);

-- Location: LCCOMB_X45_Y39_N18
\u_keyboard_reader|u_ringbuffer|u_ram|ram~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~11_combout\ = (GLOBAL(\rtl~0clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\)) # (!GLOBAL(\rtl~0clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\,
	datac => \rtl~0clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~11_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~11_combout\);

-- Location: LCCOMB_X43_Y35_N10
\u_keyboard_reader|u_ringbuffer|u_ram|ram~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~7_combout\ = (GLOBAL(\rtl~1clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\)) # (!GLOBAL(\rtl~1clkctrl_outclk\) & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\,
	datac => \rtl~1clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~7_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~7_combout\);

-- Location: LCCOMB_X43_Y35_N20
\u_keyboard_reader|u_ringbuffer|u_ram|ram~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~3_combout\ = (GLOBAL(\rtl~2clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\)) # (!GLOBAL(\rtl~2clkctrl_outclk\) & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\,
	datac => \rtl~2clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~3_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~3_combout\);

-- Location: LCCOMB_X43_Y35_N2
\u_keyboard_reader|u_ringbuffer|u_ram|ram~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~49_combout\ = (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~7_combout\) # ((\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\)))) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & (((\u_keyboard_reader|u_ringbuffer|u_ram|ram~3_combout\ & !\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ram|ram~7_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ram|ram~3_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~49_combout\);

-- Location: LCCOMB_X45_Y39_N22
\u_keyboard_reader|u_ringbuffer|u_ram|ram~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~50_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ram|ram~49_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~15_combout\) # ((!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\)))) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_ram|ram~49_combout\ & (((\u_keyboard_reader|u_ringbuffer|u_ram|ram~11_combout\ & \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ram|ram~15_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ram|ram~11_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ram|ram~49_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~50_combout\);

-- Location: LCCOMB_X46_Y38_N6
\u_keyboard_reader|u_ringbuffer|u_ram|ram~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~31_combout\ = (GLOBAL(\rtl~7clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\)) # (!GLOBAL(\rtl~7clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~31_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\,
	datac => \rtl~7clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~31_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~31_combout\);

-- Location: LCCOMB_X46_Y38_N28
\u_keyboard_reader|u_ringbuffer|u_ram|ram~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~23_combout\ = (GLOBAL(\rtl~4clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\)) # (!GLOBAL(\rtl~4clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~4clkctrl_outclk\,
	datac => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~23_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~23_combout\);

-- Location: LCCOMB_X43_Y38_N24
\u_keyboard_reader|u_ringbuffer|u_ram|ram~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~19_combout\ = (GLOBAL(\rtl~6clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\)) # (!GLOBAL(\rtl~6clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\,
	datac => \rtl~6clkctrl_outclk\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~19_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~19_combout\);

-- Location: LCCOMB_X43_Y35_N24
\u_keyboard_reader|u_ringbuffer|u_ram|ram~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~27_combout\ = (GLOBAL(\rtl~5clkctrl_outclk\) & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\)) # (!GLOBAL(\rtl~5clkctrl_outclk\) & 
-- ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~27_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rtl~5clkctrl_outclk\,
	datac => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ram|ram~27_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~27_combout\);

-- Location: LCCOMB_X43_Y35_N0
\u_keyboard_reader|u_ringbuffer|u_ram|ram~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~47_combout\ = (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & (((\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\)))) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\ & 
-- ((\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~27_combout\))) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\ & (\u_keyboard_reader|u_ringbuffer|u_ram|ram~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ram|ram~19_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ram|ram~27_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[1]~1_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~47_combout\);

-- Location: LCCOMB_X46_Y38_N8
\u_keyboard_reader|u_ringbuffer|u_ram|ram~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~48_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ram|ram~47_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~31_combout\) # ((!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\)))) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_ram|ram~47_combout\ & (((\u_keyboard_reader|u_ringbuffer|u_ram|ram~23_combout\ & \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ram|ram~31_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ram|ram~23_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ram|ram~47_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[0]~0_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~48_combout\);

-- Location: LCCOMB_X45_Y38_N20
\u_keyboard_reader|u_ringbuffer|u_ram|ram~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ram|ram~51_combout\ = (\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_ram|ram~48_combout\))) # (!\u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\ & 
-- (\u_keyboard_reader|u_ringbuffer|u_ram|ram~50_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ram|ram~50_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ram|ram~48_combout\,
	datad => \u_keyboard_reader|u_ringbuffer|u_mac|u_mux|Y[2]~2_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ram|ram~51_combout\);

-- Location: FF_X45_Y38_N21
\u_keyboard_reader|u_outputbuffer|u_OutputRegister|u_FFD3|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_ringbuffer|u_ram|ram~51_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.STATE_REGISTERING~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_outputbuffer|u_OutputRegister|u_FFD3|Q~q\);

-- Location: LCCOMB_X45_Y42_N28
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~10\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(5),
	datab => \u_keyboard_reader|u_outputbuffer|u_OutputRegister|u_FFD3|Q~q\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~10_combout\);

-- Location: FF_X45_Y42_N29
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~10_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(4));

-- Location: LCCOMB_X45_Y40_N30
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~6\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_outputbuffer|u_OutputRegister|u_FFD2|Q~q\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~1_combout\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(4),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~6_combout\);

-- Location: LCCOMB_X45_Y40_N20
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~9\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(3),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~8_combout\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~6_combout\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~9_combout\);

-- Location: LCCOMB_X45_Y42_N26
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~9_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~feeder_combout\);

-- Location: FF_X45_Y42_N27
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~feeder_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(3));

-- Location: LCCOMB_X45_Y42_N6
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~4\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_outputbuffer|u_OutputRegister|u_FFD1|Q~q\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~4_combout\);

-- Location: FF_X45_Y42_N7
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg~4_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(2));

-- Location: LCCOMB_X46_Y41_N30
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(2),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(0),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(1),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~0_combout\);

-- Location: LCCOMB_X46_Y40_N14
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~1\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~0_combout\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(8),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~1_combout\);

-- Location: FF_X47_Y41_N23
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~feeder_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg\(3));

-- Location: LCCOMB_X47_Y41_N10
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[2]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[2]~feeder_combout\);

-- Location: FF_X47_Y41_N11
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[2]~feeder_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg\(2));

-- Location: LCCOMB_X47_Y41_N6
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[1]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg\(2),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[1]~feeder_combout\);

-- Location: FF_X47_Y41_N7
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[1]~feeder_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg\(1));

-- Location: LCCOMB_X47_Y41_N26
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg\(1),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~feeder_combout\);

-- Location: FF_X47_Y41_N27
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~feeder_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg\(0));

-- Location: LCCOMB_X46_Y40_N20
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[0]~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(8),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~0_combout\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(8),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[0]~0_combout\);

-- Location: FF_X47_Y41_N1
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	asdata => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg\(0),
	sload => VCC,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata\(0));

-- Location: LCCOMB_X46_Y42_N12
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~6\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(4),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(1),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(0),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(2),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~6_combout\);

-- Location: LCCOMB_X47_Y41_N0
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~7\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~5_combout\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata\(0),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~6_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~7_combout\);

-- Location: LCCOMB_X47_Y42_N24
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~4_combout\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(3),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~7_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~0_combout\);

-- Location: LCCOMB_X47_Y41_N20
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[1]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg\(1),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[1]~feeder_combout\);

-- Location: FF_X47_Y41_N21
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[1]~feeder_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata\(1));

-- Location: LCCOMB_X46_Y42_N28
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~14\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000110101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(1),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(3),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(0),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(2),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~14_combout\);

-- Location: LCCOMB_X46_Y42_N6
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~15\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~14_combout\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(1),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(4),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(2),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~15_combout\);

-- Location: LCCOMB_X47_Y42_N12
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~8\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(3),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~6_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~8_combout\);

-- Location: LCCOMB_X47_Y42_N26
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[1]~1\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata\(1),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~15_combout\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~8_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[1]~1_combout\);

-- Location: LCCOMB_X47_Y41_N16
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[2]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg\(2),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[2]~feeder_combout\);

-- Location: FF_X47_Y41_N17
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[2]~feeder_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata\(2));

-- Location: LCCOMB_X46_Y42_N26
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~10\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(4),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(1),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(0),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(2),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~10_combout\);

-- Location: LCCOMB_X46_Y42_N24
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~9\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(1),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(3),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(0),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(2),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~9_combout\);

-- Location: LCCOMB_X46_Y42_N4
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~11\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~10_combout\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~9_combout\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(4),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~11_combout\);

-- Location: LCCOMB_X47_Y42_N4
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~2\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata\(2),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~11_combout\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~8_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~2_combout\);

-- Location: LCCOMB_X46_Y42_N0
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~12\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(1),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(0),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(2),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~12_combout\);

-- Location: LCCOMB_X46_Y42_N2
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~13\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~12_combout\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(1),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(4),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~13_combout\);

-- Location: LCCOMB_X47_Y41_N4
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[3]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[3]~feeder_combout\);

-- Location: FF_X47_Y41_N5
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[3]~feeder_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata\(3));

-- Location: LCCOMB_X47_Y42_N30
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[3]~3\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg~13_combout\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric_ident_writedata\(3),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~8_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[3]~3_combout\);

-- Location: LCCOMB_X47_Y42_N10
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_proc~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_proc~0_combout\);

-- Location: LCCOMB_X47_Y42_N8
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg_ena\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg_ena~combout\);

-- Location: FF_X47_Y42_N31
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[3]~3_combout\,
	asdata => \altera_internal_jtag~TDIUTAP\,
	sload => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_proc~0_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg_ena~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg\(3));

-- Location: FF_X47_Y42_N5
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~2_combout\,
	asdata => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg\(3),
	sload => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_proc~0_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg_ena~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg\(2));

-- Location: FF_X47_Y42_N27
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[1]~1_combout\,
	asdata => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg\(2),
	sload => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_proc~0_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg_ena~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg\(1));

-- Location: FF_X47_Y42_N25
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~0_combout\,
	asdata => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg\(1),
	sload => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_proc~0_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg_ena~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg\(0));

-- Location: LCCOMB_X46_Y41_N0
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~7\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(2),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(0),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(1),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(8),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~7_combout\);

-- Location: LCCOMB_X46_Y41_N26
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~8\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg\(0),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(8),
	datac => \~GND~combout\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~7_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~8_combout\);

-- Location: LCCOMB_X45_Y41_N10
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg~3\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \altera_internal_jtag~TDIUTAP\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg~3_combout\);

-- Location: LCCOMB_X45_Y41_N8
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg_ena~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg_ena~0_combout\);

-- Location: FF_X45_Y41_N11
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg~3_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg_ena~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg\(3));

-- Location: LCCOMB_X45_Y41_N24
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg~2\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg\(3),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg~2_combout\);

-- Location: FF_X45_Y41_N25
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg~2_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg_ena~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg\(2));

-- Location: LCCOMB_X45_Y41_N6
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg~1\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg\(2),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg~1_combout\);

-- Location: FF_X45_Y41_N7
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg~1_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg_ena~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg\(1));

-- Location: LCCOMB_X45_Y41_N12
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg\(1),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg~0_combout\);

-- Location: FF_X45_Y41_N13
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg~0_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg_ena~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg\(0));

-- Location: LCCOMB_X44_Y41_N6
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~9\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(0),
	datad => VCC,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~9_combout\,
	cout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~10\);

-- Location: LCCOMB_X45_Y40_N12
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|clear_signal\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(8),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|clear_signal~combout\);

-- Location: LCCOMB_X44_Y41_N12
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3]~16\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(3),
	datad => VCC,
	cin => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2]~15\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3]~16_combout\,
	cout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3]~17\);

-- Location: LCCOMB_X44_Y41_N14
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[4]~18\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(4),
	cin => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3]~17\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[4]~18_combout\);

-- Location: LCCOMB_X45_Y41_N22
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~20\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|clear_signal~combout\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~20_combout\);

-- Location: FF_X44_Y41_N15
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[4]~18_combout\,
	sclr => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~13_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(4));

-- Location: LCCOMB_X44_Y41_N2
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~5\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(3),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(4),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(0),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~5_combout\);

-- Location: LCCOMB_X44_Y41_N26
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~13\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(2),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(1),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|clear_signal~combout\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~5_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~13_combout\);

-- Location: FF_X44_Y41_N7
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~9_combout\,
	sclr => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~13_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(0));

-- Location: LCCOMB_X44_Y41_N8
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~11\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(1),
	datad => VCC,
	cin => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~10\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~11_combout\,
	cout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~12\);

-- Location: FF_X44_Y41_N9
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~11_combout\,
	sclr => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~13_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(1));

-- Location: LCCOMB_X44_Y41_N10
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2]~14\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(2),
	datad => VCC,
	cin => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~12\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2]~14_combout\,
	cout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2]~15\);

-- Location: FF_X44_Y41_N11
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2]~14_combout\,
	sclr => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~13_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(2));

-- Location: FF_X44_Y41_N13
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3]~16_combout\,
	sclr => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~13_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(3));

-- Location: LCCOMB_X44_Y41_N28
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~8\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(0),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(1),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(2),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~8_combout\);

-- Location: LCCOMB_X44_Y41_N22
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~9\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(3),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~8_combout\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|clear_signal~combout\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~9_combout\);

-- Location: LCCOMB_X44_Y41_N4
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~6\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(2),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~5_combout\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(1),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~6_combout\);

-- Location: LCCOMB_X44_Y41_N20
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~12\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010110001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(3),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(1),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(4),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(2),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~12_combout\);

-- Location: LCCOMB_X44_Y41_N30
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~13\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter\(0),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~12_combout\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|clear_signal~combout\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~13_combout\);

-- Location: LCCOMB_X44_Y41_N16
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~14\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~13_combout\,
	datab => \altera_internal_jtag~TDIUTAP\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|clear_signal~combout\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~14_combout\);

-- Location: LCCOMB_X45_Y41_N20
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[0]~15\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|clear_signal~combout\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[0]~15_combout\);

-- Location: FF_X44_Y41_N17
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~14_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[0]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR\(3));

-- Location: LCCOMB_X44_Y41_N18
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~10\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(8),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR\(3),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~10_combout\);

-- Location: LCCOMB_X44_Y41_N24
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~11\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~9_combout\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|clear_signal~combout\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~6_combout\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~10_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~11_combout\);

-- Location: FF_X44_Y41_N25
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~11_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[0]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR\(2));

-- Location: LCCOMB_X44_Y41_N0
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~7\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR\(2),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~6_combout\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|clear_signal~combout\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~7_combout\);

-- Location: FF_X44_Y41_N1
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~7_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[0]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR\(1));

-- Location: LCCOMB_X45_Y41_N2
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~4\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR\(1),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(8),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~4_combout\);

-- Location: FF_X45_Y41_N3
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR~4_combout\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[0]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR\(0));

-- Location: LCCOMB_X46_Y41_N28
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~5\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(0),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(1),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(8),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~5_combout\);

-- Location: LCCOMB_X46_Y41_N14
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~6\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg\(0),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR\(0),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(2),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~5_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~6_combout\);

-- Location: LCCOMB_X46_Y41_N6
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~2\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(2),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(0),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(1),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(8),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~2_combout\);

-- Location: LCCOMB_X45_Y40_N2
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	datab => \altera_internal_jtag~TDIUTAP\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~q\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~0_combout\);

-- Location: FF_X45_Y40_N3
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~q\);

-- Location: LCCOMB_X46_Y41_N4
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~0\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(0),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~0_combout\);

-- Location: LCCOMB_X46_Y41_N10
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~1\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~q\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~0_combout\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(8),
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg_ena~0_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~1_combout\);

-- Location: LCCOMB_X46_Y41_N8
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~3\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~2_combout\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~q\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~1_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~3_combout\);

-- Location: LCCOMB_X46_Y41_N18
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~4\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(3),
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(4),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~4_combout\);

-- Location: LCCOMB_X46_Y41_N24
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~9\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~8_combout\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~6_combout\,
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~3_combout\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~4_combout\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~9_combout\);

-- Location: FF_X46_Y41_N25
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_mux_out~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~q\);

-- Location: CLKCTRL_G10
\altera_internal_jtag~TCKUTAPclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \altera_internal_jtag~TCKUTAPclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\);

-- Location: FF_X44_Y42_N9
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	asdata => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(0),
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	sload => VCC,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~q\);

-- Location: LCCOMB_X49_Y39_N24
\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~0_combout\ = (\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~q\ & (((!\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~q\) # 
-- (!\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~q\)))) # 
-- (!\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~q\ & (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_READING~0_combout\ & 
-- ((!\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_READING~0_combout\,
	datab => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~q\,
	datac => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~q\,
	datad => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~q\,
	combout => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~0_combout\);

-- Location: FF_X49_Y39_N25
\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~q\);

-- Location: LCCOMB_X49_Y39_N26
\u_keyboard_reader|u_ringbuffer|u_ring_controller|nextState.STATE_SET_GET~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|nextState.STATE_SET_GET~0_combout\ = (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\ & (!\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~q\ & 
-- (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\ & !\u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\,
	datab => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_0~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\,
	datad => \u_keyboard_reader|u_outputbuffer|u_BufferControl|currentState.state_bit_1~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ring_controller|nextState.STATE_SET_GET~0_combout\);

-- Location: LCCOMB_X45_Y36_N20
\u_keyboard_reader|u_ringbuffer|u_ring_controller|nextState.STATE_SET_GET~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|nextState.STATE_SET_GET~1_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ring_controller|nextState.STATE_SET_GET~0_combout\ & ((\u_keyboard_reader|u_ringbuffer|u_mac|full~0_combout\ & 
-- (\u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD3|Q~q\)) # (!\u_keyboard_reader|u_ringbuffer|u_mac|full~0_combout\ & ((!\u_keyboard_reader|u_key_decode|u_key_control|currentState.STATE_PRESSING~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_mac|full~0_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|nextState.STATE_SET_GET~0_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_mac|u_mac_counter|u_reg|u_FFD3|Q~q\,
	datad => \u_keyboard_reader|u_key_decode|u_key_control|currentState.STATE_PRESSING~0_combout\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ring_controller|nextState.STATE_SET_GET~1_combout\);

-- Location: LCCOMB_X46_Y39_N18
\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~1_combout\ = ((\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\ & ((!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\))) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\ & (\u_keyboard_reader|u_ringbuffer|u_ring_controller|nextState.STATE_SET_GET~1_combout\))) # 
-- (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ring_controller|nextState.STATE_SET_GET~1_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~0_combout\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~1_combout\);

-- Location: FF_X46_Y39_N19
\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\);

-- Location: LCCOMB_X45_Y36_N0
\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_DAC~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_DAC~0_combout\ = (\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\ & (!\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\ & 
-- \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_1~q\,
	datac => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_0~q\,
	datad => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.state_bit_2~q\,
	combout => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_DAC~0_combout\);

-- Location: LCCOMB_X45_Y36_N22
\u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~0_combout\ = (\u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~q\ & (((\u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_DAC~0_combout\) # 
-- (!\u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_1~q\)))) # (!\u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~q\ & (!\u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~2_combout\ & 
-- ((!\u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~2_combout\,
	datab => \u_keyboard_reader|u_ringbuffer|u_ring_controller|currentState.STATE_DAC~0_combout\,
	datac => \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~q\,
	datad => \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_1~q\,
	combout => \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~0_combout\);

-- Location: FF_X45_Y36_N23
\u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_keyboard_reader|u_key_decode|u_clk|tmp~clkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~q\);

-- Location: LCCOMB_X45_Y36_N16
\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~0_combout\ = (!\u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~q\ & (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\ & 
-- ((\u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~0_combout\) # (\u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_control|currentState.state_bit_0~q\,
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~0_combout\,
	datac => \u_keyboard_reader|u_key_decode|u_key_scan|u_mux|Y~1_combout\,
	datad => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD0|Q~q\,
	combout => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~0_combout\);

-- Location: LCCOMB_X45_Y39_N24
\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~0_combout\ = \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\ $ (((\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~0_combout\ & 
-- \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~0_combout\,
	datac => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\,
	datad => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD1|Q~q\,
	combout => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~0_combout\);

-- Location: FF_X45_Y39_N25
\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_keyboard_reader|u_key_decode|u_clk|tmp~clkctrl_outclk\,
	d => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\);

-- Location: LCCOMB_X43_Y35_N8
\u_keyboard_reader|u_key_decode|u_key_scan|u_dec|CL[0]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_key_scan|u_dec|CL\(0) = (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\) # (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\,
	datac => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\,
	combout => \u_keyboard_reader|u_key_decode|u_key_scan|u_dec|CL\(0));

-- Location: LCCOMB_X43_Y35_N26
\u_keyboard_reader|u_key_decode|u_key_scan|u_dec|CL[1]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_key_scan|u_dec|CL\(1) = (\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\ & !\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\,
	datac => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\,
	combout => \u_keyboard_reader|u_key_decode|u_key_scan|u_dec|CL\(1));

-- Location: LCCOMB_X43_Y35_N28
\u_keyboard_reader|u_key_decode|u_key_scan|u_dec|CL[2]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_keyboard_reader|u_key_decode|u_key_scan|u_dec|CL\(2) = (!\u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\ & \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD2|Q~q\,
	datac => \u_keyboard_reader|u_key_decode|u_key_scan|u_counter|u_reg|u_FFD3|Q~q\,
	combout => \u_keyboard_reader|u_key_decode|u_key_scan|u_dec|CL\(2));

-- Location: LCCOMB_X45_Y43_N16
\u_SLCDC|u_serial_receiver|u_shift_register|u_ffd0|Q~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd0|Q~feeder_combout\ = \auto_hub
-- |instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1]~q\,
	combout => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd0|Q~feeder_combout\);

-- Location: LCCOMB_X44_Y42_N12
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(2),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~feeder_combout\);

-- Location: FF_X44_Y42_N13
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~feeder_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~q\);

-- Location: LCCOMB_X47_Y46_N24
\u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~0_combout\ = !\u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\,
	combout => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~0_combout\);

-- Location: LCCOMB_X45_Y48_N24
\u_SLCDC|u_dispatcher|currentState.state_bit_0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_dispatcher|currentState.state_bit_0~0_combout\ = (\u_SLCDC|u_dispatcher|currentState.state_bit_0~q\ & (((\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\ & 
-- \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\)) # (!\u_SLCDC|u_dispatcher|currentState.state_bit_1~q\))) # (!\u_SLCDC|u_dispatcher|currentState.state_bit_0~q\ & 
-- (\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\ & (\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\ & !\u_SLCDC|u_dispatcher|currentState.state_bit_1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\,
	datab => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\,
	datac => \u_SLCDC|u_dispatcher|currentState.state_bit_0~q\,
	datad => \u_SLCDC|u_dispatcher|currentState.state_bit_1~q\,
	combout => \u_SLCDC|u_dispatcher|currentState.state_bit_0~0_combout\);

-- Location: FF_X45_Y48_N25
\u_SLCDC|u_dispatcher|currentState.state_bit_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_SDC|u_clkdiv|tmp~clkctrl_outclk\,
	d => \u_SLCDC|u_dispatcher|currentState.state_bit_0~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SLCDC|u_dispatcher|currentState.state_bit_0~q\);

-- Location: LCCOMB_X45_Y48_N10
\u_SLCDC|u_dispatcher|currentState.state_bit_1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_dispatcher|currentState.state_bit_1~0_combout\ = (\u_SLCDC|u_dispatcher|currentState.state_bit_0~q\ & (((\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\ & 
-- \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\)) # (!\u_SLCDC|u_dispatcher|currentState.state_bit_1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\,
	datab => \u_SLCDC|u_dispatcher|currentState.state_bit_0~q\,
	datac => \u_SLCDC|u_dispatcher|currentState.state_bit_1~q\,
	datad => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\,
	combout => \u_SLCDC|u_dispatcher|currentState.state_bit_1~0_combout\);

-- Location: FF_X45_Y48_N11
\u_SLCDC|u_dispatcher|currentState.state_bit_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_SDC|u_clkdiv|tmp~clkctrl_outclk\,
	d => \u_SLCDC|u_dispatcher|currentState.state_bit_1~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SLCDC|u_dispatcher|currentState.state_bit_1~q\);

-- Location: LCCOMB_X45_Y48_N2
\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~0_combout\ = (!\u_SLCDC|u_dispatcher|currentState.state_bit_1~q\ & (\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\ & 
-- \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SLCDC|u_dispatcher|currentState.state_bit_1~q\,
	datac => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\,
	datad => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\,
	combout => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~0_combout\);

-- Location: LCCOMB_X45_Y48_N12
\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~1_combout\ = (\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~0_combout\) # ((!\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\ & 
-- ((\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~0_combout\) # 
-- (!\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\,
	datab => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~0_combout\,
	datac => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~0_combout\,
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~q\,
	combout => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~1_combout\);

-- Location: FF_X45_Y48_N13
\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\);

-- Location: LCCOMB_X45_Y48_N22
\u_SLCDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0_combout\ = (!\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\ & !\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\,
	datad => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\,
	combout => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0_combout\);

-- Location: CLKCTRL_G12
\u_SLCDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.STATE_CLEAR~0clkctrl_outclk\);

-- Location: FF_X47_Y46_N25
\u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\,
	d => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~0_combout\,
	clrn => \u_SLCDC|u_serial_receiver|u_serial_control|ALT_INV_currentState.STATE_CLEAR~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\);

-- Location: LCCOMB_X47_Y46_N12
\u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~0_combout\ = \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\ $ (\u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\,
	datad => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\,
	combout => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~0_combout\);

-- Location: FF_X47_Y46_N13
\u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\,
	d => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~0_combout\,
	clrn => \u_SLCDC|u_serial_receiver|u_serial_control|ALT_INV_currentState.STATE_CLEAR~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\);

-- Location: LCCOMB_X47_Y46_N10
\u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~0_combout\ = \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~q\ $ (((\u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\ & \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\,
	datac => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~q\,
	datad => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\,
	combout => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~0_combout\);

-- Location: FF_X47_Y46_N11
\u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\,
	d => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~0_combout\,
	clrn => \u_SLCDC|u_serial_receiver|u_serial_control|ALT_INV_currentState.STATE_CLEAR~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~q\);

-- Location: LCCOMB_X47_Y46_N30
\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~0_combout\ = (!\u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\ & (\u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\ & 
-- (\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\ & \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD1|Q~q\,
	datab => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD0|Q~q\,
	datac => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\,
	datad => \u_SLCDC|u_serial_receiver|u_counter|u_reg|u_FFD2|Q~q\,
	combout => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~0_combout\);

-- Location: LCCOMB_X45_Y48_N4
\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~1_combout\ = (\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\ & ((\u_SLCDC|u_dispatcher|currentState.state_bit_1~q\) # 
-- (\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SLCDC|u_dispatcher|currentState.state_bit_1~q\,
	datac => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\,
	datad => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\,
	combout => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~1_combout\);

-- Location: LCCOMB_X45_Y48_N30
\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~2_combout\ = (\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~1_combout\) # 
-- ((\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~q\ & 
-- \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~q\,
	datab => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~0_combout\,
	datac => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~1_combout\,
	combout => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~2_combout\);

-- Location: FF_X45_Y48_N31
\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Mclk~inputclkctrl_outclk\,
	d => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\);

-- Location: LCCOMB_X45_Y48_N16
\u_SLCDC|u_serial_receiver|u_serial_control|wr~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_serial_receiver|u_serial_control|wr~0_combout\ = (!\auto_hub|instrume
-- ntation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~q\ & 
-- (!\u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\ & \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~q\,
	datac => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_1~q\,
	datad => \u_SLCDC|u_serial_receiver|u_serial_control|currentState.state_bit_0~q\,
	combout => \u_SLCDC|u_serial_receiver|u_serial_control|wr~0_combout\);

-- Location: FF_X45_Y43_N17
\u_SLCDC|u_serial_receiver|u_shift_register|u_ffd0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\,
	d => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd0|Q~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_SLCDC|u_serial_receiver|u_serial_control|wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd0|Q~q\);

-- Location: LCCOMB_X45_Y43_N22
\u_SLCDC|u_serial_receiver|u_shift_register|u_ffd1|Q~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd1|Q~feeder_combout\ = \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd0|Q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd0|Q~q\,
	combout => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd1|Q~feeder_combout\);

-- Location: FF_X45_Y43_N23
\u_SLCDC|u_serial_receiver|u_shift_register|u_ffd1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\,
	d => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd1|Q~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_SLCDC|u_serial_receiver|u_serial_control|wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd1|Q~q\);

-- Location: LCCOMB_X45_Y43_N4
\u_SLCDC|u_serial_receiver|u_shift_register|u_ffd2|Q~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd2|Q~feeder_combout\ = \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd1|Q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd1|Q~q\,
	combout => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd2|Q~feeder_combout\);

-- Location: FF_X45_Y43_N5
\u_SLCDC|u_serial_receiver|u_shift_register|u_ffd2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\,
	d => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd2|Q~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_SLCDC|u_serial_receiver|u_serial_control|wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd2|Q~q\);

-- Location: LCCOMB_X45_Y43_N10
\u_SLCDC|u_serial_receiver|u_shift_register|u_ffd3|Q~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd3|Q~feeder_combout\ = \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd2|Q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd2|Q~q\,
	combout => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd3|Q~feeder_combout\);

-- Location: FF_X45_Y43_N11
\u_SLCDC|u_serial_receiver|u_shift_register|u_ffd3|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\,
	d => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd3|Q~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_SLCDC|u_serial_receiver|u_serial_control|wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd3|Q~q\);

-- Location: LCCOMB_X45_Y43_N8
\u_SLCDC|u_serial_receiver|u_shift_register|u_ffd4|Q~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd4|Q~feeder_combout\ = \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd3|Q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd3|Q~q\,
	combout => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd4|Q~feeder_combout\);

-- Location: FF_X45_Y43_N9
\u_SLCDC|u_serial_receiver|u_shift_register|u_ffd4|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~clkctrl_outclk\,
	d => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd4|Q~feeder_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \u_SLCDC|u_serial_receiver|u_serial_control|wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SLCDC|u_serial_receiver|u_shift_register|u_ffd4|Q~q\);

-- Location: LCCOMB_X45_Y48_N28
\u_SLCDC|u_dispatcher|currentState.STATE_WAITING~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SLCDC|u_dispatcher|currentState.STATE_WAITING~0_combout\ = (\u_SLCDC|u_dispatcher|currentState.state_bit_0~q\ & !\u_SLCDC|u_dispatcher|currentState.state_bit_1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_SLCDC|u_dispatcher|currentState.state_bit_0~q\,
	datad => \u_SLCDC|u_dispatcher|currentState.state_bit_1~q\,
	combout => \u_SLCDC|u_dispatcher|currentState.STATE_WAITING~0_combout\);

-- Location: LCCOMB_X44_Y42_N30
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][4]~feeder\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg\(4),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][4]~feeder_combout\);

-- Location: FF_X44_Y42_N31
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][4]~feeder_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][4]~q\);

-- Location: LCCOMB_X44_Y42_N24
\u_SDC|u_door_controller|currentState.STATE_OPEN~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_SDC|u_door_controller|currentState.STATE_OPEN~0_combout\ = (\u_SDC|u_door_controller|currentState.state_bit_0~q\ & !\u_SDC|u_door_controller|currentState.state_bit_1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_SDC|u_door_controller|currentState.state_bit_0~q\,
	datad => \u_SDC|u_door_controller|currentState.state_bit_1~q\,
	combout => \u_SDC|u_door_controller|currentState.STATE_OPEN~0_combout\);

-- Location: FF_X44_Y42_N1
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][6]~feeder_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][6]~q\);

-- Location: FF_X44_Y42_N15
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \altera_internal_jtag~TCKUTAPclkctrl_outclk\,
	d => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][7]~feeder_combout\,
	clrn => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|ALT_INV_clr_reg~q\,
	ena => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][7]~q\);

-- Location: LCCOMB_X62_Y46_N0
\auto_hub|~GND\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
;

-- Location: LCCOMB_X45_Y42_N4
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~_wirecell\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q\,
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~_wirecell_combout\);

-- Location: LCCOMB_X49_Y41_N2
\auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~_wirecell\ : fiftyfivenm_lcell_comb
-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state\(0),
	combout => \auto_hub|instrumentation_fabric_with_node_gen:fabric_gen_new_way:with_jtag_input_gen:instrumentation_fabric|instrumentation_fabric|alt_sld_fab|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~_wirecell_combout\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);
END structure;


