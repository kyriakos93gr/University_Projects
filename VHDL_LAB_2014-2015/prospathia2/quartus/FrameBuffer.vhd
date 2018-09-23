library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity FrameBuffer is
port(
	clk : in std_logic;
	rst : in std_logic;
	frame_address:in std_logic_vector(635 downto 0);
	frame_data:out std_logic_vector(461 downto 0)
	);
end FrameBuffer;

architecture rtl of FrameBuffer is
	type RegisterFile is array(0 to 635) of std_logic_vector(461 downto 0);
    	signal Frame: RegisterFile;
		
	
	
	signal frame_row:std_logic_vector(461 downto 0);
	signal row :std_logic_vector(9 downto 0);
	signal read_address : std_logic_vector(7 downto 0);
	signal data :  std_logic_vector(65 downto 0);
	
	
component Faces
port(	
	address : in std_logic_vector(7 downto 0); 
	data : out std_logic_vector(65 downto 0)
	);
end component Faces;



begin

	F: Faces port map(
		address=>read_address,
		data=>data
		);
	

	process(clk,rst)
	begin
	if rst='0' then
	
	read_address<=(others=>'0');
	row<=(others=>'0');
	frame_row<=(others=>'0');

	elsif rising_edge(clk) then
	
	frame_row(461 downto 396)<=data;
	frame_row(395 downto 330)<=data;
	frame_row(329 downto 264)<=data;
	frame_row(263 downto 198)<=data;
	frame_row(197 downto 132)<=data;
	frame_row(131 downto 66)<=data;
	frame_row(65 downto 0)<=data;
	
	Frame(conv_integer(row))<=frame_row;
		if row=635 then
			row<=(others=>'0');
		else
			row<=row+1;
		end if;	
	read_address<=read_address+1;
								
		if read_address="01101001" then
		read_address<=(others=>'0');
		end if;
			
	end if;
	end process;

	process(frame_address)
	begin
		frame_data<=Frame(conv_integer(frame_address));
	end process;
	
	
	
end rtl;

