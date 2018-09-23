library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;


entity toplevel is
port(clk,rst : in std_logic;
hsync,vsync : out std_logic;
red       : out std_logic_vector(3 downto 0);
green     : out std_logic_vector(3 downto 0);
blue      : out std_logic_vector(3 downto 0));
end toplevel;

architecture bhv of toplevel is


  component char_rom is
	port(
        address : in  std_logic_vector(7 downto 0);   -- 256 addresses in total
        data    : out std_logic_vector(63 downto 0)  -- 64 bits/address
        );
  end component;

  component paneldisplay is
	port(
      clk : in std_logic;
      rst       : in std_logic;
      hsync     : out std_logic;
      vsync     : out std_logic;
      address   : out  std_logic_vector(7 downto 0);   -- 256 addresses in total
      data      : in std_logic_vector (63 downto 0);  -- 64 bits/address
      red       : out std_logic_vector(3 downto 0);
      green     : out std_logic_vector(3 downto 0);
      blue      : out std_logic_vector(3 downto 0)
);
  end component;


  signal address  :  std_logic_vector(7 downto 0);   -- 256 addresses in total
  signal data     :  std_logic_vector(63 downto 0);

  begin

  mem: char_rom port map(address,data);

  disp: paneldisplay port map(clk, rst, hsync, vsync, address, data, red, green, blue);



end bhv;
