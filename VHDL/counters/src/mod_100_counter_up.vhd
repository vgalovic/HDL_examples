library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;
  use IEEE.MATH_REAL.ALL;

entity mod_100_counter_up is
     Generic (
        M : integer := 100;
        WIDTH : integer := integer(ceil(log2(real(100))))
    );
    Port (
        clk : in STD_LOGIC;
        ce, en : in STD_LOGIC;
        reset : in STD_LOGIC;
        q : out STD_LOGIC_VECTOR (WIDTH - 1 downto 0)
    );
end mod_100_counter_up;

architecture Behavioral of mod_100_counter_up is
    subtype cnt_range_t is integer range 0 to M - 1;
    signal count_s : cnt_range_t := 0;

begin
    cnt: process(clk, ce, en, reset)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                count_s <= 0;
            elsif ce = '1' and en = '1' then
                if count_s >= M - 1 then
                    count_s <= 0;
                else
                    count_s <= count_s + 1;
                end if;
            end if;
        end if;
    end process cnt;

    q <= std_logic_vector(to_unsigned(count_s, WIDTH));

end Behavioral;
