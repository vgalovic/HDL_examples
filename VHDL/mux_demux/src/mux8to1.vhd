library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity mux8to1 is
  Port (x0, x1, x2, x3, x4, x5, x6, x7 : in  STD_LOGIC;
        sel : in  STD_LOGIC_VECTOR(2 downto 0);
        y : out  STD_LOGIC);
end entity mux8to1;

architecture Behavioral of mux8to1 is

  signal y_0, y_1: STD_LOGIC;
begin

  mux4to1_0 : entity work.mux4to1
    port map(
      x0 => x0,
      x1 => x1,
      x2 => x2,
      x3 => x3,
      sel => sel(1 downto 0),
      y => y_0
    );

  mux4to1_1 : entity work.mux4to1
    port map(
      x0 => x4,
      x1 => x5,
      x2 => x6,
      x3 => x7,
      sel => sel(1 downto 0),
      y => y_1
    );

  connect_mux: process(sel) is
  begin

    case sel(2) is
      when '0' => y <= y_0;
      when '1' => y <= y_1;
      when others => null;
    end case;

  end process connect_mux;

end Behavioral;
