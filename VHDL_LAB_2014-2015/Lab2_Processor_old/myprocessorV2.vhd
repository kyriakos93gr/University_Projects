library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;




entity cpu is
  port(
    clk, rst: in std_logic;
     we: out std_logic;

    dataOut: in std_logic_vector(15 downto 0);
    dataOut_instr: in std_logic_vector(15 downto 0);
    dataIn: out std_logic_vector(15 downto 0);
    read_address: out STD_LOGIC_VECTOR(7 downto 0);
    read_address_instr: out STD_LOGIC_VECTOR(7 downto 0);
    pc_in :in std_logic_vector(7 downto 0);
    write_address: out std_logic_vector(7 downto 0)
  );
end cpu;

architecture cpuArch of cpu is
type cpu_array is array(0 to 7) of std_logic_vector(15 downto 0);
type fsm_state  is enum(S0,idle,add,addi,nand_state,lui,sw,lw,bne,jalr,dummy);
signal state: fsm_state;
signal reg : cpu_array ;
signal condition :std_logic_vector (2 downto 0);
signal pc: std_logic_vector(7 downto 0);
begin

  instruction_Set:process(clk,rst)
    variable temp : std_logic_vector(15 downto 0) := (others=>'0');
    variable delay:std_logic_vector(23 downto 0) := (others=>'0');
    begin

      if rst='1' then
        we<='0';

        read_address_instr<=(others=>'0');
        write_address<=(others=>'0');
        dataIn<=(others=>'0');
        read_address<=(others=>'0');
        state<=dummy;

      elsif rising_edge(clk) then
        pc<=pc_in;
        read_address_instr<=pc+1;
        condition<=dataOut_instr(15 downto 13);
        case state is

          if condition="000" then
            state<=add;
            when add=>
            reg(to_integer(unsigned(dataOut_instr(12 downto 10))))<=reg(to_integer(unsigned(dataOut_instr(9 downto 7))))+reg(to_integer(signed(dataOut_instr(2 downto 0))));
            state<=dummy;
          elsif condition="001" then
            state<=addi;
            when addi=>
            for i in 7 to 15 loop
              temp(i):= dataOut_instr(6);
            end loop;
            temp(6 downto 0):= dataOut_instr(6 downto 0);
            reg(to_integer(unsigned(dataOut_instr(12 downto 10))))<=(reg(to_integer(unsigned(dataOut_instr(9 downto 7)))))+temp;
            state<=dummy;
          elsif condition="010" then
            state<=nand_state;
            when nand_state=>
            reg(to_integer(unsigned(dataOut_instr(12 downto 10))))<=reg(to_integer(unsigned(dataOut_instr(9 downto 7)))) nand reg(to_integer(unsigned(dataOut_instr(2 downto 0))));
            state<=dummy;
            elsif condition="011" then
            state<=lui;
            when lui=>
            for i in 6 to 15 loop
              temp(i):=dataOut_instr(i-6);
            end loop;
            reg(to_integer(unsigned(dataOut_instr(12 downto 10))))(15 downto 6)<= temp(15 downto 6);
            reg(to_integer(unsigned(dataOut_instr(12 downto 10))))(5 downto 0)<=(others=>'0');
            state<=dummy;
          elsif condition="100" then
            state<=sw;
            when sw=>
            for i in 7 to 15 loop
              temp(i):=dataOut_instr(6);
            end loop;
            we<='1';
            write_address<=reg(to_integer(unsigned(dataOut_instr(9 downto 7))))(7 downto 0) +temp(7 downto 0);
            dataIn<=reg(to_integer(unsigned(dataOut_instr(12 downto 10))));
            state<=dummy;
          elsif condition="101" then
            state<=lw;
            when lw=>
            for i in 7 to 15 loop
              temp(i):=dataOut_instr(6);
            end loop;
            read_address<=reg(to_integer(unsigned(dataOut_instr(9 downto 7))))(7 downto 0) +temp(7 downto 0);
            reg(to_integer(unsigned(dataOut_instr(12 downto 10))))<=dataOut;
            state<=dummy;
          elsif condition="110" then
            state<=bne;
            when bne=>
            for i in 7 to 15 loop
              temp(i):=dataOut_instr(6);
            end loop;
            if reg(to_integer(unsigned(dataOut_instr(12 downto 10))))/=reg(to_integer(unsigned(dataOut_instr(9 downto 7)))) then
              we<='1';
              read_address_instr<=(1+pc+temp(7 downto 0));

            end if;
            state<=dummy;
          else
            state<=jalr;
            when jalr=>

            reg(to_integer(unsigned(dataOut_instr(12 downto 10))))(7 downto 0)<=read_address_instr+1;
            read_address_instr<= reg(to_integer(unsigned(dataOut_instr(9 downto 7))))(7 downto 0);
            state<=dummy;
          end if;
          when dummy=>
          for i in 0 to 10000000 loop
            delay<=delay+1;
          end loop;
        end case;
      end if;
    end process;
  end cpuArch;


---------------------------------------------------------------------------

  library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;
  use ieee.std_logic_textio.all;
  use std.textio.all;


  entity ram_infer_instr is port(
        clk                 : in  std_logic;
        rst                 : in  std_logic;
        dataIn_instr        : in   std_logic_vector(15 downto 0);
        write_address_instr : in  std_logic_vector(7 downto 0);
        read_address_instr  : in  std_logic_vector(7 downto 0);
        pc_in               : out  std_logic_vector(7 downto 0);
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

  --signal ram_block      : memory := init_my_RAM("test");

  -------------------------------------------------------
  -- initialize memory for altera quartus and fpga programming
  -- (does not work for modelsim)
  -------------------------------------------------------
  signal    ram_block: memory;
  attribute ram_init_file : string;
  attribute ram_init_file of ram_block : signal is "diff_out.mif";
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
          pc_in<=  read_address_instr ;
      end if;
    end process;
  END rtl;


----enala sthn  ram_infer_instr to sima pc_in pou pairnei
----thn timh tou read_address_instr
----ston cpu,to pc_in einai eisodos kai to read_address_instr
----eksodos.ekei,pairnei thn timh tou pc_in+1
----ektos apo tis periptwseis pou
----prepei na parei allh  timh









  entity lab2 is
  port(clk,rst : in std_logic;
  led_1,led_2,led_3,led_4: out std_logic);
  end lab2;

  architecture bhv of lab2 is

    component cpu is
      port(
        clk, rst: in std_logic;
         we: out std_logic;

        dataOut: in std_logic_vector(15 downto 0);
        dataOut_instr: in std_logic_vector(15 downto 0);
        dataIn: out std_logic_vector(15 downto 0);
        read_address: out STD_LOGIC_VECTOR(7 downto 0);
        read_address_instr: out STD_LOGIC_VECTOR(7 downto 0);
        pc_in :in std_logic_vector(7 downto 0);
        write_address: out std_logic_vector(7 downto 0)
      );

    end  component;

    component ram_infer_instr is port(
          clk                 : in  std_logic;
          rst                 : in  std_logic;
          dataIn_instr        : in   std_logic_vector(15 downto 0);
          write_address_instr : in  std_logic_vector(7 downto 0);
          read_address_instr  : in  std_logic_vector(7 downto 0);
          pc_in               : out  std_logic_vector(7 downto 0);
        --  we_instr            : in  std_logic;
          dataOut_instr       : out std_logic_vector(15 downto 0));
    end component;


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

      instr: ram_infer port map(clk,rst,dataIn_instr,write_address_instr,read_address_instr,pc_in,dataOut_instr);
      cp: cpu port map(clk, rst,we,dataOut,dataOut_instr,dataIn,read_address,read_address_instr,pc_in,write_address);


    end bhv;
