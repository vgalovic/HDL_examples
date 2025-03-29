library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity bcd_to_7seg is
    Port (x : in  STD_LOGIC_VECTOR (3 downto 0);
          y : out  STD_LOGIC_VECTOR (6 downto 0));
end entity bcd_to_7seg;

architecture Behavioral of bcd_to_7seg is

begin
  with x select
  y <= "1111110" when "0000",
       "0110000" when "0001",
       "1101101" when "0010",
       "1111001" when "0011",
       "0110011" when "0100",
       "1011011" when "0101",
       "1011111" when "0110",
       "1110000" when "0111",
       "1111111" when "1000",
       "1111011" when "1001",
       "0000000" when others;

  -- seven_seg: process(x) is
  -- begin
  --  case x is
  --    when "0000" => y <= "1111110";
  --    when "0001" => y <= "0110000";
  --    when "0010" => y <= "1101101";
  --    when "0011" => y <= "1111001";
  --    when "0100" => y <= "0110011";
  --    when "0101" => y <= "1011011";
  --    when "0110" => y <= "0011111";
  --    when "0111" => y <= "1110000";
  --    when "1000" => y <= "1111111";
  --    when "1001" => y <= "1111011";
  --    when others => y <= "0000000";
  --  end case;
  -- end process seven_seg;

end Behavioral;
