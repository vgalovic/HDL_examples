library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity D_flip_flop_synchro_en_tb is
--  Port ( );
end entity D_flip_flop_synchro_en_tb;

architecture Behavioral of D_flip_flop_synchro_en_tb is
  component D_flip_flop_synchro_en is
    Port (
      D : in STD_LOGIC;
      clk : in STD_LOGIC;
      reset : in STD_LOGIC;
      set : in STD_LOGIC;
      en : in STD_LOGIC;
      Q : out STD_LOGIC
    );
  end component D_flip_flop_synchro_en;

  signal D_s, clk_s, reset_s, set_s, en_s : STD_LOGIC := '0';
  signal Q_s : STD_LOGIC := '0';

begin
  duv: D_flip_flop_synchro_en
    port map (
      D => D_s,
      clk => clk_s,
      reset => reset_s,
      set => set_s,
      en => en_s,
      Q => Q_s
    );

  clk_gen: process is
  begin
    clk_s <= '0', '1' after 50 ns;
    wait for 100 ns;
  end process clk_gen;

  sim_gen: process is
  begin

      D_s <= '0',
             '1' after 100 ns,
             '0' after 200 ns,
             '1' after 300 ns,
             '0' after 400 ns,
             '1' after 500 ns,
             '0' after 600 ns,
             '1' after 700 ns,
             '0' after 800 ns,
             '1' after 900 ns;

      reset_s <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 500 ns, '0' after 600 ns;
      set_s <= '0', '1' after 200 ns, '0' after 300 ns , '1' after 400 ns, '0' after 500 ns;
      en_s <= '0', '1' after 300 ns;

      wait;

  end process sim_gen;

end Behavioral;
