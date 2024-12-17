----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/02/2024 04:25:25 PM
-- Design Name: 
-- Module Name: bin_encoder8to3 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bin_encoder8to3 is
    Port (x : in  STD_LOGIC_VECTOR (7 downto 0);
          y : out  STD_LOGIC_VECTOR (2 downto 0));
end bin_encoder8to3;

architecture Behavioral of bin_encoder8to3 is

begin
    encoder: process(x)
    begin
        y <= (others => '0');

        case x is
            when "00000001" => y <= "000";
            when "00000010" => y <= "001";
            when "00000100" => y <= "010";
            when "00001000" => y <= "011";
            when "00010000" => y <= "100";
            when "00100000" => y <= "101";
            when "01000000" => y <= "110";
            when "10000000" => y <= "111";
            when others => null;
        end case;
    end process;

end Behavioral;
