library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity demux1to2_with_logic_gates_tb is
--  Port ( );
end entity demux1to2_with_logic_gates_tb;

architecture Behavioral of demux1to2_with_logic_gates_tb is
  component demux1to2_with_logic_gates is
    Port (x : in STD_LOGIC;
          sel : in STD_LOGIC;
          y0, y1 : out STD_LOGIC);
  end component demux1to2_with_logic_gates;

  signal x_s : STD_LOGIC := '0';
  signal sel_s : STD_LOGIC := '0';
  signal y0_s, y1_s : STD_LOGIC;

begin

  duv: demux1to2_with_logic_gates
    port map (
      x => x_s,
      sel => sel_s,
      y0 => y0_s,
      y1 => y1_s
    );

  sim_gen: process is
  begin
    x_s <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 300 ns;
    sel_s <= '0', '1' after 200 ns;
    wait;
  end process sim_gen;

end Behavioral;
