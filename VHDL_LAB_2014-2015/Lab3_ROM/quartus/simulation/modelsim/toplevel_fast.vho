-- Copyright (C) 1991-2012 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 12.1 Build 177 11/07/2012 SJ Web Edition"

-- DATE "05/19/2015 17:06:49"

-- 
-- Device: Altera EP2C20F484C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	toplevel IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	hsync : OUT std_logic;
	vsync : OUT std_logic;
	red : OUT std_logic_vector(3 DOWNTO 0);
	green : OUT std_logic_vector(3 DOWNTO 0);
	blue : OUT std_logic_vector(3 DOWNTO 0)
	);
END toplevel;

-- Design Ports Information
-- hsync	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- vsync	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- red[0]	=>  Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- red[1]	=>  Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- red[2]	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- red[3]	=>  Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- green[0]	=>  Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- green[1]	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- green[2]	=>  Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- green[3]	=>  Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- blue[0]	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- blue[1]	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- blue[2]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- blue[3]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- rst	=>  Location: PIN_R22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF toplevel IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_hsync : std_logic;
SIGNAL ww_vsync : std_logic;
SIGNAL ww_red : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_green : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_blue : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \disp|Add2~8_combout\ : std_logic;
SIGNAL \disp|Add2~10_combout\ : std_logic;
SIGNAL \disp|Add2~12_combout\ : std_logic;
SIGNAL \disp|Mux0~30_combout\ : std_logic;
SIGNAL \disp|Mux0~31_combout\ : std_logic;
SIGNAL \disp|Mux0~32_combout\ : std_logic;
SIGNAL \mem|Mux17~0_combout\ : std_logic;
SIGNAL \mem|Mux17~1_combout\ : std_logic;
SIGNAL \mem|Mux19~0_combout\ : std_logic;
SIGNAL \mem|Mux19~1_combout\ : std_logic;
SIGNAL \mem|Mux37~1_combout\ : std_logic;
SIGNAL \mem|Mux37~2_combout\ : std_logic;
SIGNAL \mem|Mux37~3_combout\ : std_logic;
SIGNAL \mem|Mux37~4_combout\ : std_logic;
SIGNAL \mem|Mux42~0_combout\ : std_logic;
SIGNAL \mem|Mux45~4_combout\ : std_logic;
SIGNAL \mem|Mux46~1_combout\ : std_logic;
SIGNAL \mem|Mux36~0_combout\ : std_logic;
SIGNAL \mem|Mux34~0_combout\ : std_logic;
SIGNAL \mem|Mux34~1_combout\ : std_logic;
SIGNAL \mem|Mux34~2_combout\ : std_logic;
SIGNAL \mem|Mux39~0_combout\ : std_logic;
SIGNAL \mem|Mux39~1_combout\ : std_logic;
SIGNAL \mem|Mux39~2_combout\ : std_logic;
SIGNAL \mem|Mux39~3_combout\ : std_logic;
SIGNAL \mem|Mux39~4_combout\ : std_logic;
SIGNAL \mem|Mux47~0_combout\ : std_logic;
SIGNAL \mem|Mux47~1_combout\ : std_logic;
SIGNAL \mem|Mux35~0_combout\ : std_logic;
SIGNAL \mem|Mux36~1_combout\ : std_logic;
SIGNAL \mem|Mux36~2_combout\ : std_logic;
SIGNAL \mem|Mux36~3_combout\ : std_logic;
SIGNAL \mem|Mux36~4_combout\ : std_logic;
SIGNAL \mem|Mux53~0_combout\ : std_logic;
SIGNAL \mem|Mux53~1_combout\ : std_logic;
SIGNAL \mem|Mux61~0_combout\ : std_logic;
SIGNAL \mem|Mux61~1_combout\ : std_logic;
SIGNAL \mem|Mux61~2_combout\ : std_logic;
SIGNAL \mem|Mux50~1_combout\ : std_logic;
SIGNAL \mem|Mux48~3_combout\ : std_logic;
SIGNAL \mem|Mux48~4_combout\ : std_logic;
SIGNAL \mem|Mux14~0_combout\ : std_logic;
SIGNAL \mem|Mux14~1_combout\ : std_logic;
SIGNAL \mem|Mux13~0_combout\ : std_logic;
SIGNAL \mem|Mux13~1_combout\ : std_logic;
SIGNAL \mem|Mux15~0_combout\ : std_logic;
SIGNAL \mem|Mux15~1_combout\ : std_logic;
SIGNAL \mem|Mux15~2_combout\ : std_logic;
SIGNAL \mem|Mux12~0_combout\ : std_logic;
SIGNAL \mem|Mux12~1_combout\ : std_logic;
SIGNAL \mem|Mux11~0_combout\ : std_logic;
SIGNAL \mem|Mux48~5_combout\ : std_logic;
SIGNAL \mem|Mux51~2_combout\ : std_logic;
SIGNAL \mem|Mux51~3_combout\ : std_logic;
SIGNAL \mem|Mux46~2_combout\ : std_logic;
SIGNAL \mem|Mux46~3_combout\ : std_logic;
SIGNAL \disp|pixelcounter[0]~10_combout\ : std_logic;
SIGNAL \rst~combout\ : std_logic;
SIGNAL \disp|pixelcounter[5]~21\ : std_logic;
SIGNAL \disp|pixelcounter[6]~22_combout\ : std_logic;
SIGNAL \disp|a~0_combout\ : std_logic;
SIGNAL \disp|a~regout\ : std_logic;
SIGNAL \disp|pixelcounter[6]~23\ : std_logic;
SIGNAL \disp|pixelcounter[7]~25\ : std_logic;
SIGNAL \disp|pixelcounter[8]~27\ : std_logic;
SIGNAL \disp|pixelcounter[9]~28_combout\ : std_logic;
SIGNAL \disp|pixelcounter[7]~24_combout\ : std_logic;
SIGNAL \disp|pixelcounter[8]~26_combout\ : std_logic;
SIGNAL \disp|LessThan6~0_combout\ : std_logic;
SIGNAL \disp|LessThan6~1_combout\ : std_logic;
SIGNAL \disp|pixelcounter[0]~11\ : std_logic;
SIGNAL \disp|pixelcounter[1]~12_combout\ : std_logic;
SIGNAL \disp|pixelcounter[1]~13\ : std_logic;
SIGNAL \disp|pixelcounter[2]~15\ : std_logic;
SIGNAL \disp|pixelcounter[3]~16_combout\ : std_logic;
SIGNAL \disp|pixelcounter[3]~17\ : std_logic;
SIGNAL \disp|pixelcounter[4]~18_combout\ : std_logic;
SIGNAL \disp|pixelcounter[4]~19\ : std_logic;
SIGNAL \disp|pixelcounter[5]~20_combout\ : std_logic;
SIGNAL \disp|hsync~0_combout\ : std_logic;
SIGNAL \disp|hsync~1_combout\ : std_logic;
SIGNAL \disp|hsync~2_combout\ : std_logic;
SIGNAL \disp|Add5~13\ : std_logic;
SIGNAL \disp|Add5~14_combout\ : std_logic;
SIGNAL \disp|linecounter[7]~11_combout\ : std_logic;
SIGNAL \disp|Add5~15\ : std_logic;
SIGNAL \disp|Add5~16_combout\ : std_logic;
SIGNAL \disp|linecounter[8]~10_combout\ : std_logic;
SIGNAL \disp|linecounter[7]~0_combout\ : std_logic;
SIGNAL \disp|linecounter[7]~1_combout\ : std_logic;
SIGNAL \disp|pixelcounter[2]~14_combout\ : std_logic;
SIGNAL \disp|linecounter[7]~2_combout\ : std_logic;
SIGNAL \disp|linecounter[7]~3_combout\ : std_logic;
SIGNAL \disp|Add5~17\ : std_logic;
SIGNAL \disp|Add5~18_combout\ : std_logic;
SIGNAL \disp|linecounter[9]~8_combout\ : std_logic;
SIGNAL \disp|Equal8~1_combout\ : std_logic;
SIGNAL \disp|Add5~0_combout\ : std_logic;
SIGNAL \disp|linecounter[0]~13_combout\ : std_logic;
SIGNAL \disp|Equal8~0_combout\ : std_logic;
SIGNAL \disp|Equal8~2_combout\ : std_logic;
SIGNAL \disp|Add5~1\ : std_logic;
SIGNAL \disp|Add5~2_combout\ : std_logic;
SIGNAL \disp|linecounter[1]~12_combout\ : std_logic;
SIGNAL \disp|Add5~3\ : std_logic;
SIGNAL \disp|Add5~5\ : std_logic;
SIGNAL \disp|Add5~7\ : std_logic;
SIGNAL \disp|Add5~8_combout\ : std_logic;
SIGNAL \disp|linecounter[4]~4_combout\ : std_logic;
SIGNAL \disp|Add5~9\ : std_logic;
SIGNAL \disp|Add5~10_combout\ : std_logic;
SIGNAL \disp|linecounter[5]~6_combout\ : std_logic;
SIGNAL \disp|Add5~11\ : std_logic;
SIGNAL \disp|Add5~12_combout\ : std_logic;
SIGNAL \disp|linecounter[6]~5_combout\ : std_logic;
SIGNAL \disp|Add5~6_combout\ : std_logic;
SIGNAL \disp|linecounter[3]~7_combout\ : std_logic;
SIGNAL \disp|vsync~0_combout\ : std_logic;
SIGNAL \disp|vsync~1_combout\ : std_logic;
SIGNAL \disp|vsync~2_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \disp|Add5~4_combout\ : std_logic;
SIGNAL \disp|linecounter[2]~9_combout\ : std_logic;
SIGNAL \disp|characters~5_combout\ : std_logic;
SIGNAL \disp|characters~6_combout\ : std_logic;
SIGNAL \disp|Equal4~2_combout\ : std_logic;
SIGNAL \disp|characters~0_combout\ : std_logic;
SIGNAL \disp|characters~1_combout\ : std_logic;
SIGNAL \disp|characters~2_combout\ : std_logic;
SIGNAL \disp|characters~3_combout\ : std_logic;
SIGNAL \disp|Equal3~0_combout\ : std_logic;
SIGNAL \disp|characters~4_combout\ : std_logic;
SIGNAL \disp|characters~7_combout\ : std_logic;
SIGNAL \disp|reg_counter[0]~7\ : std_logic;
SIGNAL \disp|reg_counter[1]~9_combout\ : std_logic;
SIGNAL \disp|reg_counter[0]~6_combout\ : std_logic;
SIGNAL \disp|state.print~feeder_combout\ : std_logic;
SIGNAL \disp|state.print~regout\ : std_logic;
SIGNAL \disp|reg_counter[5]~8_combout\ : std_logic;
SIGNAL \disp|reg_counter[3]~13_combout\ : std_logic;
SIGNAL \disp|reg_counter[2]~11_combout\ : std_logic;
SIGNAL \disp|Equal6~0_combout\ : std_logic;
SIGNAL \disp|Selector7~0_combout\ : std_logic;
SIGNAL \disp|state~12_combout\ : std_logic;
SIGNAL \disp|state~13_combout\ : std_logic;
SIGNAL \disp|state.fetch~regout\ : std_logic;
SIGNAL \disp|reg_counter[1]~10\ : std_logic;
SIGNAL \disp|reg_counter[2]~12\ : std_logic;
SIGNAL \disp|reg_counter[3]~14\ : std_logic;
SIGNAL \disp|reg_counter[4]~15_combout\ : std_logic;
SIGNAL \disp|reg_counter[4]~16\ : std_logic;
SIGNAL \disp|reg_counter[5]~17_combout\ : std_logic;
SIGNAL \disp|Selector14~0_combout\ : std_logic;
SIGNAL \disp|Selector14~1_combout\ : std_logic;
SIGNAL \disp|state.idle~regout\ : std_logic;
SIGNAL \disp|Selector15~0_combout\ : std_logic;
SIGNAL \disp|state.send_add~regout\ : std_logic;
SIGNAL \disp|Selector3~0_combout\ : std_logic;
SIGNAL \disp|Add1~7_combout\ : std_logic;
SIGNAL \disp|Add1~5_combout\ : std_logic;
SIGNAL \disp|Add1~3_combout\ : std_logic;
SIGNAL \disp|Add1~0_combout\ : std_logic;
SIGNAL \disp|Add2~1\ : std_logic;
SIGNAL \disp|Add2~3\ : std_logic;
SIGNAL \disp|Add2~5\ : std_logic;
SIGNAL \disp|Add2~7\ : std_logic;
SIGNAL \disp|Add2~9\ : std_logic;
SIGNAL \disp|Add2~11\ : std_logic;
SIGNAL \disp|Add2~13\ : std_logic;
SIGNAL \disp|Add2~14_combout\ : std_logic;
SIGNAL \disp|Add0~1\ : std_logic;
SIGNAL \disp|Add0~3\ : std_logic;
SIGNAL \disp|Add0~5\ : std_logic;
SIGNAL \disp|Add0~7\ : std_logic;
SIGNAL \disp|Add0~9\ : std_logic;
SIGNAL \disp|Add0~11\ : std_logic;
SIGNAL \disp|Add0~13\ : std_logic;
SIGNAL \disp|Add0~14_combout\ : std_logic;
SIGNAL \disp|address[7]~0_combout\ : std_logic;
SIGNAL \disp|Add1~8_combout\ : std_logic;
SIGNAL \disp|Equal3~1_combout\ : std_logic;
SIGNAL \disp|Equal3~2_combout\ : std_logic;
SIGNAL \disp|Equal4~3_combout\ : std_logic;
SIGNAL \disp|address[7]~8_combout\ : std_logic;
SIGNAL \disp|address[7]~9_combout\ : std_logic;
SIGNAL \disp|Equal4~4_combout\ : std_logic;
SIGNAL \disp|Add0~10_combout\ : std_logic;
SIGNAL \disp|address[5]~6_combout\ : std_logic;
SIGNAL \disp|Add1~4_combout\ : std_logic;
SIGNAL \disp|Add0~0_combout\ : std_logic;
SIGNAL \disp|Add2~0_combout\ : std_logic;
SIGNAL \disp|address[0]~3_combout\ : std_logic;
SIGNAL \disp|Add2~4_combout\ : std_logic;
SIGNAL \disp|Add0~4_combout\ : std_logic;
SIGNAL \disp|address[2]~5_combout\ : std_logic;
SIGNAL \disp|linecounter[2]~_wirecell_combout\ : std_logic;
SIGNAL \disp|Add2~2_combout\ : std_logic;
SIGNAL \disp|Add0~2_combout\ : std_logic;
SIGNAL \disp|address[1]~4_combout\ : std_logic;
SIGNAL \mem|Mux48~2_combout\ : std_logic;
SIGNAL \disp|Add0~12_combout\ : std_logic;
SIGNAL \disp|address[6]~1_combout\ : std_logic;
SIGNAL \disp|Add1~6_combout\ : std_logic;
SIGNAL \mem|Mux16~3_combout\ : std_logic;
SIGNAL \disp|Add2~6_combout\ : std_logic;
SIGNAL \disp|Add0~6_combout\ : std_logic;
SIGNAL \disp|address[3]~2_combout\ : std_logic;
SIGNAL \disp|Add1~2_combout\ : std_logic;
SIGNAL \mem|Mux16~0_combout\ : std_logic;
SIGNAL \disp|Add0~8_combout\ : std_logic;
SIGNAL \disp|address[4]~7_combout\ : std_logic;
SIGNAL \disp|Add1~1_combout\ : std_logic;
SIGNAL \mem|Mux16~1_combout\ : std_logic;
SIGNAL \mem|Mux16~2_combout\ : std_logic;
SIGNAL \mem|Mux16~4_combout\ : std_logic;
SIGNAL \disp|reg[52]~2_combout\ : std_logic;
SIGNAL \mem|Mux24~0_combout\ : std_logic;
SIGNAL \mem|Mux20~1_combout\ : std_logic;
SIGNAL \mem|Mux20~2_combout\ : std_logic;
SIGNAL \mem|Mux19~2_combout\ : std_logic;
SIGNAL \mem|Mux45~1_combout\ : std_logic;
SIGNAL \mem|Mux18~0_combout\ : std_logic;
SIGNAL \mem|Mux18~1_combout\ : std_logic;
SIGNAL \disp|Mux0~7_combout\ : std_logic;
SIGNAL \disp|Mux0~8_combout\ : std_logic;
SIGNAL \mem|Mux25~5_combout\ : std_logic;
SIGNAL \mem|Mux45~0_combout\ : std_logic;
SIGNAL \mem|Mux28~2_combout\ : std_logic;
SIGNAL \mem|Mux25~2_combout\ : std_logic;
SIGNAL \mem|Mux25~3_combout\ : std_logic;
SIGNAL \mem|Mux25~4_combout\ : std_logic;
SIGNAL \mem|Mux25~6_combout\ : std_logic;
SIGNAL \disp|Mux0~0_combout\ : std_logic;
SIGNAL \disp|Mux0~1_combout\ : std_logic;
SIGNAL \mem|Mux37~0_combout\ : std_logic;
SIGNAL \mem|Mux30~2_combout\ : std_logic;
SIGNAL \mem|Mux30~3_combout\ : std_logic;
SIGNAL \mem|Mux30~4_combout\ : std_logic;
SIGNAL \mem|Mux32~1_combout\ : std_logic;
SIGNAL \mem|Mux30~6_combout\ : std_logic;
SIGNAL \mem|Mux30~5_combout\ : std_logic;
SIGNAL \mem|Mux33~0_combout\ : std_logic;
SIGNAL \mem|Mux32~0_combout\ : std_logic;
SIGNAL \mem|Mux32~2_combout\ : std_logic;
SIGNAL \mem|Mux32~3_combout\ : std_logic;
SIGNAL \mem|Mux32~4_combout\ : std_logic;
SIGNAL \mem|Mux28~3_combout\ : std_logic;
SIGNAL \mem|Mux28~9_combout\ : std_logic;
SIGNAL \mem|Mux28~6_combout\ : std_logic;
SIGNAL \mem|Mux28~4_combout\ : std_logic;
SIGNAL \mem|Mux28~5_combout\ : std_logic;
SIGNAL \mem|Mux28~7_combout\ : std_logic;
SIGNAL \mem|Mux28~8_combout\ : std_logic;
SIGNAL \disp|Mux0~4_combout\ : std_logic;
SIGNAL \disp|Mux0~5_combout\ : std_logic;
SIGNAL \mem|Mux46~0_combout\ : std_logic;
SIGNAL \mem|Mux22~0_combout\ : std_logic;
SIGNAL \mem|Mux22~1_combout\ : std_logic;
SIGNAL \mem|Mux22~2_combout\ : std_logic;
SIGNAL \mem|Mux52~1_combout\ : std_logic;
SIGNAL \mem|Mux20~0_combout\ : std_logic;
SIGNAL \mem|Mux20~3_combout\ : std_logic;
SIGNAL \mem|Mux21~2_combout\ : std_logic;
SIGNAL \mem|Mux21~0_combout\ : std_logic;
SIGNAL \mem|Mux21~1_combout\ : std_logic;
SIGNAL \mem|Mux21~4_combout\ : std_logic;
SIGNAL \mem|Mux21~5_combout\ : std_logic;
SIGNAL \mem|Mux21~3_combout\ : std_logic;
SIGNAL \mem|Mux24~2_combout\ : std_logic;
SIGNAL \mem|Mux24~6_combout\ : std_logic;
SIGNAL \mem|Mux24~7_combout\ : std_logic;
SIGNAL \mem|Mux38~0_combout\ : std_logic;
SIGNAL \mem|Mux24~3_combout\ : std_logic;
SIGNAL \mem|Mux24~4_combout\ : std_logic;
SIGNAL \disp|Mux0~2_combout\ : std_logic;
SIGNAL \disp|Mux0~3_combout\ : std_logic;
SIGNAL \disp|Mux0~6_combout\ : std_logic;
SIGNAL \disp|Mux0~9_combout\ : std_logic;
SIGNAL \mem|Mux52~2_combout\ : std_logic;
SIGNAL \mem|Mux52~3_combout\ : std_logic;
SIGNAL \mem|Mux55~0_combout\ : std_logic;
SIGNAL \mem|Mux55~1_combout\ : std_logic;
SIGNAL \mem|Mux55~2_combout\ : std_logic;
SIGNAL \disp|Mux0~20_combout\ : std_logic;
SIGNAL \disp|Mux0~21_combout\ : std_logic;
SIGNAL \mem|Mux24~1_combout\ : std_logic;
SIGNAL \mem|Mux57~0_combout\ : std_logic;
SIGNAL \mem|Mux57~1_combout\ : std_logic;
SIGNAL \mem|Mux57~2_combout\ : std_logic;
SIGNAL \mem|Mux59~0_combout\ : std_logic;
SIGNAL \mem|Mux59~1_combout\ : std_logic;
SIGNAL \mem|Mux59~2_combout\ : std_logic;
SIGNAL \disp|Mux0~22_combout\ : std_logic;
SIGNAL \mem|Mux60~0_combout\ : std_logic;
SIGNAL \mem|Mux60~1_combout\ : std_logic;
SIGNAL \mem|Mux52~0_combout\ : std_logic;
SIGNAL \mem|Mux63~0_combout\ : std_logic;
SIGNAL \mem|Mux63~1_combout\ : std_logic;
SIGNAL \disp|Mux0~23_combout\ : std_logic;
SIGNAL \mem|Mux24~5_combout\ : std_logic;
SIGNAL \mem|Mux62~0_combout\ : std_logic;
SIGNAL \mem|Mux62~1_combout\ : std_logic;
SIGNAL \disp|Mux0~24_combout\ : std_logic;
SIGNAL \disp|Mux0~25_combout\ : std_logic;
SIGNAL \mem|Mux50~0_combout\ : std_logic;
SIGNAL \mem|Mux50~2_combout\ : std_logic;
SIGNAL \mem|Mux49~1_combout\ : std_logic;
SIGNAL \mem|Mux49~0_combout\ : std_logic;
SIGNAL \mem|Mux49~2_combout\ : std_logic;
SIGNAL \disp|Mux0~26_combout\ : std_logic;
SIGNAL \disp|Mux0~27_combout\ : std_logic;
SIGNAL \disp|Mux0~28_combout\ : std_logic;
SIGNAL \mem|Mux33~1_combout\ : std_logic;
SIGNAL \mem|Mux33~2_combout\ : std_logic;
SIGNAL \mem|Mux33~3_combout\ : std_logic;
SIGNAL \mem|Mux33~4_combout\ : std_logic;
SIGNAL \mem|Mux33~5_combout\ : std_logic;
SIGNAL \mem|Mux45~2_combout\ : std_logic;
SIGNAL \mem|Mux45~3_combout\ : std_logic;
SIGNAL \mem|Mux45~5_combout\ : std_logic;
SIGNAL \disp|Mux0~10_combout\ : std_logic;
SIGNAL \disp|Mux0~11_combout\ : std_logic;
SIGNAL \mem|Mux40~0_combout\ : std_logic;
SIGNAL \mem|Mux40~1_combout\ : std_logic;
SIGNAL \disp|reg[23]~feeder_combout\ : std_logic;
SIGNAL \mem|Mux41~0_combout\ : std_logic;
SIGNAL \disp|reg[22]~0_combout\ : std_logic;
SIGNAL \mem|Mux44~0_combout\ : std_logic;
SIGNAL \mem|Mux44~1_combout\ : std_logic;
SIGNAL \disp|Mux0~17_combout\ : std_logic;
SIGNAL \disp|Mux0~18_combout\ : std_logic;
SIGNAL \mem|Mux35~1_combout\ : std_logic;
SIGNAL \mem|Mux35~2_combout\ : std_logic;
SIGNAL \mem|Mux43~0_combout\ : std_logic;
SIGNAL \disp|Mux0~14_combout\ : std_logic;
SIGNAL \disp|Mux0~15_combout\ : std_logic;
SIGNAL \mem|Mux42~2_combout\ : std_logic;
SIGNAL \disp|reg[21]~1_combout\ : std_logic;
SIGNAL \mem|Mux42~1_combout\ : std_logic;
SIGNAL \mem|Mux38~1_combout\ : std_logic;
SIGNAL \mem|Mux38~2_combout\ : std_logic;
SIGNAL \mem|Mux38~3_combout\ : std_logic;
SIGNAL \mem|Mux38~4_combout\ : std_logic;
SIGNAL \mem|Mux38~5_combout\ : std_logic;
SIGNAL \mem|Mux38~6_combout\ : std_logic;
SIGNAL \disp|Mux0~12_combout\ : std_logic;
SIGNAL \disp|Mux0~13_combout\ : std_logic;
SIGNAL \disp|Mux0~16_combout\ : std_logic;
SIGNAL \disp|Mux0~19_combout\ : std_logic;
SIGNAL \disp|Mux0~29_combout\ : std_logic;
SIGNAL \disp|Mux0~33_combout\ : std_logic;
SIGNAL \disp|Selector3~1_combout\ : std_logic;
SIGNAL \disp|Selector7~1_combout\ : std_logic;
SIGNAL \disp|reg_counter\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \disp|reg\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \disp|red\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \disp|pixelcounter\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \disp|linecounter\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \disp|green\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \disp|address\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_rst~combout\ : std_logic;
SIGNAL \disp|ALT_INV_address\ : std_logic_vector(6 DOWNTO 6);
SIGNAL \disp|ALT_INV_state.print~regout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
hsync <= ww_hsync;
vsync <= ww_vsync;
red <= ww_red;
green <= ww_green;
blue <= ww_blue;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);
\ALT_INV_rst~combout\ <= NOT \rst~combout\;
\disp|ALT_INV_address\(6) <= NOT \disp|address\(6);
\disp|ALT_INV_state.print~regout\ <= NOT \disp|state.print~regout\;

-- Location: LCFF_X22_Y13_N5
\disp|reg[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|reg[22]~0_combout\,
	sdata => \mem|Mux42~1_combout\,
	sclr => \disp|address\(7),
	sload => \disp|address\(6),
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(22));

-- Location: LCFF_X19_Y13_N21
\disp|reg[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux46~3_combout\,
	sclr => \disp|address\(7),
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(17));

-- Location: LCFF_X19_Y13_N15
\disp|reg[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux39~4_combout\,
	sclr => \disp|address\(7),
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(24));

-- Location: LCFF_X19_Y13_N11
\disp|reg[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux47~1_combout\,
	sclr => \disp|address\(7),
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(16));

-- Location: LCFF_X19_Y12_N25
\disp|reg[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux48~5_combout\,
	sclr => \disp|address\(7),
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(15));

-- Location: LCCOMB_X20_Y16_N22
\disp|Add2~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add2~8_combout\ = (\disp|Add2~7\ & (\disp|linecounter\(4) $ (\disp|Add1~0_combout\ $ (GND)))) # (!\disp|Add2~7\ & ((\disp|linecounter\(4) $ (!\disp|Add1~0_combout\)) # (GND)))
-- \disp|Add2~9\ = CARRY((\disp|linecounter\(4) $ (!\disp|Add1~0_combout\)) # (!\disp|Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(4),
	datab => \disp|Add1~0_combout\,
	datad => VCC,
	cin => \disp|Add2~7\,
	combout => \disp|Add2~8_combout\,
	cout => \disp|Add2~9\);

-- Location: LCCOMB_X20_Y16_N24
\disp|Add2~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add2~10_combout\ = (\disp|Add2~9\ & (\disp|linecounter\(5) $ ((!\disp|Add1~3_combout\)))) # (!\disp|Add2~9\ & ((\disp|linecounter\(5) $ (\disp|Add1~3_combout\)) # (GND)))
-- \disp|Add2~11\ = CARRY((\disp|linecounter\(5) $ (!\disp|Add1~3_combout\)) # (!\disp|Add2~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(5),
	datab => \disp|Add1~3_combout\,
	datad => VCC,
	cin => \disp|Add2~9\,
	combout => \disp|Add2~10_combout\,
	cout => \disp|Add2~11\);

-- Location: LCCOMB_X20_Y16_N26
\disp|Add2~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add2~12_combout\ = (\disp|Add2~11\ & (\disp|linecounter\(6) $ (\disp|Add1~5_combout\ $ (VCC)))) # (!\disp|Add2~11\ & ((\disp|linecounter\(6) $ (\disp|Add1~5_combout\)) # (GND)))
-- \disp|Add2~13\ = CARRY((\disp|linecounter\(6) $ (\disp|Add1~5_combout\)) # (!\disp|Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(6),
	datab => \disp|Add1~5_combout\,
	datad => VCC,
	cin => \disp|Add2~11\,
	combout => \disp|Add2~12_combout\,
	cout => \disp|Add2~13\);

-- Location: LCFF_X19_Y13_N9
\disp|reg[46]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux17~1_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(46));

-- Location: LCFF_X22_Y13_N17
\disp|reg[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux37~4_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(26));

-- Location: LCFF_X21_Y13_N5
\disp|reg[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux34~2_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(29));

-- Location: LCFF_X21_Y13_N17
\disp|reg[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux36~4_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(27));

-- Location: LCFF_X22_Y13_N23
\disp|reg[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux53~1_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(10));

-- Location: LCFF_X19_Y13_N13
\disp|reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux61~2_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(2));

-- Location: LCFF_X19_Y12_N15
\disp|reg[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux51~3_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(12));

-- Location: LCFF_X18_Y14_N29
\disp|reg[49]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux14~1_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(49));

-- Location: LCFF_X18_Y14_N27
\disp|reg[50]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux13~1_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(50));

-- Location: LCFF_X18_Y14_N13
\disp|reg[48]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux15~2_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(48));

-- Location: LCCOMB_X18_Y14_N22
\disp|Mux0~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~30_combout\ = (\disp|reg_counter\(0) & ((\disp|reg_counter\(1) & (\disp|reg\(48))) # (!\disp|reg_counter\(1) & ((\disp|reg\(50)))))) # (!\disp|reg_counter\(0) & (((!\disp|reg_counter\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg\(48),
	datab => \disp|reg\(50),
	datac => \disp|reg_counter\(0),
	datad => \disp|reg_counter\(1),
	combout => \disp|Mux0~30_combout\);

-- Location: LCFF_X18_Y14_N17
\disp|reg[51]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux12~1_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(51));

-- Location: LCCOMB_X18_Y14_N18
\disp|Mux0~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~31_combout\ = (\disp|reg_counter\(0) & (((\disp|Mux0~30_combout\)))) # (!\disp|reg_counter\(0) & ((\disp|Mux0~30_combout\ & (\disp|reg\(51))) # (!\disp|Mux0~30_combout\ & ((\disp|reg\(49))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg\(51),
	datab => \disp|reg\(49),
	datac => \disp|reg_counter\(0),
	datad => \disp|Mux0~30_combout\,
	combout => \disp|Mux0~31_combout\);

-- Location: LCFF_X18_Y13_N1
\disp|reg[52]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux11~0_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(52));

-- Location: LCCOMB_X19_Y13_N30
\disp|Mux0~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~32_combout\ = (\disp|reg_counter\(2) & ((\disp|reg_counter\(3) & ((\disp|Mux0~31_combout\))) # (!\disp|reg_counter\(3) & (\disp|reg\(52))))) # (!\disp|reg_counter\(2) & (\disp|reg\(52)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg\(52),
	datab => \disp|reg_counter\(2),
	datac => \disp|reg_counter\(3),
	datad => \disp|Mux0~31_combout\,
	combout => \disp|Mux0~32_combout\);

-- Location: LCCOMB_X18_Y13_N10
\mem|Mux17~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux17~0_combout\ = ((\disp|address\(4) & (!\mem|Mux45~1_combout\)) # (!\disp|address\(4) & ((!\mem|Mux24~0_combout\)))) # (!\disp|address\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux45~1_combout\,
	datab => \mem|Mux24~0_combout\,
	datac => \disp|address\(5),
	datad => \disp|address\(4),
	combout => \mem|Mux17~0_combout\);

-- Location: LCCOMB_X19_Y13_N8
\mem|Mux17~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux17~1_combout\ = (!\disp|address\(7) & ((\disp|address\(6) & ((\mem|Mux17~0_combout\))) # (!\disp|address\(6) & (\mem|Mux20~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(6),
	datab => \disp|address\(7),
	datac => \mem|Mux20~2_combout\,
	datad => \mem|Mux17~0_combout\,
	combout => \mem|Mux17~1_combout\);

-- Location: LCCOMB_X21_Y14_N6
\mem|Mux19~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux19~0_combout\ = \disp|address\(4) $ (((\disp|address\(3)) # ((\disp|address\(2) & \disp|address\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datab => \disp|address\(2),
	datac => \disp|address\(1),
	datad => \disp|address\(3),
	combout => \mem|Mux19~0_combout\);

-- Location: LCCOMB_X21_Y14_N12
\mem|Mux19~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux19~1_combout\ = (\disp|address\(6) & ((\mem|Mux19~0_combout\) # (!\disp|address\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(6),
	datac => \disp|address\(5),
	datad => \mem|Mux19~0_combout\,
	combout => \mem|Mux19~1_combout\);

-- Location: LCCOMB_X21_Y14_N14
\mem|Mux37~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux37~1_combout\ = (\disp|address\(1) & ((\disp|address\(5)) # ((\disp|address\(4)) # (\disp|address\(0))))) # (!\disp|address\(1) & (\disp|address\(0) & (\disp|address\(5) $ (\disp|address\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \disp|address\(4),
	datac => \disp|address\(1),
	datad => \disp|address\(0),
	combout => \mem|Mux37~1_combout\);

-- Location: LCCOMB_X22_Y14_N12
\mem|Mux37~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux37~2_combout\ = (\disp|address\(4)) # (\disp|address\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \disp|address\(4),
	datad => \disp|address\(5),
	combout => \mem|Mux37~2_combout\);

-- Location: LCCOMB_X22_Y14_N6
\mem|Mux37~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux37~3_combout\ = (\disp|address\(3) & (((!\mem|Mux37~2_combout\)))) # (!\disp|address\(3) & ((\mem|Mux37~1_combout\ & ((!\mem|Mux37~2_combout\) # (!\disp|address\(2)))) # (!\mem|Mux37~1_combout\ & ((\disp|address\(2)) # (\mem|Mux37~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux37~1_combout\,
	datab => \disp|address\(3),
	datac => \disp|address\(2),
	datad => \mem|Mux37~2_combout\,
	combout => \mem|Mux37~3_combout\);

-- Location: LCCOMB_X22_Y13_N16
\mem|Mux37~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux37~4_combout\ = (!\disp|address\(7) & ((\mem|Mux30~2_combout\) # ((!\disp|address\(6) & \mem|Mux37~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(7),
	datab => \mem|Mux30~2_combout\,
	datac => \disp|address\(6),
	datad => \mem|Mux37~3_combout\,
	combout => \mem|Mux37~4_combout\);

-- Location: LCCOMB_X22_Y13_N24
\mem|Mux42~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux42~0_combout\ = \disp|address\(4) $ (((\disp|address\(2)) # (\disp|address\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datac => \disp|address\(2),
	datad => \disp|address\(3),
	combout => \mem|Mux42~0_combout\);

-- Location: LCCOMB_X18_Y13_N8
\mem|Mux45~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux45~4_combout\ = ((\disp|address\(4) & (!\mem|Mux45~1_combout\)) # (!\disp|address\(4) & ((\mem|Mux45~0_combout\)))) # (!\disp|address\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux45~1_combout\,
	datab => \disp|address\(4),
	datac => \mem|Mux45~0_combout\,
	datad => \disp|address\(5),
	combout => \mem|Mux45~4_combout\);

-- Location: LCCOMB_X20_Y15_N10
\mem|Mux46~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux46~1_combout\ = (\disp|address\(3) & (!\disp|address\(2))) # (!\disp|address\(3) & ((\disp|address\(2)) # ((\disp|address\(0) & \disp|address\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(3),
	datab => \disp|address\(2),
	datac => \disp|address\(0),
	datad => \disp|address\(1),
	combout => \mem|Mux46~1_combout\);

-- Location: LCCOMB_X21_Y12_N24
\mem|Mux36~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux36~0_combout\ = (\disp|address\(4) & (((!\disp|address\(2)) # (!\disp|address\(0))) # (!\disp|address\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(1),
	datab => \disp|address\(0),
	datac => \disp|address\(4),
	datad => \disp|address\(2),
	combout => \mem|Mux36~0_combout\);

-- Location: LCCOMB_X21_Y12_N18
\mem|Mux34~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux34~0_combout\ = (!\disp|address\(5) & ((\disp|address\(3) & (!\mem|Mux36~0_combout\)) # (!\disp|address\(3) & ((\mem|Mux32~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux36~0_combout\,
	datab => \disp|address\(3),
	datac => \mem|Mux32~0_combout\,
	datad => \disp|address\(5),
	combout => \mem|Mux34~0_combout\);

-- Location: LCCOMB_X21_Y13_N6
\mem|Mux34~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux34~1_combout\ = (\mem|Mux30~2_combout\) # ((!\disp|address\(6) & ((\mem|Mux33~2_combout\) # (\mem|Mux34~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux30~2_combout\,
	datab => \disp|address\(6),
	datac => \mem|Mux33~2_combout\,
	datad => \mem|Mux34~0_combout\,
	combout => \mem|Mux34~1_combout\);

-- Location: LCCOMB_X21_Y13_N4
\mem|Mux34~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux34~2_combout\ = (!\disp|address\(7) & \mem|Mux34~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(7),
	datad => \mem|Mux34~1_combout\,
	combout => \mem|Mux34~2_combout\);

-- Location: LCCOMB_X20_Y15_N16
\mem|Mux39~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux39~0_combout\ = (\disp|address\(3) & (((!\disp|address\(2))))) # (!\disp|address\(3) & (\disp|address\(2) & ((\disp|address\(1)) # (\disp|address\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(3),
	datab => \disp|address\(1),
	datac => \disp|address\(0),
	datad => \disp|address\(2),
	combout => \mem|Mux39~0_combout\);

-- Location: LCCOMB_X19_Y15_N10
\mem|Mux39~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux39~1_combout\ = (\disp|address\(4)) # ((!\disp|address\(3) & ((\disp|address\(1)) # (\disp|address\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(1),
	datab => \disp|address\(2),
	datac => \disp|address\(3),
	datad => \disp|address\(4),
	combout => \mem|Mux39~1_combout\);

-- Location: LCCOMB_X19_Y15_N8
\mem|Mux39~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux39~2_combout\ = (\mem|Mux39~0_combout\ & ((\disp|address\(4)) # ((!\disp|address\(6) & \mem|Mux39~1_combout\)))) # (!\mem|Mux39~0_combout\ & (((!\disp|address\(6) & \mem|Mux39~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux39~0_combout\,
	datab => \disp|address\(4),
	datac => \disp|address\(6),
	datad => \mem|Mux39~1_combout\,
	combout => \mem|Mux39~2_combout\);

-- Location: LCCOMB_X19_Y12_N20
\mem|Mux39~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux39~3_combout\ = (\disp|address\(6)) # (\disp|address\(4) $ (((\disp|address\(3)) # (\disp|address\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datab => \disp|address\(3),
	datac => \disp|address\(2),
	datad => \disp|address\(6),
	combout => \mem|Mux39~3_combout\);

-- Location: LCCOMB_X19_Y13_N14
\mem|Mux39~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux39~4_combout\ = (\disp|address\(5) & ((\mem|Mux39~2_combout\))) # (!\disp|address\(5) & (\mem|Mux39~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(5),
	datac => \mem|Mux39~3_combout\,
	datad => \mem|Mux39~2_combout\,
	combout => \mem|Mux39~4_combout\);

-- Location: LCCOMB_X18_Y13_N22
\mem|Mux47~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux47~0_combout\ = (\disp|address\(3) & (!\disp|address\(6) & !\disp|address\(2))) # (!\disp|address\(3) & ((\disp|address\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(3),
	datac => \disp|address\(6),
	datad => \disp|address\(2),
	combout => \mem|Mux47~0_combout\);

-- Location: LCCOMB_X19_Y13_N10
\mem|Mux47~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux47~1_combout\ = (\disp|address\(5) & ((\disp|address\(4) & (!\disp|address\(6))) # (!\disp|address\(4) & ((\mem|Mux47~0_combout\))))) # (!\disp|address\(5) & (\disp|address\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(6),
	datab => \mem|Mux47~0_combout\,
	datac => \disp|address\(5),
	datad => \disp|address\(4),
	combout => \mem|Mux47~1_combout\);

-- Location: LCCOMB_X21_Y12_N0
\mem|Mux35~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux35~0_combout\ = (!\disp|address\(5) & ((\disp|address\(3) & (!\mem|Mux36~0_combout\)) # (!\disp|address\(3) & ((\mem|Mux38~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \disp|address\(3),
	datac => \mem|Mux36~0_combout\,
	datad => \mem|Mux38~3_combout\,
	combout => \mem|Mux35~0_combout\);

-- Location: LCCOMB_X21_Y12_N4
\mem|Mux36~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux36~1_combout\ = (\disp|address\(2) & ((\disp|address\(1)) # ((!\disp|address\(4) & \disp|address\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(2),
	datab => \disp|address\(1),
	datac => \disp|address\(4),
	datad => \disp|address\(0),
	combout => \mem|Mux36~1_combout\);

-- Location: LCCOMB_X21_Y12_N22
\mem|Mux36~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux36~2_combout\ = (!\disp|address\(3) & ((\disp|address\(5) & (!\mem|Mux36~1_combout\)) # (!\disp|address\(5) & ((\mem|Mux38~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \disp|address\(3),
	datac => \mem|Mux36~1_combout\,
	datad => \mem|Mux38~3_combout\,
	combout => \mem|Mux36~2_combout\);

-- Location: LCCOMB_X21_Y12_N8
\mem|Mux36~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux36~3_combout\ = (\mem|Mux36~2_combout\) # ((!\disp|address\(5) & (\disp|address\(3) & !\mem|Mux36~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \disp|address\(3),
	datac => \mem|Mux36~0_combout\,
	datad => \mem|Mux36~2_combout\,
	combout => \mem|Mux36~3_combout\);

-- Location: LCCOMB_X21_Y13_N16
\mem|Mux36~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux36~4_combout\ = (!\disp|address\(7) & ((\mem|Mux30~2_combout\) # ((!\disp|address\(6) & \mem|Mux36~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux30~2_combout\,
	datab => \disp|address\(7),
	datac => \disp|address\(6),
	datad => \mem|Mux36~3_combout\,
	combout => \mem|Mux36~4_combout\);

-- Location: LCCOMB_X22_Y13_N18
\mem|Mux53~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux53~0_combout\ = (\disp|address\(5) & ((\disp|address\(6)) # ((!\disp|address\(4) & \disp|address\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datab => \disp|address\(5),
	datac => \disp|address\(6),
	datad => \disp|address\(3),
	combout => \mem|Mux53~0_combout\);

-- Location: LCCOMB_X22_Y13_N22
\mem|Mux53~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux53~1_combout\ = (\disp|address\(7) & (\mem|Mux24~1_combout\)) # (!\disp|address\(7) & ((\mem|Mux53~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(7),
	datac => \mem|Mux24~1_combout\,
	datad => \mem|Mux53~0_combout\,
	combout => \mem|Mux53~1_combout\);

-- Location: LCCOMB_X22_Y13_N28
\mem|Mux61~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux61~0_combout\ = (\disp|address\(3) & (\disp|address\(2) & ((\disp|address\(0)) # (\disp|address\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(0),
	datab => \disp|address\(3),
	datac => \disp|address\(2),
	datad => \disp|address\(1),
	combout => \mem|Mux61~0_combout\);

-- Location: LCCOMB_X22_Y13_N10
\mem|Mux61~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux61~1_combout\ = (\disp|address\(6) & (!\disp|address\(7))) # (!\disp|address\(6) & (!\disp|address\(4) & ((\disp|address\(7)) # (\mem|Mux61~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100011101000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(7),
	datab => \disp|address\(6),
	datac => \disp|address\(4),
	datad => \mem|Mux61~0_combout\,
	combout => \mem|Mux61~1_combout\);

-- Location: LCCOMB_X19_Y13_N12
\mem|Mux61~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux61~2_combout\ = (\mem|Mux61~1_combout\ & (\disp|address\(7) $ (\disp|address\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(7),
	datac => \disp|address\(5),
	datad => \mem|Mux61~1_combout\,
	combout => \mem|Mux61~2_combout\);

-- Location: LCCOMB_X19_Y12_N12
\mem|Mux50~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux50~1_combout\ = (\disp|address\(2) & (\disp|address\(1) & ((\disp|address\(0)) # (!\disp|address\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(2),
	datab => \disp|address\(0),
	datac => \disp|address\(6),
	datad => \disp|address\(1),
	combout => \mem|Mux50~1_combout\);

-- Location: LCCOMB_X19_Y12_N28
\mem|Mux48~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux48~3_combout\ = (\disp|address\(6) & (((!\disp|address\(4) & \mem|Mux48~2_combout\)) # (!\disp|address\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datab => \disp|address\(5),
	datac => \mem|Mux48~2_combout\,
	datad => \disp|address\(6),
	combout => \mem|Mux48~3_combout\);

-- Location: LCCOMB_X19_Y12_N22
\mem|Mux48~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux48~4_combout\ = (\disp|address\(4)) # ((\disp|address\(2) & ((!\disp|address\(3)) # (!\disp|address\(1)))) # (!\disp|address\(2) & ((\disp|address\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(2),
	datab => \disp|address\(1),
	datac => \disp|address\(3),
	datad => \disp|address\(4),
	combout => \mem|Mux48~4_combout\);

-- Location: LCCOMB_X18_Y14_N0
\mem|Mux14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux14~0_combout\ = (\disp|address\(5) & ((\disp|address\(4) & ((!\disp|address\(6)))) # (!\disp|address\(4) & (\mem|Mux49~0_combout\ & \disp|address\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datab => \disp|address\(5),
	datac => \mem|Mux49~0_combout\,
	datad => \disp|address\(6),
	combout => \mem|Mux14~0_combout\);

-- Location: LCCOMB_X18_Y14_N28
\mem|Mux14~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux14~1_combout\ = (!\disp|address\(7) & ((\mem|Mux16~2_combout\) # (\mem|Mux14~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(7),
	datac => \mem|Mux16~2_combout\,
	datad => \mem|Mux14~0_combout\,
	combout => \mem|Mux14~1_combout\);

-- Location: LCCOMB_X18_Y14_N10
\mem|Mux13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux13~0_combout\ = (\disp|address\(5) & ((\disp|address\(4) & ((!\disp|address\(6)))) # (!\disp|address\(4) & (!\mem|Mux52~1_combout\ & \disp|address\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datab => \disp|address\(5),
	datac => \mem|Mux52~1_combout\,
	datad => \disp|address\(6),
	combout => \mem|Mux13~0_combout\);

-- Location: LCCOMB_X18_Y14_N26
\mem|Mux13~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux13~1_combout\ = (!\disp|address\(7) & ((\mem|Mux16~2_combout\) # (\mem|Mux13~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(7),
	datac => \mem|Mux16~2_combout\,
	datad => \mem|Mux13~0_combout\,
	combout => \mem|Mux13~1_combout\);

-- Location: LCCOMB_X20_Y15_N2
\mem|Mux15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux15~0_combout\ = (!\disp|address\(3) & ((\disp|address\(2) & ((!\disp|address\(1)) # (!\disp|address\(0)))) # (!\disp|address\(2) & ((\disp|address\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(3),
	datab => \disp|address\(2),
	datac => \disp|address\(0),
	datad => \disp|address\(1),
	combout => \mem|Mux15~0_combout\);

-- Location: LCCOMB_X19_Y15_N18
\mem|Mux15~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux15~1_combout\ = (\disp|address\(5) & ((\disp|address\(4) & ((!\disp|address\(6)))) # (!\disp|address\(4) & (\mem|Mux15~0_combout\ & \disp|address\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux15~0_combout\,
	datab => \disp|address\(4),
	datac => \disp|address\(6),
	datad => \disp|address\(5),
	combout => \mem|Mux15~1_combout\);

-- Location: LCCOMB_X18_Y14_N12
\mem|Mux15~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux15~2_combout\ = (!\disp|address\(7) & ((\mem|Mux16~2_combout\) # (\mem|Mux15~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(7),
	datac => \mem|Mux16~2_combout\,
	datad => \mem|Mux15~1_combout\,
	combout => \mem|Mux15~2_combout\);

-- Location: LCCOMB_X18_Y14_N20
\mem|Mux12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux12~0_combout\ = (\disp|address\(6)) # ((\disp|address\(4) & ((\mem|Mux25~3_combout\) # (\disp|address\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(6),
	datab => \disp|address\(4),
	datac => \mem|Mux25~3_combout\,
	datad => \disp|address\(5),
	combout => \mem|Mux12~0_combout\);

-- Location: LCCOMB_X18_Y14_N16
\mem|Mux12~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux12~1_combout\ = (\disp|address\(7) & (((\mem|Mux24~1_combout\)))) # (!\disp|address\(7) & ((\mem|Mux12~0_combout\) # ((\mem|Mux24~1_combout\ & \mem|Mux24~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux12~0_combout\,
	datab => \disp|address\(7),
	datac => \mem|Mux24~1_combout\,
	datad => \mem|Mux24~0_combout\,
	combout => \mem|Mux12~1_combout\);

-- Location: LCCOMB_X18_Y13_N0
\mem|Mux11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux11~0_combout\ = (\disp|address\(5) & (!\disp|address\(7) & ((\disp|address\(6)) # (!\disp|address\(4))))) # (!\disp|address\(5) & (!\disp|address\(6) & ((!\disp|address\(7)) # (!\disp|address\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000110100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \disp|address\(4),
	datac => \disp|address\(6),
	datad => \disp|address\(7),
	combout => \mem|Mux11~0_combout\);

-- Location: LCCOMB_X19_Y12_N24
\mem|Mux48~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux48~5_combout\ = (\mem|Mux48~3_combout\) # ((!\disp|address\(6) & (\mem|Mux48~4_combout\ & \disp|address\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(6),
	datab => \mem|Mux48~4_combout\,
	datac => \disp|address\(5),
	datad => \mem|Mux48~3_combout\,
	combout => \mem|Mux48~5_combout\);

-- Location: LCCOMB_X19_Y12_N8
\mem|Mux51~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux51~2_combout\ = (\disp|address\(5) & (!\disp|address\(7) & ((\mem|Mux52~1_combout\) # (\disp|address\(6))))) # (!\disp|address\(5) & (((!\disp|address\(6) & \disp|address\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux52~1_combout\,
	datab => \disp|address\(6),
	datac => \disp|address\(5),
	datad => \disp|address\(7),
	combout => \mem|Mux51~2_combout\);

-- Location: LCCOMB_X19_Y12_N14
\mem|Mux51~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux51~3_combout\ = (\mem|Mux51~2_combout\ & ((\disp|address\(4) & (\disp|address\(6))) # (!\disp|address\(4) & ((!\mem|Mux16~1_combout\) # (!\disp|address\(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datab => \disp|address\(6),
	datac => \mem|Mux51~2_combout\,
	datad => \mem|Mux16~1_combout\,
	combout => \mem|Mux51~3_combout\);

-- Location: LCCOMB_X20_Y15_N30
\mem|Mux46~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux46~2_combout\ = (\disp|address\(6) & (((!\disp|address\(5)) # (!\disp|address\(4))))) # (!\disp|address\(6) & (\disp|address\(5) & ((\mem|Mux46~1_combout\) # (\disp|address\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux46~1_combout\,
	datab => \disp|address\(6),
	datac => \disp|address\(4),
	datad => \disp|address\(5),
	combout => \mem|Mux46~2_combout\);

-- Location: LCCOMB_X19_Y13_N20
\mem|Mux46~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux46~3_combout\ = (\mem|Mux46~2_combout\ & ((\disp|address\(6) & ((\mem|Mux46~0_combout\) # (!\disp|address\(5)))) # (!\disp|address\(6) & (\disp|address\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(6),
	datab => \disp|address\(5),
	datac => \mem|Mux46~0_combout\,
	datad => \mem|Mux46~2_combout\,
	combout => \mem|Mux46~3_combout\);

-- Location: LCCOMB_X22_Y15_N2
\disp|pixelcounter[0]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|pixelcounter[0]~10_combout\ = \disp|pixelcounter\(0) $ (VCC)
-- \disp|pixelcounter[0]~11\ = CARRY(\disp|pixelcounter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|pixelcounter\(0),
	datad => VCC,
	combout => \disp|pixelcounter[0]~10_combout\,
	cout => \disp|pixelcounter[0]~11\);

-- Location: PIN_R22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\rst~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_rst,
	combout => \rst~combout\);

-- Location: LCCOMB_X22_Y15_N12
\disp|pixelcounter[5]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|pixelcounter[5]~20_combout\ = (\disp|pixelcounter\(5) & (!\disp|pixelcounter[4]~19\)) # (!\disp|pixelcounter\(5) & ((\disp|pixelcounter[4]~19\) # (GND)))
-- \disp|pixelcounter[5]~21\ = CARRY((!\disp|pixelcounter[4]~19\) # (!\disp|pixelcounter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|pixelcounter\(5),
	datad => VCC,
	cin => \disp|pixelcounter[4]~19\,
	combout => \disp|pixelcounter[5]~20_combout\,
	cout => \disp|pixelcounter[5]~21\);

-- Location: LCCOMB_X22_Y15_N14
\disp|pixelcounter[6]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|pixelcounter[6]~22_combout\ = (\disp|pixelcounter\(6) & (\disp|pixelcounter[5]~21\ $ (GND))) # (!\disp|pixelcounter\(6) & (!\disp|pixelcounter[5]~21\ & VCC))
-- \disp|pixelcounter[6]~23\ = CARRY((\disp|pixelcounter\(6) & !\disp|pixelcounter[5]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \disp|pixelcounter\(6),
	datad => VCC,
	cin => \disp|pixelcounter[5]~21\,
	combout => \disp|pixelcounter[6]~22_combout\,
	cout => \disp|pixelcounter[6]~23\);

-- Location: LCCOMB_X22_Y14_N0
\disp|a~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|a~0_combout\ = !\disp|a~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \disp|a~regout\,
	combout => \disp|a~0_combout\);

-- Location: LCFF_X22_Y14_N1
\disp|a\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|a~0_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|a~regout\);

-- Location: LCFF_X22_Y15_N15
\disp|pixelcounter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|pixelcounter[6]~22_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \disp|LessThan6~1_combout\,
	ena => \disp|a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|pixelcounter\(6));

-- Location: LCCOMB_X22_Y15_N16
\disp|pixelcounter[7]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|pixelcounter[7]~24_combout\ = (\disp|pixelcounter\(7) & (!\disp|pixelcounter[6]~23\)) # (!\disp|pixelcounter\(7) & ((\disp|pixelcounter[6]~23\) # (GND)))
-- \disp|pixelcounter[7]~25\ = CARRY((!\disp|pixelcounter[6]~23\) # (!\disp|pixelcounter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|pixelcounter\(7),
	datad => VCC,
	cin => \disp|pixelcounter[6]~23\,
	combout => \disp|pixelcounter[7]~24_combout\,
	cout => \disp|pixelcounter[7]~25\);

-- Location: LCCOMB_X22_Y15_N18
\disp|pixelcounter[8]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|pixelcounter[8]~26_combout\ = (\disp|pixelcounter\(8) & (\disp|pixelcounter[7]~25\ $ (GND))) # (!\disp|pixelcounter\(8) & (!\disp|pixelcounter[7]~25\ & VCC))
-- \disp|pixelcounter[8]~27\ = CARRY((\disp|pixelcounter\(8) & !\disp|pixelcounter[7]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|pixelcounter\(8),
	datad => VCC,
	cin => \disp|pixelcounter[7]~25\,
	combout => \disp|pixelcounter[8]~26_combout\,
	cout => \disp|pixelcounter[8]~27\);

-- Location: LCCOMB_X22_Y15_N20
\disp|pixelcounter[9]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|pixelcounter[9]~28_combout\ = \disp|pixelcounter\(9) $ (\disp|pixelcounter[8]~27\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|pixelcounter\(9),
	cin => \disp|pixelcounter[8]~27\,
	combout => \disp|pixelcounter[9]~28_combout\);

-- Location: LCFF_X22_Y15_N21
\disp|pixelcounter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|pixelcounter[9]~28_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \disp|LessThan6~1_combout\,
	ena => \disp|a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|pixelcounter\(9));

-- Location: LCFF_X22_Y15_N17
\disp|pixelcounter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|pixelcounter[7]~24_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \disp|LessThan6~1_combout\,
	ena => \disp|a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|pixelcounter\(7));

-- Location: LCFF_X22_Y15_N19
\disp|pixelcounter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|pixelcounter[8]~26_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \disp|LessThan6~1_combout\,
	ena => \disp|a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|pixelcounter\(8));

-- Location: LCCOMB_X21_Y15_N18
\disp|LessThan6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|LessThan6~0_combout\ = (\disp|pixelcounter\(8) & ((\disp|pixelcounter\(6)) # ((\disp|pixelcounter\(5)) # (\disp|pixelcounter\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|pixelcounter\(6),
	datab => \disp|pixelcounter\(5),
	datac => \disp|pixelcounter\(7),
	datad => \disp|pixelcounter\(8),
	combout => \disp|LessThan6~0_combout\);

-- Location: LCCOMB_X21_Y15_N0
\disp|LessThan6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|LessThan6~1_combout\ = (\disp|pixelcounter\(9) & \disp|LessThan6~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|pixelcounter\(9),
	datad => \disp|LessThan6~0_combout\,
	combout => \disp|LessThan6~1_combout\);

-- Location: LCFF_X22_Y15_N3
\disp|pixelcounter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|pixelcounter[0]~10_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \disp|LessThan6~1_combout\,
	ena => \disp|a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|pixelcounter\(0));

-- Location: LCCOMB_X22_Y15_N4
\disp|pixelcounter[1]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|pixelcounter[1]~12_combout\ = (\disp|pixelcounter\(1) & (!\disp|pixelcounter[0]~11\)) # (!\disp|pixelcounter\(1) & ((\disp|pixelcounter[0]~11\) # (GND)))
-- \disp|pixelcounter[1]~13\ = CARRY((!\disp|pixelcounter[0]~11\) # (!\disp|pixelcounter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \disp|pixelcounter\(1),
	datad => VCC,
	cin => \disp|pixelcounter[0]~11\,
	combout => \disp|pixelcounter[1]~12_combout\,
	cout => \disp|pixelcounter[1]~13\);

-- Location: LCFF_X22_Y15_N5
\disp|pixelcounter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|pixelcounter[1]~12_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \disp|LessThan6~1_combout\,
	ena => \disp|a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|pixelcounter\(1));

-- Location: LCCOMB_X22_Y15_N6
\disp|pixelcounter[2]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|pixelcounter[2]~14_combout\ = (\disp|pixelcounter\(2) & (\disp|pixelcounter[1]~13\ $ (GND))) # (!\disp|pixelcounter\(2) & (!\disp|pixelcounter[1]~13\ & VCC))
-- \disp|pixelcounter[2]~15\ = CARRY((\disp|pixelcounter\(2) & !\disp|pixelcounter[1]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|pixelcounter\(2),
	datad => VCC,
	cin => \disp|pixelcounter[1]~13\,
	combout => \disp|pixelcounter[2]~14_combout\,
	cout => \disp|pixelcounter[2]~15\);

-- Location: LCCOMB_X22_Y15_N8
\disp|pixelcounter[3]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|pixelcounter[3]~16_combout\ = (\disp|pixelcounter\(3) & (!\disp|pixelcounter[2]~15\)) # (!\disp|pixelcounter\(3) & ((\disp|pixelcounter[2]~15\) # (GND)))
-- \disp|pixelcounter[3]~17\ = CARRY((!\disp|pixelcounter[2]~15\) # (!\disp|pixelcounter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \disp|pixelcounter\(3),
	datad => VCC,
	cin => \disp|pixelcounter[2]~15\,
	combout => \disp|pixelcounter[3]~16_combout\,
	cout => \disp|pixelcounter[3]~17\);

-- Location: LCFF_X22_Y15_N9
\disp|pixelcounter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|pixelcounter[3]~16_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \disp|LessThan6~1_combout\,
	ena => \disp|a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|pixelcounter\(3));

-- Location: LCCOMB_X22_Y15_N10
\disp|pixelcounter[4]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|pixelcounter[4]~18_combout\ = (\disp|pixelcounter\(4) & (\disp|pixelcounter[3]~17\ $ (GND))) # (!\disp|pixelcounter\(4) & (!\disp|pixelcounter[3]~17\ & VCC))
-- \disp|pixelcounter[4]~19\ = CARRY((\disp|pixelcounter\(4) & !\disp|pixelcounter[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \disp|pixelcounter\(4),
	datad => VCC,
	cin => \disp|pixelcounter[3]~17\,
	combout => \disp|pixelcounter[4]~18_combout\,
	cout => \disp|pixelcounter[4]~19\);

-- Location: LCFF_X22_Y15_N11
\disp|pixelcounter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|pixelcounter[4]~18_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \disp|LessThan6~1_combout\,
	ena => \disp|a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|pixelcounter\(4));

-- Location: LCFF_X22_Y15_N13
\disp|pixelcounter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|pixelcounter[5]~20_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \disp|LessThan6~1_combout\,
	ena => \disp|a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|pixelcounter\(5));

-- Location: LCCOMB_X21_Y15_N10
\disp|hsync~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|hsync~0_combout\ = ((!\disp|pixelcounter\(6) & (!\disp|pixelcounter\(5) & !\disp|pixelcounter\(4)))) # (!\disp|pixelcounter\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|pixelcounter\(6),
	datab => \disp|pixelcounter\(5),
	datac => \disp|pixelcounter\(7),
	datad => \disp|pixelcounter\(4),
	combout => \disp|hsync~0_combout\);

-- Location: LCCOMB_X22_Y15_N0
\disp|hsync~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|hsync~1_combout\ = (\disp|pixelcounter\(5) & (\disp|pixelcounter\(6) & \disp|pixelcounter\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|pixelcounter\(5),
	datac => \disp|pixelcounter\(6),
	datad => \disp|pixelcounter\(4),
	combout => \disp|hsync~1_combout\);

-- Location: LCCOMB_X21_Y15_N20
\disp|hsync~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|hsync~2_combout\ = (\disp|hsync~0_combout\) # (((\disp|hsync~1_combout\) # (\disp|pixelcounter\(8))) # (!\disp|pixelcounter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|hsync~0_combout\,
	datab => \disp|pixelcounter\(9),
	datac => \disp|hsync~1_combout\,
	datad => \disp|pixelcounter\(8),
	combout => \disp|hsync~2_combout\);

-- Location: LCCOMB_X23_Y16_N12
\disp|Add5~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add5~12_combout\ = (\disp|linecounter\(6) & (\disp|Add5~11\ $ (GND))) # (!\disp|linecounter\(6) & (!\disp|Add5~11\ & VCC))
-- \disp|Add5~13\ = CARRY((\disp|linecounter\(6) & !\disp|Add5~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \disp|linecounter\(6),
	datad => VCC,
	cin => \disp|Add5~11\,
	combout => \disp|Add5~12_combout\,
	cout => \disp|Add5~13\);

-- Location: LCCOMB_X23_Y16_N14
\disp|Add5~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add5~14_combout\ = (\disp|linecounter\(7) & (!\disp|Add5~13\)) # (!\disp|linecounter\(7) & ((\disp|Add5~13\) # (GND)))
-- \disp|Add5~15\ = CARRY((!\disp|Add5~13\) # (!\disp|linecounter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(7),
	datad => VCC,
	cin => \disp|Add5~13\,
	combout => \disp|Add5~14_combout\,
	cout => \disp|Add5~15\);

-- Location: LCCOMB_X22_Y16_N14
\disp|linecounter[7]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|linecounter[7]~11_combout\ = (!\disp|Equal8~2_combout\ & ((\disp|linecounter[7]~3_combout\ & ((\disp|linecounter\(7)))) # (!\disp|linecounter[7]~3_combout\ & (\disp|Add5~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter[7]~3_combout\,
	datab => \disp|Add5~14_combout\,
	datac => \disp|linecounter\(7),
	datad => \disp|Equal8~2_combout\,
	combout => \disp|linecounter[7]~11_combout\);

-- Location: LCFF_X22_Y16_N15
\disp|linecounter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|linecounter[7]~11_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|linecounter\(7));

-- Location: LCCOMB_X23_Y16_N16
\disp|Add5~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add5~16_combout\ = (\disp|linecounter\(8) & (\disp|Add5~15\ $ (GND))) # (!\disp|linecounter\(8) & (!\disp|Add5~15\ & VCC))
-- \disp|Add5~17\ = CARRY((\disp|linecounter\(8) & !\disp|Add5~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(8),
	datad => VCC,
	cin => \disp|Add5~15\,
	combout => \disp|Add5~16_combout\,
	cout => \disp|Add5~17\);

-- Location: LCCOMB_X22_Y16_N8
\disp|linecounter[8]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|linecounter[8]~10_combout\ = (!\disp|Equal8~2_combout\ & ((\disp|linecounter[7]~3_combout\ & (\disp|linecounter\(8))) # (!\disp|linecounter[7]~3_combout\ & ((\disp|Add5~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter[7]~3_combout\,
	datab => \disp|Equal8~2_combout\,
	datac => \disp|linecounter\(8),
	datad => \disp|Add5~16_combout\,
	combout => \disp|linecounter[8]~10_combout\);

-- Location: LCFF_X22_Y16_N9
\disp|linecounter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|linecounter[8]~10_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|linecounter\(8));

-- Location: LCCOMB_X21_Y15_N22
\disp|linecounter[7]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|linecounter[7]~0_combout\ = (\disp|pixelcounter\(6)) # (((!\disp|a~regout\) # (!\disp|pixelcounter\(3))) # (!\disp|pixelcounter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|pixelcounter\(6),
	datab => \disp|pixelcounter\(9),
	datac => \disp|pixelcounter\(3),
	datad => \disp|a~regout\,
	combout => \disp|linecounter[7]~0_combout\);

-- Location: LCCOMB_X21_Y15_N4
\disp|linecounter[7]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|linecounter[7]~1_combout\ = ((\disp|pixelcounter\(5)) # ((\disp|pixelcounter\(7)) # (!\disp|pixelcounter\(8)))) # (!\disp|pixelcounter\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|pixelcounter\(4),
	datab => \disp|pixelcounter\(5),
	datac => \disp|pixelcounter\(7),
	datad => \disp|pixelcounter\(8),
	combout => \disp|linecounter[7]~1_combout\);

-- Location: LCFF_X22_Y15_N7
\disp|pixelcounter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|pixelcounter[2]~14_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \disp|LessThan6~1_combout\,
	ena => \disp|a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|pixelcounter\(2));

-- Location: LCCOMB_X23_Y15_N10
\disp|linecounter[7]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|linecounter[7]~2_combout\ = ((!\disp|pixelcounter\(0)) # (!\disp|pixelcounter\(2))) # (!\disp|pixelcounter\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|pixelcounter\(1),
	datac => \disp|pixelcounter\(2),
	datad => \disp|pixelcounter\(0),
	combout => \disp|linecounter[7]~2_combout\);

-- Location: LCCOMB_X21_Y15_N2
\disp|linecounter[7]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|linecounter[7]~3_combout\ = (\disp|linecounter[7]~0_combout\) # ((\disp|linecounter[7]~1_combout\) # (\disp|linecounter[7]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|linecounter[7]~0_combout\,
	datac => \disp|linecounter[7]~1_combout\,
	datad => \disp|linecounter[7]~2_combout\,
	combout => \disp|linecounter[7]~3_combout\);

-- Location: LCCOMB_X23_Y16_N18
\disp|Add5~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add5~18_combout\ = \disp|Add5~17\ $ (\disp|linecounter\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \disp|linecounter\(9),
	cin => \disp|Add5~17\,
	combout => \disp|Add5~18_combout\);

-- Location: LCCOMB_X24_Y15_N4
\disp|linecounter[9]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|linecounter[9]~8_combout\ = (!\disp|Equal8~2_combout\ & ((\disp|linecounter[7]~3_combout\ & (\disp|linecounter\(9))) # (!\disp|linecounter[7]~3_combout\ & ((\disp|Add5~18_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|Equal8~2_combout\,
	datab => \disp|linecounter[7]~3_combout\,
	datac => \disp|linecounter\(9),
	datad => \disp|Add5~18_combout\,
	combout => \disp|linecounter[9]~8_combout\);

-- Location: LCFF_X24_Y15_N5
\disp|linecounter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|linecounter[9]~8_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|linecounter\(9));

-- Location: LCCOMB_X22_Y16_N16
\disp|Equal8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Equal8~1_combout\ = (!\disp|linecounter\(6) & (!\disp|linecounter\(8) & (\disp|linecounter\(9) & !\disp|linecounter\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(6),
	datab => \disp|linecounter\(8),
	datac => \disp|linecounter\(9),
	datad => \disp|linecounter\(5),
	combout => \disp|Equal8~1_combout\);

-- Location: LCCOMB_X23_Y16_N0
\disp|Add5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add5~0_combout\ = \disp|linecounter\(0) $ (VCC)
-- \disp|Add5~1\ = CARRY(\disp|linecounter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(0),
	datad => VCC,
	combout => \disp|Add5~0_combout\,
	cout => \disp|Add5~1\);

-- Location: LCCOMB_X22_Y16_N20
\disp|linecounter[0]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|linecounter[0]~13_combout\ = (!\disp|Equal8~2_combout\ & ((\disp|linecounter[7]~3_combout\ & ((\disp|linecounter\(0)))) # (!\disp|linecounter[7]~3_combout\ & (\disp|Add5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter[7]~3_combout\,
	datab => \disp|Add5~0_combout\,
	datac => \disp|linecounter\(0),
	datad => \disp|Equal8~2_combout\,
	combout => \disp|linecounter[0]~13_combout\);

-- Location: LCFF_X22_Y16_N21
\disp|linecounter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|linecounter[0]~13_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|linecounter\(0));

-- Location: LCCOMB_X22_Y16_N22
\disp|Equal8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Equal8~0_combout\ = (\disp|linecounter\(3) & (!\disp|linecounter\(4) & (!\disp|linecounter\(0) & !\disp|linecounter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(3),
	datab => \disp|linecounter\(4),
	datac => \disp|linecounter\(0),
	datad => \disp|linecounter\(1),
	combout => \disp|Equal8~0_combout\);

-- Location: LCCOMB_X22_Y16_N2
\disp|Equal8~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Equal8~2_combout\ = (\disp|linecounter\(2) & (!\disp|linecounter\(7) & (\disp|Equal8~1_combout\ & \disp|Equal8~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(2),
	datab => \disp|linecounter\(7),
	datac => \disp|Equal8~1_combout\,
	datad => \disp|Equal8~0_combout\,
	combout => \disp|Equal8~2_combout\);

-- Location: LCCOMB_X23_Y16_N2
\disp|Add5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add5~2_combout\ = (\disp|linecounter\(1) & (!\disp|Add5~1\)) # (!\disp|linecounter\(1) & ((\disp|Add5~1\) # (GND)))
-- \disp|Add5~3\ = CARRY((!\disp|Add5~1\) # (!\disp|linecounter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \disp|linecounter\(1),
	datad => VCC,
	cin => \disp|Add5~1\,
	combout => \disp|Add5~2_combout\,
	cout => \disp|Add5~3\);

-- Location: LCCOMB_X22_Y16_N26
\disp|linecounter[1]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|linecounter[1]~12_combout\ = (!\disp|Equal8~2_combout\ & ((\disp|linecounter[7]~3_combout\ & (\disp|linecounter\(1))) # (!\disp|linecounter[7]~3_combout\ & ((\disp|Add5~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter[7]~3_combout\,
	datab => \disp|Equal8~2_combout\,
	datac => \disp|linecounter\(1),
	datad => \disp|Add5~2_combout\,
	combout => \disp|linecounter[1]~12_combout\);

-- Location: LCFF_X22_Y16_N27
\disp|linecounter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|linecounter[1]~12_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|linecounter\(1));

-- Location: LCCOMB_X23_Y16_N4
\disp|Add5~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add5~4_combout\ = (\disp|linecounter\(2) & (\disp|Add5~3\ $ (GND))) # (!\disp|linecounter\(2) & (!\disp|Add5~3\ & VCC))
-- \disp|Add5~5\ = CARRY((\disp|linecounter\(2) & !\disp|Add5~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(2),
	datad => VCC,
	cin => \disp|Add5~3\,
	combout => \disp|Add5~4_combout\,
	cout => \disp|Add5~5\);

-- Location: LCCOMB_X23_Y16_N6
\disp|Add5~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add5~6_combout\ = (\disp|linecounter\(3) & (!\disp|Add5~5\)) # (!\disp|linecounter\(3) & ((\disp|Add5~5\) # (GND)))
-- \disp|Add5~7\ = CARRY((!\disp|Add5~5\) # (!\disp|linecounter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(3),
	datad => VCC,
	cin => \disp|Add5~5\,
	combout => \disp|Add5~6_combout\,
	cout => \disp|Add5~7\);

-- Location: LCCOMB_X23_Y16_N8
\disp|Add5~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add5~8_combout\ = (\disp|linecounter\(4) & (\disp|Add5~7\ $ (GND))) # (!\disp|linecounter\(4) & (!\disp|Add5~7\ & VCC))
-- \disp|Add5~9\ = CARRY((\disp|linecounter\(4) & !\disp|Add5~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \disp|linecounter\(4),
	datad => VCC,
	cin => \disp|Add5~7\,
	combout => \disp|Add5~8_combout\,
	cout => \disp|Add5~9\);

-- Location: LCCOMB_X22_Y16_N4
\disp|linecounter[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|linecounter[4]~4_combout\ = (!\disp|Equal8~2_combout\ & ((\disp|linecounter[7]~3_combout\ & ((\disp|linecounter\(4)))) # (!\disp|linecounter[7]~3_combout\ & (\disp|Add5~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter[7]~3_combout\,
	datab => \disp|Add5~8_combout\,
	datac => \disp|linecounter\(4),
	datad => \disp|Equal8~2_combout\,
	combout => \disp|linecounter[4]~4_combout\);

-- Location: LCFF_X22_Y16_N5
\disp|linecounter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|linecounter[4]~4_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|linecounter\(4));

-- Location: LCCOMB_X23_Y16_N10
\disp|Add5~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add5~10_combout\ = (\disp|linecounter\(5) & (!\disp|Add5~9\)) # (!\disp|linecounter\(5) & ((\disp|Add5~9\) # (GND)))
-- \disp|Add5~11\ = CARRY((!\disp|Add5~9\) # (!\disp|linecounter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \disp|linecounter\(5),
	datad => VCC,
	cin => \disp|Add5~9\,
	combout => \disp|Add5~10_combout\,
	cout => \disp|Add5~11\);

-- Location: LCCOMB_X22_Y16_N28
\disp|linecounter[5]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|linecounter[5]~6_combout\ = (!\disp|Equal8~2_combout\ & ((\disp|linecounter[7]~3_combout\ & ((\disp|linecounter\(5)))) # (!\disp|linecounter[7]~3_combout\ & (\disp|Add5~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter[7]~3_combout\,
	datab => \disp|Add5~10_combout\,
	datac => \disp|linecounter\(5),
	datad => \disp|Equal8~2_combout\,
	combout => \disp|linecounter[5]~6_combout\);

-- Location: LCFF_X22_Y16_N29
\disp|linecounter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|linecounter[5]~6_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|linecounter\(5));

-- Location: LCCOMB_X22_Y16_N6
\disp|linecounter[6]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|linecounter[6]~5_combout\ = (!\disp|Equal8~2_combout\ & ((\disp|linecounter[7]~3_combout\ & ((\disp|linecounter\(6)))) # (!\disp|linecounter[7]~3_combout\ & (\disp|Add5~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter[7]~3_combout\,
	datab => \disp|Add5~12_combout\,
	datac => \disp|linecounter\(6),
	datad => \disp|Equal8~2_combout\,
	combout => \disp|linecounter[6]~5_combout\);

-- Location: LCFF_X22_Y16_N7
\disp|linecounter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|linecounter[6]~5_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|linecounter\(6));

-- Location: LCCOMB_X22_Y16_N10
\disp|linecounter[3]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|linecounter[3]~7_combout\ = (!\disp|Equal8~2_combout\ & ((\disp|linecounter[7]~3_combout\ & (\disp|linecounter\(3))) # (!\disp|linecounter[7]~3_combout\ & ((\disp|Add5~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter[7]~3_combout\,
	datab => \disp|Equal8~2_combout\,
	datac => \disp|linecounter\(3),
	datad => \disp|Add5~6_combout\,
	combout => \disp|linecounter[3]~7_combout\);

-- Location: LCFF_X22_Y16_N11
\disp|linecounter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|linecounter[3]~7_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|linecounter\(3));

-- Location: LCCOMB_X22_Y16_N24
\disp|vsync~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|vsync~0_combout\ = (((\disp|linecounter\(4)) # (!\disp|linecounter\(3))) # (!\disp|linecounter\(6))) # (!\disp|linecounter\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(5),
	datab => \disp|linecounter\(6),
	datac => \disp|linecounter\(4),
	datad => \disp|linecounter\(3),
	combout => \disp|vsync~0_combout\);

-- Location: LCCOMB_X22_Y16_N12
\disp|vsync~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|vsync~1_combout\ = (\disp|linecounter\(2)) # (((\disp|linecounter\(9)) # (!\disp|linecounter\(7))) # (!\disp|linecounter\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(2),
	datab => \disp|linecounter\(8),
	datac => \disp|linecounter\(9),
	datad => \disp|linecounter\(7),
	combout => \disp|vsync~1_combout\);

-- Location: LCCOMB_X20_Y16_N2
\disp|vsync~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|vsync~2_combout\ = (\disp|vsync~0_combout\) # ((\disp|vsync~1_combout\) # (!\disp|linecounter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|vsync~0_combout\,
	datab => \disp|linecounter\(1),
	datac => \disp|vsync~1_combout\,
	combout => \disp|vsync~2_combout\);

-- Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G2
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: LCCOMB_X22_Y16_N30
\disp|linecounter[2]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|linecounter[2]~9_combout\ = (!\disp|Equal8~2_combout\ & ((\disp|linecounter[7]~3_combout\ & (\disp|linecounter\(2))) # (!\disp|linecounter[7]~3_combout\ & ((\disp|Add5~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter[7]~3_combout\,
	datab => \disp|Equal8~2_combout\,
	datac => \disp|linecounter\(2),
	datad => \disp|Add5~4_combout\,
	combout => \disp|linecounter[2]~9_combout\);

-- Location: LCFF_X22_Y16_N31
\disp|linecounter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|linecounter[2]~9_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|linecounter\(2));

-- Location: LCCOMB_X22_Y16_N0
\disp|characters~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|characters~5_combout\ = (!\disp|linecounter\(3) & (((!\disp|linecounter\(0) & !\disp|linecounter\(1))) # (!\disp|linecounter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(3),
	datab => \disp|linecounter\(2),
	datac => \disp|linecounter\(0),
	datad => \disp|linecounter\(1),
	combout => \disp|characters~5_combout\);

-- Location: LCCOMB_X22_Y16_N18
\disp|characters~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|characters~6_combout\ = (\disp|linecounter\(6) & (\disp|linecounter\(5) & ((\disp|linecounter\(4)) # (!\disp|characters~5_combout\)))) # (!\disp|linecounter\(6) & ((\disp|linecounter\(5)) # ((\disp|linecounter\(4) & !\disp|characters~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(6),
	datab => \disp|linecounter\(5),
	datac => \disp|linecounter\(4),
	datad => \disp|characters~5_combout\,
	combout => \disp|characters~6_combout\);

-- Location: LCCOMB_X22_Y15_N24
\disp|Equal4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Equal4~2_combout\ = (!\disp|pixelcounter\(9) & (!\disp|pixelcounter\(3) & (\disp|pixelcounter\(6) & \disp|pixelcounter\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|pixelcounter\(9),
	datab => \disp|pixelcounter\(3),
	datac => \disp|pixelcounter\(6),
	datad => \disp|pixelcounter\(8),
	combout => \disp|Equal4~2_combout\);

-- Location: LCCOMB_X22_Y15_N26
\disp|characters~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|characters~0_combout\ = (\disp|pixelcounter\(9) & (\disp|pixelcounter\(3) & (!\disp|pixelcounter\(6) & !\disp|pixelcounter\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|pixelcounter\(9),
	datab => \disp|pixelcounter\(3),
	datac => \disp|pixelcounter\(6),
	datad => \disp|pixelcounter\(8),
	combout => \disp|characters~0_combout\);

-- Location: LCCOMB_X22_Y15_N22
\disp|characters~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|characters~1_combout\ = (!\disp|pixelcounter\(4) & (!\disp|pixelcounter\(5) & ((\disp|Equal4~2_combout\) # (\disp|characters~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|pixelcounter\(4),
	datab => \disp|pixelcounter\(5),
	datac => \disp|Equal4~2_combout\,
	datad => \disp|characters~0_combout\,
	combout => \disp|characters~1_combout\);

-- Location: LCCOMB_X23_Y15_N6
\disp|characters~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|characters~2_combout\ = (!\disp|linecounter\(9) & (!\disp|pixelcounter\(2) & (!\disp|pixelcounter\(1) & !\disp|pixelcounter\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(9),
	datab => \disp|pixelcounter\(2),
	datac => \disp|pixelcounter\(1),
	datad => \disp|pixelcounter\(7),
	combout => \disp|characters~2_combout\);

-- Location: LCCOMB_X23_Y15_N4
\disp|characters~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|characters~3_combout\ = (!\disp|pixelcounter\(0) & (!\disp|linecounter\(8) & \disp|characters~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|pixelcounter\(0),
	datac => \disp|linecounter\(8),
	datad => \disp|characters~2_combout\,
	combout => \disp|characters~3_combout\);

-- Location: LCCOMB_X22_Y15_N28
\disp|Equal3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Equal3~0_combout\ = (!\disp|pixelcounter\(9) & (!\disp|pixelcounter\(8) & (\disp|pixelcounter\(3) & \disp|hsync~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|pixelcounter\(9),
	datab => \disp|pixelcounter\(8),
	datac => \disp|pixelcounter\(3),
	datad => \disp|hsync~1_combout\,
	combout => \disp|Equal3~0_combout\);

-- Location: LCCOMB_X23_Y15_N18
\disp|characters~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|characters~4_combout\ = (\disp|characters~3_combout\ & ((\disp|characters~1_combout\) # (\disp|Equal3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|characters~1_combout\,
	datac => \disp|characters~3_combout\,
	datad => \disp|Equal3~0_combout\,
	combout => \disp|characters~4_combout\);

-- Location: LCCOMB_X23_Y15_N28
\disp|characters~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|characters~7_combout\ = (\disp|characters~4_combout\ & ((\disp|linecounter\(6) & (!\disp|linecounter\(7) & \disp|characters~6_combout\)) # (!\disp|linecounter\(6) & (\disp|linecounter\(7) & !\disp|characters~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(6),
	datab => \disp|linecounter\(7),
	datac => \disp|characters~6_combout\,
	datad => \disp|characters~4_combout\,
	combout => \disp|characters~7_combout\);

-- Location: LCCOMB_X20_Y14_N6
\disp|reg_counter[0]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|reg_counter[0]~6_combout\ = !\disp|reg_counter\(0)
-- \disp|reg_counter[0]~7\ = CARRY(!\disp|reg_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(0),
	combout => \disp|reg_counter[0]~6_combout\,
	cout => \disp|reg_counter[0]~7\);

-- Location: LCCOMB_X20_Y14_N8
\disp|reg_counter[1]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|reg_counter[1]~9_combout\ = (\disp|reg_counter\(1) & (\disp|reg_counter[0]~7\ $ (GND))) # (!\disp|reg_counter\(1) & (!\disp|reg_counter[0]~7\ & VCC))
-- \disp|reg_counter[1]~10\ = CARRY((\disp|reg_counter\(1) & !\disp|reg_counter[0]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \disp|reg_counter\(1),
	datad => VCC,
	cin => \disp|reg_counter[0]~7\,
	combout => \disp|reg_counter[1]~9_combout\,
	cout => \disp|reg_counter[1]~10\);

-- Location: LCCOMB_X23_Y15_N20
\disp|state.print~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|state.print~feeder_combout\ = \disp|state.fetch~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \disp|state.fetch~regout\,
	combout => \disp|state.print~feeder_combout\);

-- Location: LCFF_X23_Y15_N21
\disp|state.print\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|state.print~feeder_combout\,
	aclr => \ALT_INV_rst~combout\,
	ena => \disp|state~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|state.print~regout\);

-- Location: LCCOMB_X21_Y15_N16
\disp|reg_counter[5]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|reg_counter[5]~8_combout\ = (!\disp|state.send_add~regout\ & \disp|a~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \disp|state.send_add~regout\,
	datad => \disp|a~regout\,
	combout => \disp|reg_counter[5]~8_combout\);

-- Location: LCFF_X20_Y14_N7
\disp|reg_counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|reg_counter[0]~6_combout\,
	sdata => \disp|state.fetch~regout\,
	aclr => \ALT_INV_rst~combout\,
	sload => \disp|ALT_INV_state.print~regout\,
	ena => \disp|reg_counter[5]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg_counter\(0));

-- Location: LCCOMB_X20_Y14_N12
\disp|reg_counter[3]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|reg_counter[3]~13_combout\ = (\disp|reg_counter\(3) & (\disp|reg_counter[2]~12\ $ (GND))) # (!\disp|reg_counter\(3) & (!\disp|reg_counter[2]~12\ & VCC))
-- \disp|reg_counter[3]~14\ = CARRY((\disp|reg_counter\(3) & !\disp|reg_counter[2]~12\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(3),
	datad => VCC,
	cin => \disp|reg_counter[2]~12\,
	combout => \disp|reg_counter[3]~13_combout\,
	cout => \disp|reg_counter[3]~14\);

-- Location: LCFF_X20_Y14_N13
\disp|reg_counter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|reg_counter[3]~13_combout\,
	sdata => \disp|state.fetch~regout\,
	aclr => \ALT_INV_rst~combout\,
	sload => \disp|ALT_INV_state.print~regout\,
	ena => \disp|reg_counter[5]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg_counter\(3));

-- Location: LCCOMB_X20_Y14_N10
\disp|reg_counter[2]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|reg_counter[2]~11_combout\ = (\disp|reg_counter\(2) & (!\disp|reg_counter[1]~10\)) # (!\disp|reg_counter\(2) & ((\disp|reg_counter[1]~10\) # (GND)))
-- \disp|reg_counter[2]~12\ = CARRY((!\disp|reg_counter[1]~10\) # (!\disp|reg_counter\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(2),
	datad => VCC,
	cin => \disp|reg_counter[1]~10\,
	combout => \disp|reg_counter[2]~11_combout\,
	cout => \disp|reg_counter[2]~12\);

-- Location: LCFF_X20_Y14_N11
\disp|reg_counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|reg_counter[2]~11_combout\,
	sdata => \disp|state.fetch~regout\,
	aclr => \ALT_INV_rst~combout\,
	sload => \disp|ALT_INV_state.print~regout\,
	ena => \disp|reg_counter[5]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg_counter\(2));

-- Location: LCCOMB_X21_Y14_N18
\disp|Equal6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Equal6~0_combout\ = (\disp|reg_counter\(1) & (\disp|reg_counter\(0) & (\disp|reg_counter\(3) & \disp|reg_counter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(1),
	datab => \disp|reg_counter\(0),
	datac => \disp|reg_counter\(3),
	datad => \disp|reg_counter\(2),
	combout => \disp|Equal6~0_combout\);

-- Location: LCCOMB_X22_Y14_N22
\disp|Selector7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Selector7~0_combout\ = (\disp|state.print~regout\ & (((!\disp|Equal6~0_combout\) # (!\disp|reg_counter\(4))) # (!\disp|reg_counter\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|state.print~regout\,
	datab => \disp|reg_counter\(5),
	datac => \disp|reg_counter\(4),
	datad => \disp|Equal6~0_combout\,
	combout => \disp|Selector7~0_combout\);

-- Location: LCCOMB_X23_Y15_N24
\disp|state~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|state~12_combout\ = (\disp|Selector7~0_combout\) # (!\disp|a~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \disp|a~regout\,
	datad => \disp|Selector7~0_combout\,
	combout => \disp|state~12_combout\);

-- Location: LCCOMB_X23_Y15_N26
\disp|state~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|state~13_combout\ = (!\disp|state~12_combout\ & ((\disp|state.print~regout\) # ((\disp|state.idle~regout\) # (\disp|characters~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|state.print~regout\,
	datab => \disp|state.idle~regout\,
	datac => \disp|state~12_combout\,
	datad => \disp|characters~7_combout\,
	combout => \disp|state~13_combout\);

-- Location: LCFF_X23_Y15_N23
\disp|state.fetch\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \disp|state.send_add~regout\,
	aclr => \ALT_INV_rst~combout\,
	sload => VCC,
	ena => \disp|state~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|state.fetch~regout\);

-- Location: LCFF_X20_Y14_N9
\disp|reg_counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|reg_counter[1]~9_combout\,
	sdata => \disp|state.fetch~regout\,
	aclr => \ALT_INV_rst~combout\,
	sload => \disp|ALT_INV_state.print~regout\,
	ena => \disp|reg_counter[5]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg_counter\(1));

-- Location: LCCOMB_X20_Y14_N14
\disp|reg_counter[4]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|reg_counter[4]~15_combout\ = (\disp|reg_counter\(4) & (!\disp|reg_counter[3]~14\)) # (!\disp|reg_counter\(4) & ((\disp|reg_counter[3]~14\) # (GND)))
-- \disp|reg_counter[4]~16\ = CARRY((!\disp|reg_counter[3]~14\) # (!\disp|reg_counter\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \disp|reg_counter\(4),
	datad => VCC,
	cin => \disp|reg_counter[3]~14\,
	combout => \disp|reg_counter[4]~15_combout\,
	cout => \disp|reg_counter[4]~16\);

-- Location: LCFF_X20_Y14_N15
\disp|reg_counter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|reg_counter[4]~15_combout\,
	sdata => \disp|state.fetch~regout\,
	aclr => \ALT_INV_rst~combout\,
	sload => \disp|ALT_INV_state.print~regout\,
	ena => \disp|reg_counter[5]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg_counter\(4));

-- Location: LCCOMB_X20_Y14_N16
\disp|reg_counter[5]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|reg_counter[5]~17_combout\ = \disp|reg_counter\(5) $ (!\disp|reg_counter[4]~16\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(5),
	cin => \disp|reg_counter[4]~16\,
	combout => \disp|reg_counter[5]~17_combout\);

-- Location: LCFF_X20_Y14_N17
\disp|reg_counter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|reg_counter[5]~17_combout\,
	sdata => \disp|state.fetch~regout\,
	aclr => \ALT_INV_rst~combout\,
	sload => \disp|ALT_INV_state.print~regout\,
	ena => \disp|reg_counter[5]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg_counter\(5));

-- Location: LCCOMB_X22_Y14_N2
\disp|Selector14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Selector14~0_combout\ = (\disp|state.print~regout\ & (\disp|reg_counter\(5) & (\disp|reg_counter\(4) & \disp|Equal6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|state.print~regout\,
	datab => \disp|reg_counter\(5),
	datac => \disp|reg_counter\(4),
	datad => \disp|Equal6~0_combout\,
	combout => \disp|Selector14~0_combout\);

-- Location: LCCOMB_X23_Y15_N2
\disp|Selector14~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Selector14~1_combout\ = (!\disp|Selector14~0_combout\ & ((\disp|characters~7_combout\) # (\disp|state.idle~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|characters~7_combout\,
	datac => \disp|state.idle~regout\,
	datad => \disp|Selector14~0_combout\,
	combout => \disp|Selector14~1_combout\);

-- Location: LCFF_X23_Y15_N3
\disp|state.idle\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|Selector14~1_combout\,
	aclr => \ALT_INV_rst~combout\,
	ena => \disp|a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|state.idle~regout\);

-- Location: LCCOMB_X23_Y15_N8
\disp|Selector15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Selector15~0_combout\ = (!\disp|state.idle~regout\ & \disp|characters~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|state.idle~regout\,
	datad => \disp|characters~7_combout\,
	combout => \disp|Selector15~0_combout\);

-- Location: LCFF_X23_Y15_N9
\disp|state.send_add\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|Selector15~0_combout\,
	aclr => \ALT_INV_rst~combout\,
	ena => \disp|a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|state.send_add~regout\);

-- Location: LCCOMB_X20_Y15_N24
\disp|Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Selector3~0_combout\ = (\disp|red\(0) & ((\disp|state.send_add~regout\) # (\disp|state.fetch~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|state.send_add~regout\,
	datac => \disp|red\(0),
	datad => \disp|state.fetch~regout\,
	combout => \disp|Selector3~0_combout\);

-- Location: LCCOMB_X21_Y16_N4
\disp|Add1~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add1~7_combout\ = (\disp|linecounter\(5) & (\disp|linecounter\(6) & ((\disp|Add1~0_combout\) # (\disp|linecounter\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|Add1~0_combout\,
	datab => \disp|linecounter\(5),
	datac => \disp|linecounter\(4),
	datad => \disp|linecounter\(6),
	combout => \disp|Add1~7_combout\);

-- Location: LCCOMB_X21_Y16_N0
\disp|Add1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add1~5_combout\ = (\disp|linecounter\(5) & ((\disp|linecounter\(4)) # ((\disp|linecounter\(2)) # (\disp|linecounter\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(4),
	datab => \disp|linecounter\(2),
	datac => \disp|linecounter\(3),
	datad => \disp|linecounter\(5),
	combout => \disp|Add1~5_combout\);

-- Location: LCCOMB_X21_Y16_N10
\disp|Add1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add1~3_combout\ = (\disp|linecounter\(2)) # ((\disp|linecounter\(3)) # (\disp|linecounter\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|linecounter\(2),
	datac => \disp|linecounter\(3),
	datad => \disp|linecounter\(4),
	combout => \disp|Add1~3_combout\);

-- Location: LCCOMB_X21_Y16_N12
\disp|Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add1~0_combout\ = (\disp|linecounter\(3)) # (\disp|linecounter\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \disp|linecounter\(3),
	datad => \disp|linecounter\(2),
	combout => \disp|Add1~0_combout\);

-- Location: LCCOMB_X20_Y16_N14
\disp|Add2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add2~0_combout\ = \disp|linecounter\(0) $ (VCC)
-- \disp|Add2~1\ = CARRY(\disp|linecounter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|linecounter\(0),
	datad => VCC,
	combout => \disp|Add2~0_combout\,
	cout => \disp|Add2~1\);

-- Location: LCCOMB_X20_Y16_N16
\disp|Add2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add2~2_combout\ = (\disp|linecounter\(1) & (\disp|Add2~1\ & VCC)) # (!\disp|linecounter\(1) & (!\disp|Add2~1\))
-- \disp|Add2~3\ = CARRY((!\disp|linecounter\(1) & !\disp|Add2~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \disp|linecounter\(1),
	datad => VCC,
	cin => \disp|Add2~1\,
	combout => \disp|Add2~2_combout\,
	cout => \disp|Add2~3\);

-- Location: LCCOMB_X20_Y16_N18
\disp|Add2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add2~4_combout\ = (\disp|linecounter\(2) & (\disp|Add2~3\ $ (GND))) # (!\disp|linecounter\(2) & ((GND) # (!\disp|Add2~3\)))
-- \disp|Add2~5\ = CARRY((!\disp|Add2~3\) # (!\disp|linecounter\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \disp|linecounter\(2),
	datad => VCC,
	cin => \disp|Add2~3\,
	combout => \disp|Add2~4_combout\,
	cout => \disp|Add2~5\);

-- Location: LCCOMB_X20_Y16_N20
\disp|Add2~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add2~6_combout\ = (\disp|Add2~5\ & ((\disp|linecounter\(3) $ (!\disp|linecounter\(2))))) # (!\disp|Add2~5\ & (\disp|linecounter\(3) $ ((\disp|linecounter\(2)))))
-- \disp|Add2~7\ = CARRY((!\disp|Add2~5\ & (\disp|linecounter\(3) $ (\disp|linecounter\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000000110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(3),
	datab => \disp|linecounter\(2),
	datad => VCC,
	cin => \disp|Add2~5\,
	combout => \disp|Add2~6_combout\,
	cout => \disp|Add2~7\);

-- Location: LCCOMB_X20_Y16_N28
\disp|Add2~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add2~14_combout\ = \disp|linecounter\(7) $ (\disp|Add2~13\ $ (!\disp|Add1~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \disp|linecounter\(7),
	datad => \disp|Add1~7_combout\,
	cin => \disp|Add2~13\,
	combout => \disp|Add2~14_combout\);

-- Location: LCCOMB_X21_Y16_N16
\disp|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add0~0_combout\ = \disp|linecounter\(0) $ (VCC)
-- \disp|Add0~1\ = CARRY(\disp|linecounter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|linecounter\(0),
	datad => VCC,
	combout => \disp|Add0~0_combout\,
	cout => \disp|Add0~1\);

-- Location: LCCOMB_X21_Y16_N18
\disp|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add0~2_combout\ = (\disp|linecounter\(1) & (\disp|Add0~1\ & VCC)) # (!\disp|linecounter\(1) & (!\disp|Add0~1\))
-- \disp|Add0~3\ = CARRY((!\disp|linecounter\(1) & !\disp|Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(1),
	datad => VCC,
	cin => \disp|Add0~1\,
	combout => \disp|Add0~2_combout\,
	cout => \disp|Add0~3\);

-- Location: LCCOMB_X21_Y16_N20
\disp|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add0~4_combout\ = (\disp|linecounter\(2) & (\disp|Add0~3\ $ (GND))) # (!\disp|linecounter\(2) & ((GND) # (!\disp|Add0~3\)))
-- \disp|Add0~5\ = CARRY((!\disp|Add0~3\) # (!\disp|linecounter\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \disp|linecounter\(2),
	datad => VCC,
	cin => \disp|Add0~3\,
	combout => \disp|Add0~4_combout\,
	cout => \disp|Add0~5\);

-- Location: LCCOMB_X21_Y16_N22
\disp|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add0~6_combout\ = (\disp|Add0~5\ & ((\disp|linecounter\(2) $ (!\disp|linecounter\(3))))) # (!\disp|Add0~5\ & (\disp|linecounter\(2) $ ((\disp|linecounter\(3)))))
-- \disp|Add0~7\ = CARRY((!\disp|Add0~5\ & (\disp|linecounter\(2) $ (\disp|linecounter\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000000110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(2),
	datab => \disp|linecounter\(3),
	datad => VCC,
	cin => \disp|Add0~5\,
	combout => \disp|Add0~6_combout\,
	cout => \disp|Add0~7\);

-- Location: LCCOMB_X21_Y16_N24
\disp|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add0~8_combout\ = (\disp|Add0~7\ & ((\disp|Add1~0_combout\ $ (!\disp|linecounter\(4))))) # (!\disp|Add0~7\ & (\disp|Add1~0_combout\ $ (\disp|linecounter\(4) $ (GND))))
-- \disp|Add0~9\ = CARRY((!\disp|Add0~7\ & (\disp|Add1~0_combout\ $ (!\disp|linecounter\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|Add1~0_combout\,
	datab => \disp|linecounter\(4),
	datad => VCC,
	cin => \disp|Add0~7\,
	combout => \disp|Add0~8_combout\,
	cout => \disp|Add0~9\);

-- Location: LCCOMB_X21_Y16_N26
\disp|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add0~10_combout\ = (\disp|Add0~9\ & ((\disp|Add1~3_combout\ $ (\disp|linecounter\(5))))) # (!\disp|Add0~9\ & (\disp|Add1~3_combout\ $ ((!\disp|linecounter\(5)))))
-- \disp|Add0~11\ = CARRY((!\disp|Add0~9\ & (\disp|Add1~3_combout\ $ (!\disp|linecounter\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|Add1~3_combout\,
	datab => \disp|linecounter\(5),
	datad => VCC,
	cin => \disp|Add0~9\,
	combout => \disp|Add0~10_combout\,
	cout => \disp|Add0~11\);

-- Location: LCCOMB_X21_Y16_N28
\disp|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add0~12_combout\ = (\disp|Add0~11\ & ((\disp|linecounter\(6) $ (\disp|Add1~5_combout\)))) # (!\disp|Add0~11\ & (\disp|linecounter\(6) $ (\disp|Add1~5_combout\ $ (VCC))))
-- \disp|Add0~13\ = CARRY((!\disp|Add0~11\ & (\disp|linecounter\(6) $ (\disp|Add1~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100000110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(6),
	datab => \disp|Add1~5_combout\,
	datad => VCC,
	cin => \disp|Add0~11\,
	combout => \disp|Add0~12_combout\,
	cout => \disp|Add0~13\);

-- Location: LCCOMB_X21_Y16_N30
\disp|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add0~14_combout\ = \disp|Add1~7_combout\ $ (\disp|Add0~13\ $ (!\disp|linecounter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \disp|Add1~7_combout\,
	datad => \disp|linecounter\(7),
	cin => \disp|Add0~13\,
	combout => \disp|Add0~14_combout\);

-- Location: LCCOMB_X21_Y15_N28
\disp|address[7]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|address[7]~0_combout\ = (\disp|Equal4~4_combout\ & ((\disp|Add0~14_combout\))) # (!\disp|Equal4~4_combout\ & (\disp|Add2~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|Equal4~4_combout\,
	datab => \disp|Add2~14_combout\,
	datad => \disp|Add0~14_combout\,
	combout => \disp|address[7]~0_combout\);

-- Location: LCCOMB_X20_Y16_N10
\disp|Add1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add1~8_combout\ = \disp|linecounter\(7) $ ((((!\disp|linecounter\(6)) # (!\disp|Add1~3_combout\)) # (!\disp|linecounter\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(5),
	datab => \disp|linecounter\(7),
	datac => \disp|Add1~3_combout\,
	datad => \disp|linecounter\(6),
	combout => \disp|Add1~8_combout\);

-- Location: LCCOMB_X22_Y15_N30
\disp|Equal3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Equal3~1_combout\ = (!\disp|pixelcounter\(2) & (!\disp|pixelcounter\(1) & (!\disp|pixelcounter\(7) & \disp|pixelcounter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|pixelcounter\(2),
	datab => \disp|pixelcounter\(1),
	datac => \disp|pixelcounter\(7),
	datad => \disp|pixelcounter\(0),
	combout => \disp|Equal3~1_combout\);

-- Location: LCCOMB_X21_Y15_N12
\disp|Equal3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Equal3~2_combout\ = (\disp|Equal3~1_combout\ & \disp|Equal3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|Equal3~1_combout\,
	datad => \disp|Equal3~0_combout\,
	combout => \disp|Equal3~2_combout\);

-- Location: LCCOMB_X21_Y15_N26
\disp|Equal4~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Equal4~3_combout\ = (!\disp|pixelcounter\(5) & !\disp|pixelcounter\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \disp|pixelcounter\(5),
	datad => \disp|pixelcounter\(4),
	combout => \disp|Equal4~3_combout\);

-- Location: LCCOMB_X21_Y15_N14
\disp|address[7]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|address[7]~8_combout\ = (\disp|Equal4~3_combout\ & (\disp|Equal3~1_combout\ & ((\disp|characters~0_combout\) # (\disp|Equal4~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|characters~0_combout\,
	datab => \disp|Equal4~3_combout\,
	datac => \disp|Equal4~2_combout\,
	datad => \disp|Equal3~1_combout\,
	combout => \disp|address[7]~8_combout\);

-- Location: LCCOMB_X21_Y15_N24
\disp|address[7]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|address[7]~9_combout\ = (\disp|state.send_add~regout\ & (\disp|a~regout\ & ((\disp|address[7]~8_combout\) # (\disp|Equal3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|state.send_add~regout\,
	datab => \disp|a~regout\,
	datac => \disp|address[7]~8_combout\,
	datad => \disp|Equal3~2_combout\,
	combout => \disp|address[7]~9_combout\);

-- Location: LCFF_X21_Y15_N29
\disp|address[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|address[7]~0_combout\,
	sdata => \disp|Add1~8_combout\,
	aclr => \ALT_INV_rst~combout\,
	sload => \disp|Equal3~2_combout\,
	ena => \disp|address[7]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|address\(7));

-- Location: LCCOMB_X21_Y15_N6
\disp|Equal4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Equal4~4_combout\ = (\disp|Equal4~2_combout\ & (\disp|Equal3~1_combout\ & (!\disp|pixelcounter\(5) & !\disp|pixelcounter\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|Equal4~2_combout\,
	datab => \disp|Equal3~1_combout\,
	datac => \disp|pixelcounter\(5),
	datad => \disp|pixelcounter\(4),
	combout => \disp|Equal4~4_combout\);

-- Location: LCCOMB_X20_Y16_N8
\disp|address[5]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|address[5]~6_combout\ = (\disp|Equal4~4_combout\ & ((\disp|Add0~10_combout\))) # (!\disp|Equal4~4_combout\ & (\disp|Add2~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|Add2~10_combout\,
	datab => \disp|Equal4~4_combout\,
	datad => \disp|Add0~10_combout\,
	combout => \disp|address[5]~6_combout\);

-- Location: LCCOMB_X20_Y16_N4
\disp|Add1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add1~4_combout\ = \disp|linecounter\(5) $ (((\disp|linecounter\(4)) # ((\disp|linecounter\(2)) # (\disp|linecounter\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(4),
	datab => \disp|linecounter\(2),
	datac => \disp|linecounter\(5),
	datad => \disp|linecounter\(3),
	combout => \disp|Add1~4_combout\);

-- Location: LCFF_X20_Y16_N9
\disp|address[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|address[5]~6_combout\,
	sdata => \disp|Add1~4_combout\,
	aclr => \ALT_INV_rst~combout\,
	sload => \disp|Equal3~2_combout\,
	ena => \disp|address[7]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|address\(5));

-- Location: LCCOMB_X20_Y15_N18
\disp|address[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|address[0]~3_combout\ = (\disp|Equal4~4_combout\ & (\disp|Add0~0_combout\)) # (!\disp|Equal4~4_combout\ & ((\disp|Add2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|Equal4~4_combout\,
	datab => \disp|Add0~0_combout\,
	datad => \disp|Add2~0_combout\,
	combout => \disp|address[0]~3_combout\);

-- Location: LCFF_X20_Y15_N19
\disp|address[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|address[0]~3_combout\,
	sdata => \disp|linecounter\(0),
	aclr => \ALT_INV_rst~combout\,
	sload => \disp|Equal3~2_combout\,
	ena => \disp|address[7]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|address\(0));

-- Location: LCCOMB_X20_Y15_N0
\disp|address[2]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|address[2]~5_combout\ = (\disp|Equal4~4_combout\ & ((\disp|Add0~4_combout\))) # (!\disp|Equal4~4_combout\ & (\disp|Add2~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|Equal4~4_combout\,
	datab => \disp|Add2~4_combout\,
	datad => \disp|Add0~4_combout\,
	combout => \disp|address[2]~5_combout\);

-- Location: LCCOMB_X20_Y16_N0
\disp|linecounter[2]~_wirecell\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|linecounter[2]~_wirecell_combout\ = !\disp|linecounter\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \disp|linecounter\(2),
	combout => \disp|linecounter[2]~_wirecell_combout\);

-- Location: LCFF_X20_Y15_N1
\disp|address[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|address[2]~5_combout\,
	sdata => \disp|linecounter[2]~_wirecell_combout\,
	aclr => \ALT_INV_rst~combout\,
	sload => \disp|Equal3~2_combout\,
	ena => \disp|address[7]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|address\(2));

-- Location: LCCOMB_X20_Y15_N26
\disp|address[1]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|address[1]~4_combout\ = (\disp|Equal4~4_combout\ & ((\disp|Add0~2_combout\))) # (!\disp|Equal4~4_combout\ & (\disp|Add2~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|Equal4~4_combout\,
	datab => \disp|Add2~2_combout\,
	datad => \disp|Add0~2_combout\,
	combout => \disp|address[1]~4_combout\);

-- Location: LCFF_X20_Y15_N27
\disp|address[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|address[1]~4_combout\,
	sdata => \disp|linecounter\(1),
	aclr => \ALT_INV_rst~combout\,
	sload => \disp|Equal3~2_combout\,
	ena => \disp|address[7]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|address\(1));

-- Location: LCCOMB_X19_Y12_N16
\mem|Mux48~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux48~2_combout\ = (!\disp|address\(3) & ((\disp|address\(2)) # ((\disp|address\(0) & \disp|address\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(3),
	datab => \disp|address\(0),
	datac => \disp|address\(2),
	datad => \disp|address\(1),
	combout => \mem|Mux48~2_combout\);

-- Location: LCCOMB_X21_Y15_N30
\disp|address[6]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|address[6]~1_combout\ = (\disp|Equal4~4_combout\ & ((\disp|Add0~12_combout\))) # (!\disp|Equal4~4_combout\ & (\disp|Add2~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|Add2~12_combout\,
	datab => \disp|Equal4~4_combout\,
	datad => \disp|Add0~12_combout\,
	combout => \disp|address[6]~1_combout\);

-- Location: LCCOMB_X21_Y16_N14
\disp|Add1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add1~6_combout\ = \disp|Add1~5_combout\ $ (\disp|linecounter\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \disp|Add1~5_combout\,
	datad => \disp|linecounter\(6),
	combout => \disp|Add1~6_combout\);

-- Location: LCFF_X21_Y15_N31
\disp|address[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|address[6]~1_combout\,
	sdata => \disp|Add1~6_combout\,
	aclr => \ALT_INV_rst~combout\,
	sload => \disp|Equal3~2_combout\,
	ena => \disp|address[7]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|address\(6));

-- Location: LCCOMB_X19_Y12_N2
\mem|Mux16~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux16~3_combout\ = (\disp|address\(5) & ((\disp|address\(4) & ((!\disp|address\(6)))) # (!\disp|address\(4) & (\mem|Mux48~2_combout\ & \disp|address\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datab => \disp|address\(5),
	datac => \mem|Mux48~2_combout\,
	datad => \disp|address\(6),
	combout => \mem|Mux16~3_combout\);

-- Location: LCCOMB_X20_Y15_N12
\disp|address[3]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|address[3]~2_combout\ = (\disp|Equal4~4_combout\ & ((\disp|Add0~6_combout\))) # (!\disp|Equal4~4_combout\ & (\disp|Add2~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|Equal4~4_combout\,
	datab => \disp|Add2~6_combout\,
	datad => \disp|Add0~6_combout\,
	combout => \disp|address[3]~2_combout\);

-- Location: LCCOMB_X20_Y16_N6
\disp|Add1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add1~2_combout\ = \disp|linecounter\(3) $ (!\disp|linecounter\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(3),
	datad => \disp|linecounter\(2),
	combout => \disp|Add1~2_combout\);

-- Location: LCFF_X20_Y15_N13
\disp|address[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|address[3]~2_combout\,
	sdata => \disp|Add1~2_combout\,
	aclr => \ALT_INV_rst~combout\,
	sload => \disp|Equal3~2_combout\,
	ena => \disp|address[7]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|address\(3));

-- Location: LCCOMB_X21_Y14_N22
\mem|Mux16~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux16~0_combout\ = (\disp|address\(6)) # ((!\disp|address\(2) & (\disp|address\(4) $ (!\disp|address\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datab => \disp|address\(2),
	datac => \disp|address\(6),
	datad => \disp|address\(3),
	combout => \mem|Mux16~0_combout\);

-- Location: LCCOMB_X21_Y15_N8
\disp|address[4]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|address[4]~7_combout\ = (\disp|Equal4~4_combout\ & ((\disp|Add0~8_combout\))) # (!\disp|Equal4~4_combout\ & (\disp|Add2~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|Add2~8_combout\,
	datab => \disp|Add0~8_combout\,
	datad => \disp|Equal4~4_combout\,
	combout => \disp|address[4]~7_combout\);

-- Location: LCCOMB_X20_Y16_N12
\disp|Add1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Add1~1_combout\ = \disp|linecounter\(4) $ (((!\disp|linecounter\(2) & !\disp|linecounter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|linecounter\(4),
	datab => \disp|linecounter\(2),
	datad => \disp|linecounter\(3),
	combout => \disp|Add1~1_combout\);

-- Location: LCFF_X21_Y15_N9
\disp|address[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|address[4]~7_combout\,
	sdata => \disp|Add1~1_combout\,
	aclr => \ALT_INV_rst~combout\,
	sload => \disp|Equal3~2_combout\,
	ena => \disp|address[7]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|address\(4));

-- Location: LCCOMB_X21_Y14_N28
\mem|Mux16~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux16~1_combout\ = (\disp|address\(1) & (\disp|address\(2) & (\disp|address\(0) & !\disp|address\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(1),
	datab => \disp|address\(2),
	datac => \disp|address\(0),
	datad => \disp|address\(3),
	combout => \mem|Mux16~1_combout\);

-- Location: LCCOMB_X19_Y14_N26
\mem|Mux16~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux16~2_combout\ = (!\disp|address\(5) & ((\mem|Mux16~0_combout\) # ((\disp|address\(4) & \mem|Mux16~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \mem|Mux16~0_combout\,
	datac => \disp|address\(4),
	datad => \mem|Mux16~1_combout\,
	combout => \mem|Mux16~2_combout\);

-- Location: LCCOMB_X19_Y14_N6
\mem|Mux16~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux16~4_combout\ = (!\disp|address\(7) & ((\mem|Mux16~3_combout\) # (\mem|Mux16~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(7),
	datac => \mem|Mux16~3_combout\,
	datad => \mem|Mux16~2_combout\,
	combout => \mem|Mux16~4_combout\);

-- Location: LCCOMB_X23_Y15_N16
\disp|reg[52]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|reg[52]~2_combout\ = (\rst~combout\ & (\disp|a~regout\ & \disp|state.fetch~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datac => \disp|a~regout\,
	datad => \disp|state.fetch~regout\,
	combout => \disp|reg[52]~2_combout\);

-- Location: LCFF_X19_Y14_N7
\disp|reg[47]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux16~4_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(47));

-- Location: LCCOMB_X19_Y15_N26
\mem|Mux24~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux24~0_combout\ = (!\disp|address\(2) & !\disp|address\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(2),
	datac => \disp|address\(3),
	combout => \mem|Mux24~0_combout\);

-- Location: LCCOMB_X19_Y13_N0
\mem|Mux20~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux20~1_combout\ = (\disp|address\(1) & ((\disp|address\(3) $ (\disp|address\(2))))) # (!\disp|address\(1) & (\disp|address\(3) & ((!\disp|address\(2)) # (!\disp|address\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(1),
	datab => \disp|address\(0),
	datac => \disp|address\(3),
	datad => \disp|address\(2),
	combout => \mem|Mux20~1_combout\);

-- Location: LCCOMB_X19_Y13_N22
\mem|Mux20~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux20~2_combout\ = (\disp|address\(5) & (\disp|address\(4))) # (!\disp|address\(5) & ((\disp|address\(4) & ((\mem|Mux20~1_combout\))) # (!\disp|address\(4) & (\mem|Mux24~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \disp|address\(4),
	datac => \mem|Mux24~0_combout\,
	datad => \mem|Mux20~1_combout\,
	combout => \mem|Mux20~2_combout\);

-- Location: LCCOMB_X21_Y14_N26
\mem|Mux19~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux19~2_combout\ = (!\disp|address\(7) & ((\mem|Mux19~1_combout\) # ((!\disp|address\(6) & \mem|Mux20~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux19~1_combout\,
	datab => \disp|address\(7),
	datac => \disp|address\(6),
	datad => \mem|Mux20~2_combout\,
	combout => \mem|Mux19~2_combout\);

-- Location: LCFF_X21_Y14_N27
\disp|reg[44]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux19~2_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(44));

-- Location: LCCOMB_X19_Y15_N30
\mem|Mux45~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux45~1_combout\ = (\disp|address\(3)) # ((\disp|address\(2) & ((\disp|address\(1)) # (\disp|address\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(1),
	datab => \disp|address\(2),
	datac => \disp|address\(3),
	datad => \disp|address\(0),
	combout => \mem|Mux45~1_combout\);

-- Location: LCCOMB_X19_Y15_N20
\mem|Mux18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux18~0_combout\ = ((\disp|address\(4) & (!\mem|Mux45~0_combout\)) # (!\disp|address\(4) & ((\mem|Mux45~1_combout\)))) # (!\disp|address\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux45~0_combout\,
	datab => \mem|Mux45~1_combout\,
	datac => \disp|address\(4),
	datad => \disp|address\(5),
	combout => \mem|Mux18~0_combout\);

-- Location: LCCOMB_X19_Y14_N16
\mem|Mux18~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux18~1_combout\ = (!\disp|address\(7) & ((\disp|address\(6) & (\mem|Mux18~0_combout\)) # (!\disp|address\(6) & ((\mem|Mux20~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(6),
	datab => \disp|address\(7),
	datac => \mem|Mux18~0_combout\,
	datad => \mem|Mux20~2_combout\,
	combout => \mem|Mux18~1_combout\);

-- Location: LCFF_X19_Y14_N17
\disp|reg[45]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux18~1_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(45));

-- Location: LCCOMB_X20_Y14_N0
\disp|Mux0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~7_combout\ = (\disp|reg_counter\(0) & (\disp|reg_counter\(1) & (\disp|reg\(44)))) # (!\disp|reg_counter\(0) & (((\disp|reg\(45))) # (!\disp|reg_counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(0),
	datab => \disp|reg_counter\(1),
	datac => \disp|reg\(44),
	datad => \disp|reg\(45),
	combout => \disp|Mux0~7_combout\);

-- Location: LCCOMB_X20_Y14_N26
\disp|Mux0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~8_combout\ = (\disp|reg_counter\(1) & (((\disp|Mux0~7_combout\)))) # (!\disp|reg_counter\(1) & ((\disp|Mux0~7_combout\ & ((\disp|reg\(47)))) # (!\disp|Mux0~7_combout\ & (\disp|reg\(46)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg\(46),
	datab => \disp|reg_counter\(1),
	datac => \disp|reg\(47),
	datad => \disp|Mux0~7_combout\,
	combout => \disp|Mux0~8_combout\);

-- Location: LCCOMB_X18_Y14_N24
\mem|Mux25~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux25~5_combout\ = (\disp|address\(2)) # ((\disp|address\(3)) # ((\disp|address\(1) & \disp|address\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(2),
	datab => \disp|address\(3),
	datac => \disp|address\(1),
	datad => \disp|address\(5),
	combout => \mem|Mux25~5_combout\);

-- Location: LCCOMB_X19_Y15_N12
\mem|Mux45~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux45~0_combout\ = (\disp|address\(3)) # ((\disp|address\(2) & \disp|address\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(2),
	datac => \disp|address\(1),
	datad => \disp|address\(3),
	combout => \mem|Mux45~0_combout\);

-- Location: LCCOMB_X19_Y14_N18
\mem|Mux28~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux28~2_combout\ = ((!\disp|address\(1) & !\disp|address\(2))) # (!\disp|address\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(1),
	datac => \disp|address\(2),
	datad => \disp|address\(3),
	combout => \mem|Mux28~2_combout\);

-- Location: LCCOMB_X19_Y14_N8
\mem|Mux25~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux25~2_combout\ = (\disp|address\(5) & (((\disp|address\(6))))) # (!\disp|address\(5) & ((\disp|address\(6) & ((!\mem|Mux28~2_combout\))) # (!\disp|address\(6) & (!\mem|Mux24~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux24~0_combout\,
	datab => \mem|Mux28~2_combout\,
	datac => \disp|address\(5),
	datad => \disp|address\(6),
	combout => \mem|Mux25~2_combout\);

-- Location: LCCOMB_X19_Y14_N14
\mem|Mux25~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux25~3_combout\ = (\disp|address\(2) & (\disp|address\(0) & (\disp|address\(1) & !\disp|address\(3)))) # (!\disp|address\(2) & (((\disp|address\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(0),
	datab => \disp|address\(1),
	datac => \disp|address\(2),
	datad => \disp|address\(3),
	combout => \mem|Mux25~3_combout\);

-- Location: LCCOMB_X19_Y14_N28
\mem|Mux25~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux25~4_combout\ = (\disp|address\(5) & ((\mem|Mux25~2_combout\ & ((\mem|Mux25~3_combout\))) # (!\mem|Mux25~2_combout\ & (!\mem|Mux45~0_combout\)))) # (!\disp|address\(5) & (((\mem|Mux25~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001001010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \mem|Mux45~0_combout\,
	datac => \mem|Mux25~2_combout\,
	datad => \mem|Mux25~3_combout\,
	combout => \mem|Mux25~4_combout\);

-- Location: LCCOMB_X19_Y14_N4
\mem|Mux25~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux25~6_combout\ = (\disp|address\(4) & (((\mem|Mux25~4_combout\)))) # (!\disp|address\(4) & (!\disp|address\(6) & (!\mem|Mux25~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(6),
	datab => \mem|Mux25~5_combout\,
	datac => \disp|address\(4),
	datad => \mem|Mux25~4_combout\,
	combout => \mem|Mux25~6_combout\);

-- Location: LCFF_X19_Y14_N5
\disp|reg[38]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux25~6_combout\,
	sclr => \disp|address\(7),
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(38));

-- Location: LCCOMB_X19_Y14_N12
\disp|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~0_combout\ = (!\disp|reg_counter\(1) & ((\disp|reg_counter\(0) & ((\disp|reg\(38)))) # (!\disp|reg_counter\(0) & (\disp|reg\(39)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg\(39),
	datab => \disp|reg\(38),
	datac => \disp|reg_counter\(1),
	datad => \disp|reg_counter\(0),
	combout => \disp|Mux0~0_combout\);

-- Location: LCCOMB_X19_Y14_N30
\disp|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~1_combout\ = (\disp|Mux0~0_combout\) # ((\disp|reg\(35) & \disp|reg_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg\(35),
	datac => \disp|reg_counter\(1),
	datad => \disp|Mux0~0_combout\,
	combout => \disp|Mux0~1_combout\);

-- Location: LCCOMB_X21_Y13_N2
\mem|Mux37~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux37~0_combout\ = (\disp|address\(2) & (((!\disp|address\(5))))) # (!\disp|address\(2) & ((\disp|address\(1)) # ((\disp|address\(0) & \disp|address\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(0),
	datab => \disp|address\(2),
	datac => \disp|address\(1),
	datad => \disp|address\(5),
	combout => \mem|Mux37~0_combout\);

-- Location: LCCOMB_X21_Y13_N24
\mem|Mux30~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux30~2_combout\ = (\disp|address\(3) & (\disp|address\(4) & (\disp|address\(6) & \mem|Mux37~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(3),
	datab => \disp|address\(4),
	datac => \disp|address\(6),
	datad => \mem|Mux37~0_combout\,
	combout => \mem|Mux30~2_combout\);

-- Location: LCCOMB_X20_Y15_N20
\mem|Mux30~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux30~3_combout\ = (\disp|address\(0) & (((!\disp|address\(1)) # (!\disp|address\(4))) # (!\disp|address\(2)))) # (!\disp|address\(0) & ((\disp|address\(2)) # ((\disp|address\(4)) # (\disp|address\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(0),
	datab => \disp|address\(2),
	datac => \disp|address\(4),
	datad => \disp|address\(1),
	combout => \mem|Mux30~3_combout\);

-- Location: LCCOMB_X20_Y15_N14
\mem|Mux30~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux30~4_combout\ = (\disp|address\(3) & (((\disp|address\(2))) # (!\disp|address\(4)))) # (!\disp|address\(3) & (((\mem|Mux30~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(3),
	datab => \disp|address\(4),
	datac => \mem|Mux30~3_combout\,
	datad => \disp|address\(2),
	combout => \mem|Mux30~4_combout\);

-- Location: LCCOMB_X20_Y15_N28
\mem|Mux32~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux32~1_combout\ = (\disp|address\(2) & (((\disp|address\(1)) # (!\disp|address\(4))))) # (!\disp|address\(2) & (\disp|address\(0) & (!\disp|address\(4) & \disp|address\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(0),
	datab => \disp|address\(2),
	datac => \disp|address\(4),
	datad => \disp|address\(1),
	combout => \mem|Mux32~1_combout\);

-- Location: LCCOMB_X20_Y15_N8
\mem|Mux30~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux30~6_combout\ = (\disp|address\(5) & (!\disp|address\(3) & ((!\mem|Mux32~1_combout\)))) # (!\disp|address\(5) & (((\mem|Mux30~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000001110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(3),
	datab => \disp|address\(5),
	datac => \mem|Mux30~4_combout\,
	datad => \mem|Mux32~1_combout\,
	combout => \mem|Mux30~6_combout\);

-- Location: LCCOMB_X21_Y14_N16
\mem|Mux30~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux30~5_combout\ = (!\disp|address\(7) & ((\mem|Mux30~2_combout\) # ((!\disp|address\(6) & \mem|Mux30~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(6),
	datab => \mem|Mux30~2_combout\,
	datac => \mem|Mux30~6_combout\,
	datad => \disp|address\(7),
	combout => \mem|Mux30~5_combout\);

-- Location: LCFF_X21_Y14_N17
\disp|reg[33]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux30~5_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(33));

-- Location: LCCOMB_X20_Y12_N26
\mem|Mux33~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux33~0_combout\ = (\disp|address\(4) & (((!\disp|address\(1) & !\disp|address\(0))) # (!\disp|address\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(1),
	datab => \disp|address\(2),
	datac => \disp|address\(4),
	datad => \disp|address\(0),
	combout => \mem|Mux33~0_combout\);

-- Location: LCCOMB_X20_Y15_N22
\mem|Mux32~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux32~0_combout\ = (\disp|address\(2) & ((!\disp|address\(1)) # (!\disp|address\(4)))) # (!\disp|address\(2) & ((\disp|address\(4)) # (\disp|address\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(2),
	datac => \disp|address\(4),
	datad => \disp|address\(1),
	combout => \mem|Mux32~0_combout\);

-- Location: LCCOMB_X20_Y15_N6
\mem|Mux32~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux32~2_combout\ = (!\disp|address\(3) & ((\disp|address\(5) & ((!\mem|Mux32~1_combout\))) # (!\disp|address\(5) & (\mem|Mux32~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(3),
	datab => \mem|Mux32~0_combout\,
	datac => \disp|address\(5),
	datad => \mem|Mux32~1_combout\,
	combout => \mem|Mux32~2_combout\);

-- Location: LCCOMB_X21_Y14_N24
\mem|Mux32~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux32~3_combout\ = (\mem|Mux32~2_combout\) # ((!\disp|address\(5) & (\disp|address\(3) & !\mem|Mux33~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \disp|address\(3),
	datac => \mem|Mux33~0_combout\,
	datad => \mem|Mux32~2_combout\,
	combout => \mem|Mux32~3_combout\);

-- Location: LCCOMB_X20_Y14_N24
\mem|Mux32~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux32~4_combout\ = (!\disp|address\(7) & ((\mem|Mux30~2_combout\) # ((!\disp|address\(6) & \mem|Mux32~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(6),
	datab => \disp|address\(7),
	datac => \mem|Mux30~2_combout\,
	datad => \mem|Mux32~3_combout\,
	combout => \mem|Mux32~4_combout\);

-- Location: LCFF_X20_Y14_N25
\disp|reg[31]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux32~4_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(31));

-- Location: LCCOMB_X19_Y15_N28
\mem|Mux28~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux28~3_combout\ = (!\disp|address\(2) & ((\disp|address\(1) & ((!\disp|address\(5)))) # (!\disp|address\(1) & ((\disp|address\(0)) # (\disp|address\(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(1),
	datab => \disp|address\(2),
	datac => \disp|address\(0),
	datad => \disp|address\(5),
	combout => \mem|Mux28~3_combout\);

-- Location: LCCOMB_X19_Y15_N4
\mem|Mux28~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux28~9_combout\ = (!\disp|address\(6) & (!\disp|address\(3) & (!\disp|address\(4) & \mem|Mux28~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(6),
	datab => \disp|address\(3),
	datac => \disp|address\(4),
	datad => \mem|Mux28~3_combout\,
	combout => \mem|Mux28~9_combout\);

-- Location: LCCOMB_X19_Y15_N16
\mem|Mux28~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux28~6_combout\ = (!\disp|address\(2) & (\disp|address\(3) & ((\disp|address\(1)) # (\disp|address\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(1),
	datab => \disp|address\(0),
	datac => \disp|address\(2),
	datad => \disp|address\(3),
	combout => \mem|Mux28~6_combout\);

-- Location: LCCOMB_X19_Y15_N14
\mem|Mux28~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux28~4_combout\ = (\disp|address\(2) & (((\disp|address\(3)) # (!\disp|address\(0))) # (!\disp|address\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(1),
	datab => \disp|address\(2),
	datac => \disp|address\(3),
	datad => \disp|address\(0),
	combout => \mem|Mux28~4_combout\);

-- Location: LCCOMB_X19_Y14_N2
\mem|Mux28~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux28~5_combout\ = (\disp|address\(5) & (((\disp|address\(6))))) # (!\disp|address\(5) & ((\disp|address\(6) & (!\mem|Mux28~2_combout\)) # (!\disp|address\(6) & ((\mem|Mux28~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \mem|Mux28~2_combout\,
	datac => \mem|Mux28~4_combout\,
	datad => \disp|address\(6),
	combout => \mem|Mux28~5_combout\);

-- Location: LCCOMB_X19_Y14_N0
\mem|Mux28~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux28~7_combout\ = (\disp|address\(5) & ((\mem|Mux28~5_combout\ & (\mem|Mux28~6_combout\)) # (!\mem|Mux28~5_combout\ & ((!\mem|Mux45~0_combout\))))) # (!\disp|address\(5) & (((\mem|Mux28~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \mem|Mux28~6_combout\,
	datac => \mem|Mux45~0_combout\,
	datad => \mem|Mux28~5_combout\,
	combout => \mem|Mux28~7_combout\);

-- Location: LCCOMB_X19_Y14_N24
\mem|Mux28~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux28~8_combout\ = (\mem|Mux28~9_combout\) # ((\disp|address\(4) & \mem|Mux28~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datac => \mem|Mux28~9_combout\,
	datad => \mem|Mux28~7_combout\,
	combout => \mem|Mux28~8_combout\);

-- Location: LCFF_X19_Y14_N25
\disp|reg[35]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux28~8_combout\,
	sclr => \disp|address\(7),
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(35));

-- Location: LCCOMB_X20_Y14_N30
\disp|Mux0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~4_combout\ = (\disp|reg_counter\(0) & (\disp|reg_counter\(1) & (\disp|reg\(31)))) # (!\disp|reg_counter\(0) & (!\disp|reg_counter\(1) & ((\disp|reg\(35)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(0),
	datab => \disp|reg_counter\(1),
	datac => \disp|reg\(31),
	datad => \disp|reg\(35),
	combout => \disp|Mux0~4_combout\);

-- Location: LCCOMB_X20_Y14_N4
\disp|Mux0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~5_combout\ = (\disp|Mux0~4_combout\) # ((\disp|reg\(33) & (\disp|reg_counter\(0) $ (\disp|reg_counter\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(0),
	datab => \disp|reg_counter\(1),
	datac => \disp|reg\(33),
	datad => \disp|Mux0~4_combout\,
	combout => \disp|Mux0~5_combout\);

-- Location: LCCOMB_X19_Y15_N2
\mem|Mux46~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux46~0_combout\ = (\disp|address\(2) & (!\disp|address\(3) & ((\disp|address\(1)) # (\disp|address\(0))))) # (!\disp|address\(2) & (!\disp|address\(1) & (\disp|address\(3) & !\disp|address\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(1),
	datab => \disp|address\(2),
	datac => \disp|address\(3),
	datad => \disp|address\(0),
	combout => \mem|Mux46~0_combout\);

-- Location: LCCOMB_X19_Y15_N24
\mem|Mux22~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux22~0_combout\ = (\disp|address\(2) & ((\disp|address\(1) & ((!\disp|address\(0)) # (!\disp|address\(3)))) # (!\disp|address\(1) & ((\disp|address\(3)) # (\disp|address\(0)))))) # (!\disp|address\(2) & (((\disp|address\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(1),
	datab => \disp|address\(2),
	datac => \disp|address\(3),
	datad => \disp|address\(0),
	combout => \mem|Mux22~0_combout\);

-- Location: LCCOMB_X19_Y15_N22
\mem|Mux22~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux22~1_combout\ = (\disp|address\(4) & (((\mem|Mux22~0_combout\) # (\disp|address\(5))))) # (!\disp|address\(4) & (\mem|Mux24~0_combout\ & ((!\disp|address\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datab => \mem|Mux24~0_combout\,
	datac => \mem|Mux22~0_combout\,
	datad => \disp|address\(5),
	combout => \mem|Mux22~1_combout\);

-- Location: LCCOMB_X19_Y14_N22
\mem|Mux22~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux22~2_combout\ = (\disp|address\(6) & (((\mem|Mux46~0_combout\ & \mem|Mux22~1_combout\)) # (!\disp|address\(5)))) # (!\disp|address\(6) & (((\mem|Mux22~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \mem|Mux46~0_combout\,
	datac => \mem|Mux22~1_combout\,
	datad => \disp|address\(6),
	combout => \mem|Mux22~2_combout\);

-- Location: LCFF_X19_Y14_N23
\disp|reg[41]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux22~2_combout\,
	sclr => \disp|address\(7),
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(41));

-- Location: LCCOMB_X19_Y13_N16
\mem|Mux52~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux52~1_combout\ = (\disp|address\(3)) # ((\disp|address\(1) & (\disp|address\(0) & \disp|address\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(1),
	datab => \disp|address\(0),
	datac => \disp|address\(3),
	datad => \disp|address\(2),
	combout => \mem|Mux52~1_combout\);

-- Location: LCCOMB_X19_Y13_N26
\mem|Mux20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux20~0_combout\ = (\disp|address\(6) & ((\mem|Mux52~1_combout\ $ (\disp|address\(4))) # (!\disp|address\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(6),
	datab => \disp|address\(5),
	datac => \mem|Mux52~1_combout\,
	datad => \disp|address\(4),
	combout => \mem|Mux20~0_combout\);

-- Location: LCCOMB_X21_Y14_N10
\mem|Mux20~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux20~3_combout\ = (\mem|Mux20~0_combout\) # ((!\disp|address\(6) & \mem|Mux20~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(6),
	datac => \mem|Mux20~0_combout\,
	datad => \mem|Mux20~2_combout\,
	combout => \mem|Mux20~3_combout\);

-- Location: LCFF_X21_Y14_N11
\disp|reg[43]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux20~3_combout\,
	sclr => \disp|address\(7),
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(43));

-- Location: LCCOMB_X21_Y14_N30
\mem|Mux21~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux21~2_combout\ = (\disp|address\(3) & (((!\disp|address\(6))))) # (!\disp|address\(3) & ((\disp|address\(5)) # ((!\disp|address\(6) & \disp|address\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111100101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \disp|address\(3),
	datac => \disp|address\(6),
	datad => \disp|address\(2),
	combout => \mem|Mux21~2_combout\);

-- Location: LCCOMB_X19_Y15_N0
\mem|Mux21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux21~0_combout\ = (\disp|address\(2) & (\disp|address\(1) & \disp|address\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(2),
	datac => \disp|address\(1),
	datad => \disp|address\(0),
	combout => \mem|Mux21~0_combout\);

-- Location: LCCOMB_X21_Y14_N4
\mem|Mux21~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux21~1_combout\ = (!\disp|address\(6) & (\disp|address\(3) & ((\disp|address\(5)) # (!\mem|Mux21~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \mem|Mux21~0_combout\,
	datac => \disp|address\(6),
	datad => \disp|address\(3),
	combout => \mem|Mux21~1_combout\);

-- Location: LCCOMB_X21_Y14_N0
\mem|Mux21~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux21~4_combout\ = (\disp|address\(2) & (!\disp|address\(5) & ((\disp|address\(1)) # (\disp|address\(0))))) # (!\disp|address\(2) & (!\disp|address\(1) & (\disp|address\(5) & !\disp|address\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(1),
	datab => \disp|address\(2),
	datac => \disp|address\(5),
	datad => \disp|address\(0),
	combout => \mem|Mux21~4_combout\);

-- Location: LCCOMB_X21_Y14_N2
\mem|Mux21~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux21~5_combout\ = (\mem|Mux21~4_combout\ & (((\disp|address\(6))) # (!\disp|address\(3)))) # (!\mem|Mux21~4_combout\ & ((\disp|address\(5) & (!\disp|address\(3))) # (!\disp|address\(5) & ((\disp|address\(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110101011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(3),
	datab => \disp|address\(6),
	datac => \disp|address\(5),
	datad => \mem|Mux21~4_combout\,
	combout => \mem|Mux21~5_combout\);

-- Location: LCCOMB_X21_Y14_N8
\mem|Mux21~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux21~3_combout\ = (\disp|address\(4) & (((\mem|Mux21~1_combout\) # (\mem|Mux21~5_combout\)))) # (!\disp|address\(4) & (!\mem|Mux21~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datab => \mem|Mux21~2_combout\,
	datac => \mem|Mux21~1_combout\,
	datad => \mem|Mux21~5_combout\,
	combout => \mem|Mux21~3_combout\);

-- Location: LCFF_X21_Y14_N9
\disp|reg[42]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux21~3_combout\,
	sclr => \disp|address\(7),
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(42));

-- Location: LCCOMB_X20_Y12_N28
\mem|Mux24~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux24~2_combout\ = (\disp|address\(5)) # ((\disp|address\(2) & (\disp|address\(1) & \disp|address\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \disp|address\(2),
	datac => \disp|address\(1),
	datad => \disp|address\(0),
	combout => \mem|Mux24~2_combout\);

-- Location: LCCOMB_X20_Y12_N22
\mem|Mux24~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux24~6_combout\ = (\disp|address\(2) & ((\disp|address\(1) & ((!\disp|address\(5)))) # (!\disp|address\(1) & ((\disp|address\(0)) # (\disp|address\(5)))))) # (!\disp|address\(2) & (((\disp|address\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(2),
	datab => \disp|address\(0),
	datac => \disp|address\(1),
	datad => \disp|address\(5),
	combout => \mem|Mux24~6_combout\);

-- Location: LCCOMB_X20_Y12_N16
\mem|Mux24~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux24~7_combout\ = (\disp|address\(3) & (((\disp|address\(6))))) # (!\disp|address\(3) & ((\disp|address\(6) & (\disp|address\(5) & !\mem|Mux24~6_combout\)) # (!\disp|address\(6) & ((\mem|Mux24~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \disp|address\(3),
	datac => \disp|address\(6),
	datad => \mem|Mux24~6_combout\,
	combout => \mem|Mux24~7_combout\);

-- Location: LCCOMB_X20_Y12_N6
\mem|Mux38~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux38~0_combout\ = (\disp|address\(2) & ((\disp|address\(5)))) # (!\disp|address\(2) & (!\disp|address\(1) & !\disp|address\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(2),
	datac => \disp|address\(1),
	datad => \disp|address\(5),
	combout => \mem|Mux38~0_combout\);

-- Location: LCCOMB_X20_Y12_N4
\mem|Mux24~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux24~3_combout\ = (\disp|address\(3) & ((\mem|Mux24~7_combout\ & ((!\mem|Mux38~0_combout\))) # (!\mem|Mux24~7_combout\ & (!\mem|Mux24~2_combout\)))) # (!\disp|address\(3) & (((\mem|Mux24~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(3),
	datab => \mem|Mux24~2_combout\,
	datac => \mem|Mux24~7_combout\,
	datad => \mem|Mux38~0_combout\,
	combout => \mem|Mux24~3_combout\);

-- Location: LCCOMB_X19_Y14_N10
\mem|Mux24~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux24~4_combout\ = (\mem|Mux24~1_combout\ & ((\mem|Mux24~0_combout\) # ((\disp|address\(4) & \mem|Mux24~3_combout\)))) # (!\mem|Mux24~1_combout\ & (\disp|address\(4) & ((\mem|Mux24~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux24~1_combout\,
	datab => \disp|address\(4),
	datac => \mem|Mux24~0_combout\,
	datad => \mem|Mux24~3_combout\,
	combout => \mem|Mux24~4_combout\);

-- Location: LCFF_X19_Y14_N11
\disp|reg[39]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux24~4_combout\,
	sclr => \disp|address\(7),
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(39));

-- Location: LCCOMB_X20_Y14_N28
\disp|Mux0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~2_combout\ = (\disp|reg_counter\(0) & ((\disp|reg_counter\(1) & ((\disp|reg\(39)))) # (!\disp|reg_counter\(1) & (\disp|reg\(42))))) # (!\disp|reg_counter\(0) & (!\disp|reg_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(0),
	datab => \disp|reg_counter\(1),
	datac => \disp|reg\(42),
	datad => \disp|reg\(39),
	combout => \disp|Mux0~2_combout\);

-- Location: LCCOMB_X20_Y14_N22
\disp|Mux0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~3_combout\ = (\disp|reg_counter\(0) & (((\disp|Mux0~2_combout\)))) # (!\disp|reg_counter\(0) & ((\disp|Mux0~2_combout\ & ((\disp|reg\(43)))) # (!\disp|Mux0~2_combout\ & (\disp|reg\(41)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(0),
	datab => \disp|reg\(41),
	datac => \disp|reg\(43),
	datad => \disp|Mux0~2_combout\,
	combout => \disp|Mux0~3_combout\);

-- Location: LCCOMB_X20_Y14_N18
\disp|Mux0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~6_combout\ = (\disp|reg_counter\(3) & (\disp|reg_counter\(2) & (\disp|Mux0~5_combout\))) # (!\disp|reg_counter\(3) & (((\disp|Mux0~3_combout\)) # (!\disp|reg_counter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(3),
	datab => \disp|reg_counter\(2),
	datac => \disp|Mux0~5_combout\,
	datad => \disp|Mux0~3_combout\,
	combout => \disp|Mux0~6_combout\);

-- Location: LCCOMB_X20_Y14_N20
\disp|Mux0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~9_combout\ = (\disp|reg_counter\(2) & (((\disp|Mux0~6_combout\)))) # (!\disp|reg_counter\(2) & ((\disp|Mux0~6_combout\ & (\disp|Mux0~8_combout\)) # (!\disp|Mux0~6_combout\ & ((\disp|Mux0~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(2),
	datab => \disp|Mux0~8_combout\,
	datac => \disp|Mux0~1_combout\,
	datad => \disp|Mux0~6_combout\,
	combout => \disp|Mux0~9_combout\);

-- Location: LCCOMB_X18_Y14_N2
\mem|Mux52~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux52~2_combout\ = (\disp|address\(6) & (((!\disp|address\(7))))) # (!\disp|address\(6) & (!\disp|address\(4) & ((\disp|address\(7)) # (\mem|Mux52~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datab => \disp|address\(7),
	datac => \mem|Mux52~1_combout\,
	datad => \disp|address\(6),
	combout => \mem|Mux52~2_combout\);

-- Location: LCCOMB_X19_Y14_N20
\mem|Mux52~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux52~3_combout\ = (\mem|Mux52~2_combout\ & (\disp|address\(7) $ (\disp|address\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(7),
	datac => \disp|address\(5),
	datad => \mem|Mux52~2_combout\,
	combout => \mem|Mux52~3_combout\);

-- Location: LCFF_X19_Y14_N21
\disp|reg[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux52~3_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(11));

-- Location: LCCOMB_X22_Y13_N12
\mem|Mux55~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux55~0_combout\ = (\disp|address\(3) & ((\disp|address\(1)) # ((\disp|address\(0)) # (\disp|address\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(1),
	datab => \disp|address\(0),
	datac => \disp|address\(2),
	datad => \disp|address\(3),
	combout => \mem|Mux55~0_combout\);

-- Location: LCCOMB_X22_Y14_N4
\mem|Mux55~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux55~1_combout\ = (\disp|address\(6) & (((!\disp|address\(7))))) # (!\disp|address\(6) & (!\disp|address\(4) & ((\disp|address\(7)) # (\mem|Mux55~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101100011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(6),
	datab => \disp|address\(4),
	datac => \disp|address\(7),
	datad => \mem|Mux55~0_combout\,
	combout => \mem|Mux55~1_combout\);

-- Location: LCCOMB_X21_Y14_N20
\mem|Mux55~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux55~2_combout\ = (\mem|Mux55~1_combout\ & (\disp|address\(7) $ (\disp|address\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(7),
	datac => \disp|address\(5),
	datad => \mem|Mux55~1_combout\,
	combout => \mem|Mux55~2_combout\);

-- Location: LCFF_X21_Y14_N21
\disp|reg[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux55~2_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(8));

-- Location: LCCOMB_X20_Y14_N2
\disp|Mux0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~20_combout\ = (\disp|reg_counter\(0) & (\disp|reg_counter\(1) & ((\disp|reg\(8))))) # (!\disp|reg_counter\(0) & (!\disp|reg_counter\(1) & (\disp|reg\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(0),
	datab => \disp|reg_counter\(1),
	datac => \disp|reg\(11),
	datad => \disp|reg\(8),
	combout => \disp|Mux0~20_combout\);

-- Location: LCCOMB_X20_Y13_N2
\disp|Mux0~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~21_combout\ = (\disp|Mux0~20_combout\) # ((\disp|reg\(10) & (\disp|reg_counter\(1) $ (\disp|reg_counter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg\(10),
	datab => \disp|reg_counter\(1),
	datac => \disp|reg_counter\(0),
	datad => \disp|Mux0~20_combout\,
	combout => \disp|Mux0~21_combout\);

-- Location: LCCOMB_X18_Y13_N24
\mem|Mux24~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux24~1_combout\ = (!\disp|address\(4) & (!\disp|address\(6) & !\disp|address\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(4),
	datac => \disp|address\(6),
	datad => \disp|address\(5),
	combout => \mem|Mux24~1_combout\);

-- Location: LCCOMB_X22_Y13_N8
\mem|Mux57~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux57~0_combout\ = (!\disp|address\(4) & (\disp|address\(3) & ((\disp|address\(2)) # (\disp|address\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datab => \disp|address\(3),
	datac => \disp|address\(2),
	datad => \disp|address\(1),
	combout => \mem|Mux57~0_combout\);

-- Location: LCCOMB_X22_Y13_N6
\mem|Mux57~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux57~1_combout\ = (!\disp|address\(7) & (\disp|address\(5) & ((\disp|address\(6)) # (\mem|Mux57~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(7),
	datab => \disp|address\(5),
	datac => \disp|address\(6),
	datad => \mem|Mux57~0_combout\,
	combout => \mem|Mux57~1_combout\);

-- Location: LCCOMB_X21_Y13_N18
\mem|Mux57~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux57~2_combout\ = (\mem|Mux57~1_combout\) # ((\disp|address\(7) & \mem|Mux24~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(7),
	datac => \mem|Mux24~1_combout\,
	datad => \mem|Mux57~1_combout\,
	combout => \mem|Mux57~2_combout\);

-- Location: LCFF_X21_Y13_N19
\disp|reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux57~2_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(6));

-- Location: LCCOMB_X18_Y13_N28
\mem|Mux59~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux59~0_combout\ = (\disp|address\(3) & ((\disp|address\(2)) # ((\disp|address\(0) & \disp|address\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(3),
	datab => \disp|address\(0),
	datac => \disp|address\(1),
	datad => \disp|address\(2),
	combout => \mem|Mux59~0_combout\);

-- Location: LCCOMB_X18_Y13_N26
\mem|Mux59~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux59~1_combout\ = (\disp|address\(6) & (!\disp|address\(7))) # (!\disp|address\(6) & (!\disp|address\(4) & ((\disp|address\(7)) # (\mem|Mux59~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001101010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(7),
	datab => \disp|address\(4),
	datac => \disp|address\(6),
	datad => \mem|Mux59~0_combout\,
	combout => \mem|Mux59~1_combout\);

-- Location: LCCOMB_X21_Y13_N28
\mem|Mux59~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux59~2_combout\ = (\mem|Mux59~1_combout\ & (\disp|address\(5) $ (\disp|address\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datac => \mem|Mux59~1_combout\,
	datad => \disp|address\(7),
	combout => \mem|Mux59~2_combout\);

-- Location: LCFF_X21_Y13_N29
\disp|reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux59~2_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(4));

-- Location: LCCOMB_X21_Y13_N8
\disp|Mux0~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~22_combout\ = (\disp|reg_counter\(1) & ((\disp|reg\(4)))) # (!\disp|reg_counter\(1) & (\disp|reg\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|reg\(6),
	datac => \disp|reg_counter\(1),
	datad => \disp|reg\(4),
	combout => \disp|Mux0~22_combout\);

-- Location: LCCOMB_X18_Y13_N14
\mem|Mux60~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux60~0_combout\ = (\disp|address\(6)) # ((\disp|address\(2) & (\disp|address\(3) & !\disp|address\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(2),
	datab => \disp|address\(6),
	datac => \disp|address\(3),
	datad => \disp|address\(4),
	combout => \mem|Mux60~0_combout\);

-- Location: LCCOMB_X19_Y13_N28
\mem|Mux60~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux60~1_combout\ = (\disp|address\(7) & (\mem|Mux52~0_combout\ & (!\disp|address\(5)))) # (!\disp|address\(7) & (((\disp|address\(5) & \mem|Mux60~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux52~0_combout\,
	datab => \disp|address\(7),
	datac => \disp|address\(5),
	datad => \mem|Mux60~0_combout\,
	combout => \mem|Mux60~1_combout\);

-- Location: LCFF_X19_Y13_N29
\disp|reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux60~1_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(3));

-- Location: LCCOMB_X18_Y13_N30
\mem|Mux52~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux52~0_combout\ = (!\disp|address\(6) & !\disp|address\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \disp|address\(6),
	datad => \disp|address\(4),
	combout => \mem|Mux52~0_combout\);

-- Location: LCCOMB_X18_Y13_N12
\mem|Mux63~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux63~0_combout\ = (\disp|address\(6)) # ((\disp|address\(3) & (\mem|Mux21~0_combout\ & !\disp|address\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(3),
	datab => \disp|address\(6),
	datac => \mem|Mux21~0_combout\,
	datad => \disp|address\(4),
	combout => \mem|Mux63~0_combout\);

-- Location: LCCOMB_X19_Y13_N18
\mem|Mux63~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux63~1_combout\ = (\disp|address\(5) & (!\disp|address\(7) & ((\mem|Mux63~0_combout\)))) # (!\disp|address\(5) & (\disp|address\(7) & (\mem|Mux52~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \disp|address\(7),
	datac => \mem|Mux52~0_combout\,
	datad => \mem|Mux63~0_combout\,
	combout => \mem|Mux63~1_combout\);

-- Location: LCFF_X19_Y13_N19
\disp|reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux63~1_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(0));

-- Location: LCCOMB_X20_Y13_N24
\disp|Mux0~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~23_combout\ = (\disp|reg_counter\(0) & ((\disp|reg_counter\(1) & ((\disp|reg\(0)))) # (!\disp|reg_counter\(1) & (\disp|reg\(2))))) # (!\disp|reg_counter\(0) & (((!\disp|reg_counter\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg\(2),
	datab => \disp|reg\(0),
	datac => \disp|reg_counter\(0),
	datad => \disp|reg_counter\(1),
	combout => \disp|Mux0~23_combout\);

-- Location: LCCOMB_X20_Y12_N18
\mem|Mux24~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux24~5_combout\ = (\disp|address\(1) & \disp|address\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(1),
	datac => \disp|address\(2),
	combout => \mem|Mux24~5_combout\);

-- Location: LCCOMB_X20_Y12_N8
\mem|Mux62~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux62~0_combout\ = (\disp|address\(6)) # ((\disp|address\(3) & (!\disp|address\(4) & \mem|Mux24~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(6),
	datab => \disp|address\(3),
	datac => \disp|address\(4),
	datad => \mem|Mux24~5_combout\,
	combout => \mem|Mux62~0_combout\);

-- Location: LCCOMB_X19_Y13_N6
\mem|Mux62~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux62~1_combout\ = (\disp|address\(7) & (((\mem|Mux24~1_combout\)))) # (!\disp|address\(7) & (\disp|address\(5) & ((\mem|Mux62~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \disp|address\(7),
	datac => \mem|Mux24~1_combout\,
	datad => \mem|Mux62~0_combout\,
	combout => \mem|Mux62~1_combout\);

-- Location: LCFF_X19_Y13_N7
\disp|reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux62~1_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(1));

-- Location: LCCOMB_X20_Y13_N6
\disp|Mux0~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~24_combout\ = (\disp|reg_counter\(0) & (((\disp|Mux0~23_combout\)))) # (!\disp|reg_counter\(0) & ((\disp|Mux0~23_combout\ & (\disp|reg\(3))) # (!\disp|Mux0~23_combout\ & ((\disp|reg\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(0),
	datab => \disp|reg\(3),
	datac => \disp|Mux0~23_combout\,
	datad => \disp|reg\(1),
	combout => \disp|Mux0~24_combout\);

-- Location: LCCOMB_X20_Y13_N4
\disp|Mux0~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~25_combout\ = (\disp|reg_counter\(3) & ((\disp|reg_counter\(2) & ((\disp|Mux0~24_combout\))) # (!\disp|reg_counter\(2) & (\disp|Mux0~22_combout\)))) # (!\disp|reg_counter\(3) & (!\disp|reg_counter\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(3),
	datab => \disp|reg_counter\(2),
	datac => \disp|Mux0~22_combout\,
	datad => \disp|Mux0~24_combout\,
	combout => \disp|Mux0~25_combout\);

-- Location: LCCOMB_X19_Y12_N6
\mem|Mux50~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux50~0_combout\ = (!\disp|address\(4) & (\disp|address\(5) & !\disp|address\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datab => \disp|address\(5),
	datad => \disp|address\(7),
	combout => \mem|Mux50~0_combout\);

-- Location: LCCOMB_X19_Y12_N18
\mem|Mux50~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux50~2_combout\ = (\mem|Mux50~0_combout\ & ((\mem|Mux50~1_combout\ & (!\disp|address\(3) & !\disp|address\(6))) # (!\mem|Mux50~1_combout\ & (\disp|address\(3) $ (\disp|address\(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux50~1_combout\,
	datab => \disp|address\(3),
	datac => \disp|address\(6),
	datad => \mem|Mux50~0_combout\,
	combout => \mem|Mux50~2_combout\);

-- Location: LCFF_X19_Y12_N19
\disp|reg[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux50~2_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(13));

-- Location: LCCOMB_X19_Y12_N26
\mem|Mux49~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux49~1_combout\ = (\disp|address\(2) & ((\disp|address\(3) & ((!\disp|address\(1)))) # (!\disp|address\(3) & ((\disp|address\(0)) # (\disp|address\(1)))))) # (!\disp|address\(2) & (((\disp|address\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(2),
	datab => \disp|address\(0),
	datac => \disp|address\(3),
	datad => \disp|address\(1),
	combout => \mem|Mux49~1_combout\);

-- Location: LCCOMB_X18_Y13_N4
\mem|Mux49~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux49~0_combout\ = (!\disp|address\(3) & ((\disp|address\(0) & ((!\disp|address\(2)) # (!\disp|address\(1)))) # (!\disp|address\(0) & ((\disp|address\(1)) # (\disp|address\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(3),
	datab => \disp|address\(0),
	datac => \disp|address\(1),
	datad => \disp|address\(2),
	combout => \mem|Mux49~0_combout\);

-- Location: LCCOMB_X19_Y12_N4
\mem|Mux49~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux49~2_combout\ = (\mem|Mux50~0_combout\ & ((\disp|address\(6) & ((\mem|Mux49~0_combout\))) # (!\disp|address\(6) & (\mem|Mux49~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux50~0_combout\,
	datab => \mem|Mux49~1_combout\,
	datac => \mem|Mux49~0_combout\,
	datad => \disp|address\(6),
	combout => \mem|Mux49~2_combout\);

-- Location: LCFF_X19_Y12_N5
\disp|reg[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux49~2_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(14));

-- Location: LCCOMB_X19_Y12_N0
\disp|Mux0~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~26_combout\ = (\disp|reg_counter\(0) & ((\disp|reg_counter\(1) & (\disp|reg\(12))) # (!\disp|reg_counter\(1) & ((\disp|reg\(14)))))) # (!\disp|reg_counter\(0) & (((!\disp|reg_counter\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg\(12),
	datab => \disp|reg\(14),
	datac => \disp|reg_counter\(0),
	datad => \disp|reg_counter\(1),
	combout => \disp|Mux0~26_combout\);

-- Location: LCCOMB_X19_Y12_N10
\disp|Mux0~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~27_combout\ = (\disp|reg_counter\(0) & (((\disp|Mux0~26_combout\)))) # (!\disp|reg_counter\(0) & ((\disp|Mux0~26_combout\ & (\disp|reg\(15))) # (!\disp|Mux0~26_combout\ & ((\disp|reg\(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg\(15),
	datab => \disp|reg\(13),
	datac => \disp|reg_counter\(0),
	datad => \disp|Mux0~26_combout\,
	combout => \disp|Mux0~27_combout\);

-- Location: LCCOMB_X20_Y13_N14
\disp|Mux0~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~28_combout\ = (\disp|reg_counter\(3) & (((\disp|Mux0~25_combout\)))) # (!\disp|reg_counter\(3) & ((\disp|Mux0~25_combout\ & ((\disp|Mux0~27_combout\))) # (!\disp|Mux0~25_combout\ & (\disp|Mux0~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(3),
	datab => \disp|Mux0~21_combout\,
	datac => \disp|Mux0~25_combout\,
	datad => \disp|Mux0~27_combout\,
	combout => \disp|Mux0~28_combout\);

-- Location: LCCOMB_X21_Y12_N20
\mem|Mux33~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux33~1_combout\ = (!\disp|address\(3) & \disp|address\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \disp|address\(3),
	datad => \disp|address\(5),
	combout => \mem|Mux33~1_combout\);

-- Location: LCCOMB_X21_Y12_N10
\mem|Mux33~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux33~2_combout\ = (\mem|Mux33~1_combout\ & (((\disp|address\(4) & !\disp|address\(1))) # (!\disp|address\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(2),
	datab => \disp|address\(4),
	datac => \mem|Mux33~1_combout\,
	datad => \disp|address\(1),
	combout => \mem|Mux33~2_combout\);

-- Location: LCCOMB_X20_Y12_N12
\mem|Mux33~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux33~3_combout\ = (!\disp|address\(5) & ((\disp|address\(3) & (!\mem|Mux33~0_combout\)) # (!\disp|address\(3) & ((\mem|Mux32~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \mem|Mux33~0_combout\,
	datac => \disp|address\(3),
	datad => \mem|Mux32~0_combout\,
	combout => \mem|Mux33~3_combout\);

-- Location: LCCOMB_X20_Y12_N10
\mem|Mux33~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux33~4_combout\ = (\mem|Mux30~2_combout\) # ((!\disp|address\(6) & ((\mem|Mux33~2_combout\) # (\mem|Mux33~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(6),
	datab => \mem|Mux33~2_combout\,
	datac => \mem|Mux30~2_combout\,
	datad => \mem|Mux33~3_combout\,
	combout => \mem|Mux33~4_combout\);

-- Location: LCCOMB_X20_Y12_N30
\mem|Mux33~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux33~5_combout\ = (!\disp|address\(7) & \mem|Mux33~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(7),
	datad => \mem|Mux33~4_combout\,
	combout => \mem|Mux33~5_combout\);

-- Location: LCFF_X20_Y12_N31
\disp|reg[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux33~5_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(30));

-- Location: LCCOMB_X20_Y15_N4
\mem|Mux45~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux45~2_combout\ = (\disp|address\(3) & (!\disp|address\(2) & ((!\disp|address\(1))))) # (!\disp|address\(3) & ((\disp|address\(2)) # ((\disp|address\(0) & \disp|address\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(3),
	datab => \disp|address\(2),
	datac => \disp|address\(0),
	datad => \disp|address\(1),
	combout => \mem|Mux45~2_combout\);

-- Location: LCCOMB_X19_Y13_N24
\mem|Mux45~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux45~3_combout\ = (\disp|address\(5) & (!\disp|address\(6) & ((\disp|address\(4)) # (\mem|Mux45~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \disp|address\(4),
	datac => \mem|Mux45~2_combout\,
	datad => \disp|address\(6),
	combout => \mem|Mux45~3_combout\);

-- Location: LCCOMB_X21_Y13_N22
\mem|Mux45~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux45~5_combout\ = (!\disp|address\(7) & ((\mem|Mux45~3_combout\) # ((\mem|Mux45~4_combout\ & \disp|address\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux45~4_combout\,
	datab => \disp|address\(7),
	datac => \disp|address\(6),
	datad => \mem|Mux45~3_combout\,
	combout => \mem|Mux45~5_combout\);

-- Location: LCFF_X21_Y13_N23
\disp|reg[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux45~5_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(18));

-- Location: LCCOMB_X21_Y13_N12
\disp|Mux0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~10_combout\ = (\disp|reg_counter\(2) & (((\disp|reg\(18) & \disp|reg_counter\(3))))) # (!\disp|reg_counter\(2) & ((\disp|reg\(22)) # ((!\disp|reg_counter\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg\(22),
	datab => \disp|reg\(18),
	datac => \disp|reg_counter\(2),
	datad => \disp|reg_counter\(3),
	combout => \disp|Mux0~10_combout\);

-- Location: LCCOMB_X21_Y13_N10
\disp|Mux0~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~11_combout\ = (\disp|reg_counter\(3) & (((\disp|Mux0~10_combout\)))) # (!\disp|reg_counter\(3) & ((\disp|Mux0~10_combout\ & ((\disp|reg\(30)))) # (!\disp|Mux0~10_combout\ & (\disp|reg\(26)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg\(26),
	datab => \disp|reg_counter\(3),
	datac => \disp|reg\(30),
	datad => \disp|Mux0~10_combout\,
	combout => \disp|Mux0~11_combout\);

-- Location: LCCOMB_X21_Y12_N26
\mem|Mux40~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux40~0_combout\ = (\disp|address\(4) & ((!\disp|address\(2)) # (!\disp|address\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datac => \disp|address\(3),
	datad => \disp|address\(2),
	combout => \mem|Mux40~0_combout\);

-- Location: LCCOMB_X22_Y13_N20
\mem|Mux40~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux40~1_combout\ = ((\mem|Mux40~0_combout\) # ((!\disp|address\(4) & \mem|Mux55~0_combout\))) # (!\disp|address\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datab => \mem|Mux55~0_combout\,
	datac => \disp|address\(5),
	datad => \mem|Mux40~0_combout\,
	combout => \mem|Mux40~1_combout\);

-- Location: LCCOMB_X21_Y13_N0
\disp|reg[23]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|reg[23]~feeder_combout\ = \mem|Mux40~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \mem|Mux40~1_combout\,
	combout => \disp|reg[23]~feeder_combout\);

-- Location: LCCOMB_X22_Y13_N2
\mem|Mux41~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux41~0_combout\ = (\disp|address\(4)) # ((!\disp|address\(3) & ((\disp|address\(2)) # (\disp|address\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datab => \disp|address\(3),
	datac => \disp|address\(2),
	datad => \disp|address\(1),
	combout => \mem|Mux41~0_combout\);

-- Location: LCCOMB_X22_Y13_N4
\disp|reg[22]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|reg[22]~0_combout\ = (\disp|address\(5) & ((\mem|Mux41~0_combout\))) # (!\disp|address\(5) & (\mem|Mux42~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux42~0_combout\,
	datab => \disp|address\(5),
	datad => \mem|Mux41~0_combout\,
	combout => \disp|reg[22]~0_combout\);

-- Location: LCFF_X21_Y13_N1
\disp|reg[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|reg[23]~feeder_combout\,
	sdata => \disp|reg[22]~0_combout\,
	sclr => \disp|address\(7),
	sload => \disp|ALT_INV_address\(6),
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(23));

-- Location: LCCOMB_X19_Y13_N2
\mem|Mux44~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux44~0_combout\ = ((\disp|address\(4) & ((!\mem|Mux45~0_combout\))) # (!\disp|address\(4) & (\mem|Mux52~1_combout\))) # (!\disp|address\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux52~1_combout\,
	datab => \disp|address\(4),
	datac => \disp|address\(5),
	datad => \mem|Mux45~0_combout\,
	combout => \mem|Mux44~0_combout\);

-- Location: LCCOMB_X21_Y13_N30
\mem|Mux44~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux44~1_combout\ = (!\disp|address\(7) & ((\mem|Mux45~3_combout\) # ((\disp|address\(6) & \mem|Mux44~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(6),
	datab => \disp|address\(7),
	datac => \mem|Mux44~0_combout\,
	datad => \mem|Mux45~3_combout\,
	combout => \mem|Mux44~1_combout\);

-- Location: LCFF_X21_Y13_N31
\disp|reg[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux44~1_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(19));

-- Location: LCCOMB_X21_Y13_N20
\disp|Mux0~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~17_combout\ = (\disp|reg_counter\(2) & ((\disp|reg_counter\(3) & ((\disp|reg\(19)))) # (!\disp|reg_counter\(3) & (\disp|reg\(27))))) # (!\disp|reg_counter\(2) & (((!\disp|reg_counter\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg\(27),
	datab => \disp|reg\(19),
	datac => \disp|reg_counter\(2),
	datad => \disp|reg_counter\(3),
	combout => \disp|Mux0~17_combout\);

-- Location: LCCOMB_X21_Y13_N14
\disp|Mux0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~18_combout\ = (\disp|reg_counter\(2) & (((\disp|Mux0~17_combout\)))) # (!\disp|reg_counter\(2) & ((\disp|Mux0~17_combout\ & ((\disp|reg\(31)))) # (!\disp|Mux0~17_combout\ & (\disp|reg\(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(2),
	datab => \disp|reg\(23),
	datac => \disp|Mux0~17_combout\,
	datad => \disp|reg\(31),
	combout => \disp|Mux0~18_combout\);

-- Location: LCCOMB_X22_Y13_N30
\mem|Mux35~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux35~1_combout\ = (\mem|Mux30~2_combout\) # ((!\disp|address\(6) & ((\mem|Mux35~0_combout\) # (\mem|Mux33~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux35~0_combout\,
	datab => \mem|Mux30~2_combout\,
	datac => \disp|address\(6),
	datad => \mem|Mux33~2_combout\,
	combout => \mem|Mux35~1_combout\);

-- Location: LCCOMB_X21_Y13_N26
\mem|Mux35~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux35~2_combout\ = (!\disp|address\(7) & \mem|Mux35~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|address\(7),
	datad => \mem|Mux35~1_combout\,
	combout => \mem|Mux35~2_combout\);

-- Location: LCFF_X21_Y13_N27
\disp|reg[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux35~2_combout\,
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(28));

-- Location: LCCOMB_X19_Y13_N4
\mem|Mux43~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux43~0_combout\ = (\mem|Mux20~0_combout\) # (\mem|Mux45~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mem|Mux20~0_combout\,
	datac => \mem|Mux45~3_combout\,
	combout => \mem|Mux43~0_combout\);

-- Location: LCFF_X19_Y13_N5
\disp|reg[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux43~0_combout\,
	sclr => \disp|address\(7),
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(20));

-- Location: LCCOMB_X20_Y13_N18
\disp|Mux0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~14_combout\ = (\disp|reg_counter\(3) & ((\disp|reg_counter\(2) & (\disp|reg\(16))) # (!\disp|reg_counter\(2) & ((\disp|reg\(20)))))) # (!\disp|reg_counter\(3) & (((!\disp|reg_counter\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg\(16),
	datab => \disp|reg_counter\(3),
	datac => \disp|reg\(20),
	datad => \disp|reg_counter\(2),
	combout => \disp|Mux0~14_combout\);

-- Location: LCCOMB_X20_Y13_N20
\disp|Mux0~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~15_combout\ = (\disp|reg_counter\(3) & (((\disp|Mux0~14_combout\)))) # (!\disp|reg_counter\(3) & ((\disp|Mux0~14_combout\ & ((\disp|reg\(28)))) # (!\disp|Mux0~14_combout\ & (\disp|reg\(24)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg\(24),
	datab => \disp|reg_counter\(3),
	datac => \disp|reg\(28),
	datad => \disp|Mux0~14_combout\,
	combout => \disp|Mux0~15_combout\);

-- Location: LCCOMB_X22_Y13_N0
\mem|Mux42~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux42~2_combout\ = (\disp|address\(4)) # (\disp|address\(3) $ (((\disp|address\(2)) # (\disp|address\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(2),
	datab => \disp|address\(3),
	datac => \disp|address\(4),
	datad => \disp|address\(1),
	combout => \mem|Mux42~2_combout\);

-- Location: LCCOMB_X22_Y13_N26
\disp|reg[21]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|reg[21]~1_combout\ = (\disp|address\(5) & ((\mem|Mux42~2_combout\))) # (!\disp|address\(5) & (\mem|Mux42~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem|Mux42~0_combout\,
	datab => \disp|address\(5),
	datad => \mem|Mux42~2_combout\,
	combout => \disp|reg[21]~1_combout\);

-- Location: LCCOMB_X22_Y13_N14
\mem|Mux42~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux42~1_combout\ = ((\disp|address\(4) & ((!\mem|Mux55~0_combout\))) # (!\disp|address\(4) & (\disp|address\(3)))) # (!\disp|address\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(4),
	datab => \disp|address\(3),
	datac => \disp|address\(5),
	datad => \mem|Mux55~0_combout\,
	combout => \mem|Mux42~1_combout\);

-- Location: LCFF_X22_Y13_N27
\disp|reg[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|reg[21]~1_combout\,
	sdata => \mem|Mux42~1_combout\,
	sclr => \disp|address\(7),
	sload => \disp|address\(6),
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(21));

-- Location: LCCOMB_X20_Y12_N20
\mem|Mux38~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux38~1_combout\ = (\disp|address\(5) & ((\mem|Mux16~1_combout\) # ((\disp|address\(3) & !\mem|Mux38~0_combout\)))) # (!\disp|address\(5) & (((\disp|address\(3) & !\mem|Mux38~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \mem|Mux16~1_combout\,
	datac => \disp|address\(3),
	datad => \mem|Mux38~0_combout\,
	combout => \mem|Mux38~1_combout\);

-- Location: LCCOMB_X21_Y12_N16
\mem|Mux38~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux38~2_combout\ = (\disp|address\(1) & (((!\disp|address\(2))))) # (!\disp|address\(1) & ((\disp|address\(4)) # (\disp|address\(0) $ (\disp|address\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(1),
	datab => \disp|address\(0),
	datac => \disp|address\(4),
	datad => \disp|address\(2),
	combout => \mem|Mux38~2_combout\);

-- Location: LCCOMB_X21_Y12_N30
\mem|Mux38~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux38~3_combout\ = (\disp|address\(4) & (((!\disp|address\(1) & !\disp|address\(0))) # (!\disp|address\(2)))) # (!\disp|address\(4) & ((\disp|address\(2)) # ((\disp|address\(1) & \disp|address\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(1),
	datab => \disp|address\(0),
	datac => \disp|address\(4),
	datad => \disp|address\(2),
	combout => \mem|Mux38~3_combout\);

-- Location: LCCOMB_X21_Y12_N12
\mem|Mux38~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux38~4_combout\ = (!\disp|address\(3) & ((\disp|address\(5) & (\mem|Mux38~2_combout\)) # (!\disp|address\(5) & ((\mem|Mux38~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \disp|address\(3),
	datac => \mem|Mux38~2_combout\,
	datad => \mem|Mux38~3_combout\,
	combout => \mem|Mux38~4_combout\);

-- Location: LCCOMB_X21_Y12_N2
\mem|Mux38~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux38~5_combout\ = (\mem|Mux38~4_combout\) # ((!\disp|address\(5) & (!\disp|address\(4) & \disp|address\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(5),
	datab => \disp|address\(4),
	datac => \disp|address\(3),
	datad => \mem|Mux38~4_combout\,
	combout => \mem|Mux38~5_combout\);

-- Location: LCCOMB_X20_Y12_N0
\mem|Mux38~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem|Mux38~6_combout\ = (\disp|address\(6) & (\disp|address\(4) & (\mem|Mux38~1_combout\))) # (!\disp|address\(6) & (((\mem|Mux38~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|address\(6),
	datab => \disp|address\(4),
	datac => \mem|Mux38~1_combout\,
	datad => \mem|Mux38~5_combout\,
	combout => \mem|Mux38~6_combout\);

-- Location: LCFF_X20_Y12_N1
\disp|reg[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \mem|Mux38~6_combout\,
	sclr => \disp|address\(7),
	ena => \disp|reg[52]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|reg\(25));

-- Location: LCCOMB_X20_Y13_N22
\disp|Mux0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~12_combout\ = (\disp|reg_counter\(3) & (\disp|reg\(17) & ((\disp|reg_counter\(2))))) # (!\disp|reg_counter\(3) & (((\disp|reg\(25)) # (!\disp|reg_counter\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg\(17),
	datab => \disp|reg\(25),
	datac => \disp|reg_counter\(3),
	datad => \disp|reg_counter\(2),
	combout => \disp|Mux0~12_combout\);

-- Location: LCCOMB_X20_Y13_N28
\disp|Mux0~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~13_combout\ = (\disp|reg_counter\(2) & (((\disp|Mux0~12_combout\)))) # (!\disp|reg_counter\(2) & ((\disp|Mux0~12_combout\ & (\disp|reg\(29))) # (!\disp|Mux0~12_combout\ & ((\disp|reg\(21))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg\(29),
	datab => \disp|reg_counter\(2),
	datac => \disp|reg\(21),
	datad => \disp|Mux0~12_combout\,
	combout => \disp|Mux0~13_combout\);

-- Location: LCCOMB_X20_Y13_N10
\disp|Mux0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~16_combout\ = (\disp|reg_counter\(0) & (\disp|reg_counter\(1) & (\disp|Mux0~15_combout\))) # (!\disp|reg_counter\(0) & (((\disp|Mux0~13_combout\)) # (!\disp|reg_counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(0),
	datab => \disp|reg_counter\(1),
	datac => \disp|Mux0~15_combout\,
	datad => \disp|Mux0~13_combout\,
	combout => \disp|Mux0~16_combout\);

-- Location: LCCOMB_X20_Y13_N0
\disp|Mux0~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~19_combout\ = (\disp|reg_counter\(1) & (((\disp|Mux0~16_combout\)))) # (!\disp|reg_counter\(1) & ((\disp|Mux0~16_combout\ & ((\disp|Mux0~18_combout\))) # (!\disp|Mux0~16_combout\ & (\disp|Mux0~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(1),
	datab => \disp|Mux0~11_combout\,
	datac => \disp|Mux0~18_combout\,
	datad => \disp|Mux0~16_combout\,
	combout => \disp|Mux0~19_combout\);

-- Location: LCCOMB_X20_Y13_N12
\disp|Mux0~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~29_combout\ = (\disp|reg_counter\(4) & (\disp|reg_counter\(5) & (\disp|Mux0~28_combout\))) # (!\disp|reg_counter\(4) & (((\disp|Mux0~19_combout\)) # (!\disp|reg_counter\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|reg_counter\(4),
	datab => \disp|reg_counter\(5),
	datac => \disp|Mux0~28_combout\,
	datad => \disp|Mux0~19_combout\,
	combout => \disp|Mux0~29_combout\);

-- Location: LCCOMB_X20_Y13_N26
\disp|Mux0~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Mux0~33_combout\ = (\disp|reg_counter\(5) & (((\disp|Mux0~29_combout\)))) # (!\disp|reg_counter\(5) & ((\disp|Mux0~29_combout\ & (\disp|Mux0~32_combout\)) # (!\disp|Mux0~29_combout\ & ((\disp|Mux0~9_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|Mux0~32_combout\,
	datab => \disp|reg_counter\(5),
	datac => \disp|Mux0~9_combout\,
	datad => \disp|Mux0~29_combout\,
	combout => \disp|Mux0~33_combout\);

-- Location: LCCOMB_X20_Y13_N8
\disp|Selector3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Selector3~1_combout\ = (\disp|Selector3~0_combout\) # ((\disp|Selector7~0_combout\ & \disp|Mux0~33_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \disp|Selector3~0_combout\,
	datac => \disp|Selector7~0_combout\,
	datad => \disp|Mux0~33_combout\,
	combout => \disp|Selector3~1_combout\);

-- Location: LCFF_X20_Y13_N9
\disp|red[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|Selector3~1_combout\,
	aclr => \ALT_INV_rst~combout\,
	ena => \disp|a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|red\(0));

-- Location: LCCOMB_X23_Y15_N0
\disp|Selector7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \disp|Selector7~1_combout\ = (\disp|Selector7~0_combout\) # ((\disp|green\(0) & ((\disp|state.send_add~regout\) # (\disp|state.fetch~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \disp|state.send_add~regout\,
	datab => \disp|state.fetch~regout\,
	datac => \disp|green\(0),
	datad => \disp|Selector7~0_combout\,
	combout => \disp|Selector7~1_combout\);

-- Location: LCFF_X23_Y15_N1
\disp|green[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \disp|Selector7~1_combout\,
	aclr => \ALT_INV_rst~combout\,
	ena => \disp|a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \disp|green\(0));

-- Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\hsync~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \disp|hsync~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_hsync);

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\vsync~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \disp|vsync~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_vsync);

-- Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\red[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \disp|red\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_red(0));

-- Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\red[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \disp|red\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_red(1));

-- Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\red[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \disp|red\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_red(2));

-- Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\red[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \disp|red\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_red(3));

-- Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\green[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \disp|green\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_green(0));

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\green[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \disp|green\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_green(1));

-- Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\green[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \disp|green\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_green(2));

-- Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\green[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \disp|green\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_green(3));

-- Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\blue[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_blue(0));

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\blue[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_blue(1));

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\blue[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_blue(2));

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\blue[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_blue(3));
END structure;


