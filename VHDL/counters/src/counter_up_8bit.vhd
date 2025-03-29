library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_up_8bit is
    Generic (
        WIDTH : integer := 8
    );
    Port (
        clk : in STD_LOGIC;
        ce, en : in STD_LOGIC;
        reset : in STD_LOGIC;
        q : out STD_LOGIC_VECTOR (WIDTH - 1 downto 0)
    );
end counter_up_8bit;

architecture Behavioral of counter_up_8bit is
    signal count_s: STD_LOGIC_VECTOR (WIDTH - 1 downto 0) := (others => '0');
begin
    cnt: process(clk, ce, en, reset)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                count_s <= (others => '0');
            elsif ce = '1' and en = '1' then
                    count_s <= count_s + 1;
            end if;
        end if;
    end process cnt;

    q <= count_s;
end Behavioral;
