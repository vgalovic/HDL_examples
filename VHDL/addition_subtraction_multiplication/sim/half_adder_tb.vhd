----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/01/2024 08:45:05 PM
-- Design Name: 
-- Module Name: half_adder_tb - Behavioral
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

entity half_adder_tb is
--  Port ( );
end half_adder_tb;

architecture Behavioral of half_adder_tb is
    component half_adder
        Port(A, B : in std_logic;
             S, C : out std_logic);
    end component;

    signal A_s, B_s: STD_LOGIC := '0';
    signal S_s, C_s : STD_LOGIC;

begin
    duv: half_adder
        port map(
            A => A_s,
            B => B_s,
            S => S_s,
            C => C_s
        );

    sim_gen: process
    begin
        A_s <= '0', '1' after 100 ns, '0' after 300 ns, '1' after 500 ns;
        B_s <= '0', '1' after 200 ns, '0' after 400 ns, '1' after 600 ns;

        wait;
    end process;

end Behavioral;
