library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity xor_cir is
  Port (a, b : in  STD_LOGIC;
        f : out  STD_LOGIC);
end entity xor_cir;

architecture Behavioral of xor_cir is

begin
  f <= a xor b;

end Behavioral;
