----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/11/2024 06:37:55 PM
-- Design Name: 
-- Module Name: d_flip_flop_with_delays_plus_assert - Behavioral
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

entity d_flip_flop_with_delays_plus_assert is
    Port (
        D : in  STD_LOGIC;
	clk : in  STD_LOGIC;
	Q : out  STD_LOGIC
    );
end d_flip_flop_with_delays_plus_assert;

architecture Behavioral of d_flip_flop_with_delays_plus_assert is
    constant tsu : time := 2 ns;
    constant th : time := 1.5 ns;
    constant tcq : time := 3 ns;

    signal Q_internal : STD_LOGIC := '0';
    signal last_D : STD_LOGIC := '0';
    signal D_last_event : time := 0 ns;
begin
    process(clk, D, last_D, D_last_event, Q_internal)
    begin
        if D /= last_D then
            last_D <= D;
            D_last_event <= now;
        end if;

        if rising_edge(clk) then
            -- Check setup time violation
            if now - D_last_event < tsu then
                report "Setup time violation detected" severity warning;
                Q_internal <= 'X';
            else
                -- Propagate input to output after tcq delay
                Q_internal <= D after tcq;
            end if;
        end if;

        if D /= last_D and not rising_edge(clk) then
            if now - D_last_event > th then
                report "Hold time violation detected" severity warning;
                Q_internal <= 'X';
            end if;
        end if;

    Q <= Q_internal;
    end process;

end Behavioral;

