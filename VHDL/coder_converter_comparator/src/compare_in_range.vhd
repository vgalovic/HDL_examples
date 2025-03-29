library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity compare_in_range is
    Port (a : in  STD_LOGIC_VECTOR (3 downto 0);
	  in_range : out  STD_LOGIC);
end entity compare_in_range;

architecture Behavioral of compare_in_range is

begin

  range_check: process(a) is
  begin
    in_range <= '0';

    if( std_logic_vector(to_unsigned(3,4)) <= a and a < std_logic_vector(to_unsigned(7,4)) ) then
      in_range <= '1';
    end if;
  end process range_check;


end Behavioral;
