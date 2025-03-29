library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity and_cir is
  Port (a, b : in  STD_LOGIC;
        f : out  STD_LOGIC);
end entity and_cir;

architecture Behavioral of and_cir is

begin
  f <= a and b;

end Behavioral;
