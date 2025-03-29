library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity half_adder is
  Port (A, B : in  STD_LOGIC;
        S, C : out  STD_LOGIC);
end entity half_adder;

architecture Behavioral of half_adder is

begin
  and_cir: entity work.and_cir
    port map (a => A,
              b => B,
              f => S);

  xor_cir: entity work.xor_cir
    port map (a => A,
              b => B,
              f => C);

end Behavioral;
