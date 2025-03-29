library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity dec_counter is
  port (
    clk   : in    STD_LOGIC;
    reset : in    STD_LOGIC;
    en    : in    STD_LOGIC;

    q     : out   STD_LOGIC_VECTOR(3 downto 0);
    pulse : out   STD_LOGIC
  );
end entity dec_counter;

architecture behavioral of dec_counter is

  signal count_s : UNSIGNED(3 downto 0);
  signal pulse_s : STD_LOGIC;

begin

 cnt : process (clk, reset) is
  begin
    if rising_edge(clk) then
      -- Reset counter and pulse when reset is asserted
      if reset = '1' then
        count_s <= (others => '0');
        pulse_s <= '0';
      elsif en = '1' then

        -- Send pulse one tick before counter reaches 9
        if count_s = 8 then
          pulse_s <= '1';
        else
          pulse_s <= '0';
        end if;

        -- Renset counter whent it reaches 9, otherwise increment
        if count_s = 9 then
          count_s <= (others => '0');
        else
          count_s <= count_s + 1;
        end if;
      end if;
    end if;
  end process cnt;

  q <= STD_LOGIC_VECTOR(count_s);
  pulse <= pulse_s;

end architecture behavioral;
