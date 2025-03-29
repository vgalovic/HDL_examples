library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity parameterized_counter_tb is
  generic (
    -- width of 8bit and 10bit counters
    W_8BIT  : integer := 8;
    W_10BIT : integer := 10;

    -- clock period
    period : time := 100 ns
  );
--  Port ( );
end entity parameterized_counter_tb;

architecture behavioral of parameterized_counter_tb is

  component parameterized_counter is
    generic (
      WIDTH : integer := 8
    );
    port (
      clk   : in    STD_LOGIC;
      reset : in    STD_LOGIC;
      q     : out   STD_LOGIC_VECTOR(WIDTH - 1 downto 0)
    );
  end component parameterized_counter;

  signal clk_s   : STD_LOGIC;
  signal reset_s : STD_LOGIC;

  signal q_8bit  : STD_LOGIC_VECTOR(W_8BIT - 1 downto 0);
  signal q_10bit : STD_LOGIC_VECTOR(W_10BIT - 1 downto 0);

begin

  dut_8bit : component parameterized_counter
    generic map (
      WIDTH => W_8BIT
    )
    port map (
      clk   => clk_s,
      reset => reset_s,
      q     => q_8bit
    );

  dut_10bit : component parameterized_counter
    generic map (
      WIDTH => W_10BIT
    )
    port map (
      clk   => clk_s,
      reset => reset_s,
      q     => q_10bit
    );

  clk_gen : process is
  begin

    while true loop

      clk_s <= '0';
      wait for period / 2;
      clk_s <= '1';
      wait for period / 2;

    end loop;

    wait;

  end process clk_gen;

  reset_gen : process is
  begin

    -- Initial reset to start counter from 0
    reset_s <= '1';
    wait for period;

    reset_s <= '0';
    wait for period * 4;

    -- Reset coutner
    reset_s <= '1';
    wait for period;

    -- Let simulation run with counter runing normally
    reset_s <= '0';

    wait;

  end process reset_gen;

end architecture behavioral;


