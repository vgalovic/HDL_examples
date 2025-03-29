library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity compare_in_range_tb is
--  Port ( );
end entity compare_in_range_tb;

architecture Behavioral of compare_in_range_tb is
  component compare_in_range is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           in_range : out  STD_LOGIC);
  end component;

  signal a_s : STD_LOGIC_VECTOR (3 downto 0);
  signal in_range_s : STD_LOGIC;

begin
  duv: compare_in_range
    port map(
      a =>a_s,
      in_range => in_range_s
    );

  sim_gen: process is
  begin
    a_s <= "0000", "0011" after 200 ns, "0101" after 400 ns, "0111" after 600 ns, "1100" after 800 ns;

    wait;
  end process sim_gen;

end Behavioral;
