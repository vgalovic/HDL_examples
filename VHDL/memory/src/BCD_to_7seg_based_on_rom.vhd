library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity BCD_to_7seg_based_on_rom is
  Generic (
    BCD_WIDTH : integer := 4;
    SEG_WIDTH : integer := 7;
    MEM_CAPACITY : integer := 16
  );
  Port (
    bcd : in STD_LOGIC_VECTOR (BCD_WIDTH-1 downto 0);
    seg : out STD_LOGIC_VECTOR (SEG_WIDTH-1 downto 0)
  );
end entity BCD_to_7seg_based_on_rom;

architecture Behavioral of BCD_to_7seg_based_on_rom is

  type rom_type is array (0 to MEM_CAPACITY-1) of STD_LOGIC_VECTOR (SEG_WIDTH-1 downto 0);
  signal rom_s : rom_type := (
    "1111110", -- 0
    "0110000", -- 1
    "1101101", -- 2
    "1111001", -- 3
    "0110011", -- 4
    "1011011", -- 5
    "1011111", -- 6
    "1110000", -- 7
    "1111111", -- 8
    "1111011", -- 9
    others =>  (others => '0')
  );

begin

  seg <= rom_s(to_integer(unsigned(bcd)));

end Behavioral;
