library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity full_subtractor is
  Port (A, B, Cin : in  STD_LOGIC;
        S, Cout : out  STD_LOGIC);
end entity full_subtractor;

architecture Behavioral of full_subtractor is
  signal xor1, and1, and2: STD_LOGIC;

begin

  -- xor1 <= A xor B;
  xor1_entry: entity work.xor_cir
    port map (a => A,
              b => B,
              f => xor1);

  -- S <= xor1 xor Cin;
  S_entry: entity work.xor_cir
    port map (a => xor1,
              b => Cin,
              f => S);

  -- and1 <= (not A) and B;
  and1_entry: entity work.and_cir
    port map (a => not A,
              b => B,
              f => and1);

  -- and2 <= (not xor1) and Cin;
  and2_entry: entity work.and_cir
    port map (a => not xor1,
              b => Cin,
              f => and2);

  Cout <= and1 or and2;
end Behavioral;
