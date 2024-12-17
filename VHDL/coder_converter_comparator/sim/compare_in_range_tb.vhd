----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/04/2024 09:27:53 PM
-- Design Name: 
-- Module Name: compare_in_range_tb - Behavioral
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

entity compare_in_range_tb is
--  Port ( );
end compare_in_range_tb;

architecture Behavioral of compare_in_range_tb is
    component compare_in_range
	Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
	       in_range : out  STD_LOGIC);
    end component;

    signal a_s : STD_LOGIC_VECTOR (3 downto 0);
    signal in_range_s : STD_LOGIC;

begin
    duv: compare_in_range
	port map(
	    a =>a_s,
	    in_range => in_range_s
	);

    sim_gen: process
    begin
	a_s <= "0000", "0011" after 200 ns, "0101" after 400 ns, "0111" after 600 ns, "1100" after 800 ns;

	wait;
    end process;

end Behavioral;
