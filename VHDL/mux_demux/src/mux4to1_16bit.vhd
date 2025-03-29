library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity mux4to1_16bit is
  Port (x0, x1, x2, x3 : in  STD_LOGIC_VECTOR (15 downto 0);
        sel : in  STD_LOGIC_VECTOR (1 downto 0);
        y : out  STD_LOGIC_VECTOR (15 downto 0));
end entity mux4to1_16bit;

architecture Behavioral of mux4to1_16bit is

begin

  mux4to1 : process (x0, x1, x2, x3, sel) is
  begin
    case sel is
      when "00" => y <= x0;
      when "01" => y <= x1;
      when "10" => y <= x2;
      when "11" => y <= x3;
      when others => null;
    end case;
  end process mux4to1;

end Behavioral;
