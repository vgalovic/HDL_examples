library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity D_flip_flop_set_reset is
  Port (
    D : in STD_LOGIC;
    clk : in STD_LOGIC;
    set : in STD_LOGIC;
    reset : in STD_LOGIC;
    Q : out STD_LOGIC
  );
end entity D_flip_flop_set_reset;

architecture Behavioral of D_flip_flop_set_reset is

begin

  flip_flop : process(clk, set, reset) is
  begin
    if (rising_edge(clk)) then
      if (set = '1') then
        Q <= '1';
      elsif (reset = '1') then
        Q <= '0';
      else
        Q <= D;
      end if;
    end if;
  end process flip_flop;

end Behavioral;
