----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/19/2024 11:55:32 AM
-- Design Name: 
-- Module Name: SISO_sync_4bit_register_with_ce_we - Behavioral
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

entity SISO_sync_4bit_register_with_ce_we is
    Generic (
        WIDTH : integer := 4
    );
    Port (
        D : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        ce, we : in  STD_LOGIC;
        set, reset : in  STD_LOGIC;
        Q : out  STD_LOGIC
    );
end SISO_sync_4bit_register_with_ce_we;

architecture Behavioral of SISO_sync_4bit_register_with_ce_we is
    signal Q_s : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (others => '0');

begin
    reg_4bit: process(clk, Q_s)
    begin
        if rising_edge(clk) then
            if set = '1' then
                Q_s <= (others => '1');
            elsif reset = '1' then
                Q_s <= (others => '0');
            elsif ce = '1' then
                if we = '1' then
                    Q_s <= D & Q_s(WIDTH-1 downto 1);
                end if;
            end if;
        end if;

        Q <= Q_s(0);
    end process;

end Behavioral;
