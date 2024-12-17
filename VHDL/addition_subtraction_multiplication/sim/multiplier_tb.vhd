----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/01/2024 07:59:01 PM
-- Design Name: 
-- Module Name: multiplier_tb - Behavioral
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

entity multiplier_tb is
--  Port ( );
end multiplier_tb;

architecture Behavioral of multiplier_tb is
    component multiplier is
        port ( A, B : in  STD_LOGIC_VECTOR(1 downto 0);
               C : out  STD_LOGIC_VECTOR(3 downto 0));
    end component;

    signal A_s, B_s: STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal C_s : STD_LOGIC_VECTOR(3 downto 0);

begin
    duv: multiplier
        port map(
            A => A_s,
            B => B_s,
            C => C_s
        );

    sim_gen: process
    begin
        A_s <= "00" after 100 ns, "01" after 300 ns, "10" after 500 ns, "11" after 700 ns;
        B_s <= "00" after 200 ns, "01" after 400 ns, "10" after 600 ns, "11" after 800 ns;

        wait;
    end process;

end Behavioral;
