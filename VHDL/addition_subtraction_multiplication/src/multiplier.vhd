library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity multiplier is
  Port (A, B : in  STD_LOGIC_VECTOR(1 downto 0);
        C : out  STD_LOGIC_VECTOR(3 downto 0));
end entity multiplier;

architecture Behavioral of multiplier is
  signal and1, and2, and3, and4, xor1: STD_LOGIC;

begin
  -- and1 <= A0 and B1;
  and_gate_0: entity work.and_cir
    port map (
        a => A(0),
        b => B(1),
        f => and1
    );

  -- C0 <= A0 and B0;
  and_gate_1: entity work.and_cir
    port map (
        a => A(0),
        b => B(0),
        f => C(0)
    );

  -- and2 <= A1 and B0;
  and_gate_2: entity work.and_cir
    port map (
        a => A(1),
        b => B(0),
        f => and2
    );

  -- and3 <= A1 and B1;
  and_gate_3: entity work.and_cir
    port map (
        a => A(1),
        b => B(1),
        f => and3
    );

  -- and4 <= and1 and and2;
  and_gate_4: entity work.and_cir
    port map (
        a => and1,
        b => and2,
        f => and4
    );

  -- C3 <= and3 and and4;
  and_gate_5: entity work.and_cir
    port map (
        a => and3,
        b => and4,
        f => C(3)
    );

  -- C1 <= and1 xor and2;
  xor_gate_0: entity work.xor_cir
    port map (
        a => and1,
        b => and2,
        f => C(1)
    );

  -- C2 <= and3 xor and4;
  xor_gate_1: entity work.xor_cir
    port map (
        a => and3,
        b => and4,
        f => C(2)
    );

end Behavioral;
