----------------------------------------------------------------------------------
-- Company:
-- Engineer: Vlado Galović
--
-- Create Date: 03/24/2025 12:54:06 PM
-- Design Name:
-- Module Name: parameterized_counter - Behavioral
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
  use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity parameterized_counter is
  generic (
    width : integer := 8
  );
  port (
    clk   : in    std_logic;
    reset : in    std_logic;
    q     : out   std_logic_vector(width - 1 downto 0)
  );
end entity parameterized_counter;

architecture behavioral of parameterized_counter is

  signal count_s : std_logic_vector(width - 1 downto 0);

begin

  cnt : process (clk, reset) is
  begin

    if rising_edge(clk) then
      if (reset = '1') then
        count_s <= (others => '0');
      else
        count_s <= count_s + 1;
      end if;
    end if;

  end process cnt;

  q <= count_s;

end architecture behavioral;
