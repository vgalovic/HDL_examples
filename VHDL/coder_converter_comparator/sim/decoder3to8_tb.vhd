library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity decoder3to8_tb is
--  Port ( );
end decoder3to8_tb;

architecture Behavioral of decoder3to8_tb is
  component decoder3to8 is
    Port ( x : in  STD_LOGIC_VECTOR (2 downto 0);
           y : out  STD_LOGIC_VECTOR (7 downto 0));
  end component;

    signal x_s : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal y_s : STD_LOGIC_VECTOR (7 downto 0);

begin
    duv: decoder3to8
	port map (
	    x => x_s,
	    y => y_s
	);

    sim_gen: process
    begin
	x_s <= "000", "001" after 100 ns, "010" after 200 ns, "011" after 300 ns,
	       "100" after 400 ns, "101" after 500 ns, "110" after 600 ns, "111" after 700 ns;
	wait;
    end process;


end Behavioral;
