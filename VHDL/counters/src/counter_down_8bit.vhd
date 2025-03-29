library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_down_8bit is
    Generic (
        WIDTH : integer := 8
    );
    Port (
        clk : in STD_LOGIC;
        ce, en : in STD_LOGIC;
        load : in STD_LOGIC;
        counter_value : in STD_LOGIC_VECTOR (WIDTH - 1 downto 0);
        q : out STD_LOGIC_VECTOR (WIDTH - 1 downto 0)
    );

end counter_down_8bit;

architecture Behavioral of counter_down_8bit is
    signal count_s : STD_LOGIC_VECTOR (WIDTH - 1 downto 0) := (others => '1');

begin
    cnt: process(clk, ce, en, load)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                if load = '1' then
                    count_s <= counter_value;
                elsif en = '1' then
                        count_s <= count_s - 1;
                end if;
            end if;
        end if;
    end process cnt;

    q <= count_s;

end Behavioral;
