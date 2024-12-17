----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/02/2024 07:46:48 PM
-- Design Name: 
-- Module Name: decoder2to4_with_en - Behavioral
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

entity decoder2to4_with_en is
    Port (x : in  STD_LOGIC_VECTOR (1 downto 0);
	  en : in  STD_LOGIC;
	  y : out  STD_LOGIC_VECTOR (3 downto 0)
    );
end decoder2to4_with_en;

architecture Behavioral of decoder2to4_with_en is

begin
    decoder: process(x, en)
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
    end process;

end Behavioral;
