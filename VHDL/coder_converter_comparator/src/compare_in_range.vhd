----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/04/2024 09:27:21 PM
-- Design Name: 
-- Module Name: compare_in_range - Behavioral
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

entity compare_in_range is
    Port (a : in  STD_LOGIC_VECTOR (3 downto 0);
	  in_range : out  STD_LOGIC);
end compare_in_range;

architecture Behavioral of compare_in_range is

begin
    range_check: process(a)
    begin
	in_range <= '0';

	if( std_logic_vector(to_unsigned(3,4)) <= a and a < std_logic_vector(to_unsigned(7,4)) ) then
	    in_range <= '1';
	end if;
    end process;


end Behavioral;
