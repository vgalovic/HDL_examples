library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity D_flip_flop_synchro_en is
  Port (
    D : in STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    set : in STD_LOGIC;
    en : in STD_LOGIC;
    Q : out STD_LOGIC
  );
end  entity D_flip_flop_synchro_en;

architecture Behavioral of D_flip_flop_synchro_en is

begin

  filp_flop : process(clk, en) is
  begin
    if (rising_edge(clk)) then
      if (set = '1') then
        Q <= '1';
      elsif (reset = '1') then
        Q <= '0';
      else
        if (en = '1') then
          Q <= D;
        end if;
      end if;
    end if;
  end process filp_flop;

end Behavioral;
