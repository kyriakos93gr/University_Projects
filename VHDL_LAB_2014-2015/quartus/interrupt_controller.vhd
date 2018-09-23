library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity interrupt_controller is
  port(
    clk, rst             : in std_logic;
    col_1, col_2, col_3, col_4, col_5, col_6, col_7 : in std_logic;
    player : in std_logic;
    interrupt : out std_logic;
    interrupt_vector : out std_logic_vector (0 to 8);
    interrupt_ack : in std_logic
  );
end interrupt_controller;

architecture interrupt_arch of interrupt_controller is
  type col_array is array(1 to 7) of std_logic;
  signal col : col_array;
  signal col_freeze : col_array;
  type fsm_state is (IDLE, EXECUTE, WAIT_ACK);
  signal state: fsm_state;
  signal pointer : integer;

begin
  col(1) <= col_1;
  col(2) <= col_2;
  col(3) <= col_3;
  col(4) <= col_4;
  col(5) <= col_5;
  col(6) <= col_6;
  col(7) <= col_7;
  process (clk, rst)
    variable counter : integer := 0;
    variable delay : integer := 0;
    constant limit : integer := 30; -- 1 second for 50 MHz clock
  begin
    if (rst = '0') then
      interrupt <= '0';
      interrupt_vector <= (others => '0');
      state <= IDLE;
    elsif (rising_edge(clk)) then
      case state is
        when IDLE =>
          for i in 1 to 7 loop
            if (col(i)='1') then  -- when only one signal is 1 then counter = 1
              counter := counter + 1;
              pointer <= i;
            end if;
          end loop;
          if (counter = 1) then
            state <= EXECUTE;     -- goest to execute only when one signal is active
          else
            counter := 0;
          end if;
        when EXECUTE =>
          if (delay = limit) then   -- delay loop here
            interrupt <= '1';       -- when delay = limit then interrupt
            delay := 0;
	          state <= IDLE;
            interrupt_vector <= (others => '0');
            interrupt_vector(0) <= player;
            interrupt_vector(pointer) <= '1';
            state <= WAIT_ACK;
          else
            delay := delay + 1;
          end if;
        when WAIT_ACK =>
          if interrupt_ack = '1' then
            state <= IDLE;
            interrupt <= '0';
            counter := 0;
            pointer <= 0;
          else
            state <= WAIT_ACK;
          end if;
      end case;
    end if;
  end process;


end interrupt_arch;
