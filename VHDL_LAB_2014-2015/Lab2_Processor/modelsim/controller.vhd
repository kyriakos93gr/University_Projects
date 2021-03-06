library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity controller is
  port(
    clk, rst: in std_logic;
    read_address_instr: in std_logic_vector(7 downto 0);
    dataOut : in std_logic_vector(15 downto 0);
    dataOut_instr: in std_logic_vector(15 downto 0);
    led_0, led_1, led_2, led_3, led_4, led_5, led_6, led_7, led_8, led_9: out std_logic
  );
end controller;

architecture conArch of controller is
signal tmp : std_logic_vector(15 downto 0);
begin
  led_0<=dataOut(5) when rst='0' else '0';
  led_1<=dataOut(6) when rst='0' else '0';
  led_2<=dataOut(7) when rst='0' else '0';
  led_3<=dataOut(8) when rst='0' else '0';
  led_4<=dataOut(9) when rst='0' else '0';
  led_5<=dataOut(10) when rst='0' else '0';
  led_6<=dataOut(11) when rst='0' else '0';
  led_7<=dataOut(13) when rst='0' else '0';
  led_8<=dataOut(14) when rst='0' else '0';
  led_9<=dataOut(15) when rst='0' else '0';
  -- process (rst)

  -- begin
  --   if rst='1' then
  --     led_1<='0';
  --     led_2<='0';
  --     led_3<='0';
  --     led_4<='0';
  --   -- else
  --   --   if rising_edge(clk) then
  --   --     led_1<=dataOut(0);
  --   --     led_2<=dataOut(1);
  --   --     led_3<=dataOut(2);
  --   --     led_4<=dataOut(3);
  --   --   end if;
  --   end if;
  -- end process;
end conArch;
