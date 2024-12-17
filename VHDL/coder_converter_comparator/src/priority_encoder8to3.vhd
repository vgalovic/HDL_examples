----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/02/2024 07:21:16 PM
-- Design Name: 
-- Module Name: priority_encoder8to3 - Behavioral
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

entity priority_encoder8to3 is
    Port (x : in  STD_LOGIC_VECTOR (7 downto 0);
	  y : out  STD_LOGIC_VECTOR (2 downto 0);
	  z : out  STD_LOGIC);
end priority_encoder8to3;

architecture Behavioral of priority_encoder8to3 is

begin

    encoder: process(x)
    begin
	y <= (others => '0');
	z <= '0';

	if  x(7) = '1' then
	    y <= "111";
	elsif x(6) = '1' then
	    y <= "110";
	elsif x(5) = '1' then
	    y <= "101";
	elsif x(4) = '1' then
	    y <= "100";
	elsif x(3) = '1' then
	    y <= "011";
	elsif x(2) = '1' then
	    y <= "010";
	elsif x(1) = '1' then
	    y <= "001";
	elsif x(0) = '1' then
	    y <= "000";
	end if;

	if x = "00000000" then
	    z <= '0';
	else
	    z <= '1';
	end if;
    end process;

end Behavioral;
