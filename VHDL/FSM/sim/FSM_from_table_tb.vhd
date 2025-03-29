library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity FSM_from_table_tb is
--  Port ( );
end  entity FSM_from_table_tb;

architecture Behavioral of FSM_from_table_tb is
  component FSM_from_table
      Port (
          clk : in STD_LOGIC;
          x : in STD_LOGIC;
          y : in STD_LOGIC;
          o : out STD_LOGIC
      );
  end component;

  signal clk_s : STD_LOGIC := '0';
  signal x_s : STD_LOGIC := '0';
  signal y_s : STD_LOGIC := '0';
  signal o_s : STD_LOGIC;

  constant clk_period : time := 100 ns;

begin
  duv: FSM_from_table
    port map (
        clk => clk_s,
        x => x_s,
        y => y_s,
        o => o_s
    );

  clk_gen: process is
  begin
    clk_s <= '0', '1' after clk_period/2;
    wait for clk_period;
  end process clk_gen;

  stim_gen: process is
  begin
    x_s <= '0'; y_s <= '0';
    wait for clk_period;

    x_s <= '0'; y_s <= '1';
    wait for clk_period;

    x_s <= '0'; y_s <= '0';
    wait for clk_period;

    x_s <= '1'; y_s <= '0';
    wait for clk_period;

    x_s <= '1'; y_s <= '1';
    wait for clk_period;

    wait;
  end process stim_gen;

end Behavioral;
