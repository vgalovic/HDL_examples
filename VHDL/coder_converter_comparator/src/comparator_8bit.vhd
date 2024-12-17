----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/04/2024 09:14:15 PM
-- Design Name: 
-- Module Name: comparator_8bit - Behavioral
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

entity comparator_8bit is
    Port (a : in  STD_LOGIC_VECTOR (7 downto 0);
	  b : in  STD_LOGIC_VECTOR (7 downto 0);
	  neq : out  STD_LOGIC;
	  gt : out  STD_LOGIC;
	  lt : out  STD_LOGIC);
end comparator_8bit;

architecture Behavioral of comparator_8bit is

begin
    process(a, b)
    begin
	neq <= '0';
	gt <= '0';
	lt <= '0';
	if (a /= b) then
	    neq <= '1';
	end if;
	if (a >= b) then
	    gt <= '1';
	end if;
	if (a <= b) then
	    lt <= '1';
	end if;
    end process;

end Behavioral;
