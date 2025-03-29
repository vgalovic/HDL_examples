library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity FSM_corresponding_sequence_tb is
--  Port ( );
end entity FSM_corresponding_sequence_tb;

architecture Behavioral of FSM_corresponding_sequence_tb is
    component FSM_corresponding_sequence is
        Port (
            clk : in STD_LOGIC;
            w : in STD_LOGIC;
            z : out STD_LOGIC
        );
    end component FSM_corresponding_sequence;

    signal clk_s, reset_s, w_s : STD_LOGIC := '0';
    signal z_s : STD_LOGIC;

    constant clk_period : time := 100 ns;
begin
    duv: FSM_corresponding_sequence
      port map(
          clk => clk_s,
          w => w_s,
          z => z_s
      );

    clk_gen: process is
    begin
        clk_s <= '0', '1' after clk_period/2;
        wait for clk_period;
    end process clk_gen;

    stim_gen: process is
    begin
      w_s <= '0',
             '1' after clk_period * 1,
             '1' after clk_period * 2,
             '1' after clk_period * 3,
             '0' after clk_period * 4,
             '1' after clk_period * 5,
             '0' after clk_period * 6,
             '0' after clk_period * 7,
             '1' after clk_period * 8,
             '1' after clk_period * 9;

      wait;
    end process stim_gen;
end Behavioral;
