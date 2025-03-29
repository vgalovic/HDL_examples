library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity demux1to4_with_en is
  Port (x : in STD_LOGIC;
        sel : in STD_LOGIC_vector(1 downto 0);
        en : in STD_LOGIC;
        y0, y1, y2, y3 : out STD_LOGIC);
end entity demux1to4_with_en;

architecture Behavioral of demux1to4_with_en is

begin

  demux: process(x, sel, en) is
  begin
    y0 <= '0';
    y1 <= '0';
    y2 <= '0';
    y3 <= '0';

    if en = '1' then
      case sel is
        when "00" => y0 <= x;
        when "01" => y1 <= x;
        when "10" => y2 <= x;
        when "11" => y3 <= x;
        when others => null;
      end case;
    end if;
  end process demux;

end Behavioral;
