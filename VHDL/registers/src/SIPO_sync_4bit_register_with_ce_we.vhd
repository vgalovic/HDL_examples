library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity SIPO_sync_4bit_register_with_ce_we is
  generic (
    WIDTH : integer := 4
  );
  Port (
    D : in STD_LOGIC;
    clk, ce, we : in STD_LOGIC;
    set, reset : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR (WIDTH - 1 downto 0)
  );
end entity SIPO_sync_4bit_register_with_ce_we;

architecture Behavioral of SIPO_sync_4bit_register_with_ce_we is

signal Q_s : STD_LOGIC_VECTOR(WIDTH - 1 downto 0) := (others => '0');

begin

  reg_4bit: process (clk, Q_s) is
  begin

    if rising_edge(clk) then
      if set = '1' then
        Q_s <= (others => '1');
      elsif reset = '1' then
        Q_s <= (others => '0');
      elsif ce = '1' then
        if we = '1' then
          Q_s <= D & Q_s(WIDTH - 1 downto 1);
        end if;
      end if;
    end if;

    Q <= Q_s;

  end process reg_4bit;

end Behavioral;

