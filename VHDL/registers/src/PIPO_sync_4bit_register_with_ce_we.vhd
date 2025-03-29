library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity PIPO_sync_4bit_register_with_ce_we is
  Port (
    D : in STD_LOGIC_VECTOR (3 downto 0);
    ce, we : in STD_LOGIC;
    clk : in STD_LOGIC;
    set, reset : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR (3 downto 0)
  );
end entity PIPO_sync_4bit_register_with_ce_we;

architecture Behavioral of PIPO_sync_4bit_register_with_ce_we is

begin
  reg_4bit: process (clk) is
  begin
    if (rising_edge(clk)) then
      if (reset = '1') then
        Q <= (others => '0');
      elsif (set = '1') then
        Q <= (others => '1');
      else
        if (ce = '1') then
          if (we = '1') then
            Q <= D;
          end if;
        end if;
      end if;
    end if;
  end process reg_4bit;

end Behavioral;
