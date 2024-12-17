----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/01/2024 08:42:19 PM
-- Design Name: 
-- Module Name: full_subtractor_tb - Behavioral
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

entity full_subtractor_tb is
--  Port ( );
end full_subtractor_tb;

architecture Behavioral of full_subtractor_tb is
    component full_subtractor
        Port(A, B, Cin : in std_logic;
             S, Cout : out std_logic);
    end component;

    signal A_s, B_s, Cin_s: STD_LOGIC := '0';
    signal S_s, Cout_s : STD_LOGIC;

begin
    duv: full_subtractor
        port map(
            A => A_s,
            B => B_s,
            Cin => Cin_s,
            S => S_s,
            Cout => Cout_s
        );

    sim_gen: process
    begin
        A_s <= '0', '1' after 100 ns, '0' after 300 ns, '1' after 500 ns;
        B_s <= '0', '1' after 200 ns, '0' after 400 ns, '1' after 600 ns;
        Cin_s <= '0', '1' after 300 ns, '0' after 500 ns, '1' after 700 ns;

        wait;
    end process;

end Behavioral;
