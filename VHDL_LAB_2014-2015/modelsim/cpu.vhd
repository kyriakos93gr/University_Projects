library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity cpu is
  port(
    clk, rst             : in std_logic;
    we                   : out std_logic;
    dataOut              : in std_logic_vector(15 downto 0);
    dataOut_instr        : in std_logic_vector(15 downto 0);
    dataIn               : out std_logic_vector(15 downto 0);
    read_address         : out STD_LOGIC_VECTOR(7 downto 0);
    read_address_instr   : out STD_LOGIC_VECTOR(7 downto 0);
    pc                   : in STD_LOGIC_VECTOR(7 downto 0);
    write_address        : out std_logic_vector(7 downto 0);
    interrupt            : in std_logic;
    interrupt_vector     : in std_logic_vector(0 to 8);
    interrupt_ack        : out std_logic
  );
end cpu;

architecture cpuArch of cpu is
type cpu_array is array(0 to 7) of std_logic_vector(15 downto 0);
signal reg : cpu_array :=(others=>(others=>'0'));
type fsm_state is (FETCH, DECODE, EXECUTE, MEMORY, REGWRITE, DELAY1, DELAY2, INTER);
signal state: fsm_state;
signal condition: std_logic_vector (2 downto 0);
signal temp : std_logic_vector(15 downto 0);
signal regA, regB, regC : std_logic_vector(15 downto 0);
begin

process (clk, rst)
begin

if rst='0' then
  state<=FETCH;
  we<='0';
  dataIn<=(others=>'0');
  read_address<=(others=>'0');
  write_address<=(others=>'0');
  read_address_instr<=(others=>'0');
  temp<=(others=>'0');
  regA<= (others=>'0');
  regB <=(others=>'0');
  regC<=(others=>'0');
  interrupt_ack <= '0';

elsif rising_edge(clk) then
  condition<=dataOut_instr(15 downto 13);
  case state is
    ------------------------FETCH-------------------------
    when FETCH =>
      interrupt_ack <= '0';
      condition<=dataOut_instr(15 downto 13);
      we<='0';
      state<=DECODE;
      ------------------------DECODE-------------------------
    when DECODE =>
      --add
      if condition="000" then
        regA<=reg(to_integer(unsigned(dataOut_instr(12 downto 10))));
        regB<=reg(to_integer(unsigned(dataOut_instr(9 downto 7))));
        regC<=reg(to_integer(signed(dataOut_instr(2 downto 0))));
        state<=EXECUTE;
        --addi
      elsif condition="001" then
        temp(6 downto 0)<=(dataOut_instr(6 downto 0));
        -- temp(15 downto 7)<=(others=>dataOut_instr(6));
        temp(15 downto 7) <= (others => '0');
        regA<=reg(to_integer(unsigned(dataOut_instr(12 downto 10))));
        regB<=reg(to_integer(unsigned(dataOut_instr(9 downto 7))));
        state<=EXECUTE;
      --nand
      elsif condition="010" then
        regA<=reg(to_integer(unsigned(dataOut_instr(12 downto 10))));
        regB<=reg(to_integer(unsigned(dataOut_instr(9 downto 7))));
        regC<=reg(to_integer(unsigned(dataOut_instr(2 downto 0))));
        state<=EXECUTE;
        --lui
      elsif condition="011" then
        regA<=reg(to_integer(unsigned(dataOut_instr(12 downto 10))));
        temp(15 downto 6)<=dataOut_instr(9 downto 0);
        state<=EXECUTE;
        --sw
      elsif condition="100" then
        temp(6 downto 0)<=dataOut_instr(6 downto 0);
        temp(15 downto 7)<=(others=>dataOut_instr(6));
        regA<=reg(to_integer(unsigned(dataOut_instr(12 downto 10))));
        regB<=reg(to_integer(unsigned(dataOut_instr(9 downto 7))));
        state<=MEMORY;
        --lw
      elsif condition="101" then
        temp(6 downto 0)<=dataOut_instr(6 downto 0);
        temp(15 downto 7)<=(others=>dataOut_instr(6));
        regA<=reg(to_integer(unsigned(dataOut_instr(12 downto 10))));
        regB<=reg(to_integer(unsigned(dataOut_instr(9 downto 7))));
        state<=MEMORY;
        --beq
      elsif condition="110" then
        temp(6 downto 0)<=dataOut_instr(6 downto 0);
        temp(15 downto 7)<=(others=>dataOut_instr(6));
        regA<=reg(to_integer(unsigned(dataOut_instr(12 downto 10))));
        regB<=reg(to_integer(unsigned(dataOut_instr(9 downto 7))));
        state<=EXECUTE;
        --jalr
      else
        regA<=reg(to_integer(unsigned(dataOut_instr(12 downto 10))));
        regB<=reg(to_integer(unsigned(dataOut_instr(9 downto 7))));
        state<=EXECUTE;
      end if;

      ------------------------EXECUTE-------------------------
    when EXECUTE =>
      --add
      if condition="000" then
        regA<=regB+regC;
        state<=REGWRITE;
        --addi
      elsif condition="001" then
        regA<=regB+temp;
        state<=REGWRITE;
      --nand
      elsif condition="010" then
        regA<=regB nand regC;
        state<=REGWRITE;
        --lui
      elsif condition="011" then
        regA(15 downto 6)<=temp(15 downto 6);
        regA(5 downto 0)<=(others=>'0');
        state<=REGWRITE;
        --beq
      elsif condition="110" then
	      state<=REGWRITE;
        if regA=regB then
          read_address_instr<=(pc+temp(7 downto 0)+1);
          state<=DELAY1;
        end if;
        --jalr
      else
        regA(7 downto 0)<=pc+1;
        read_address_instr<= regB(7 downto 0);
        state<=REGWRITE;
      end if;
      ------------------------MEMORY-------------------------
    when MEMORY =>
      if condition="100" then
        we<='1';
        write_address<=regB(7 downto 0) +temp(7 downto 0);
        dataIn<=regA;
        state<=REGWRITE;
      elsif condition="101" then
        read_address<=reg(to_integer(signed(dataOut_instr(9 downto 7))))(7 downto 0) +temp(7 downto 0);
        state<=REGWRITE;
      end if;
      ------------------------REGWRITE-------------------------
    when REGWRITE =>
      --jalr
      if condition="111" then
        reg(to_integer(unsigned(dataOut_instr(12 downto 10))))<=regA;
      else
        --add
        if condition="000" then
          reg(to_integer(unsigned(dataOut_instr(12 downto 10))))<=regA;
        --addi
        elsif condition="001" then
          reg(to_integer(unsigned(dataOut_instr(12 downto 10))))<=regA;
        --nand
        elsif condition="010" then
          reg(to_integer(unsigned(dataOut_instr(12 downto 10))))<=regA;
        --lui
        elsif condition="011" then
          reg(to_integer(unsigned(dataOut_instr(12 downto 10))))<=regA;
        --lw
        elsif condition="101" then
          reg(to_integer(unsigned(dataOut_instr(12 downto 10))))<=dataOut;
        end if;
        read_address_instr<=pc+1;
      end if;
      state<=DELAY1;
    when DELAY1 =>
      state<=DELAY2;
    when DELAY2 =>
      state<=INTER;
      ------------------------INTERRUPT-------------------------
    when INTER =>
      if interrupt = '1' then
  		  reg(5)(15 downto 1) <= (others => '0');
        reg(5)(0) <= interrupt_vector(0); -- reg1 = player
        reg(7) <= std_logic_vector(to_unsigned(55,16)); -- informs our assembly that a new value has been added.
        for i in 1 to 7 loop
          if interrupt_vector(i) = '1' then
            reg(6) <= std_logic_vector(to_signed(i, 16));
          end if;
        end loop;
        interrupt_ack <= '1';
      end if;
      state <= FETCH;
  end case;
end if;
end process;

end cpuArch;
