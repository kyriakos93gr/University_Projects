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
blue : out std_logic_vector(3 downto 0)


);
end PanelDisplay;


architecture potato of PanelDisplay is
  signal done : std_logic;
	signal temp : std_logic;
	signal horiz_count : std_logic_vector(9 downto 0);
	signal vertical_count : std_logic_vector(9 downto 0);
	signal pixel_now: std_logic_vector(9 downto 0);
	signal v_count:std_logic_vector(9 downto 0);
	signal pixel_row:std_logic_vector(461 downto 0);
	signal pixel:std_logic;
	signal color:std_logic_vector(1 downto 0);
	signal frame_address: std_logic_vector(635 downto 0);
	signal frame_data: std_logic_vector(461 downto 0);
	
	type memory is array(0 to 41) of std_logic_vector(1 downto 0);
	signal    ram_block: memory;
	attribute ram_init_file : string;
	attribute ram_init_file of ram_block : signal is "diff_out.mif";
	
component FrameBuffer
port(
	clk : in std_logic;
	rst : in std_logic;
	frame_address:in std_logic_vector(635 downto 0);
	frame_data:out std_logic_vector(461 downto 0)
);
end component FrameBuffer;
	
begin

 F: FrameBuffer port map(
		clk=>clk,
		rst=>rst,
		frame_address=>frame_address,
		frame_data=>frame_data
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


red<="1111" when  color=1 ;
--blue<="1111" when color=0 and pixel='0' else "0000";

process(clk,rst)
	begin
	if rst='0' then
	frame_address<=(others=>'0');
	pixel_now<="1010000001";--461
	v_count<=(others=>'0');
	
	elsif rising_edge(clk) then
	if temp='1' then
	--if horiz_count<=640 and vertical_count<=480 then
	
	pixel_row<=frame_data;
	pixel<=pixel_row(conv_integer(pixel_now));
	pixel_now<=pixel_now-1;
	
	
		if pixel_now=0 then
			frame_address<=frame_address+1;
			v_count<=v_count+1;
			pixel_now<="1010000001";--461
			
		elsif v_count=635 then
			v_count<=(others=>'0');
		end if;
	
	if pixel_now<=461 and pixel_now>=396 then
	
		if v_count<=105 then
			color<=ram_block(0);
		elsif v_count>=106 and v_count<=211 then 
			color<=ram_block(7);
		elsif v_count>=212 and v_count<=317 then
			color<=ram_block(14);
		elsif v_count>=318 and v_count<=423 then
			color<=ram_block(21);
		elsif v_count>=424 and v_count<=529 then
			color<=ram_block(28);
		elsif v_count>=530 and v_count<=635 then
			color<=ram_block(35);
		end if;
		
	elsif pixel_now<=395 and pixel_now>=330 then
	
		if v_count<=105 then
			color<=ram_block(1);
		elsif v_count>=106 and v_count<=211 then 
			color<=ram_block(8);
		elsif v_count>=212 and v_count<=317 then
			color<=ram_block(15);
		elsif v_count>=318 and v_count<=423 then
			color<=ram_block(22);
		elsif v_count>=424 and v_count<=529 then
			color<=ram_block(29);
		elsif v_count>=530 and v_count<=635 then
			color<=ram_block(36);
		end if;
		
	elsif pixel_now<=329 and pixel_now>=264 then
	
		if v_count<=105 then
			color<=ram_block(2);
		elsif v_count>=106 and v_count<=211 then 
			color<=ram_block(9);
		elsif v_count>=212 and v_count<=317 then
			color<=ram_block(16);
		elsif v_count>=318 and v_count<=423 then
			color<=ram_block(23);
		elsif v_count>=424 and v_count<=529 then
			color<=ram_block(30);
		elsif v_count>=530 and v_count<=635 then
			color<=ram_block(37);
		end if;
		
	elsif pixel_now<=263 and pixel_now>=198 then
	
		if v_count<=105 then
			color<=ram_block(3);
		elsif v_count>=106 and v_count<=211 then 
			color<=ram_block(10);
		elsif v_count>=212 and v_count<=317 then
			color<=ram_block(17);
		elsif v_count>=318 and v_count<=423 then
			color<=ram_block(24);
		elsif v_count>=424 and v_count<=529 then
			color<=ram_block(31);
		elsif v_count>=530 and v_count<=635 then
			color<=ram_block(38);
		end if;
		
	elsif pixel_now<=197 and pixel_now>=132 then
	
		if v_count<=105 then
			color<=ram_block(4);
		elsif v_count>=106 and v_count<=211 then 
			color<=ram_block(11);
		elsif v_count>=212 and v_count<=317 then
			color<=ram_block(18);
		elsif v_count>=318 and v_count<=423 then
			color<=ram_block(25);
		elsif v_count>=424 and v_count<=529 then
			color<=ram_block(32);
		elsif v_count>=530 and v_count<=635 then
			color<=ram_block(39);
		end if;
	
	elsif pixel_now<=131 and pixel_now>=66 then
	
		if v_count<=105 then
			color<=ram_block(5);
		elsif v_count>=106 and v_count<=211 then 
			color<=ram_block(12);
		elsif v_count>=212 and v_count<=317 then
			color<=ram_block(19);
		elsif v_count>=318 and v_count<=423 then
			color<=ram_block(26);
		elsif v_count>=424 and v_count<=529 then
			color<=ram_block(33);
		elsif v_count>=530 and v_count<=635 then
			color<=ram_block(40);
		end if; 
		
	elsif pixel_now<=65 and pixel_now>=0 then
	
		if v_count<=105 then
			color<=ram_block(6);
		elsif v_count>=106 and v_count<=211 then 
			color<=ram_block(13);
		elsif v_count>=212 and v_count<=317 then
			color<=ram_block(20);
		elsif v_count>=318 and v_count<=423 then
			color<=ram_block(27);
		elsif v_count>=424 and v_count<=529 then
			color<=ram_block(34);
		elsif v_count>=530 and v_count<=635 then
			color<=ram_block(41);
		end if;
	else
	color<="00";
	end if;
	end if;
	--end if;
	end if;
	end process;



end potato;
 