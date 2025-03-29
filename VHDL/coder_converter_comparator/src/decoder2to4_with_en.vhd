library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity decoder2to4_with_en is
    Port (x : in  STD_LOGIC_VECTOR (1 downto 0);
	  en : in  STD_LOGIC;
	  y : out  STD_LOGIC_VECTOR (3 downto 0)
    );
end entity decoder2to4_with_en;

architecture Behavioral of decoder2to4_with_en is

begin

  decoder: process(x, en) is
  begin
    y <= (others => '0');

    if en = '1' then
      if x = "00" then
        y(3) <= '1';
      elsif x = "01" then
        y(2) <= '1';
      elsif x = "10" then
        y(1) <= '1';
      elsif x = "11" then
        y(0) <= '1';
      end if;
    end if;
  end process decoder;

end Behavioral;
