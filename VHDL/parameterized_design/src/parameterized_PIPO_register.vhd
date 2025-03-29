library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity parameterized_pipo_register is
  generic (
    WIDTH_BEH : integer := 16;
    WIDTH_STR : integer := 32
  );
  port (
    clk   : in    STD_LOGIC;
    rst   : in    STD_LOGIC;
    d_beh : in    STD_LOGIC_VECTOR(WIDTH_BEH - 1 downto 0);
    y_beh : out   STD_LOGIC_VECTOR(WIDTH_BEH - 1 downto 0);
    d_str : in    STD_LOGIC_VECTOR(WIDTH_STR - 1 downto 0);
    y_str : out   STD_LOGIC_VECTOR(WIDTH_STR - 1 downto 0)
  );
end entity parameterized_pipo_register;

architecture mixed of parameterized_pipo_register is

  -- Internal signal for structural register storage
  signal reg_str : STD_LOGIC_VECTOR(WIDTH_STR - 1 downto 0);

begin

  -- Behavioral Register Implementation
  behavioral_register : process (clk, rst) is
  begin

    if (rst = '1') then
      y_beh <= (others => '0');
    elsif rising_edge(clk) then
      y_beh <= d_beh;
    end if;

  end process behavioral_register;

  -- Structural Register Implementation

  strucural_registar : for i in 0 to WIDTH_STR - 1 generate
  begin

    ff : process (clk, rst) is
    begin

      if (rst = '1') then
        reg_str(i) <= '0';
      elsif rising_edge(clk) then
        reg_str(i) <= d_str(i);
      end if;

    end process ff;

  end generate strucural_registar;

  -- Output Assignment for Structural Register
  y_str <= reg_str;

end architecture mixed;
