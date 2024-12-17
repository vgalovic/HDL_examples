----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 11/30/2024 04:59:34 PM
-- Design Name: 
-- Module Name: mux4to1_16bit_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux4to1_16bit_tb is
--  Port ( );
end mux4to1_16bit_tb;

architecture Behavioral of mux4to1_16bit_tb is
    component mux4to1_16bit
        Port ( x0, x1, x2, x3 : in  STD_LOGIC_VECTOR (15 downto 0);
               sel : in  STD_LOGIC_VECTOR (1 downto 0);
               y : out  STD_LOGIC_VECTOR (15 downto 0));
    end component;

    signal x0_s, x1_s, x2_s, x3_s : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal sel_s : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal y_s : STD_LOGIC_VECTOR (15 downto 0);

begin
    duv : mux4to1_16bit
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
        x0_s <= STD_LOGIC_VECTOR(to_unsigned(0, 16)), 
                STD_LOGIC_VECTOR(to_unsigned(5, 16)) after 100 ns, 
                STD_LOGIC_VECTOR(to_unsigned(11, 16)) after 200 ns, 
                STD_LOGIC_VECTOR(to_unsigned(4, 16)) after 800 ns,
                STD_LOGIC_VECTOR(to_unsigned(8, 16)) after 900 ns;

        x1_s <= STD_LOGIC_VECTOR(TO_UNSIGNED(1, 16)), 
                STD_LOGIC_VECTOR(TO_UNSIGNED(6, 16)) after 300 ns, 
                STD_LOGIC_VECTOR(TO_UNSIGNED(12, 16)) after 400 ns, 
                STD_LOGIC_VECTOR(TO_UNSIGNED(7, 16)) after 600 ns,
                STD_LOGIC_VECTOR(TO_UNSIGNED(9, 16)) after 700 ns;

        x2_s <= STD_LOGIC_VECTOR(TO_UNSIGNED(2, 16)), 
                STD_LOGIC_VECTOR(TO_UNSIGNED(7, 16)) after 500 ns, 
                STD_LOGIC_VECTOR(TO_UNSIGNED(13, 16)) after 600 ns, 
                STD_LOGIC_VECTOR(TO_UNSIGNED(8, 16)) after 800 ns,
                STD_LOGIC_VECTOR(TO_UNSIGNED(10, 16)) after 900 ns;

        x3_s <= STD_LOGIC_VECTOR(TO_UNSIGNED(3, 16)), 
                STD_LOGIC_VECTOR(TO_UNSIGNED(8, 16)) after 700 ns, 
                STD_LOGIC_VECTOR(TO_UNSIGNED(14, 16)) after 800 ns, 
                STD_LOGIC_VECTOR(TO_UNSIGNED(9, 16)) after 1000 ns,
                STD_LOGIC_VECTOR(TO_UNSIGNED(11, 16)) after 1100 ns;

        sel_s <= "00", "01" after 500 ns, "10" after 700 ns, "11" after 900 ns;

        wait;
    end process;

end Behavioral;
