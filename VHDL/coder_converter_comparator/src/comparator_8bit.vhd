library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity comparator_8bit is
    Port (a : in  STD_LOGIC_VECTOR (7 downto 0);
	  b : in  STD_LOGIC_VECTOR (7 downto 0);
	  neq : out  STD_LOGIC;
	  gt : out  STD_LOGIC;
	  lt : out  STD_LOGIC);
end entity comparator_8bit;

architecture Behavioral of comparator_8bit is

begin
  comparator: process(a, b) is
  begin
    neq <= '0';
    gt <= '0';
    lt <= '0';
    if (a /= b) then
        neq <= '1';
    end if;
    if (a >= b) then
        gt <= '1';
    end if;
    if (a <= b) then
        lt <= '1';
    end if;
  end process comparator;

end Behavioral;
