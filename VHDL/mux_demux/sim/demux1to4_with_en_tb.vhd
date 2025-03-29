library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity demux1to4_with_en_tb is
--  Port ( );
end entity demux1to4_with_en_tb;

architecture Behavioral of demux1to4_with_en_tb is
  component demux1to4_with_en is
    Port (x : in STD_LOGIC;
          sel : in STD_LOGIC_vector(1 downto 0);
          en : in STD_LOGIC;
          y0, y1, y2, y3 : out STD_LOGIC);
  end component demux1to4_with_en;

    signal x_s : STD_LOGIC := '0';
    signal sel_s : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
    signal en_s : STD_LOGIC := '0';
    signal y0_s, y1_s, y2_s, y3_s : STD_LOGIC;

begin

  duv: demux1to4_with_en
    port map (
        x => x_s,
        sel => sel_s,
        en => en_s,
        y0 => y0_s,
        y1 => y1_s,
        y2 => y2_s,
        y3 => y3_s
    );

  sim_gen: process is
  begin
      x_s <= '0', '1' after 100 ns, '0' after 800 ns;

      sel_s <= "00",
               "01" after 100 ns,
               "10" after 200 ns,
               "11" after 300 ns,
               "00" after 400 ns,
               "01" after 500 ns,
               "10" after 600 ns,
               "11" after 700 ns;

      en_s <= '0', '1' after 200 ns;

      wait;
  end process sim_gen;

end Behavioral;
