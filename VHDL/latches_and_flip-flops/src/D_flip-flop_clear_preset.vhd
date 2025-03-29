library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity D_flip_flop_clear_preset is
  Port (
    D : in STD_LOGIC;
    clk : in STD_LOGIC;
    preset : in STD_LOGIC;
    clear : in STD_LOGIC;
    Q : out STD_LOGIC
  );
end entity D_flip_flop_clear_preset;

architecture Behavioral of D_flip_flop_clear_preset is

begin

  flip_flop : process(clk, preset, clear) is
  begin
    if (preset = '1') then
      Q <= '1';
    elsif (clear = '1') then
      Q <= '0';
    elsif (rising_edge(clk)) then
      Q <= D;
    end if;
  end process flip_flop;

end Behavioral;
