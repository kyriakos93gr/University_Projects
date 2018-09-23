library ieee;
use ieee.std_logic_1164.all;

use std.textio.all; -- this is used only for simulatiom

entity inter_contr_test is
end inter_contr_test;

architecture test of inter_contr_test is

  -- component declaration of design-under-test (dut)

  component interrupt_controller is
    port(
      clk, rst             : in std_logic;
      col_1, col_2, col_3, col_4, col_5, col_6, col_7 : in std_logic;
      player : in std_logic;
      interrupt : out std_logic
    );
  end component;

  -- declaration of the input and the outputs of the dut

  signal  clk    : std_logic;
  signal  rst    : std_logic;
  signal  col_1  : std_logic;
  signal  col_2  : std_logic;
  signal  col_3  : std_logic;
  signal  col_4  : std_logic;
  signal  col_5  : std_logic;
  signal  col_6  : std_logic;
  signal  col_7  : std_logic;
  signal  player  : std_logic;
  signal  interrupt  : std_logic;


begin

  -- Instantiation of dut
  dutx: interrupt_controller port map(clk, rst, col_1, col_2, col_3, col_4, col_5, col_6, col_7, player, interrupt);

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
