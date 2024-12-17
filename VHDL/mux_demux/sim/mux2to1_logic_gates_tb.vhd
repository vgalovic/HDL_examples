----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 11/30/2024 03:05:30 PM
-- Design Name: 
-- Module Name: mux2to1_with_logic_gates_tb - Behavioral
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

entity mux2to1_with_logic_gates_tb is
--  Port ();
end mux2to1_with_logic_gates_tb;

architecture Behavioral of mux2to1_with_logic_gates_tb is
    component mux2to1_with_logic_gates
        Port (
            x1, x2, sel: in  STD_LOGIC;
            y : out STD_LOGIC
        );
    end component;

    signal x1_s, x2_s, sel_s : STD_LOGIC := '0';
    signal y_s : STD_LOGIC;

begin
    duv: component mux2to1_with_logic_gates
        port map (
            x1  => x1_s,
            x2  => x2_s,
            sel => sel_s,
            y   => y_s
        );

    sim_gen: process
    begin
        x1_s <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 800 ns, '0' after 900 ns;
        x2_s <= '0', '1' after 300 ns, '0' after 400 ns, '1' after 600 ns, '0' after 700 ns;
        sel_s <= '0', '1' after 500 ns;

        wait;
    end process;

end Behavioral;
