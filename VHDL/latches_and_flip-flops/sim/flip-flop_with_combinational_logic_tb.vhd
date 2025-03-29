library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity flip_flop_with_combinational_logic_tb is
--  Port ( );
end entity flip_flop_with_combinational_logic_tb;

architecture Behavioral of flip_flop_with_combinational_logic_tb is
  component folip_flop_with_combinational_logic is
    Port (
      x1, x2 : in  STD_LOGIC;
      clk : in  STD_LOGIC;
      q1, q2 : out  STD_LOGIC
    );
  end component folip_flop_with_combinational_logic;

  signal x1_s, x2_s, clk_s, q1_s, q2_s : std_logic := '0';

begin
  duv: folip_flop_with_combinational_logic
    port map (
      x1 => x1_s,
      x2 => x2_s,
      clk => clk_s,
      q1 => q1_s,
      q2 => q2_s
    );

  clk_gen: process is
  begin
    clk_s <= '0', '1' after 50 ns;
    wait for 100 ns;
  end process clk_gen;

  sim_gen: process is
  begin
    x1_s <= '0', '1' after 100 ns, '0' after 300 ns, '1' after 500 ns, '0' after 700 ns;
    x2_s <= '0', '1' after 200 ns, '0' after 400 ns, '1' after 600 ns, '0' after 800 ns;
    wait;
  end process sim_gen;

end Behavioral;
