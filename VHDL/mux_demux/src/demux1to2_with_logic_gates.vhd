library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity demux1to2_with_logic_gates is
  Port (x : in STD_LOGIC;
        sel : in STD_LOGIC;
        y0, y1 : out STD_LOGIC);
end entity demux1to2_with_logic_gates;

architecture Behavioral of demux1to2_with_logic_gates is

begin

  y0 <= x and (not sel);
  y1 <= x and sel;

end Behavioral;
