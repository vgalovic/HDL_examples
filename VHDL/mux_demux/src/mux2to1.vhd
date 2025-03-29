library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is
  Port (x1, x2, sel : in  STD_LOGIC;
        y : out  STD_LOGIC);
end entity mux2to1;

architecture Behavioral of mux2to1 is

begin

  mux: process(x1, x2, sel) is
  begin
    case sel is
      when '0' => y <= x1;
      when '1' => y <= x2;
      when others => null;
    end case;
  end process mux;

end Behavioral;
