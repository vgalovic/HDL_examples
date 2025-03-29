library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity comparator_4bit is
    Port (a : in  STD_LOGIC_VECTOR (3 downto 0);
	  b : in  STD_LOGIC_VECTOR (3 downto 0);
	  eq : out  STD_LOGIC;
	  lt : out  STD_LOGIC;
	  gt : out  STD_LOGIC);
end entity comparator_4bit;

architecture Behavioral of comparator_4bit is

begin

  comparator: process(a, b) is
  begin
    eq <= '0';
    lt <= '0';
    gt <= '0';

    if (a = b) then
      eq <= '1';
    end if;

    if (a < b) then
      lt <= '1';
    end if;

    if (a > b) then
      gt <= '1';
    end if;
  end process comparator;

end Behavioral;
