library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity bin_encoder8to3_tb is
--  Port ( );
end entity bin_encoder8to3_tb;

architecture Behavioral of bin_encoder8to3_tb is
  component bin_encoder8to3 is
    Port (x : in  STD_LOGIC_VECTOR (7 downto 0);
          y : out  STD_LOGIC_VECTOR (2 downto 0));
  end component;

  signal x_s : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
  signal y_s : STD_LOGIC_VECTOR (2 downto 0);

begin

  duv: bin_encoder8to3
    port map (
        x => x_s,
        y => y_s
    );

  sim_gen: process is
  begin
    x_s <= "00000001", "00000010" after 100 ns, "00000100" after 200 ns, 
           "00001000" after 300 ns, "00010000" after 400 ns, "00100000" after 500 ns, 
           "01000000" after 600 ns, "10000000" after 700 ns;
    wait;
  end process sim_gen;


end Behavioral;
