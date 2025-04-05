library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;
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
            elsif(laod = '1' and
                  counter_value < STD_LOGIC_VECTOR(TO_UNSIGNED(MAX - 1, WIDTH)) and
                  counter_value > STD_LOGIC_VECTOR(TO_UNSIGNED(MIN, WIDTH))) then
                    count_s <= TO_INTEGER(UNSIGNED(counter_value));
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

    q <= STD_LOGIC_VECTOR(TO_UNSIGNED(count_s, WIDTH));


end Behavioral;
