library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity SIPO_async_4bit_register_with_ce_we_re is
  generic (
    WIDTH : integer := 4
  );
  Port (
    D : in STD_LOGIC;
    clk, ce, we, re : in STD_LOGIC;
    clear, preset : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR (WIDTH - 1 downto 0)
  );
end entity SIPO_async_4bit_register_with_ce_we_re;

architecture Behavioral of SIPO_async_4bit_register_with_ce_we_re is

  signal Q_s : STD_LOGIC_VECTOR(WIDTH - 1 downto 0) := (others => '0');

begin

  reg_4bit: process (clk, clear, preset, Q_s) is
  begin

    if clear = '1' then
      Q_s <= (others => '0');
    elsif preset = '1' then
      Q_s <= (others => '1');
    elsif rising_edge(clk) then
      if ce = '1' then
        if we = '1' then
          Q_s <= Q_s(WIDTH - 2 downto 0) & D;  -- Shift left, serial input `D` goes to LSB (more common in SIPO)
          -- Q_s <= D & Q_s(WIDTH - 1 downto 1);  -- Shift right, serial input `D` goes to MSB
        end if;
      end if;
    end if;

    if re = '1' then
      Q <= Q_s;
    else
      Q <= (others => '0');
    end if;

  end process reg_4bit;

end Behavioral;
