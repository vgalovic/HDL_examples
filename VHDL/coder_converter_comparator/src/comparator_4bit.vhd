----------------------------------------------------------------------------------
-- Company: 
-- Engineer:Vladimir Galović
-- 
-- Create Date: 12/04/2024 09:01:34 PM
-- Design Name: 
-- Module Name: comparator_4bit - Behavioral
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

entity comparator_4bit is
    Port (a : in  STD_LOGIC_VECTOR (3 downto 0);
	  b : in  STD_LOGIC_VECTOR (3 downto 0);
	  eq : out  STD_LOGIC;
	  lt : out  STD_LOGIC;
	  gt : out  STD_LOGIC);
end comparator_4bit;

architecture Behavioral of comparator_4bit is

begin
    process(a, b)
    begin
	eq <= '0';
	lt <= '0';
	gt <= '0';

	if (a = b) then
	    eq <= '1';
	end if;

	if (a < b) then
	    lt <= '1';
	end if;
	
	if (a > b) then
	    gt <= '1';
	end if;
    end process;

end Behavioral;
