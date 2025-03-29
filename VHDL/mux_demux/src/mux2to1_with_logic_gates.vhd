library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity mux2to1_with_logic_gates is
  Port (x1,x2, sel: in STD_LOGIC;
      y: out STD_LOGIC);
end mux2to1_with_logic_gates;

architecture Behavioral of mux2to1_with_logic_gates is

  signal and1, and2 : STD_LOGIC;

begin

  and1 <= x1 and (not sel);
  and2 <= x2 and sel;

  y <= and1 or and2;

end Behavioral;
