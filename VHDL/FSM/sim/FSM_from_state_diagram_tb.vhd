library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity FSM_from_state_diagram_tb is
--  Port ( );
end entity FSM_from_state_diagram_tb;

architecture Behavioral of FSM_from_state_diagram_tb is
  component FSM_from_state_diagram
      Port (
          clk : in STD_LOGIC;
          C : in STD_LOGIC;
          Y : out STD_LOGIC
      );
  end component FSM_from_state_diagram;

  signal clk_s : STD_LOGIC := '0';
  signal C_s : STD_LOGIC := '0';
  signal Y_s : STD_LOGIC;

  constant clk_period : time := 100 ns;

begin
  duv: FSM_from_state_diagram
      port map (
          clk => clk_s,
          C => C_s,
          Y => Y_s
      );

  clk_gen: process is
  begin
    clk_s <= '0', '1' after clk_period/2;
    wait for clk_period;
  end process clk_gen;

  stim_gen: process is
  begin
    C_s <= '0';
    wait for clk_period;

    -- Test transition from "00" to "01"
    wait for clk_period;

    -- Test transition from "01" to "10" (C = '0')
    C_s <= '0';
    wait for clk_period;

    -- Test transition from "01" to "11" (C = '1')
    C_s <= '1';
    wait for clk_period;

    -- Test transition from "10" to "00"
    C_s <= '0';
    wait for clk_period;

    -- Test transition from "11" to "00"
    C_s <= '1';
    wait for clk_period;

    -- Stop simulation
    wait;
  end process stim_gen;

end Behavioral;
