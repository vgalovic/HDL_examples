library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity d_flip_flop_with_delays_plus_assert_tb is
--  Port ( );
end entity d_flip_flop_with_delays_plus_assert_tb;

architecture Behavioral of d_flip_flop_with_delays_plus_assert_tb is
  component d_flip_flop_with_delays_plus_assert is
    Port (
      D   : in   STD_LOGIC;
      clk : in   STD_LOGIC;
      Q   : out  STD_LOGIC
    );
  end component d_flip_flop_with_delays_plus_assert;

  signal D_s : STD_LOGIC := '0';
  signal clk_s : STD_LOGIC := '0';
  signal Q_s : STD_LOGIC;

  constant clk_period : time := 10 ns; -- Clock period

begin

  duv: d_flip_flop_with_delays_plus_assert
    port map (
      D   => D_s,
      clk => clk_s,
      Q   => Q_s
    );

  -- Clock generation
  clk_gen : process is
  begin
    while now < 200 ns loop
      clk_s <= '0';
      wait for clk_period/2;
      clk_s<= '1';
      wait for clk_period/2;
    end loop;
    wait;
  end process clk_gen;

  -- Stimulus process
  stim_gen : process is
  begin
    -- Normal operation
    D_s <= '0';
    wait for 15 ns;
    D_s <= '1';
    wait for clk_period;
    assert Q_s = '1' report "Normal operation failed at step 1" severity error;

    -- Setup time violation: Change D just before rising edge of clk
    wait for clk_period - 1 ns;
    D_s <= '0';
    wait for clk_period;
    assert Q_s = 'X' report "Setup time violation not detected properly" severity error;

    -- Hold time violation: Change D just after rising edge of clk
    D_s <= '1';
    wait for 1 ns;
    D_s <= '0';
    wait for clk_period;
    assert Q_s = 'X' report "Hold time violation not detected properly" severity error;

    -- Normal operation again
    D_s <= '1';
    wait for clk_period;
    assert Q_s = '1' report "Normal operation failed at step 2" severity error;
    D_s <= '0';
    wait for clk_period;
    assert Q_s = '0' report "Normal operation failed at step 3" severity error;

    -- End simulation
    wait;
  end process stim_gen;

end Behavioral;
