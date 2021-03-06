library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;


entity scorefour is
  port (clk,rst : in std_logic;
	col_1, col_2, col_3, col_4, col_5, col_6, col_7 : in std_logic;
	player : in std_logic;
	hsync : out std_logic;
	vsync : out std_logic;
	red : out std_logic_vector(3 downto 0);
	green : out std_logic_vector(3 downto 0);
	blue : out std_logic_vector(3 downto 0)
	);
end scorefour;

architecture bhv of scorefour is


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
    clk                 : in  std_logic;
    rst                 : in  std_logic;
    --dataIn_instr        : in  std_logic_vector(15 downto 0);
    --write_address_instr : in  std_logic_vector(7 downto 0);
    read_address_instr  : in  std_logic_vector(7 downto 0);
    pc                  : out std_logic_vector(7 downto 0);
    dataOut_instr       : out std_logic_vector(15 downto 0)
    );
  end component;

  component cpu is
    port(
    clk, rst: in std_logic;
    we: out std_logic;
    dataOut: in std_logic_vector(15 downto 0);
    dataOut_instr: in std_logic_vector(15 downto 0);
    dataIn: out std_logic_vector(15 downto 0);
    read_address: out std_logic_vector(7 downto 0);
    read_address_instr : out std_logic_vector(7 downto 0);
    pc: in std_logic_vector(7 downto 0);
    write_address: out std_logic_vector(7 downto 0);
    interrupt            : in std_logic;
    interrupt_vector     : in std_logic_vector(0 to 8);
    interrupt_ack : out std_logic
    );
  end  component;

  component interrupt_controller is
    port(
      clk, rst             : in std_logic;
      col_1, col_2, col_3, col_4, col_5, col_6, col_7 : in std_logic;
      player : in std_logic;
      interrupt : out std_logic;
      interrupt_vector : out std_logic_vector(0 to 8);
      interrupt_ack : in std_logic
    );
  end component;

  component PanelDisplay is
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
  end component;

  component Faces is
  	port (
    	face_address : in std_logic_vector(7 downto 0);
    	data : out std_logic_vector(59 downto 0)
  	);
  end component;


  signal dataIn        : std_logic_vector(15 downto 0);
  --signal dataIn_instr        : std_logic_vector(15 downto 0);
  signal write_address : std_logic_vector(7 downto 0);
  --signal write_address_instr : std_logic_vector(7 downto 0);
  signal read_address  : std_logic_vector(7 downto 0);
  signal read_address_instr  : std_logic_vector(7 downto 0);
  signal we            : std_logic;
  signal dataOut       : std_logic_vector(15 downto 0);
  signal dataOut_instr       : std_logic_vector(15 downto 0);
  signal pc         : std_logic_vector(7 downto 0);
  signal interrupt  : std_logic;
  signal interrupt_vector  : std_logic_vector (0 to 8);
  signal interrupt_ack : std_logic;

  begin

  ram: ram_infer port map(clk, rst, dataIn, write_address, read_address, we, dataOut);

  instr: ram_infer_instr port map(clk, rst, read_address_instr,pc, dataOut_instr);

  cp: cpu port map(clk, rst, we, dataOut, dataOut_instr, dataIn,
  read_address, read_address_instr, pc, write_address, interrupt, interrupt_vector, interrupt_ack);

  int: interrupt_controller port map(clk, rst, col_1, col_2, col_3, col_4, col_5, col_6, col_7, player,
  interrupt, interrupt_vector, interrupt_ack);

  disp: PanelDisplay port map(clk, rst, hsync, vsync, red, green, blue, dataIn, write_address);


  
end bhv;
