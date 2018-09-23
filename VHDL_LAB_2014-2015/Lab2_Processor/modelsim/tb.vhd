library ieee;
use ieee.std_logic_1164.all;

use std.textio.all; -- this is used only for simulatiom

entity tb is
end tb;

architecture test of tb is

  -- component declaration of design-under-test (dut)
  

  component lab2 is
    port(clk,rst : in std_logic;
    led_1,led_2,led_3,led_4: out std_logic);
  end component;

  -- declaration of the input and the outputs of the dut
  signal  led_1  : std_logic;
  signal  led_2  : std_logic;
  signal  led_3  : std_logic;
  signal  led_4  : std_logic;
  signal  clk    : std_logic;
  signal  rst    : std_logic;
begin

  -- Instantiation of dut
  dutx: lab2 port map(clk, rst, led_1, led_2, led_3, led_4);

  -- Generate clock signal
  clock: process
  begin
    clk <= '0';
    wait for 2 ns;
    clk <= '1';
    wait for 2 ns;
  end process;

  -- Generate reset pulse to resetting dut
  reset: process
  begin
    rst <= '0';
    wait for 1 ns;
    rst <= '1';
    wait for 6.5 ns;
    rst <= '0';
    wait;
  end process;



end test;
