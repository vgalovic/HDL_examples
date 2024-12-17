----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/11/2024 04:29:25 PM
-- Design Name: 
-- Module Name: SR_flip_flop_with_falling_edge_tb - Behavioral
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

entity SR_flip_flop_with_falling_edge_tb is
--  Port ( );
end SR_flip_flop_with_falling_edge_tb;

architecture Behavioral of SR_flip_flop_with_falling_edge_tb is
    component SR_flip_flop_with_falling_edge
        Port ( S : in  STD_LOGIC;
			   R : in  STD_LOGIC;
               clk : in  STD_LOGIC;
			   Q : out  STD_LOGIC;
               nQ : out  STD_LOGIC);
    end component;

    signal S_s : STD_LOGIC := '0';
	signal R_s : STD_LOGIC := '0';
    signal clk_s : STD_LOGIC := '0';
    signal Q_s : STD_LOGIC := '0';
    signal nQ_s : STD_LOGIC := '0';
begin
    duv: SR_flip_flop_with_falling_edge
        Port map(
            S => S_s,
			R => R_s,
            clk => clk_s,
			Q => Q_s,
            nQ => nQ_s
        );

    clk_gen: process
    begin
        clk_s <= '0', '1' after 50 ns;
        wait for 100 ns;
    end process;

    sim_gen: process
    begin
        S_s <= '0' after 100 ns, '1' after 300 ns, '0' after 500 ns, '1' after 700 ns, '0' after 900 ns;
        R_s <= '0' after 200 ns, '1' after 400 ns, '0' after 600 ns, '1' after 800 ns, '0' after 1000 ns;
    wait;
    end process;


end Behavioral;
