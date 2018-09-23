library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity program_counter is
  port (
      clk, rst: in STD_LOGIC;
      read_address_instr: out STD_LOGIC_VECTOR(7 downto 0);
      pc_in:in  STD_LOGIC_VECTOR(7 downto 0)
  );
end program_counter;

architecture pcArch of program_counter is
signal pcReg: STD_LOGIC_VECTOR(7 downto 0) ;
begin


  			pcReg <= x"00" when rst = '1' else  pc_in;
  read_address_instr <= pcReg;
end pcArch;
