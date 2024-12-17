----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/02/2024 07:55:47 PM
-- Design Name: 
-- Module Name: decoder2to4_with_en_tb - Behavioral
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

entity decoder2to4_with_en_tb is
--  Port ( );
end decoder2to4_with_en_tb;

architecture Behavioral of decoder2to4_with_en_tb is
    component decoder2to4_with_en
	Port ( x : in  STD_LOGIC_VECTOR (1 downto 0);
	       en : in  STD_LOGIC;
	       y : out  STD_LOGIC_VECTOR (3 downto 0)
	     );
    end component;

    signal x_s : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
    signal en_s : STD_LOGIC := '0';
    signal y_s : STD_LOGIC_VECTOR (3 downto 0);

begin
    duv: decoder2to4_with_en
	port map(
	    x => x_s,
	    en => en_s,
	    y => y_s
	);

    sim_gen: process
    begin
	x_s <= "00", "01" after 200 ns, "10" after 400 ns, "11" after 600 ns;
	en_s <= '0', '1' after 100 ns;
	wait;
    end process;


end Behavioral;
