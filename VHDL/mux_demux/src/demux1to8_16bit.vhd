----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/01/2024 06:39:46 PM
-- Design Name: 
-- Module Name: demux1to8_16bit - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity demux1to8_16bit is
    generic (
        DATA_WIDTH : integer := 16
    );
    Port (x : in  STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
          sel : in  STD_LOGIC_VECTOR (2 downto 0);
          y0, y1, y2, y3, y4, y5, y6, y7 : out  STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0)
    );

end demux1to8_16bit;

architecture Behavioral of demux1to8_16bit is

begin
    demux: process(x, sel)
    begin
        y0 <= (others => '0');
        y1 <= (others => '0');
        y2 <= (others => '0');
        y3 <= (others => '0');
        y4 <= (others => '0');
        y5 <= (others => '0');
        y6 <= (others => '0');
        y7 <= (others => '0');

        case sel is
            when "000" => y0 <= x;
            when "001" => y1 <= x;
            when "010" => y2 <= x;
            when "011" => y3 <= x;
            when "100" => y4 <= x;
            when "101" => y5 <= x;
            when "110" => y6 <= x;
            when "111" => y7 <= x;
            when others => null;
        end case;
    end process;


end Behavioral;
