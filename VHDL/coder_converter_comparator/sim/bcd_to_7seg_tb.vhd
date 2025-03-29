library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity bcd_to_7seg_tb is
--  Port ( );
end entity bcd_to_7seg_tb;

architecture Behavioral of bcd_to_7seg_tb is
  component bcd_to_7seg is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : out  STD_LOGIC_VECTOR (6 downto 0));
  end component;

  signal x_s : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
  signal y_s : STD_LOGIC_VECTOR (6 downto 0);

begin

  duv : bcd_to_7seg
    port map(
      x => x_s,
      y => y_s
    );

  sim_gen : process is
  begin
    for i in 0 to 10 loop
      x_s <= std_logic_vector(to_unsigned(i, 4));
      wait for 100 ns;
    end loop;

    wait;
  end process sim_gen;

end Behavioral;
