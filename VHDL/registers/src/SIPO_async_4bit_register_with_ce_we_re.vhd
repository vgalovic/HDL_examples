----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/18/2024 09:51:30 PM
-- Design Name: 
-- Module Name: SIPO_async_4bit_register_with_ce_we_re - Behavioral
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

entity SIPO_async_4bit_register_with_ce_we_re is
    generic (
        WIDTH : integer := 4
    );
    Port (
        D : in STD_LOGIC;
        clk, ce, we, re : in STD_LOGIC;
        clear, preset : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (WIDTH - 1 downto 0)
    );
end SIPO_async_4bit_register_with_ce_we_re;

architecture Behavioral of SIPO_async_4bit_register_with_ce_we_re is
    signal Q_s : STD_LOGIC_VECTOR(WIDTH - 1 downto 0) := (others => '0');
begin
    reg_4bit: process (clk, clear, preset, Q_s)
    begin
        if clear = '1' then
            Q_s <= (others => '0');
        elsif preset = '1' then
            Q_s <= (others => '1');
        elsif rising_edge(clk) then
            if ce = '1' then
                if we = '1' then
                    Q_s <= D & Q_s(WIDTH - 1 downto 1);
                end if;
            end if;
        end if;

        if re = '1' then
            Q <= Q_s;
        else
            Q <= (others => '0');
        end if;
    end process;

end Behavioral;
