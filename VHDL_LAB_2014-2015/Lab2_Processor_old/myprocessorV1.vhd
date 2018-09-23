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
type fsm_state  is enum(S0,idle,add,addi,nand_state,lui,sw,lw,bne,jalr,dummy);
signal state: fsm_state;
signal reg : cpu_array ;
signal condition :std_logic_vector (2 downto 0);

begin

  instruction_Set:process(clk,rst)
    variable temp : std_logic_vector(15 downto 0) := (others=>'0');
    variable delay:std_logic_vector(23 downto 0) := (others=>'0');
    begin

      if rst='1' then
        we<='0';
        pc_enable<='0';
        pc_in<=(others=>'0');
        write_address<=(others=>'0');
        dataIn<=(others=>'0');
        read_address<=(others=>'0');
        state<=dummy;

      elsif rising_edge(clk) then
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
              write_address<=(1+read_address_instr+temp(7 downto 0));
              pc_enable<='1';
            end if;
            state<=dummy;
          else
            state<=jalr;
            when jalr=>
            pc_enable<='1';
            reg(to_integer(unsigned(dataOut_instr(12 downto 10))))(7 downto 0)<=read_address_instr+1;
            pc_in<= reg(to_integer(unsigned(dataOut_instr(9 downto 7))))(7 downto 0);
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



  entity lab2 is
  port(clk,rst : in std_logic;
  led_1,led_2,led_3,led_4: out std_logic);
  end lab2;

  architecture bhv of lab2 is

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
