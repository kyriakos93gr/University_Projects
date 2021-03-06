library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;


entity ram_infer_instr is port(
      clk           : in  std_logic;
	    rst           : in  std_logic;
      dataIn_instr       : in  std_logic_vector(15 downto 0);
      write_address_instr : in  std_logic_vector(7 downto 0);
      read_address_instr  : in  std_logic_vector(7 downto 0);
    --  we_instr            : in  std_logic;
      dataOut_instr       : out std_logic_vector(15 downto 0));
end ram_infer_instr;

architecture rtl of ram_infer_instr is
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
  --we_instr<='0';
  dataOut_instr <= data;
  process(clk)
    begin
      if rising_edge(clk) then
      --  if (we_instr = '1') then
    		 -- ram_block(conv_integer(write_address_instr)) <= dataIn_instr;
    --		end if;
    		data <= ram_block(conv_integer(read_address_instr));
     end if;
  end process;
END rtl;





-------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;


entity ram_infer is port(
      clk,rst       : in std_logic;
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
--  impure function init_my_RAM(mif_file_name : in string) return memory is
--     file mif_file : text open read_mode is mif_file_name;
--     variable mif_line : line;
--     variable temp_bv  : std_logic_vector(15 downto 0);
--     variable temp_mem : memory;
--      begin
-- 	 for i in memory'range loop
-- 	   if not (endfile (mif_file)) then
--           readline(mif_file, mif_line);
-- 		  hread(mif_line, temp_bv);
-- 		  temp_mem(i) := temp_bv;
-- 	   else
-- 	      temp_mem(i) := (others => '0');
--       end if;
-- 	  end loop;
-- 	  file_close(mif_file);
--     return temp_mem;
-- end function;
--
-- signal ram_block      : memory := init_my_RAM("test");
signal ram_block      : memory;
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
      read_address_instr: out STD_LOGIC_VECTOR(7 downto 0);
      pc_in:in  STD_LOGIC_VECTOR(7 downto 0)
  );
end program_counter;

architecture pcArch of program_counter is
signal pcReg: STD_LOGIC_VECTOR(7 downto 0) ;
begin
  process(clk) begin
  	if (rising_edge(clk)) then
  		if rst = '1' then
  			pcReg <= x"00";
      elsif pc_enable='1' then
        pcReg <= pc_in;
  		else
  			pcReg <= pcReg + x"01";
  		end if;
  	end if;
  end process;
  read_address_instr <= pcReg;
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
    read_address: in std_logic_vector(7 downto 0);
    dataIn: in std_logic_vector(15 downto 0);
    led_1, led_2, led_3, led_4: out std_logic
  );
end controller;

architecture conArch of controller is
signal tmp : std_logic_vector(15 downto 0);
begin
  process (clk)

  begin
    if rising_edge(clk) then
      led_1<='0';
      led_2<='0';
      led_3<='0';
      led_4<='0';
      if read_address=x"03" then
        led_1<=dataIn(0);
        led_2<=dataIn(1);
        led_3<=dataIn(2);
        led_4<=dataIn(3);
        for i in 0 to 10000 loop
          tmp <= std_logic_vector(to_unsigned(i,16));
        end loop;
      end if;
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
    pc_enable, we: out std_logic;
    dataOut: in std_logic_vector(15 downto 0);
    dataOut_instr: in std_logic_vector(15 downto 0);
    dataIn: out std_logic_vector(15 downto 0);
    read_address: out STD_LOGIC_VECTOR(7 downto 0);
    read_address_instr: in STD_LOGIC_VECTOR(7 downto 0);
    pc_in :out std_logic_vector(7 downto 0);
    write_address: out std_logic_vector(7 downto 0)
  );
end cpu;

architecture cpuArch of cpu is
type cpu_array is array(0 to 7) of std_logic_vector(15 downto 0);
signal reg : cpu_array :=(others=>(others=>'0'));
--signal temp: std_logic_vector(15 downto 0):=(others=>'0');
begin

instruction_Set:process(clk,rst)
  variable temp : std_logic_vector(15 downto 0) := (others=>'0');
  begin
  if (rst='1') then
    we<='0';
    pc_enable<='0';
    pc_in<=(others=>'0');
    write_address<=(others=>'0');
    dataIn<=(others=>'0');
    read_address<=(others=>'0');




  else
    if rising_edge(clk) then
      -- add
    if (dataOut_instr(15 downto 13)="000") then
      reg(to_integer(unsigned(dataOut_instr(12 downto 10))))<=reg(to_integer(unsigned(dataOut_instr(9 downto 7))))+reg(to_integer(signed(dataOut_instr(2 downto 0))));
      -- addi
    elsif (dataOut_instr(15 downto 13)="001") then
      for i in 7 to 15 loop
        temp(i):= dataOut_instr(6);
      end loop;
      temp(6 downto 0):= dataOut_instr(6 downto 0);
      reg(to_integer(unsigned(dataOut_instr(12 downto 10))))<=(reg(to_integer(unsigned(dataOut_instr(9 downto 7)))))+temp;
      -- nand
    elsif (dataOut_instr(15 downto 13)="010") then
      reg(to_integer(unsigned(dataOut_instr(12 downto 10))))<=reg(to_integer(unsigned(dataOut_instr(9 downto 7)))) nand reg(to_integer(unsigned(dataOut_instr(2 downto 0))));
      -- lui
    elsif (dataOut_instr(15 downto 13)="011") then
      for i in 6 to 15 loop
        temp(i):=dataOut_instr(i-6);
      end loop;
      reg(to_integer(unsigned(dataOut_instr(12 downto 10))))(15 downto 6)<= temp(15 downto 6);
      reg(to_integer(unsigned(dataOut_instr(12 downto 10))))(5 downto 0)<=(others=>'0');
      --sw
    elsif (dataOut_instr(15 downto 13)="100") then
      for i in 7 to 15 loop
        temp(i):=dataOut_instr(6);
      end loop;
      we<='1';
      write_address<=reg(to_integer(unsigned(dataOut_instr(9 downto 7))))(7 downto 0) +temp(7 downto 0);
      dataIn<=reg(to_integer(unsigned(dataOut_instr(12 downto 10))));
      -- lw
    elsif (dataOut_instr(15 downto 13)="101") then
      for i in 7 to 15 loop
        temp(i):=dataOut_instr(6);
      end loop;
      read_address<=reg(to_integer(unsigned(dataOut_instr(9 downto 7))))(7 downto 0) +temp(7 downto 0);
      reg(to_integer(unsigned(dataOut_instr(12 downto 10))))<=dataOut;
      -- bne
    elsif (dataOut_instr(15 downto 13)="110") then
      for i in 7 to 15 loop
        temp(i):=dataOut_instr(6);
      end loop;
      if reg(to_integer(unsigned(dataOut_instr(12 downto 10))))/=reg(to_integer(unsigned(dataOut_instr(9 downto 7)))) then
        we<='1';
        write_address<=(1+read_address_instr+temp(7 downto 0));
        pc_enable<='1';
      end if;
      -- jalr
  --  elsif (dataOut_instr(15 downto 13)="111") then
  else
      pc_enable<='1';
      reg(to_integer(unsigned(dataOut_instr(12 downto 10))))(7 downto 0)<=read_address_instr+1;
      pc_in<= reg(to_integer(unsigned(dataOut_instr(9 downto 7))))(7 downto 0);
    end if;
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


entity lab2 is
port(clk,rst : in std_logic;
led_1,led_2,led_3,led_4: out std_logic);
end lab2;

architecture bhv of lab2 is


  component ram_infer is
	port(
        clk           : in  std_logic;
  	    rst           : in  std_logic;
        dataIn        : in  std_logic_vector(15 downto 0);
        write_address : in  std_logic_vector(7 downto 0);
        read_address  : in  std_logic_vector(7 downto 0);
        we            : in  std_logic;
        dataOut       : out std_logic_vector(15 downto 0)
);
  end component;

  component ram_infer_instr is
	port(
    clk           : in  std_logic;
    rst           : in  std_logic;
    dataIn_instr       : in  std_logic_vector(15 downto 0);
    write_address_instr : in  std_logic_vector(7 downto 0);
    read_address_instr  : in  std_logic_vector(7 downto 0);
    dataOut_instr       : out std_logic_vector(15 downto 0)
);
  end component;

  component program_counter is port (
        clk, rst, pc_enable: in STD_LOGIC;
        read_address_instr: out STD_LOGIC_VECTOR(7 downto 0);
        pc_in:in  STD_LOGIC_VECTOR(7 downto 0)
    );
  end  component;

  component controller is
    port(
      clk, rst: in std_logic;
      read_address: in std_logic_vector(7 downto 0);
      dataIn: in std_logic_vector(15 downto 0);
      led_1, led_2, led_3, led_4: out std_logic
    );
  end  component;


  component cpu is
    port(
    clk, rst: in std_logic;
    pc_enable, we: out std_logic;
    dataOut: in std_logic_vector(15 downto 0);
    dataOut_instr: in std_logic_vector(15 downto 0);
    dataIn: out std_logic_vector(15 downto 0);
    read_address: out STD_LOGIC_VECTOR(7 downto 0);
    read_address_instr : in STD_LOGIC_VECTOR(7 downto 0);
    pc_in :out std_logic_vector(7 downto 0);
    write_address: out std_logic_vector(7 downto 0)
    );
  end  component;

  signal dataIn        : std_logic_vector(15 downto 0);
  signal dataIn_instr        : std_logic_vector(15 downto 0);
  signal write_address : std_logic_vector(7 downto 0);
  signal write_address_instr : std_logic_vector(7 downto 0);
  signal read_address  : std_logic_vector(7 downto 0);
  signal read_address_instr  : std_logic_vector(7 downto 0);
  signal we            : std_logic;
  signal dataOut       : std_logic_vector(15 downto 0);
  signal dataOut_instr       : std_logic_vector(15 downto 0);
  signal pc_in         : STD_LOGIC_VECTOR(7 downto 0);
  signal pc_enable     : std_logic;

  begin

  ram: ram_infer port map(clk, rst, dataIn, write_address, read_address, we, dataOut);

  instr: ram_infer port map(clk, rst, dataIn_instr, write_address_instr, read_address_instr, we, dataOut_instr);

  pc: program_counter port map(clk, rst, pc_enable, read_address_instr, pc_in);

  cnt: controller port map(clk, rst, read_address, dataIn, led_1, led_2, led_3, led_4);

  cp: cpu port map(clk, rst, we, pc_enable, dataOut, dataOut_instr, dataIn,
  read_address, read_address_instr, pc_in, write_address);

end bhv;
