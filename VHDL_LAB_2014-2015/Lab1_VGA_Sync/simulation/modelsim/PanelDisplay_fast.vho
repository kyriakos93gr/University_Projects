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
-- VERSION "Version 12.0 Build 263 08/02/2012 Service Pack 2 SJ Web Edition"

-- DATE "03/31/2015 06:39:50"

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

ENTITY 	PanelDisplay IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	hsync : OUT std_logic;
	vsync : OUT std_logic;
	red : OUT std_logic_vector(3 DOWNTO 0);
	green : OUT std_logic_vector(3 DOWNTO 0);
	blue : OUT std_logic_vector(3 DOWNTO 0)
	);
END PanelDisplay;

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


ARCHITECTURE structure OF PanelDisplay IS
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
SIGNAL \pixelcounter[4]~18_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \Add1~17\ : std_logic;
SIGNAL \Add1~18_combout\ : std_logic;
SIGNAL \red~0_combout\ : std_logic;
SIGNAL \red~2_combout\ : std_logic;
SIGNAL \linecounter[9]~4_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \pixelcounter[0]~10_combout\ : std_logic;
SIGNAL \rst~combout\ : std_logic;
SIGNAL \pixelcounter[6]~23\ : std_logic;
SIGNAL \pixelcounter[7]~25\ : std_logic;
SIGNAL \pixelcounter[8]~26_combout\ : std_logic;
SIGNAL \a~0_combout\ : std_logic;
SIGNAL \a~regout\ : std_logic;
SIGNAL \pixelcounter[8]~27\ : std_logic;
SIGNAL \pixelcounter[9]~28_combout\ : std_logic;
SIGNAL \pixelcounter[5]~20_combout\ : std_logic;
SIGNAL \linecounter[9]~0_combout\ : std_logic;
SIGNAL \LessThan12~0_combout\ : std_logic;
SIGNAL \pixelcounter[0]~11\ : std_logic;
SIGNAL \pixelcounter[1]~12_combout\ : std_logic;
SIGNAL \pixelcounter[1]~13\ : std_logic;
SIGNAL \pixelcounter[2]~15\ : std_logic;
SIGNAL \pixelcounter[3]~16_combout\ : std_logic;
SIGNAL \pixelcounter[3]~17\ : std_logic;
SIGNAL \pixelcounter[4]~19\ : std_logic;
SIGNAL \pixelcounter[5]~21\ : std_logic;
SIGNAL \pixelcounter[6]~22_combout\ : std_logic;
SIGNAL \hsync~0_combout\ : std_logic;
SIGNAL \pixelcounter[7]~24_combout\ : std_logic;
SIGNAL \hsync~1_combout\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \linecounter[5]~10_combout\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \linecounter[6]~7_combout\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \linecounter[3]~11_combout\ : std_logic;
SIGNAL \Add1~13\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \linecounter[7]~6_combout\ : std_logic;
SIGNAL \Add1~15\ : std_logic;
SIGNAL \Add1~16_combout\ : std_logic;
SIGNAL \linecounter[8]~5_combout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \linecounter[4]~8_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Equal1~2_combout\ : std_logic;
SIGNAL \pixelcounter[2]~14_combout\ : std_logic;
SIGNAL \linecounter[9]~2_combout\ : std_logic;
SIGNAL \linecounter[9]~1_combout\ : std_logic;
SIGNAL \linecounter[9]~3_combout\ : std_logic;
SIGNAL \linecounter[0]~13_combout\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \linecounter[1]~12_combout\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \linecounter[2]~9_combout\ : std_logic;
SIGNAL \vsync~1_combout\ : std_logic;
SIGNAL \vsync~0_combout\ : std_logic;
SIGNAL \vsync~2_combout\ : std_logic;
SIGNAL \red~4_combout\ : std_logic;
SIGNAL \red~5_combout\ : std_logic;
SIGNAL \red~1_combout\ : std_logic;
SIGNAL \red~6_combout\ : std_logic;
SIGNAL \red~3_combout\ : std_logic;
SIGNAL \red~7_combout\ : std_logic;
SIGNAL \green~0_combout\ : std_logic;
SIGNAL \green~1_combout\ : std_logic;
SIGNAL \green~2_combout\ : std_logic;
SIGNAL \blue~0_combout\ : std_logic;
SIGNAL \blue~1_combout\ : std_logic;
SIGNAL pixelcounter : std_logic_vector(9 DOWNTO 0);
SIGNAL linecounter : std_logic_vector(9 DOWNTO 0);
SIGNAL \ALT_INV_rst~combout\ : std_logic;

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

-- Location: LCFF_X44_Y13_N11
\pixelcounter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \pixelcounter[4]~18_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \LessThan12~0_combout\,
	ena => \a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pixelcounter(4));

-- Location: LCCOMB_X44_Y13_N10
\pixelcounter[4]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \pixelcounter[4]~18_combout\ = (pixelcounter(4) & (\pixelcounter[3]~17\ $ (GND))) # (!pixelcounter(4) & (!\pixelcounter[3]~17\ & VCC))
-- \pixelcounter[4]~19\ = CARRY((pixelcounter(4) & !\pixelcounter[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pixelcounter(4),
	datad => VCC,
	cin => \pixelcounter[3]~17\,
	combout => \pixelcounter[4]~18_combout\,
	cout => \pixelcounter[4]~19\);

-- Location: LCCOMB_X45_Y13_N0
\Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = linecounter(0) $ (VCC)
-- \Add1~1\ = CARRY(linecounter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => linecounter(0),
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: LCCOMB_X45_Y13_N16
\Add1~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~16_combout\ = (linecounter(8) & (\Add1~15\ $ (GND))) # (!linecounter(8) & (!\Add1~15\ & VCC))
-- \Add1~17\ = CARRY((linecounter(8) & !\Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => linecounter(8),
	datad => VCC,
	cin => \Add1~15\,
	combout => \Add1~16_combout\,
	cout => \Add1~17\);

-- Location: LCCOMB_X45_Y13_N18
\Add1~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~18_combout\ = linecounter(9) $ (\Add1~17\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => linecounter(9),
	cin => \Add1~17\,
	combout => \Add1~18_combout\);

-- Location: LCFF_X46_Y13_N17
\linecounter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \linecounter[9]~4_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => linecounter(9));

-- Location: LCCOMB_X43_Y13_N24
\red~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \red~0_combout\ = (pixelcounter(6) & (pixelcounter(5) & pixelcounter(8))) # (!pixelcounter(6) & (!pixelcounter(5) & !pixelcounter(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => pixelcounter(6),
	datac => pixelcounter(5),
	datad => pixelcounter(8),
	combout => \red~0_combout\);

-- Location: LCCOMB_X46_Y13_N10
\red~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \red~2_combout\ = (!linecounter(5) & (!linecounter(4) & ((!linecounter(3)) # (!linecounter(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => linecounter(5),
	datab => linecounter(2),
	datac => linecounter(3),
	datad => linecounter(4),
	combout => \red~2_combout\);

-- Location: LCCOMB_X46_Y13_N16
\linecounter[9]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \linecounter[9]~4_combout\ = (!\Equal1~2_combout\ & ((\linecounter[9]~3_combout\ & (linecounter(9))) # (!\linecounter[9]~3_combout\ & ((\Add1~18_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \linecounter[9]~3_combout\,
	datab => \Equal1~2_combout\,
	datac => linecounter(9),
	datad => \Add1~18_combout\,
	combout => \linecounter[9]~4_combout\);

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

-- Location: LCCOMB_X44_Y13_N2
\pixelcounter[0]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \pixelcounter[0]~10_combout\ = pixelcounter(0) $ (VCC)
-- \pixelcounter[0]~11\ = CARRY(pixelcounter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => pixelcounter(0),
	datad => VCC,
	combout => \pixelcounter[0]~10_combout\,
	cout => \pixelcounter[0]~11\);

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

-- Location: LCCOMB_X44_Y13_N14
\pixelcounter[6]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \pixelcounter[6]~22_combout\ = (pixelcounter(6) & (\pixelcounter[5]~21\ $ (GND))) # (!pixelcounter(6) & (!\pixelcounter[5]~21\ & VCC))
-- \pixelcounter[6]~23\ = CARRY((pixelcounter(6) & !\pixelcounter[5]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pixelcounter(6),
	datad => VCC,
	cin => \pixelcounter[5]~21\,
	combout => \pixelcounter[6]~22_combout\,
	cout => \pixelcounter[6]~23\);

-- Location: LCCOMB_X44_Y13_N16
\pixelcounter[7]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \pixelcounter[7]~24_combout\ = (pixelcounter(7) & (!\pixelcounter[6]~23\)) # (!pixelcounter(7) & ((\pixelcounter[6]~23\) # (GND)))
-- \pixelcounter[7]~25\ = CARRY((!\pixelcounter[6]~23\) # (!pixelcounter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pixelcounter(7),
	datad => VCC,
	cin => \pixelcounter[6]~23\,
	combout => \pixelcounter[7]~24_combout\,
	cout => \pixelcounter[7]~25\);

-- Location: LCCOMB_X44_Y13_N18
\pixelcounter[8]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \pixelcounter[8]~26_combout\ = (pixelcounter(8) & (\pixelcounter[7]~25\ $ (GND))) # (!pixelcounter(8) & (!\pixelcounter[7]~25\ & VCC))
-- \pixelcounter[8]~27\ = CARRY((pixelcounter(8) & !\pixelcounter[7]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pixelcounter(8),
	datad => VCC,
	cin => \pixelcounter[7]~25\,
	combout => \pixelcounter[8]~26_combout\,
	cout => \pixelcounter[8]~27\);

-- Location: LCCOMB_X43_Y13_N20
\a~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \a~0_combout\ = !\a~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \a~regout\,
	combout => \a~0_combout\);

-- Location: LCFF_X43_Y13_N21
a : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \a~0_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \a~regout\);

-- Location: LCFF_X44_Y13_N19
\pixelcounter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \pixelcounter[8]~26_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \LessThan12~0_combout\,
	ena => \a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pixelcounter(8));

-- Location: LCCOMB_X44_Y13_N20
\pixelcounter[9]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \pixelcounter[9]~28_combout\ = pixelcounter(9) $ (\pixelcounter[8]~27\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pixelcounter(9),
	cin => \pixelcounter[8]~27\,
	combout => \pixelcounter[9]~28_combout\);

-- Location: LCFF_X44_Y13_N21
\pixelcounter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \pixelcounter[9]~28_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \LessThan12~0_combout\,
	ena => \a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pixelcounter(9));

-- Location: LCCOMB_X44_Y13_N12
\pixelcounter[5]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \pixelcounter[5]~20_combout\ = (pixelcounter(5) & (!\pixelcounter[4]~19\)) # (!pixelcounter(5) & ((\pixelcounter[4]~19\) # (GND)))
-- \pixelcounter[5]~21\ = CARRY((!\pixelcounter[4]~19\) # (!pixelcounter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pixelcounter(5),
	datad => VCC,
	cin => \pixelcounter[4]~19\,
	combout => \pixelcounter[5]~20_combout\,
	cout => \pixelcounter[5]~21\);

-- Location: LCFF_X44_Y13_N13
\pixelcounter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \pixelcounter[5]~20_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \LessThan12~0_combout\,
	ena => \a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pixelcounter(5));

-- Location: LCCOMB_X44_Y13_N22
\linecounter[9]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \linecounter[9]~0_combout\ = (!pixelcounter(7) & (!pixelcounter(6) & !pixelcounter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pixelcounter(7),
	datac => pixelcounter(6),
	datad => pixelcounter(5),
	combout => \linecounter[9]~0_combout\);

-- Location: LCCOMB_X44_Y13_N28
\LessThan12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan12~0_combout\ = (pixelcounter(8) & (pixelcounter(9) & !\linecounter[9]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => pixelcounter(8),
	datac => pixelcounter(9),
	datad => \linecounter[9]~0_combout\,
	combout => \LessThan12~0_combout\);

-- Location: LCFF_X44_Y13_N3
\pixelcounter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \pixelcounter[0]~10_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \LessThan12~0_combout\,
	ena => \a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pixelcounter(0));

-- Location: LCCOMB_X44_Y13_N4
\pixelcounter[1]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \pixelcounter[1]~12_combout\ = (pixelcounter(1) & (!\pixelcounter[0]~11\)) # (!pixelcounter(1) & ((\pixelcounter[0]~11\) # (GND)))
-- \pixelcounter[1]~13\ = CARRY((!\pixelcounter[0]~11\) # (!pixelcounter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pixelcounter(1),
	datad => VCC,
	cin => \pixelcounter[0]~11\,
	combout => \pixelcounter[1]~12_combout\,
	cout => \pixelcounter[1]~13\);

-- Location: LCFF_X44_Y13_N5
\pixelcounter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \pixelcounter[1]~12_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \LessThan12~0_combout\,
	ena => \a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pixelcounter(1));

-- Location: LCCOMB_X44_Y13_N6
\pixelcounter[2]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \pixelcounter[2]~14_combout\ = (pixelcounter(2) & (\pixelcounter[1]~13\ $ (GND))) # (!pixelcounter(2) & (!\pixelcounter[1]~13\ & VCC))
-- \pixelcounter[2]~15\ = CARRY((pixelcounter(2) & !\pixelcounter[1]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pixelcounter(2),
	datad => VCC,
	cin => \pixelcounter[1]~13\,
	combout => \pixelcounter[2]~14_combout\,
	cout => \pixelcounter[2]~15\);

-- Location: LCCOMB_X44_Y13_N8
\pixelcounter[3]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \pixelcounter[3]~16_combout\ = (pixelcounter(3) & (!\pixelcounter[2]~15\)) # (!pixelcounter(3) & ((\pixelcounter[2]~15\) # (GND)))
-- \pixelcounter[3]~17\ = CARRY((!\pixelcounter[2]~15\) # (!pixelcounter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pixelcounter(3),
	datad => VCC,
	cin => \pixelcounter[2]~15\,
	combout => \pixelcounter[3]~16_combout\,
	cout => \pixelcounter[3]~17\);

-- Location: LCFF_X44_Y13_N9
\pixelcounter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \pixelcounter[3]~16_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \LessThan12~0_combout\,
	ena => \a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pixelcounter(3));

-- Location: LCFF_X44_Y13_N15
\pixelcounter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \pixelcounter[6]~22_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \LessThan12~0_combout\,
	ena => \a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pixelcounter(6));

-- Location: LCCOMB_X43_Y13_N28
\hsync~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \hsync~0_combout\ = ((pixelcounter(4) & (pixelcounter(6) & pixelcounter(5))) # (!pixelcounter(4) & (!pixelcounter(6) & !pixelcounter(5)))) # (!pixelcounter(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pixelcounter(4),
	datab => pixelcounter(6),
	datac => pixelcounter(5),
	datad => pixelcounter(9),
	combout => \hsync~0_combout\);

-- Location: LCFF_X44_Y13_N17
\pixelcounter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \pixelcounter[7]~24_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \LessThan12~0_combout\,
	ena => \a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pixelcounter(7));

-- Location: LCCOMB_X43_Y13_N26
\hsync~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \hsync~1_combout\ = (\hsync~0_combout\) # ((pixelcounter(8)) # (!pixelcounter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \hsync~0_combout\,
	datac => pixelcounter(7),
	datad => pixelcounter(8),
	combout => \hsync~1_combout\);

-- Location: LCCOMB_X45_Y13_N4
\Add1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = (linecounter(2) & (\Add1~3\ $ (GND))) # (!linecounter(2) & (!\Add1~3\ & VCC))
-- \Add1~5\ = CARRY((linecounter(2) & !\Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => linecounter(2),
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X45_Y13_N6
\Add1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (linecounter(3) & (!\Add1~5\)) # (!linecounter(3) & ((\Add1~5\) # (GND)))
-- \Add1~7\ = CARRY((!\Add1~5\) # (!linecounter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => linecounter(3),
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X45_Y13_N8
\Add1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = (linecounter(4) & (\Add1~7\ $ (GND))) # (!linecounter(4) & (!\Add1~7\ & VCC))
-- \Add1~9\ = CARRY((linecounter(4) & !\Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => linecounter(4),
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: LCCOMB_X45_Y13_N10
\Add1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (linecounter(5) & (!\Add1~9\)) # (!linecounter(5) & ((\Add1~9\) # (GND)))
-- \Add1~11\ = CARRY((!\Add1~9\) # (!linecounter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => linecounter(5),
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X46_Y13_N20
\linecounter[5]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \linecounter[5]~10_combout\ = (!\Equal1~2_combout\ & ((\linecounter[9]~3_combout\ & (linecounter(5))) # (!\linecounter[9]~3_combout\ & ((\Add1~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \linecounter[9]~3_combout\,
	datab => \Equal1~2_combout\,
	datac => linecounter(5),
	datad => \Add1~10_combout\,
	combout => \linecounter[5]~10_combout\);

-- Location: LCFF_X46_Y13_N21
\linecounter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \linecounter[5]~10_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => linecounter(5));

-- Location: LCCOMB_X45_Y13_N12
\Add1~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = (linecounter(6) & (\Add1~11\ $ (GND))) # (!linecounter(6) & (!\Add1~11\ & VCC))
-- \Add1~13\ = CARRY((linecounter(6) & !\Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => linecounter(6),
	datad => VCC,
	cin => \Add1~11\,
	combout => \Add1~12_combout\,
	cout => \Add1~13\);

-- Location: LCCOMB_X45_Y13_N24
\linecounter[6]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \linecounter[6]~7_combout\ = (!\Equal1~2_combout\ & ((\linecounter[9]~3_combout\ & (linecounter(6))) # (!\linecounter[9]~3_combout\ & ((\Add1~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \linecounter[9]~3_combout\,
	datab => \Equal1~2_combout\,
	datac => linecounter(6),
	datad => \Add1~12_combout\,
	combout => \linecounter[6]~7_combout\);

-- Location: LCFF_X45_Y13_N25
\linecounter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \linecounter[6]~7_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => linecounter(6));

-- Location: LCCOMB_X45_Y13_N20
\linecounter[3]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \linecounter[3]~11_combout\ = (!\Equal1~2_combout\ & ((\linecounter[9]~3_combout\ & (linecounter(3))) # (!\linecounter[9]~3_combout\ & ((\Add1~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \linecounter[9]~3_combout\,
	datab => \Equal1~2_combout\,
	datac => linecounter(3),
	datad => \Add1~6_combout\,
	combout => \linecounter[3]~11_combout\);

-- Location: LCFF_X45_Y13_N21
\linecounter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \linecounter[3]~11_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => linecounter(3));

-- Location: LCCOMB_X45_Y13_N14
\Add1~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = (linecounter(7) & (!\Add1~13\)) # (!linecounter(7) & ((\Add1~13\) # (GND)))
-- \Add1~15\ = CARRY((!\Add1~13\) # (!linecounter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => linecounter(7),
	datad => VCC,
	cin => \Add1~13\,
	combout => \Add1~14_combout\,
	cout => \Add1~15\);

-- Location: LCCOMB_X45_Y13_N30
\linecounter[7]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \linecounter[7]~6_combout\ = (!\Equal1~2_combout\ & ((\linecounter[9]~3_combout\ & ((linecounter(7)))) # (!\linecounter[9]~3_combout\ & (\Add1~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \linecounter[9]~3_combout\,
	datab => \Add1~14_combout\,
	datac => linecounter(7),
	datad => \Equal1~2_combout\,
	combout => \linecounter[7]~6_combout\);

-- Location: LCFF_X45_Y13_N31
\linecounter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \linecounter[7]~6_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => linecounter(7));

-- Location: LCCOMB_X45_Y13_N28
\linecounter[8]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \linecounter[8]~5_combout\ = (!\Equal1~2_combout\ & ((\linecounter[9]~3_combout\ & (linecounter(8))) # (!\linecounter[9]~3_combout\ & ((\Add1~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \linecounter[9]~3_combout\,
	datab => \Equal1~2_combout\,
	datac => linecounter(8),
	datad => \Add1~16_combout\,
	combout => \linecounter[8]~5_combout\);

-- Location: LCFF_X45_Y13_N29
\linecounter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \linecounter[8]~5_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => linecounter(8));

-- Location: LCCOMB_X46_Y13_N8
\Equal1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = (!linecounter(7) & (linecounter(2) & (linecounter(3) & !linecounter(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => linecounter(7),
	datab => linecounter(2),
	datac => linecounter(3),
	datad => linecounter(8),
	combout => \Equal1~1_combout\);

-- Location: LCCOMB_X44_Y13_N0
\linecounter[4]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \linecounter[4]~8_combout\ = (!\Equal1~2_combout\ & ((\linecounter[9]~3_combout\ & ((linecounter(4)))) # (!\linecounter[9]~3_combout\ & (\Add1~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \linecounter[9]~3_combout\,
	datab => \Add1~8_combout\,
	datac => linecounter(4),
	datad => \Equal1~2_combout\,
	combout => \linecounter[4]~8_combout\);

-- Location: LCFF_X44_Y13_N1
\linecounter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \linecounter[4]~8_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => linecounter(4));

-- Location: LCCOMB_X46_Y13_N22
\Equal1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (!linecounter(0) & (!linecounter(1) & (!linecounter(5) & !linecounter(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => linecounter(0),
	datab => linecounter(1),
	datac => linecounter(5),
	datad => linecounter(4),
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X46_Y13_N30
\Equal1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal1~2_combout\ = (linecounter(9) & (!linecounter(6) & (\Equal1~1_combout\ & \Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => linecounter(9),
	datab => linecounter(6),
	datac => \Equal1~1_combout\,
	datad => \Equal1~0_combout\,
	combout => \Equal1~2_combout\);

-- Location: LCFF_X44_Y13_N7
\pixelcounter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \pixelcounter[2]~14_combout\,
	aclr => \ALT_INV_rst~combout\,
	sclr => \LessThan12~0_combout\,
	ena => \a~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => pixelcounter(2));

-- Location: LCCOMB_X44_Y13_N24
\linecounter[9]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \linecounter[9]~2_combout\ = ((!pixelcounter(2)) # (!pixelcounter(1))) # (!pixelcounter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => pixelcounter(0),
	datac => pixelcounter(1),
	datad => pixelcounter(2),
	combout => \linecounter[9]~2_combout\);

-- Location: LCCOMB_X44_Y13_N26
\linecounter[9]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \linecounter[9]~1_combout\ = (((!pixelcounter(8)) # (!pixelcounter(9))) # (!pixelcounter(3))) # (!pixelcounter(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pixelcounter(4),
	datab => pixelcounter(3),
	datac => pixelcounter(9),
	datad => pixelcounter(8),
	combout => \linecounter[9]~1_combout\);

-- Location: LCCOMB_X44_Y13_N30
\linecounter[9]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \linecounter[9]~3_combout\ = (((\linecounter[9]~2_combout\) # (\linecounter[9]~1_combout\)) # (!\linecounter[9]~0_combout\)) # (!\a~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a~regout\,
	datab => \linecounter[9]~0_combout\,
	datac => \linecounter[9]~2_combout\,
	datad => \linecounter[9]~1_combout\,
	combout => \linecounter[9]~3_combout\);

-- Location: LCCOMB_X46_Y13_N24
\linecounter[0]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \linecounter[0]~13_combout\ = (!\Equal1~2_combout\ & ((\linecounter[9]~3_combout\ & ((linecounter(0)))) # (!\linecounter[9]~3_combout\ & (\Add1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \Equal1~2_combout\,
	datac => linecounter(0),
	datad => \linecounter[9]~3_combout\,
	combout => \linecounter[0]~13_combout\);

-- Location: LCFF_X46_Y13_N25
\linecounter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \linecounter[0]~13_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => linecounter(0));

-- Location: LCCOMB_X45_Y13_N2
\Add1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (linecounter(1) & (!\Add1~1\)) # (!linecounter(1) & ((\Add1~1\) # (GND)))
-- \Add1~3\ = CARRY((!\Add1~1\) # (!linecounter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => linecounter(1),
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X45_Y13_N22
\linecounter[1]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \linecounter[1]~12_combout\ = (!\Equal1~2_combout\ & ((\linecounter[9]~3_combout\ & ((linecounter(1)))) # (!\linecounter[9]~3_combout\ & (\Add1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \linecounter[9]~3_combout\,
	datab => \Add1~2_combout\,
	datac => linecounter(1),
	datad => \Equal1~2_combout\,
	combout => \linecounter[1]~12_combout\);

-- Location: LCFF_X45_Y13_N23
\linecounter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \linecounter[1]~12_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => linecounter(1));

-- Location: LCCOMB_X45_Y13_N26
\linecounter[2]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \linecounter[2]~9_combout\ = (!\Equal1~2_combout\ & ((\linecounter[9]~3_combout\ & ((linecounter(2)))) # (!\linecounter[9]~3_combout\ & (\Add1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \linecounter[9]~3_combout\,
	datab => \Add1~4_combout\,
	datac => linecounter(2),
	datad => \Equal1~2_combout\,
	combout => \linecounter[2]~9_combout\);

-- Location: LCFF_X45_Y13_N27
\linecounter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \linecounter[2]~9_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => linecounter(2));

-- Location: LCCOMB_X46_Y13_N18
\vsync~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \vsync~1_combout\ = ((linecounter(2)) # ((linecounter(4)) # (!linecounter(3)))) # (!linecounter(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => linecounter(5),
	datab => linecounter(2),
	datac => linecounter(3),
	datad => linecounter(4),
	combout => \vsync~1_combout\);

-- Location: LCCOMB_X46_Y13_N26
\vsync~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \vsync~0_combout\ = (linecounter(9)) # (((!linecounter(6)) # (!linecounter(7))) # (!linecounter(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => linecounter(9),
	datab => linecounter(8),
	datac => linecounter(7),
	datad => linecounter(6),
	combout => \vsync~0_combout\);

-- Location: LCCOMB_X46_Y13_N4
\vsync~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \vsync~2_combout\ = (\vsync~1_combout\) # ((\vsync~0_combout\) # (!linecounter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vsync~1_combout\,
	datac => \vsync~0_combout\,
	datad => linecounter(1),
	combout => \vsync~2_combout\);

-- Location: LCCOMB_X46_Y13_N14
\red~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \red~4_combout\ = (linecounter(2)) # (linecounter(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => linecounter(2),
	datac => linecounter(3),
	combout => \red~4_combout\);

-- Location: LCCOMB_X46_Y13_N12
\red~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \red~5_combout\ = (linecounter(8) & (linecounter(6) & ((\red~4_combout\) # (!\Equal1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~0_combout\,
	datab => linecounter(8),
	datac => \red~4_combout\,
	datad => linecounter(6),
	combout => \red~5_combout\);

-- Location: LCCOMB_X43_Y13_N22
\red~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \red~1_combout\ = (pixelcounter(9)) # ((pixelcounter(7) & (\red~0_combout\)) # (!pixelcounter(7) & ((!pixelcounter(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \red~0_combout\,
	datab => pixelcounter(9),
	datac => pixelcounter(7),
	datad => pixelcounter(8),
	combout => \red~1_combout\);

-- Location: LCCOMB_X46_Y13_N6
\red~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \red~6_combout\ = (linecounter(9)) # (linecounter(8) $ (!linecounter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101111101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => linecounter(9),
	datab => linecounter(8),
	datac => linecounter(7),
	combout => \red~6_combout\);

-- Location: LCCOMB_X46_Y13_N28
\red~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \red~3_combout\ = (\red~2_combout\ & (!linecounter(8) & !linecounter(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \red~2_combout\,
	datab => linecounter(8),
	datad => linecounter(6),
	combout => \red~3_combout\);

-- Location: LCCOMB_X43_Y13_N8
\red~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \red~7_combout\ = (!\red~5_combout\ & (\red~1_combout\ & (!\red~6_combout\ & !\red~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \red~5_combout\,
	datab => \red~1_combout\,
	datac => \red~6_combout\,
	datad => \red~3_combout\,
	combout => \red~7_combout\);

-- Location: LCCOMB_X43_Y13_N14
\green~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \green~0_combout\ = (pixelcounter(7) & ((pixelcounter(6) & ((pixelcounter(5)) # (!pixelcounter(8)))) # (!pixelcounter(6) & (pixelcounter(5) & !pixelcounter(8))))) # (!pixelcounter(7) & (!pixelcounter(6) & ((pixelcounter(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pixelcounter(7),
	datab => pixelcounter(6),
	datac => pixelcounter(5),
	datad => pixelcounter(8),
	combout => \green~0_combout\);

-- Location: LCCOMB_X43_Y13_N12
\green~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \green~1_combout\ = (\green~0_combout\) # (pixelcounter(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \green~0_combout\,
	datad => pixelcounter(9),
	combout => \green~1_combout\);

-- Location: LCCOMB_X43_Y13_N2
\green~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \green~2_combout\ = (\green~1_combout\ & (!\red~3_combout\ & (!\red~6_combout\ & !\red~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \green~1_combout\,
	datab => \red~3_combout\,
	datac => \red~6_combout\,
	datad => \red~5_combout\,
	combout => \green~2_combout\);

-- Location: LCCOMB_X43_Y13_N0
\blue~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \blue~0_combout\ = (pixelcounter(9)) # ((pixelcounter(8) & ((pixelcounter(7)) # (pixelcounter(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pixelcounter(7),
	datab => pixelcounter(9),
	datac => pixelcounter(6),
	datad => pixelcounter(8),
	combout => \blue~0_combout\);

-- Location: LCCOMB_X43_Y13_N6
\blue~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \blue~1_combout\ = (!\red~5_combout\ & (\blue~0_combout\ & (!\red~6_combout\ & !\red~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \red~5_combout\,
	datab => \blue~0_combout\,
	datac => \red~6_combout\,
	datad => \red~3_combout\,
	combout => \blue~1_combout\);

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
	datain => \hsync~1_combout\,
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
	datain => \vsync~2_combout\,
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
	datain => \red~7_combout\,
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
	datain => \red~7_combout\,
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
	datain => \red~7_combout\,
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
	datain => \red~7_combout\,
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
	datain => \green~2_combout\,
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
	datain => \green~2_combout\,
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
	datain => \green~2_combout\,
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
	datain => \green~2_combout\,
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
	datain => \blue~1_combout\,
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
	datain => \blue~1_combout\,
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
	datain => \blue~1_combout\,
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
	datain => \blue~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_blue(3));
END structure;


