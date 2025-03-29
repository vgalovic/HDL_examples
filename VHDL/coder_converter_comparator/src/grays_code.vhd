library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity grays_code is
    Port (b : in  STD_LOGIC_VECTOR (2 downto 0);
          g : out  STD_LOGIC_VECTOR (2 downto 0));
end entity grays_code;

architecture Behavioral of grays_code is

begin

  with b select
    g <= "000" when "000",
         "001" when "001",
         "011" when "010",
         "010" when "011",
         "110" when "100",
         "111" when "101",
         "101" when "110",
         "100" when others;

end Behavioral;
