library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity half_adder_tb is
--  Port ( );
end entity half_adder_tb;

architecture Behavioral of half_adder_tb is
  component half_adder is
    Port(A, B : in std_logic;
         S, C : out std_logic);
  end component half_adder;

  signal A_s, B_s: STD_LOGIC := '0';
  signal S_s, C_s : STD_LOGIC;

begin
  duv: half_adder
    port map(
      A => A_s,
      B => B_s,
      S => S_s,
      C => C_s
    );

  sim_gen: process is
  begin
    A_s <= '0', '1' after 100 ns, '0' after 300 ns, '1' after 500 ns;
    B_s <= '0', '1' after 200 ns, '0' after 400 ns, '1' after 600 ns;

    wait;
  end process;

end Behavioral;
