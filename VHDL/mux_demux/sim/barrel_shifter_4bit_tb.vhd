library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity barrel_shifter_4bit_tb is
--  Port ( );
  end entity barrel_shifter_4bit_tb;

architecture Behavioral of barrel_shifter_4bit_tb is
  component barrel_shifter_4bit is
    Port ( x : in STD_LOGIC_VECTOR(3 downto 0);
           s : in STD_LOGIC_VECTOR(1 downto 0);
           y : out STD_LOGIC_VECTOR(3 downto 0));
  end component barrel_shifter_4bit;

  signal x_s : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
  signal s_s: STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
  signal y_s : STD_LOGIC_VECTOR(3 downto 0);

begin

  duv: barrel_shifter_4bit
    port map (
      x => x_s,
      s => s_s,
      y => y_s
    );

  sim_gen: process is
  begin
    x_s <= "1001";
    s_s <= "00", "01" after 200 ns, "10" after 400 ns, "11" after 600 ns;
    wait;
  end process sim_gen;

end Behavioral;
