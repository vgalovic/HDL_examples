----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/11/2024 05:57:48 PM
-- Design Name: 
-- Module Name: JK_flip_flop_with_rising_edge_tb - Behavioral
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

entity JK_flip_flop_with_rising_edge_tb is
--  Port ( );
end JK_flip_flop_with_rising_edge_tb;

architecture Behavioral of JK_flip_flop_with_rising_edge_tb is
    component JK_flip_flop_with_rising_edge
        Port ( J : in  STD_LOGIC;
               K : in  STD_LOGIC;
               clk : in  STD_LOGIC;
               Q : out  STD_LOGIC;
               nQ : out  STD_LOGIC);
    end component;

    signal J_s : STD_LOGIC := '0';
    signal K_s : STD_LOGIC := '0';
    signal clk_s : STD_LOGIC := '0';
    signal Q_s : STD_LOGIC;
    signal nQ_s : STD_LOGIC;
begin

    duv: JK_flip_flop_with_rising_edge
        Port Map (
            J => J_s,
            K => K_s,
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
        J_s <= '0', '1' after 100 ns, '0' after 300 ns, '1' after 500 ns;
        K_s <= '0', '1' after 200 ns, '0' after 400 ns;
        wait;
    end process;

end Behavioral;
