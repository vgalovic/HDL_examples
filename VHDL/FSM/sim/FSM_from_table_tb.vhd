----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 01/03/2025 08:15:19 PM
-- Design Name: 
-- Module Name: FSM_from_table_tb - Behavioral
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

entity FSM_from_table_tb is
--  Port ( );
end FSM_from_table_tb;

architecture Behavioral of FSM_from_table_tb is
    component FSM_from_table
        Port (
            clk : in STD_LOGIC;
            x : in STD_LOGIC;
            y : in STD_LOGIC;
            o : out STD_LOGIC
        );
    end component;

    signal clk_s : STD_LOGIC := '0';
    signal x_s : STD_LOGIC := '0';
    signal y_s : STD_LOGIC := '0';
    signal o_s : STD_LOGIC;

    constant clk_period : time := 100 ns;

begin
    duv: FSM_from_table
        port map (
            clk => clk_s,
            x => x_s,
            y => y_s,
            o => o_s
        );

    clk_gen: process
    begin
        clk_s <= '0', '1' after clk_period/2;
        wait for clk_period;
    end process;

    stim_gen: process
    begin
        x_s <= '0'; y_s <= '0';
        wait for clk_period;

        x_s <= '0'; y_s <= '1';
        wait for clk_period;

        x_s <= '0'; y_s <= '0';
        wait for clk_period;

        x_s <= '1'; y_s <= '0';
        wait for clk_period;

        x_s <= '1'; y_s <= '1';
        wait for clk_period;

        wait;
    end process;

end Behavioral;
