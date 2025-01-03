----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 01/02/2025 10:09:06 PM
-- Design Name: 
-- Module Name: mod_counter_up_with_range_13_to_89 - Behavioral
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

use IEEE.MATH_REAL.ALL;

entity mod_counter_up_with_range_13_to_89 is
    Generic (
        MIN : integer := 13;
        MAX : integer := 89;
        WIDTH : integer := integer(ceil(log2(real(89))))
    );
    Port (
        clk : in STD_LOGIC;
        en : in STD_LOGIC;
        reset : in STD_LOGIC;
        laod : in STD_LOGIC;
        counter_value: in STD_LOGIC_VECTOR(WIDTH -1 downto 0);
        overflow : out STD_LOGIC;
        q : out STD_LOGIC_VECTOR (WIDTH - 1 downto 0)
    );
end mod_counter_up_with_range_13_to_89;

architecture Behavioral of mod_counter_up_with_range_13_to_89 is
    subtype cnt_range_t is integer range MIN to MAX;
    signal count_s : cnt_range_t := MIN;

begin
    cnt: process(clk, en, reset, laod, count_s, counter_value)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                count_s <= MIN;
            elsif laod = '1' then
                if counter_value < std_logic_vector(to_unsigned(MAX - 1, WIDTH)) then
                    count_s <= to_integer(unsigned(counter_value));
                end if;
            elsif en = '1' then
                if count_s >= MAX - 1 then
                    count_s <= MIN;
                else
                    count_s <= count_s + 1;
                end if;
            end if;
        end if;

        if count_s >= MAX -1 then
            overflow <= '1';
        else
            overflow <= '0';
        end if;
    end process cnt;

    q <= std_logic_vector(to_unsigned(count_s, WIDTH));


end Behavioral;
