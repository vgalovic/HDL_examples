library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
--  Port ( );
end entity full_adder_tb;

architecture Behavioral of full_adder_tb is
  component full_adder is
    Port(A, B, Cin : in std_logic;
         S, Cout : out std_logic);
  end component full_adder;

  signal A_s, B_s, Cin_s: STD_LOGIC := '0';
  signal S_s, Cout_s : STD_LOGIC;

begin

  duv: full_adder
    port map(
      A => A_s,
      B => B_s,
      Cin => Cin_s,
      S => S_s,
      Cout => Cout_s
    );

  sim_gen: process
  begin
    A_s <= '0', '1' after 100 ns, '0' after 300 ns, '1' after 500 ns;
    B_s <= '0', '1' after 200 ns, '0' after 400 ns, '1' after 600 ns;
    Cin_s <= '0', '1' after 300 ns, '0' after 500 ns, '1' after 700 ns;

    wait;
  end process;

end Behavioral;
