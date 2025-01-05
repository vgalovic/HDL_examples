----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 01/03/2025 09:16:29 PM
-- Design Name: 
-- Module Name: FSM_from_state_diagram_tb - Behavioral
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

entity FSM_from_state_diagram_tb is
--  Port ( );
end FSM_from_state_diagram_tb;

architecture Behavioral of FSM_from_state_diagram_tb is
    component FSM_from_state_diagram
        Port (
            clk : in STD_LOGIC;
            C : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal clk_s : STD_LOGIC := '0';
    signal C_s : STD_LOGIC := '0';
    signal Y_s : STD_LOGIC;

    constant clk_period : time := 100 ns;

begin
    duv: FSM_from_state_diagram
        port map (
            clk => clk_s,
            C => C_s,
            Y => Y_s
        );

    clk_gen: process
    begin
        clk_s <= '0', '1' after clk_period/2;
        wait for clk_period;
    end process;

    stim_gen: process
    begin
        C_s <= '0';
        wait for clk_period;

        -- Test transition from "00" to "01"
        wait for clk_period;

        -- Test transition from "01" to "10" (C = '0')
        C_s <= '0';
        wait for clk_period;

        -- Test transition from "01" to "11" (C = '1')
        C_s <= '1';
        wait for clk_period;

        -- Test transition from "10" to "00"
        C_s <= '0';
        wait for clk_period;

        -- Test transition from "11" to "00"
        C_s <= '1';
        wait for clk_period;

        -- Stop simulation
        wait;
    end process;

end Behavioral;
