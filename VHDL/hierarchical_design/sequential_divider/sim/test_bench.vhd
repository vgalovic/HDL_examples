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

  component top
    generic (
      WIDTH : integer := WIDTH
    );
    port (
      a_in : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
      b_in : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);

      clk : in STD_LOGIC;
      rst : in STD_LOGIC;

      start : in STD_LOGIC;

      quotient : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
      remainder : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);

      last : out STD_LOGIC;
      ready : out STD_LOGIC
    );
    end component top;

    signal a_in : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal b_in : STD_LOGIC_VECTOR(WIDTH-1 downto 0);

    signal clk : STD_LOGIC;
    signal rst : STD_LOGIC;

    signal start : std_logic;

    signal quotient : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal remainder : STD_LOGIC_VECTOR(WIDTH-1 downto 0);

    signal last : STD_LOGIC;
    signal ready : STD_LOGIC;

begin

  dut : top
    generic map (
      WIDTH => WIDTH
    )
    port map (
      a_in => a_in,
      b_in => b_in,

      clk => clk,
      rst => rst,

      start => start,

      quotient => quotient,
      remainder => remainder,

      last => last,
      ready => ready
    );

  a_in <= X"09";
  b_in <= X"03";

  start_gen: process is
  begin

    start <= '1';
    wait for clk_period;
    start <= '0';
    wait for clk_period*4;
    start <= '1';
    wait for clk_period;
    start <= '0';

    wait;

  end process start_gen;

  rst_gen : process is
  begin

    rst <= '0';
    wait for clk_period * 2;
    rst <= '1';
    wait for clk_period;
    rst <= '0';

    wait;

  end process rst_gen;

  clk_gen : process is
  begin
    clk <= '1', '0' after clk_period/2;
    wait for clk_period;
  end process clk_gen;

end Behavioral;
