library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity test_bench is
  generic (
    WIDTH : integer := 8;
    clk_period : time := 100 ns
    );
--  Port ( );
end entity test_bench;

architecture Behavioral of test_bench is

  component top is
    generic (
      WIDTH : integer := WIDTH
      );
    port (
      a_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
      b_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);

      clk : in STD_LOGIC;
      start : in STD_LOGIC;
      reset : in STD_LOGIC;

      ready : out STD_LOGIC;

      r_out : out STD_LOGIC_VECTOR (2*WIDTH-1 downto 0)
    );
  end component top;

  signal a_in_s : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
  signal b_in_s : STD_LOGIC_VECTOR(WIDTH-1 downto 0);

  signal clk_s   : STD_LOGIC;
  signal start_s : STD_LOGIC;
  signal reset_s : STD_LOGIC;

  signal ready_s : STD_LOGIC;

  signal r_out_s : STD_LOGIC_VECTOR(2*WIDTH-1 downto 0);

begin

  dut : component top
    generic map (
      WIDTH => WIDTH
    )
    port map (
      a_in => a_in_s,
      b_in => b_in_s,

      clk => clk_s,
      start => start_s,
      reset => reset_s,

      ready => ready_s,

      r_out => r_out_s
    );

  a_in_s <= X"05";
  b_in_s <= X"06";

  start_s <= '1', '0' after clk_period*4;
  reset_s <= '1', '0' after clk_period*2;

  clk_gen : process is
  begin
    clk_s <= '1', '0' after clk_period/2;
    wait for clk_period;
  end process clk_gen;


end Behavioral;
