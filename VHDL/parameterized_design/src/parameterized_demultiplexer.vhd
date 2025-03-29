library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity parameterized_demultiplexer is
  generic (
    WIDTH : integer := 4
  );
  port (
    x   : in    STD_LOGIC_VECTOR(WIDTH - 1 downto 0);
    sel : in    STD_LOGIC_VECTOR(1 downto 0);
    y0  : out   STD_LOGIC_VECTOR(WIDTH - 1 downto 0);
    y1  : out   STD_LOGIC_VECTOR(WIDTH - 1 downto 0);
    y2  : out   STD_LOGIC_VECTOR(WIDTH - 1 downto 0);
    y3  : out   STD_LOGIC_VECTOR(WIDTH - 1 downto 0)
  );
end entity parameterized_demultiplexer;

architecture behavioral of parameterized_demultiplexer is

begin

  demux : process (x, sel) is
  begin

    y0 <= (others => '0');
    y1 <= (others => '0');
    y2 <= (others => '0');
    y3 <= (others => '0');

    case sel is

      when "00" =>

        y0 <= x;

      when "01" =>

        y1 <= x;

      when "10" =>

        y2 <= x;

      when "11" =>

        y3 <= x;

      when others =>

        null;

    end case;

  end process demux;

end architecture behavioral;
