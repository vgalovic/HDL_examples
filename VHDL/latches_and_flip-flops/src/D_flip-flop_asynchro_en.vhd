library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity D_flip_flop_asynchro_en is
  Port (
    D : in STD_LOGIC;
    clk : in STD_LOGIC;
    clear : in STD_LOGIC;
    preset : in STD_LOGIC;
    en : in STD_LOGIC;
    Q : out STD_LOGIC
  );
end entity D_flip_flop_asynchro_en;

architecture Behavioral of D_flip_flop_asynchro_en is

begin

  filp_flop: process(clk, clear, preset, en) is
  begin
    if (clear = '1') then
      Q <= '0';
    elsif (preset = '1') then
      Q <= '1';
    elsif (rising_edge(clk)) then
      if (en = '1') then
        Q <= D;
      end if;
    end if;
  end process filp_flop;

end Behavioral;
