library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity JK_flip_flop_with_rising_edge_tb is
--  Port ( );
end entity JK_flip_flop_with_rising_edge_tb;

architecture Behavioral of JK_flip_flop_with_rising_edge_tb is
  component JK_flip_flop_with_rising_edge is
    Port ( J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           nQ : out  STD_LOGIC);
  end component JK_flip_flop_with_rising_edge;

  signal J_s : STD_LOGIC := '0';
  signal K_s : STD_LOGIC := '0';
  signal clk_s : STD_LOGIC := '0';
  signal Q_s : STD_LOGIC;
  signal nQ_s : STD_LOGIC;

begin

  duv: JK_flip_flop_with_rising_edge
    Port Map (
      J => J_s,
      K => K_s,
      clk => clk_s,
      Q => Q_s,
      nQ => nQ_s
    );

  clk_gen: process is
  begin
    clk_s <= '0', '1' after 50 ns;
    wait for 100 ns;
  end process clk_gen;

  sim_gen: process is
  begin
    J_s <= '0', '1' after 100 ns, '0' after 300 ns, '1' after 500 ns;
    K_s <= '0', '1' after 200 ns, '0' after 400 ns;
    wait;
  end process sim_gen;

end Behavioral;
