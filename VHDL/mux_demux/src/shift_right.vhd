library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity shift_right is
  Port (x : in STD_LOGIC_VECTOR(3 downto 0);
        shift : in STD_LOGIC;
        y : out STD_LOGIC_VECTOR(3 downto 0);
        k : out STD_LOGIC);
end entity shift_right;

architecture Behavioral of shift_right is

begin

  -- shr: process(x, shift) is
  -- begin
  --   case shift is
  --     when '0' =>
  --       y(3) <= x(3);
  --       y(2) <= x(2);
  --       y(1) <= x(1);
  --       y(0) <= x(0);
  --       k <= '0';
  --     when '1' =>
  --       y(3) <= '0';
  --       y(2) <= x(3);
  --       y(1) <= x(2);
  --       y(0) <= x(1);
  --       k <= x(0);
  --     when others => null;
  --   end case;
  -- end process shr;

  mux2to1_0: entity work.mux2to1
    port map(
      x1 => '0',
      x2 => x(0),
      sel => shift,
      y => k
    );

  mux2to1_1: entity work.mux2to1
    port map(
      x1 => x(0),
      x2 => x(1),
      sel => shift,
      y => y(0)
    );

  mux2to1_2: entity work.mux2to1
    port map(
      x1 => x(1),
      x2 => x(2),
      sel => shift,
      y => y(1)
    );

  mux2to1_3: entity work.mux2to1
    port map(
      x1 => x(2),
      x2 => x(3),
      sel => shift,
      y => y(2)
    );

  mux2to1_4: entity work.mux2to1
    port map(
      x1 => x(3),
      x2 => '0',
      sel => shift,
      y => y(3)
    );

end Behavioral;
