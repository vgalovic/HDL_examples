----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/04/2024 06:02:36 PM
-- Design Name: 
-- Module Name: bcd_to_7seg_tb - Behavioral
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

entity bcd_to_7seg_tb is
--  Port ( );
end bcd_to_7seg_tb;

architecture Behavioral of bcd_to_7seg_tb is
    component bcd_to_7seg
        Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
               y : out  STD_LOGIC_VECTOR (6 downto 0));
    end component;

    signal x_s : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal y_s : STD_LOGIC_VECTOR (6 downto 0);
begin
    duv : bcd_to_7seg
	port map(
	    x => x_s,
	    y => y_s
	);

    sim_gen : process
    begin
	for i in 0 to 10 loop
	    x_s <= std_logic_vector(to_unsigned(i, 4));
	    wait for 100 ns;
	end loop;

	wait;
    end process;

end Behavioral;
