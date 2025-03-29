library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity multiplier_tb is
--  Port ( );
end entity multiplier_tb;

architecture Behavioral of multiplier_tb is
  component multiplier is
    port ( A, B : in  STD_LOGIC_VECTOR(1 downto 0);
           C : out  STD_LOGIC_VECTOR(3 downto 0));
  end component multiplier;

  signal A_s, B_s: STD_LOGIC_VECTOR(1 downto 0) := "00";
  signal C_s : STD_LOGIC_VECTOR(3 downto 0);

begin
  duv: multiplier
    port map(
      A => A_s,
      B => B_s,
      C => C_s
    );

  sim_gen: process
  begin
    A_s <= "00" after 100 ns, "01" after 300 ns, "10" after 500 ns, "11" after 700 ns;
    B_s <= "00" after 200 ns, "01" after 400 ns, "10" after 600 ns, "11" after 800 ns;

    wait;
  end process;

end Behavioral;
