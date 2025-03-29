library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity SR_flip_flop_with_falling_edge_tb is
--  Port ( );
end entity SR_flip_flop_with_falling_edge_tb;

architecture Behavioral of SR_flip_flop_with_falling_edge_tb is
  component SR_flip_flop_with_falling_edge is
    Port ( S   : in   STD_LOGIC;
           R   : in   STD_LOGIC;
           clk : in   STD_LOGIC;
           Q   : out  STD_LOGIC;
           nQ  : out  STD_LOGIC);
  end component SR_flip_flop_with_falling_edge;

  signal S_s : STD_LOGIC := '0';
  signal R_s : STD_LOGIC := '0';
  signal clk_s : STD_LOGIC := '0';
  signal Q_s : STD_LOGIC := '0';
  signal nQ_s : STD_LOGIC := '0';

begin

  duv: SR_flip_flop_with_falling_edge
    Port map(
      S   => S_s,
      R   => R_s,
      clk => clk_s,
      Q   => Q_s,
      nQ  => nQ_s
    );

  clk_gen: process is
  begin
    clk_s <= '0', '1' after 50 ns;
    wait for 100 ns;
  end process clk_gen;

  sim_gen: process is
  begin
    S_s <= '0' after 100 ns, '1' after 300 ns, '0' after 500 ns, '1' after 700 ns, '0' after 900 ns;
    R_s <= '0' after 200 ns, '1' after 400 ns, '0' after 600 ns, '1' after 800 ns, '0' after 1000 ns;
  wait;
  end process sim_gen;

end Behavioral;
