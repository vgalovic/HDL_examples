----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/17/2024 05:53:34 PM
-- Design Name: 
-- Module Name: D_flip_flop_asynchro_en - Behavioral
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

entity D_flip_flop_asynchro_en is
    Port (
        D : in STD_LOGIC;
        clk : in STD_LOGIC;
        clear : in STD_LOGIC;
        preset : in STD_LOGIC;
        en : in STD_LOGIC;
        Q : out STD_LOGIC
    );
end D_flip_flop_asynchro_en;

architecture Behavioral of D_flip_flop_asynchro_en is

begin
    filp_flop: process(clk, clear, preset, en)
    begin
        if (clear = '1') then
            Q <= '0';
        elsif (preset = '1') then
            Q <= '1';
        elsif (rising_edge(clk)) then
            if (en = '1') then
                Q <= D;
            end if;
        end if;
    end process;

end Behavioral;
