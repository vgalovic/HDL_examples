library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_flip_flop_clear_preset_tb is
--  Port ( );
end entity D_flip_flop_clear_preset_tb;

architecture Behavioral of D_flip_flop_clear_preset_tb is
  component D_flip_flop_clear_preset is
    Port (
      D : in STD_LOGIC;
      clk : in STD_LOGIC;
      preset : in STD_LOGIC;
      clear : in STD_LOGIC;
      Q : out STD_LOGIC
    );
  end component D_flip_flop_clear_preset;

  signal D_s, clk_s, preset_s, clear_s, Q_s : STD_LOGIC := '0';

begin
  duv: D_flip_flop_clear_preset
    port map(
      D => D_s,
      clk => clk_s,
      preset => preset_s,
      clear => clear_s,
      Q => Q_s
    );

  clk_gen: process is
  begin
    clk_s <= '0', '1' after 50 ns;
    wait for 100 ns;
  end process clk_gen;

  sim_get: process is
  begin

    D_s <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 300 ns, '0' after 400 ns, '1' after 500 ns, '0' after 600 ns, '1' after 700 ns, '0' after 800 ns;
    preset_s <= '0', '1' after 200 ns, '0' after 300 ns;
    clear_s <= '0', '1' after 300 ns, '0' after 400 ns;
    wait;

  end process sim_get;

end Behavioral;
