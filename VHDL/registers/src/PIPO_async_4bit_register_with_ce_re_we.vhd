----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/18/2024 05:09:38 PM
-- Design Name: 
-- Module Name: PIPO_ PIPO_async_4bit_register_with_ce_re_we - Behavioral
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

entity  PIPO_async_4bit_register_with_ce_re_we is
    Port (
        D : in STD_LOGIC_VECTOR (3 downto 0);
        clk : in STD_LOGIC;
        ce, re, we : in STD_LOGIC;
        clear, preset : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (3 downto 0)
    );
end  PIPO_async_4bit_register_with_ce_re_we;

architecture Behavioral of  PIPO_async_4bit_register_with_ce_re_we is
    signal Q_s : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
begin
    reg_4bit: process (clk, clear, preset, re, we, Q_s)
    begin
        if (clear = '1') then
            Q_s <= (others => '0');
        elsif (preset = '1') then
            Q_s <= (others => '1');
        elsif rising_edge(clk) then
            if (ce = '1') then
                if (we = '1') then
                    Q_s <= D;
                end if;
            end if;
        end if;

        if (re = '0') then
            Q <= (others => '0');
        else
            Q <= Q_s;
        end if;
    end process;

end Behavioral;
