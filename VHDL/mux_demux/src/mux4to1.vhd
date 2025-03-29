library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity mux4to1 is
  Port (x0, x1, x2, x3 : in std_logic;
        sel : in std_logic_vector(1 downto 0);
        y : out std_logic);
end entity mux4to1;

architecture Behavioral of mux4to1 is

begin

  mux: process(x0, x1, x2, x3, sel) is
  begin
    case sel is
      when "00" => y <= x0;
      when "01" => y <= x1;
      when "10" => y <= x2;
      when "11" => y <= x3;
      when others => null;
    end case;
  end process mux;

end Behavioral;
