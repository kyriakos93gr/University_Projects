
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;


entity ram_infer is port(
      clk           : in  std_logic;
	    rst           : in  std_logic;
      dataIn        : in  std_logic_vector(15 downto 0);
      write_address : in  std_logic_vector(7 downto 0);
      read_address  : in  std_logic_vector(7 downto 0);
      we            : in  std_logic;
      dataOut       : out std_logic_vector(15 downto 0));
end ram_infer;

architecture rtl of ram_infer is
   type memory is array(0 to 255) of std_logic_vector(15 downto 0);

-------------------------------------------------------
-- memory initialization for simulation in modelsim
-- synthesis will ignore this initialization
-------------------------------------------------------
 impure function init_my_RAM(mif_file_name : in string) return memory is
    file mif_file : text open read_mode is mif_file_name;
    variable mif_line : line;
    variable temp_bv  : std_logic_vector(15 downto 0);
    variable temp_mem : memory;
     begin
	 for i in memory'range loop
	   if not (endfile (mif_file)) then
          readline(mif_file, mif_line);
		  hread(mif_line, temp_bv);
		  temp_mem(i) := temp_bv;
	   else
	      temp_mem(i) := (others => '0');
      end if;
	  end loop;
	  file_close(mif_file);
    return temp_mem;
end function;

signal ram_block      : memory := init_my_RAM("test");

-------------------------------------------------------
-- initialize memory for altera quartus and fpga programming
-- (does not work for modelsim)
-------------------------------------------------------
--signal    ram_block: memory;
--attribute ram_init_file : string;
--attribute ram_init_file of ram_block : signal is "diff_out.mif";
-------------------------------------------------------

signal data : std_logic_vector(15 downto 0);

BEGIN

  dataOut <= data;
  process(clk)
    begin
      if rising_edge(clk) then
        if (we = '1') then
    		  ram_block(conv_integer(write_address)) <= dataIn;
    		end if;
    		data <= ram_block(conv_integer(read_address));
      end if;
  end process;
END rtl;

--------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity program_counter is
  port (
      clk, rst, pc_enable: in STD_LOGIC;
      read_address: out STD_LOGIC_VECTOR(15 downto 0);
      pc_address: out STD_LOGIC_VECTOR(15 downto 0);
      pc_out:in  STD_LOGIC_VECTOR(15 downto 0)
  );
end program_counter;

architecture pcArch of program_counter is
signal pcReg: STD_LOGIC_VECTOR(15 downto 0) ;
begin
  process(clk) begin
  	if (rising_edge(clk)) then
  		if rst = '1' then
  			pcReg <= x"0000";
      elsif pc_enable='1' then
        pcReg <= pc_out;
  		else
  			pcReg <= pcReg + x"0001";
  		end if;
  	end if;
  end process;
  read_address <= pcReg;
  pc_address<= pcReg;
end pcArch;

-----------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity controller is
  port(
    clk, rst: in std_logic;
    address: in std_logic_vector(15 downto 0);
    dataIn: in std_logic_vector(15 downto 0);
    led_1, led_2, led_3, led_4: out std_logic
  );
end controller;

architecture conArch of controller is

begin
  process (clk)
  variable tmp:std_logic_vector(15 downto 0):=(others=>'0');
  begin
    led_1<='0';
    led_2<='0';
    led_3<='0';
    led_4<='0';
    if address=x"0008" then
      led_1<=dataIn(0);
      led_2<=dataIn(1);
      led_3<=dataIn(2);
      led_4<=dataIn(3);
      for i in 0 to 100000 loop
        tmp:=tmp+1;
      end loop;
    end if;
  end process;
end conArch;

-----------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity cpu is
  port(
    clk, rst: in std_logic;
    pc_enable: out std_logic;
    dataOut: in std_logic_vector(15 downto 0);
    dataIn: out std_logic_vector(15 downto 0);
    pc_address: in STD_LOGIC_VECTOR(15 downto 0);
    read_address: in STD_LOGIC_VECTOR(15 downto 0);
    pc_out :out std_logic_vector(15 downto 0);
    memory_out: out std_logic_vector(15 downto 0)
  );
end cpu;

architecture cpuArch of cpu is
type cpu_array is array(0 to 7) of std_logic_vector(15 downto 0);
signal reg : cpu_array :=(others=>(others=>'0'));
signal temp: std_logic_vector(15 downto 0):=(others=>'0');
begin

instruction_Set:process(clk,rst)
  --allows us to load pc with address if '1'
  --variable temp : std_logic_vector(15 downto 0) := (others=>'0');
  begin
  pc_enable<='0';
  if rising_edge(clk) then
    -- add
  if (dataOut(15 downto 13)="000") then
    reg(to_integer(unsigned(dataOut(12 downto 10))))<=reg(to_integer(unsigned(dataOut(9 downto 7))))+reg(to_integer(signed(dataOut(2 downto 0))));
    -- addi
  elsif (dataOut(15 downto 13)="001") then
    for i in 7 to 15 loop
      temp(i)<= dataOut(6);
    end loop;
    temp(6 downto 0)<= dataOut(6 downto 0);
    reg(to_integer(unsigned(dataOut(12 downto 10))))<=(reg(to_integer(unsigned(dataOut(9 downto 7)))))+temp;
    -- nand
  elsif (dataOut(15 downto 13)="010") then
    reg(to_integer(unsigned(dataOut(12 downto 10))))<=reg(to_integer(unsigned(dataOut(9 downto 7)))) nand reg(to_integer(unsigned(dataOut(2 downto 0))));
    -- lui
  elsif (dataOut(15 downto 13)="011") then
    for i in 6 to 15 loop
      temp(i)<=dataOut(i-6);
    end loop;
    reg(to_integer(unsigned(dataOut(12 downto 10))))(15 downto 6)<= temp(15 downto 6);
    reg(to_integer(unsigned(dataOut(12 downto 10))))(5 downto 0)<=(others=>'0');
    --sw
  elsif (dataOut(15 downto 13)="100") then
    for i in 9 to 15 loop
      temp(i)<=dataOut(i-9);
    end loop;
    memory_out<=reg(to_integer(unsigned(dataOut(9 downto 7)))) +temp(15 downto 9);
    dataIn<=reg(to_integer(unsigned(dataOut(12 downto 10))));
    -- lw
  elsif (dataOut(15 downto 13)="101") then
    for i in 9 to 15 loop
      temp(i)<=dataOut(i-9);
    end loop;
    memory_out<=reg(to_integer(unsigned(dataOut(9 downto 7)))) +temp(15 downto 9);
    reg(to_integer(unsigned(dataOut(12 downto 10))))<=dataOut;
    -- bne
  elsif (dataOut(15 downto 13)="110") then
    for i in 9 to 15 loop
      temp(i)<=dataOut(i-9);
    end loop;
    if reg(to_integer(unsigned(dataOut(12 downto 10))))/=reg(to_integer(unsigned(dataOut(9 downto 7)))) then
      memory_out<=1+pc_address+temp(15 downto 9);
      pc_enable<='1';
    end if;
    -- jalr
--  elsif (dataOut(15 downto 13)="111") then
else
    pc_enable<='1';
    reg(to_integer(unsigned(dataOut(12 downto 10))))<=read_address+1;
    pc_out<= reg(to_integer(unsigned(dataOut(9 downto 7))));
  end if;
end if;
end process;

end cpuArch;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;


entity top_level is
port(clk,rst : in std_logic;
led_1,led_2,led_3,led_4: out std_logic);
end top_level;

architecture bhv of top_level is


  component ram_infer is
	port(
        clk           : in  std_logic;
  	    rst       : in  std_logic;
        dataIn        : in  std_logic_vector(15 downto 0);
        write_address : in  std_logic_vector(7 downto 0);
        read_address  : in  std_logic_vector(7 downto 0);
        we            : in  std_logic;
        dataOut       : out std_logic_vector(15 downto 0)
);
  end component;


  component program_counter is port (
        clk, rst, pc_enable: in STD_LOGIC;
        read_address: out STD_LOGIC_VECTOR(15 downto 0);
        pc_address: out STD_LOGIC_VECTOR(15 downto 0);
        pc_out:in  STD_LOGIC_VECTOR(15 downto 0)
    );
  end  component;

  component controller is
    port(
      clk, rst: in std_logic;
      address: in std_logic_vector(15 downto 0);
      dataIn: in std_logic_vector(15 downto 0);
      led_1, led_2, led_3, led_4: out std_logic
    );
  end  component;


  component cpu is
    port(
      clk, rst: in std_logic;
      pc_enable: out std_logic;
      dataOut: in std_logic_vector(15 downto 0);
      dataIn: out std_logic_vector(15 downto 0);
      pc_address: in STD_LOGIC_VECTOR(15 downto 0);
      read_address: in STD_LOGIC_VECTOR(15 downto 0);
      pc_out :out std_logic_vector(15 downto 0);
      memory_out: out std_logic_vector(15 downto 0)
    );
  end  component;
  signal dataIn        :  std_logic_vector(15 downto 0);
  signal write_address :  std_logic_vector(7 downto 0);
  signal read_address  :  std_logic_vector(7 downto 0);
  signal we            :  std_logic;
  signal dataOut       :  std_logic_vector(15 downto 0);
  signal pc_address    :  STD_LOGIC_VECTOR(15 downto 0);
  signal pc_out        :  STD_LOGIC_VECTOR(15 downto 0);
  signal address       :  std_logic_vector(15 downto 0);
  signal pc_enable     :  std_logic;
  signal memory_out    :  std_logic_vector(15 downto 0);

  begin

  ram: ram_infer port map(clk, rst, dataIn, write_address, read_address, we, dataOut);

  pc: program_counter port map(clk, rst, pc_enable, read_address, pc_address, pc_out);

  cnt: controller port map(clk, rst, address, dataIn, led_1, led_2, led_3, led_4);

  cp: cpu port map(clk, rst, pc_enable, dataOut, dataIn, pc_address,
  read_address, pc_out, memory_out);

end bhv;
