library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity PanelDisplay is
port (clk : in std_logic;
  rst : in std_logic;
  hsync : out std_logic;
  vsync : out std_logic;
  red : out std_logic_vector(3 downto 0);
  green : out std_logic_vector(3 downto 0);
  blue : out std_logic_vector(3 downto 0);
  dataIn        : in  std_logic_vector(15 downto 0); -- Data from system ram
  write_address : in  std_logic_vector(7 downto 0)
);
end PanelDisplay;

architecture potato of PanelDisplay is
  signal done : std_logic;
	signal temp : std_logic;
	signal horiz_count : std_logic_vector(9 downto 0);
	signal vertical_count : std_logic_vector(9 downto 0);
	signal pixel:std_logic;
	signal color:std_logic_vector(1 downto 0);
	signal valid: std_logic;

component FrameBuffer
port(
	clk : in std_logic;
	rst : in std_logic;
	pixel: out std_logic;
	color: out std_logic_vector(1 downto 0);
	valid:in std_logic;
  	dataIn        : in  std_logic_vector(15 downto 0); -- Data from system ram
	write_address : in  std_logic_vector(7 downto 0)
	);
end component FrameBuffer;


begin

F: FrameBuffer port map(
clk=>clk,
rst=>rst,
pixel=>pixel,
color=>color,
valid=>valid,
dataIn=>dataIn,
 write_address=>write_address

);
	process(clk,rst)
		begin
		if (rst='0') then
			temp <= '0';
		elsif rising_edge(clk) then
				if (temp='0')then
					temp <='1';
				else
					temp<='0';
				end if;
			end if;
		end process;

process(clk,rst)
  begin
if (rst='0') then
horiz_count<="0000000000";
else
if rising_edge(clk) then
  if (temp='1') then

	   if (horiz_count<799) then
	   horiz_count<=horiz_count+1;

	   else
	     horiz_count<="0000000000";

	   end if;
end if;
end if;
end if;
end process;

 done <='1' when (horiz_count=799) else '0';
process(clk,rst)
  begin
if (rst='0') then
vertical_count<= "0000000000";
else
if rising_edge(clk) then
	if (temp='1') then
	 if (vertical_count<524 and done='1') then
	 vertical_count<=vertical_count+1;
	 else
	   vertical_count<=vertical_count;
	 end if;
	 if (vertical_count=523) then
	   vertical_count<="0000000000";
	 end if;
end if;
 end if;
 end if;
end process;

hsync<='0' when(horiz_count>655 and horiz_count<751) else '1';
vsync<='0' when(vertical_count>490 and vertical_count<492) else'1';

valid<='1' when (horiz_count>=100 and horiz_count<=519) and (vertical_count>=50 and vertical_count<=409) else '0';

red<="1111" when(valid='1' and pixel='1' and color=1) else "0000";
blue<="1111" when(valid='1' and pixel='0' ) else "0000";
green<="1111" when(valid='1' and pixel='1' and color=2) else "0000";

end potato;
