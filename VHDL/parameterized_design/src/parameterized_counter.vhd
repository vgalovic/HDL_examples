library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity parameterized_counter is
  generic (
    WIDTH : integer := 8
  );
  port (
    clk   : in    STD_LOGIC;
    reset : in    STD_LOGIC;
    q     : out   STD_LOGIC_VECTOR(WIDTH - 1 downto 0)
  );
end entity parameterized_counter;

architecture behavioral of parameterized_counter is

  signal count_s : STD_LOGIC_VECTOR(WIDTH - 1 downto 0);

begin

  cnt : process (clk, reset) is
  begin

    if rising_edge(clk) then
      if (reset = '1') then
        count_s <= (others => '0');
      else
        count_s <= count_s + 1;
      end if;
    end if;

  end process cnt;

  q <= count_s;

end architecture behavioral;
