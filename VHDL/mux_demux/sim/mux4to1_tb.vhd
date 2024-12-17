----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 11/30/2024 04:08:00 PM
-- Design Name: 
-- Module Name: mux4to1_tb - Behavioral
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

entity mux4to1_tb is
--  Port ( );
end mux4to1_tb;

architecture Behavioral of mux4to1_tb is
    component mux4to1
        Port ( x0, x1, x2, x3 : in std_logic;
               sel : in std_logic_vector(1 downto 0);
               y : out std_logic);
    end component;

    signal x0_s, x1_s, x2_s, x3_s : std_logic := '0';
    signal sel_s : std_logic_vector(1 downto 0) := "00";
    signal y_s : std_logic;

begin
    duv: mux4to1
        port map(
            x0 => x0_s,
            x1 => x1_s,
            x2 => x2_s,
            x3 => x3_s,
            sel => sel_s,
            y => y_s
        );

    sim_gen: process
    begin
        x0_s <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 800 ns, '0' after 900 ns;
        x1_s <= '0', '1' after 300 ns, '0' after 400 ns, '1' after 600 ns, '0' after 700 ns;
        x2_s <= '0', '1' after 500 ns, '0' after 600 ns, '1' after 800 ns, '0' after 900 ns;
        x3_s <= '0', '1' after 700 ns, '0' after 800 ns, '1' after 1000 ns, '0' after 1100 ns;
        sel_s <= "00", "01" after 500 ns, "10" after 700 ns, "11" after 900 ns;

        wait;
    end process;

end Behavioral;
