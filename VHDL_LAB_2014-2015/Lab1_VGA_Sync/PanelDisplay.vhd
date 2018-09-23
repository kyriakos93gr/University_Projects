library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PanelDisplay is
  port (clk : in std_logic;
  rst       : in std_logic;
  hsync     : out std_logic;
  vsync     : out std_logic;
  red       : out std_logic_vector(3 downto 0);
  green     : out std_logic_vector(3 downto 0);
  blue      : out std_logic_vector(3 downto 0));
end PanelDisplay;

architecture syncing of PanelDisplay is

constant HP:  integer:=640;
constant HFP: integer:=16 ;
constant HBP: integer:=48 ;
constant HSP: integer:=96 ;
constant VP:  integer:=480;
constant VFP: integer:=10 ;
constant VBP: integer:=33 ;
constant VSP: integer:=2  ;

signal a,b          : std_logic;
signal pixelclock   : std_logic;
signal pixelcounter : std_logic_vector(9 downto 0);
signal linecounter  : std_logic_vector(9 downto 0);

begin
--reset and a<=b
  process(clk,rst)
  begin
	  if rst='0' then
		 a<='0';
	  elsif	rising_edge(clk) then
		 a<=b;
	  end if;
  end process;
  
  b <= not a;
  pixelclock <= a;
   
 red<=(others=>'1') when( pixelcounter<=(159)  or pixelcounter>(479)) and linecounter>=(140) and linecounter<=(320)  else (others=>'0');
 green<=(others=>'1') when ((pixelcounter>=(160)  and pixelcounter<=(319)) or pixelcounter>(479)) and linecounter>=(140) and linecounter<=(320) else (others=>'0');
 blue<=(others=>'1') when ((pixelcounter>=(320)  and pixelcounter<=(479)) or pixelcounter>(479) )and linecounter>=(140) and linecounter<=(320)  else (others=>'0');
  --hsync
  hsync<='0' when pixelcounter>=(HP+HFP) and pixelcounter<=(HP+HFP+HSP-1) else '1';

  --vsync
  vsync<='0' when linecounter>=(VP+VFP) and linecounter<=(VP+VFP+VSP-1) else '1';
  
  --send  color
  process(clk,rst)
  begin
    --horizontal line
	 if rst='0' then
		pixelcounter<=(others=>'0');	
    elsif rising_edge(clk) then
		 if pixelclock='1' then
			if pixelcounter<=(HP+HFP+HSP+HBP-1) then
				pixelcounter<=pixelcounter+1;
			else
				pixelcounter<=(others=>'0');
			end if;
		end if;
	end if;
  end process;
  
  process(clk,rst)
  begin
  if rst='0' then
		linecounter<=(others=>'0');
  elsif rising_edge(clk) then
	 if pixelclock='1' then
	  if pixelcounter=(HP+HFP+HSP+HBP-1) then
		linecounter<=linecounter+1;
	  end if;
	 end if;
	 if linecounter=(VP+VFP+VSP+VBP-1) then
		linecounter<=(others=>'0');
	end if;
	end if;
 end process;
		
end syncing;
