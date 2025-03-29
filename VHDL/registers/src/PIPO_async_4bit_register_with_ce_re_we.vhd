library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity  PIPO_async_4bit_register_with_ce_re_we is
  Port (
    D : in STD_LOGIC_VECTOR (3 downto 0);
    clk : in STD_LOGIC;
    ce, re, we : in STD_LOGIC;
    clear, preset : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR (3 downto 0)
  );
end entity PIPO_async_4bit_register_with_ce_re_we;

architecture Behavioral of  PIPO_async_4bit_register_with_ce_re_we is

  signal Q_s : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');

begin

  reg_4bit: process (clk, clear, preset, re, we, Q_s) is
  begin

    if (clear = '1') then
      Q_s <= (others => '0');
    elsif (preset = '1') then
      Q_s <= (others => '1');
    elsif rising_edge(clk) then
      if (ce = '1') then
        if (we = '1') then
          Q_s <= D;
        end if;
      end if;
    end if;

    if (re = '0') then
      Q <= (others => '0');
    else
      Q <= Q_s;
    end if;

  end process reg_4bit;

end Behavioral;
