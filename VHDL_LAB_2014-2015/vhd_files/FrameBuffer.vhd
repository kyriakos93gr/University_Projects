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
	pixel: out std_logic;
	color: out std_logic_vector(1 downto 0);
	valid: in std_logic;
	dataIn        : in  std_logic_vector(15 downto 0); -- Data from system ram
	write_address : in  std_logic_vector(7 downto 0)
	);
end FrameBuffer;

architecture rtl of FrameBuffer is

	signal read_address : std_logic_vector(7 downto 0);
	signal data :  std_logic_vector(59 downto 0);
	signal pixel_now: std_logic_vector(6 downto 0);
	signal v_count:std_logic_vector(9 downto 0);
	signal h_count:std_logic_vector(6 downto 0);
	signal temp:std_logic;
	signal count:std_logic_vector(4 downto 0);

	type memory is array(0 to 41) of std_logic_vector(1 downto 0);
	signal    ram_block: memory;
	-- attribute ram_init_file : string;
	-- attribute ram_init_file of ram_block : signal is "diff_out.mif";





	component Faces
	port(
		face_address : in std_logic_vector(7 downto 0);
		data : out std_logic_vector(59 downto 0)
		);
	end component Faces;


begin

	F: Faces port map(face_address=>read_address,	data=>data);


	mem_update: process(clk)
	begin
		if rising_edge(clk) then
			ram_block(to_integer(unsigned(write_address))) <= dataIn(1 downto 0);
		end if;
	end process;


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
	if rst='0' then
		read_address<=(others=>'0');
		pixel_now<="0111011";--59
		v_count<=(others=>'0');
		h_count<=(others=>'0');
	elsif rising_edge(clk) then
	if valid='1' then
	if temp='1' then
		pixel<=data(conv_integer(pixel_now));
		pixel_now<=pixel_now-1;


		if pixel_now=0 then
			pixel_now<="0111011";
				if v_count=359 and h_count=6 then
					v_count<=(others=>'0');
					h_count<=(others=>'0');
					read_address<=(others=>'0');
				elsif h_count=6 and v_count=299 then
					read_address<=(others=>'0');
					h_count<=(others=>'0');
					v_count<=v_count+1;
				elsif h_count=6 and v_count=239 then
					read_address<=(others=>'0');
					h_count<=(others=>'0');
					v_count<=v_count+1;
				elsif h_count=6 and v_count=179 then
					read_address<=(others=>'0');
					h_count<=(others=>'0');
					v_count<=v_count+1;
				elsif h_count=6 and v_count=119 then
					read_address<=(others=>'0');
					h_count<=(others=>'0');
					v_count<=v_count+1;
				elsif h_count=6 and v_count=59 then
					read_address<=(others=>'0');
					h_count<=(others=>'0');
					v_count<=v_count+1;
				elsif h_count=6 then
					read_address<=read_address+1;
					h_count<=(others=>'0');
					v_count<=v_count+1;
				else
					h_count<=h_count+1;
				end if;

		end if;
		end if;
		end if;



	end if;

	end process;




	process(clk,rst)
		begin
	if rst='0' then
	color<="00";
	elsif rising_edge(clk) then

	if h_count=0 then

		if v_count<=59 then
			color<=ram_block(0);
		elsif v_count>=60 and v_count<=119 then
			color<=ram_block(7);
		elsif v_count>=120 and v_count<=179 then
			color<=ram_block(14);
		elsif v_count>=180 and v_count<=239 then
			color<=ram_block(21);
		elsif v_count>=240 and v_count<=299 then
			color<=ram_block(28);
		elsif v_count>=300 and v_count<=360 then
			color<=ram_block(35);
		end if;

	elsif h_count=1 then

		if v_count<=59 then
			color<=ram_block(1);
		elsif v_count>=60 and v_count<=119 then
			color<=ram_block(8);
		elsif v_count>=120 and v_count<=179 then
			color<=ram_block(15);
		elsif v_count>=180 and v_count<=239 then
			color<=ram_block(22);
		elsif v_count>=240 and v_count<=299 then
			color<=ram_block(29);
		elsif v_count>=300 and v_count<=360 then
			color<=ram_block(36);
		end if;

	elsif h_count=2 then

		if v_count<=59 then
			color<=ram_block(2);
		elsif v_count>=60 and v_count<=119 then
			color<=ram_block(9);
		elsif v_count>=120 and v_count<=179 then
			color<=ram_block(16);
		elsif v_count>=180 and v_count<=239 then
			color<=ram_block(23);
		elsif v_count>=240 and v_count<=299 then
			color<=ram_block(30);
		elsif v_count>=300 and v_count<=360 then
			color<=ram_block(37);
		end if;

	elsif h_count=3 then

		if v_count<=59 then
			color<=ram_block(3);
		elsif v_count>=60 and v_count<=119 then
			color<=ram_block(10);
		elsif v_count>=120 and v_count<=179 then
			color<=ram_block(17);
		elsif v_count>=180 and v_count<=239 then
			color<=ram_block(24);
		elsif v_count>=240 and v_count<=299 then
			color<=ram_block(31);
		elsif v_count>=300 and v_count<=360 then
			color<=ram_block(38);
		end if;

	elsif h_count=4 then

		if v_count<=59 then
			color<=ram_block(4);
		elsif v_count>=60 and v_count<=119 then
			color<=ram_block(11);
		elsif v_count>=120 and v_count<=179 then
			color<=ram_block(18);
		elsif v_count>=180 and v_count<=239 then
			color<=ram_block(25);
		elsif v_count>=240 and v_count<=299 then
			color<=ram_block(32);
		elsif v_count>=300 and v_count<=360 then
			color<=ram_block(39);
		end if;

	elsif h_count=5 then

		if v_count<=59 then
			color<=ram_block(5);
		elsif v_count>=60 and v_count<=119 then
			color<=ram_block(12);
		elsif v_count>=120 and v_count<=179 then
			color<=ram_block(19);
		elsif v_count>=180 and v_count<=239 then
			color<=ram_block(26);
		elsif v_count>=240 and v_count<=299 then
			color<=ram_block(33);
		elsif v_count>=300 and v_count<=360 then
			color<=ram_block(40);
		end if;

	elsif h_count=6 then

		if v_count<=59 then
			color<=ram_block(6);
		elsif v_count>=60 and v_count<=119 then
			color<=ram_block(13);
		elsif v_count>=120 and v_count<=179 then
			color<=ram_block(20);
		elsif v_count>=180 and v_count<=239 then
			color<=ram_block(27);
		elsif v_count>=240 and v_count<=299 then
			color<=ram_block(34);
		elsif v_count>=300 and v_count<=360 then
			color<=ram_block(41);
		end if;
	else
	color<="00";
	end if;


	end if;
	end process;



end rtl;
