----------------------------------------------------------------------------------
-- Company:
-- Engineer: Vladimir Galović
--
-- Create Date: 03/22/2025 03:52:42 PM
-- Design Name:
-- Module Name: parameterized_demultiplexer - Behavioral
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

entity parameterized_demultiplexer is
  generic (
    width : integer := 4
  );
  port (
    x   : in    std_logic_vector(width - 1 downto 0);
    sel : in    std_logic_vector(1 downto 0);
    y0  : out   std_logic_vector(width - 1 downto 0);
    y1  : out   std_logic_vector(width - 1 downto 0);
    y2  : out   std_logic_vector(width - 1 downto 0);
    y3  : out   std_logic_vector(width - 1 downto 0)
  );
end entity parameterized_demultiplexer;

architecture behavioral of parameterized_demultiplexer is

begin

  demux : process (x, sel) is
  begin

    y0 <= (others => '0');
    y1 <= (others => '0');
    y2 <= (others => '0');
    y3 <= (others => '0');

    case sel is

      when "00" =>

        y0 <= x;

      when "01" =>

        y1 <= x;

      when "10" =>

        y2 <= x;

      when "11" =>

        y3 <= x;

      when others =>

        null;

    end case;

  end process demux;

end architecture behavioral;
