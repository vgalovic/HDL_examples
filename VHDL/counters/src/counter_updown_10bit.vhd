----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 01/02/2025 04:53:41 PM
-- Design Name: 
-- Module Name: counter_updown_10bit - Behavioral
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

entity counter_updown_10bit is
    Generic(
        WIDTH : integer := 10
    );
    Port (
        clk : in STD_LOGIC;
        ce, en : in STD_LOGIC;
        load : in STD_LOGIC;
        updown : in STD_LOGIC;
        counter_value: in STD_LOGIC_VECTOR(WIDTH -1 downto 0);
        overflow : out STD_LOGIC;
        q : out STD_LOGIC_VECTOR(WIDTH -1 downto 0)
    );

end counter_updown_10bit;

architecture Behavioral of counter_updown_10bit is
    signal count_s : UNSIGNED(WIDTH -1 downto 0) := (others => '0');

begin
    cnt: process(clk, ce, en, load, updown, count_s)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                if load = '1' then
                    count_s <= unsigned(counter_value);
                elsif en = '1' then
                    if updown = '0' then
                        count_s <= count_s + 1;
                    else
                        count_s <= count_s - 1;
                    end if;
                end if;
            end if;
        end if;

        if updown = '0' then
            if  count_s = 2**WIDTH -1 then
                overflow <= '1';
            else
                overflow <= '0';
            end if;
        else
            if  count_s = 0 then
                overflow <= '1';
            else
                overflow <= '0';
            end if;
        end if;

    end process cnt;

    q <= std_logic_vector(count_s);

end Behavioral;
