----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/04/2024 06:48:02 PM
-- Design Name: 
-- Module Name: grays_code - Behavioral
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

entity grays_code is
    Port (b : in  STD_LOGIC_VECTOR (2 downto 0);
          g : out  STD_LOGIC_VECTOR (2 downto 0));
end grays_code;

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
