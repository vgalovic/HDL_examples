----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/02/2024 08:04:00 PM
-- Design Name: 
-- Module Name: decoder3to8 - Behavioral
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

entity decoder3to8 is
    Port (x : in  STD_LOGIC_VECTOR (2 downto 0);
	  y : out  STD_LOGIC_VECTOR (7 downto 0)
    );
end decoder3to8;

architecture Behavioral of decoder3to8 is

begin
    decoder: process(x)
    begin
	y <= (others => '0');

	if x = "000" then
	    y(7) <= '1';
	elsif x = "001" then
	    y(6) <= '1';
	elsif x = "010" then
	    y(5) <= '1';
	elsif x = "011" then
	    y(4) <= '1';
	elsif x = "100" then
	    y(3) <= '1';
	elsif x = "101" then
	    y(2) <= '1';
	elsif x = "110" then
	    y(1) <= '1';
	elsif x = "111" then
	    y(0) <= '1';
	end if;
    end process;

end Behavioral;
