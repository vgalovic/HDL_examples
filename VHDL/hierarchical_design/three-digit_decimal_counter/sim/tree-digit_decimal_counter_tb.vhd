library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity tree_digit_decimal_counter_tb is
  generic (
    clk_period : time := 100 ns
  );
--  Port ( );
end entity tree_digit_decimal_counter_tb;

architecture behavioral of tree_digit_decimal_counter_tb is

  component tree_digit_decimal_counter is
    port (
      clk   : in    STD_LOGIC;
      reset : in    STD_LOGIC;

      q_0 : out   STD_LOGIC_VECTOR(3 downto 0);
      q_1 : out   STD_LOGIC_VECTOR(3 downto 0);
      q_2 : out   STD_LOGIC_VECTOR(3 downto 0)

    );
  end component tree_digit_decimal_counter;

  signal clk_s   : STD_LOGIC;
  signal reset_s : STD_LOGIC;

  signal q_0_s : STD_LOGIC_VECTOR(3 downto 0);
  signal q_1_s : STD_LOGIC_VECTOR(3 downto 0);
  signal q_2_s : STD_LOGIC_VECTOR(3 downto 0);

begin

  dut : component tree_digit_decimal_counter
    port map (
      clk   => clk_s,
      reset => reset_s,

      q_0 => q_0_s,
      q_1 => q_1_s,
      q_2 => q_2_s
    );

  clk_gen : process is
  begin

    while true loop

      clk_s <= '0';
      wait for clk_period / 2;
      clk_s <= '1';
      wait for clk_period / 2;

    end loop;

    wait;

  end process clk_gen;

  reset_gen : process is
  begin

    reset_s <= '1';
    wait for clk_period;
    reset_s <= '0';
    wait for clk_period * 4;

    reset_s <= '1';
    wait for clk_period;
    reset_s <= '0';

    wait;

  end process reset_gen;

end architecture behavioral;
