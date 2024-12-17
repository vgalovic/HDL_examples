----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/01/2024 05:08:02 PM
-- Design Name: 
-- Module Name: barrel_shifter_4bit_tb - Behavioral
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

entity barrel_shifter_4bit_tb is
--  Port ( );
end barrel_shifter_4bit_tb;

architecture Behavioral of barrel_shifter_4bit_tb is
    component barrel_shifter_4bit
        Port ( x : in STD_LOGIC_VECTOR(3 downto 0);
               s : in STD_LOGIC_VECTOR(1 downto 0);
               y : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    signal x_s : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal s_s: STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
    signal y_s : STD_LOGIC_VECTOR(3 downto 0);

begin
    duv: barrel_shifter_4bit
        port map (
            x => x_s,
            s => s_s,
            y => y_s
        );

    sim_gen: process
    begin
        x_s <= "1001";
        s_s <= "00", "01" after 200 ns, "10" after 400 ns, "11" after 600 ns;
        wait;
    end process;

end Behavioral;
