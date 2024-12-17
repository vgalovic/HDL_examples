----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/04/2024 06:48:29 PM
-- Design Name: 
-- Module Name: grays_code_tb - Behavioral
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

entity grays_code_tb is
--  Port ( );
end grays_code_tb;

architecture Behavioral of grays_code_tb is
    component grays_code
        Port ( b : in  STD_LOGIC_VECTOR (2 downto 0);
               g : out  STD_LOGIC_VECTOR (2 downto 0));
    end component;

    signal b_s : STD_LOGIC_VECTOR (2 downto 0);
    signal g_s : STD_LOGIC_VECTOR (2 downto 0);

begin
    duv : grays_code
        Port Map(
	    b => b_s,
	    g => g_s
	);

    sim_gen : process
    begin
	for i in 0 to 7 loop
	    b_s <= std_logic_vector(to_unsigned(i, 3));
	    wait for 100 ns;
	end loop;

	wait;
    end process;

end Behavioral;
