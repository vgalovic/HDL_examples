library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity priority_encoder8to3_tb is
--  Port ( );
end entity priority_encoder8to3_tb;

architecture Behavioral of priority_encoder8to3_tb is
  component priority_encoder8to3 is
    Port ( x : in  STD_LOGIC_VECTOR (7 downto 0);
           y : out  STD_LOGIC_VECTOR (2 downto 0);
           z : out  STD_LOGIC);
    end component priority_encoder8to3;

  signal x_s : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
  signal y_s : STD_LOGIC_VECTOR (2 downto 0);
  signal z_s : STD_LOGIC;

begin

    duv: priority_encoder8to3
      port map (
        x => x_s,
        y => y_s,
        z => z_s
      );

  sim_gen: process is
  begin
    x_s <= "00000000", "00000001" after 100 ns, "00000011" after 200 ns, "00000110" after 300 ns,
           "00001000" after 400 ns, "0001110" after 500 ns, "00100001" after 600 ns,
           "01111000" after 700 ns, "10101010" after 800 ns;
    wait;
  end process sim_gen;

end Behavioral;
