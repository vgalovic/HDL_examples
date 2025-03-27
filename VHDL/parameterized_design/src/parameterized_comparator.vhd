----------------------------------------------------------------------------------
-- Company:
-- Engineer: Vladimir Galović
--
-- Create Date: 03/23/2025 11:56:26 AM
-- Design Name:
-- Module Name: parameterized_comparator - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity parameterized_comparator is
  generic (
    width : integer := 8
  );
  port (
    a  : in    std_logic_vector(width - 1 downto 0);
    b  : in    std_logic_vector(width - 1 downto 0);
    eq : out   std_logic;
    lt : out   std_logic;
    gt : out   std_logic
  );
end entity parameterized_comparator;

architecture behavioral of parameterized_comparator is

begin

  comparator : process (a, b) is
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

end architecture behavioral;
