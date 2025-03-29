library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity parameterized_pipo_register_tb is
  generic (
    WIDTH_BEH : integer := 16;
    WIDTH_STR : integer := 32;
    period    : time    := 100 ns
  );
--  Port ( );
end entity parameterized_pipo_register_tb;

architecture behavioral of parameterized_pipo_register_tb is

  component parameterized_pipo_register is
    generic (
      WIDTH_BEH : integer := WIDTH_BEH;
      WIDTH_STR : integer := WIDTH_STR
    );
    port (
      clk   : in    STD_LOGIC;
      rst   : in    STD_LOGIC;
      d_beh : in    STD_LOGIC_VECTOR(WIDTH_BEH - 1 downto 0);
      y_beh : out   STD_LOGIC_VECTOR(WIDTH_BEH - 1 downto 0);
      d_str : in    STD_LOGIC_VECTOR(WIDTH_STR - 1 downto 0);
      y_str : out   STD_LOGIC_VECTOR(WIDTH_STR - 1 downto 0)
    );
  end component parameterized_pipo_register;

  signal clk_s : STD_LOGIC;
  signal rst_s : STD_LOGIC;

  signal d_beh_s : STD_LOGIC_VECTOR(WIDTH_BEH - 1 downto 0);
  signal y_beh_s : STD_LOGIC_VECTOR(WIDTH_BEH - 1 downto 0);

  signal d_str_s : STD_LOGIC_VECTOR(WIDTH_STR - 1 downto 0);
  signal y_str_s : STD_LOGIC_VECTOR(WIDTH_STR - 1 downto 0);

begin

  dut : component parameterized_pipo_register
    generic map (
      WIDTH_BEH => WIDTH_BEH,
      WIDTH_STR => WIDTH_STR
    )
    port map (
      clk   => clk_s,
      rst   => rst_s,
      d_beh => d_beh_s,
      y_beh => y_beh_s,
      d_str => d_str_s,
      y_str => y_str_s
    );

  -- Clock Generation Process (Continuous Clock)
  clk_gen : process is
  begin

    while true loop

      clk_s <= '0';
      wait for period / 2;
      clk_s <= '1';
      wait for period / 2;

    end loop;

  end process clk_gen;

  -- Generation Process of any other signal
  sim_gen : process is
  begin

    rst_s <= '0';
    wait for 2 * period;
    rst_s <= '1';
    wait for period;
    rst_s <= '0';
    wait;

  end process sim_gen;

  -- Data Generation Process for Behavioral Register
  data_beh_gen : process is
  begin

    for i in 0 to WIDTH_BEH - 1 loop

      d_beh_s <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, WIDTH_BEH));
      wait for period;

    end loop;

    wait;

  end process data_beh_gen;

  -- Data Generation Process for Structural Register
  data_str_gen : process is
  begin

    for i in 0 to WIDTH_STR - 1 loop

      d_str_s <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, WIDTH_STR));
      wait for period / 2;

    end loop;

    wait;

  end process data_str_gen;

end architecture behavioral;
