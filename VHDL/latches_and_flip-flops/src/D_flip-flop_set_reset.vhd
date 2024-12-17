----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/17/2024 05:39:05 PM
-- Design Name: 
-- Module Name: D_flip_flop_set_reset - Behavioral
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

entity D_flip_flop_set_reset is
    Port (
        D : in STD_LOGIC;
        clk : in STD_LOGIC;
        set : in STD_LOGIC;
        reset : in STD_LOGIC;
        Q : out STD_LOGIC
    );
end D_flip_flop_set_reset;

architecture Behavioral of D_flip_flop_set_reset is

begin
    flip_flop : process(clk, set, reset)
    begin
        if (rising_edge(clk)) then
            if (set = '1') then
                Q <= '1';
            elsif (reset = '1') then
                Q <= '0';
            else
                Q <= D;
            end if;
        end if;
    end process;

end Behavioral;
