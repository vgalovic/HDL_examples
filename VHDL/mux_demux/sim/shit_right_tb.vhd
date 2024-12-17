----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/01/2024 04:37:46 PM
-- Design Name: 
-- Module Name: shit_right_tb - Behavioral
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

entity shit_right_tb is
--  Port ( );
end shit_right_tb;

architecture Behavioral of shit_right_tb is
    component shift_right
        port (
            x : in STD_LOGIC_VECTOR(3 downto 0);
            shift : in STD_LOGIC;
            y : out STD_LOGIC_VECTOR(3 downto 0);
            k : out STD_LOGIC
        );
    end component;

    signal x_s: STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal shift_s: STD_LOGIC := '0';
    signal y_s: STD_LOGIC_VECTOR(3 downto 0);
    signal k_s: STD_LOGIC;
begin
    duv: shift_right
    port map(
        x => x_s,
        shift => shift_s,
        y => y_s,
        k => k_s
    );

    sim_proc: process
    begin
        x_s <= "0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111",
               "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111";
        shift_s <= '0', '1' after 100 ns, '0' after 300 ns, '1' after 600 ns;
        wait;
    end process;

end Behavioral;
