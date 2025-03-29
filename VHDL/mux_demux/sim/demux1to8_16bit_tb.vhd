library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity demux1to8_16bit_tb is
--  Port ( );
end entity demux1to8_16bit_tb;

architecture Behavioral of demux1to8_16bit_tb is

  component demux1to8_16bit is
    Port ( x : in  STD_LOGIC_VECTOR (15 downto 0);
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
           y0, y1, y2, y3, y4, y5, y6, y7 : out  STD_LOGIC_VECTOR (15 downto 0)
    );
  end component demux1to8_16bit;

  signal x_s : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
  signal sel_s : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
  signal y0_s, y1_s, y2_s, y3_s, y4_s, y5_s, y6_s, y7_s : STD_LOGIC_VECTOR (15 downto 0);

begin
  duv: demux1to8_16bit
    port map(
        x => x_s,
        sel => sel_s,
        y0 => y0_s,
        y1 => y1_s,
        y2 => y2_s,
        y3 => y3_s,
        y4 => y4_s,
        y5 => y5_s,
        y6 => y6_s,
        y7 => y7_s
    );

  sim_gen: process is
  begin
    x_s <= STD_LOGIC_VECTOR(TO_UNSIGNED(8, 16));
    sel_s <= "000" after 100 ns,
             "001" after 200 ns,
             "010" after 300 ns,
             "011" after 400 ns,
             "100" after 500 ns,
             "101" after 600 ns,
             "110" after 700 ns,
             "111" after 800 ns;
    wait;
  end process;

end Behavioral;
