library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity majorety_voter is
  Port (X, Y, Z : in  STD_LOGIC;
        V : out  STD_LOGIC);
end entity majorety_voter;

architecture Behavioral of majorety_voter is
  signal and1, and2, and3, and_V_1, and_V: STD_LOGIC;

begin
   -- and1 <= X and Y;
  and1_entry: entity work.and_cir
    port map (a => X,
              b => Y,
              f => and1);

  -- and2 <= Y and Z;
  and2_entry: entity work.and_cir
    port map (a => Y,
              b => Z,
              f => and2);

  -- and3 <= Z and X;
  and3_entry: entity work.and_cir
    port map (a => Z,
              b => X,
              f => and3);
  
  -- and_V_1 <= (not and1) and (not and2);
  and_V_1_entry: entity work.and_cir
    port map (a => not and1,
              b => not and2,
              f => and_V_1);

  -- and_V <= and_V_1 and (not and3);
  and_V_entry: entity work.and_cir
    port map (a => and_V_1,
              b => not and3,
              f => and_V);

  V <= not and_V;

end Behavioral;

