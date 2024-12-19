----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/18/2024 04:44:28 PM
-- Design Name: 
-- Module Name: PIPO_PIPO_sync_4bit_register_with_ce_we - Behavioral
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

entity PIPO_sync_4bit_register_with_ce_we is
    Port (
        D : in STD_LOGIC_VECTOR (3 downto 0);
        ce, we : in STD_LOGIC;
        clk : in STD_LOGIC;
        set, reset : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (3 downto 0)
    );
end PIPO_sync_4bit_register_with_ce_we;

architecture Behavioral of PIPO_sync_4bit_register_with_ce_we is

begin
    reg_4bit: process (clk)
    begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                Q <= (others => '0');
            elsif (set = '1') then
                Q <= (others => '1');
            else
                if (ce = '1') then
                    if (we = '1') then
                        Q <= D;
                    end if;
                end if;
            end if;
        end if;
    end process;

end Behavioral;
