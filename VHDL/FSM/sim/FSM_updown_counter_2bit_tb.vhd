library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity FSM_updown_counter_2bit_tb is
--  Port ( );
end entity FSM_updown_counter_2bit_tb;

architecture Behavioral of FSM_updown_counter_2bit_tb is
  component FSM_updown_counter_2bit
    Port (
        clk : in std_logic;
        d : in std_logic;
        q : out std_logic_vector(1 downto 0)
    );
  end component FSM_updown_counter_2bit;

  signal clk_s : std_logic := '0';
  signal d_s : std_logic := '0';
  signal q_s : std_logic_vector(1 downto 0);

  constant clk_period : time := 100 ns;
begin
  duv : FSM_updown_counter_2bit
    port map (
        clk => clk_s,
        d => d_s,
        q => q_s
    );

  clk_gen : process is
  begin
    clk_s <= '0', '1' after clk_period/2;
    wait for clk_period;
  end process clk_gen;

  stim_gen : process is
  begin
    d_s <= '0';
    wait for clk_period*2;
    d_s <= '1';
    wait for clk_period*4;
    d_s <= '0';
    wait for clk_period*2;

    wait;
  end process stim_gen;

end Behavioral;
