library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity BCD_to_7seg_based_on_rom_tb is
--  Port ( );
end entity BCD_to_7seg_based_on_rom_tb;

architecture Behavioral of BCD_to_7seg_based_on_rom_tb is
  component BCD_to_7seg_based_on_rom is
    Generic (
      BCD_WIDTH : integer := 4;
      SEG_WIDTH : integer := 7;
      MEM_CAPACITY : integer := 16
    );
    Port (
      bcd : in STD_LOGIC_VECTOR (BCD_WIDTH-1 downto 0);
      seg : out STD_LOGIC_VECTOR (SEG_WIDTH-1 downto 0)
    );
  end component BCD_to_7seg_based_on_rom;

  signal bcd_s : std_logic_vector(3 downto 0) := (others => '0');
  signal seg_s : std_logic_vector(6 downto 0) := (others => '0');
begin
  duv : BCD_to_7seg_based_on_rom
    generic map (
      BCD_WIDTH => 4,
      SEG_WIDTH => 7,
      MEM_CAPACITY => 16
    )
    port map (
      bcd => bcd_s,
      seg => seg_s
    );

  sim_gen : process is
  begin
    for i in 0 to 10 loop
      bcd_s <= std_logic_vector(to_unsigned(i, 4));
      wait for 100 ns;
    end loop;

    wait;
  end process sim_gen;

end Behavioral;
