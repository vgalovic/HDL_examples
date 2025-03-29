library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity compare_and_subtract is
  generic (
    WIDTH : integer := 8
  );
  port (
    b_r : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    r_r : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);

    q_bit : out STD_LOGIC;
    r_temp : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
  );
end entity compare_and_subtract;

architecture Behavioral of compare_and_subtract is

  signal sel : STD_LOGIC;

  signal subtractor: STD_LOGIC_VECTOR(WIDTH-1 downto 0);

begin

  comparator : process(b_r, r_r) is
  begin
    if (r_r >= b_r) then
      sel <= '1';
    else
      sel <= '0';
    end if;
  end process;

  mux : process(sel, r_r, b_r, subtractor) is
  begin

    case sel is
      when '1' => r_temp <= subtractor;
      when '0' => r_temp <= r_r;
      when others => null;
    end case;

  end process;


  subtractor <= STD_LOGIC_VECTOR(resize(UNSIGNED(r_r), WIDTH) - resize(UNSIGNED(b_r), WIDTH));

  q_bit <= sel;

end Behavioral;
