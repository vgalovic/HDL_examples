library IEEE;
  use iEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity parameterized_demultiplexer_tb is
  generic (
    WIDTH : integer := 4
  );
--  Port ( );
end entity parameterized_demultiplexer_tb;

architecture behavioral of parameterized_demultiplexer_tb is

  component parameterized_demultiplexer is
    generic (
      WIDTH : integer := WIDTH
    );
    port (
      x   : in    STD_LOGIC_VECTOR(WIDTH - 1 downto 0);
      sel : in    STD_LOGIC_VECTOR(1 downto 0);
      y0  : out   STD_LOGIC_VECTOR(WIDTH - 1 downto 0);
      y1  : out   STD_LOGIC_VECTOR(WIDTH - 1 downto 0);
      y2  : out   STD_LOGIC_VECTOR(WIDTH - 1 downto 0);
      y3  : out   STD_LOGIC_VECTOR(WIDTH - 1 downto 0)
    );
  end component parameterized_demultiplexer;

  signal x_s : STD_LOGIC_VECTOR(WIDTH - 1 downto 0);

  signal sel_s : STD_LOGIC_VECTOR(1 downto 0);

  signal y0_s : STD_LOGIC_VECTOR(WIDTH - 1 downto 0);
  signal y1_s : STD_LOGIC_VECTOR(WIDTH - 1 downto 0);
  signal y2_s : STD_LOGIC_VECTOR(WIDTH - 1 downto 0);
  signal y3_s : STD_LOGIC_VECTOR(WIDTH - 1 downto 0);

begin

  dut : component parameterized_demultiplexer
    port map (
      x   => x_s,
      sel => sel_s,
      y0  => y0_s,
      y1  => y1_s,
      y2  => y2_s,
      y3  => y3_s
    );

  sim_gen : process is
  begin

    x_s <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, WIDTH)),
           STD_LOGIC_VECTOR(TO_UNSIGNED(1, WIDTH)) after 100 ns,
           STD_LOGIC_VECTOR(TO_UNSIGNED(2, WIDTH)) after 200 ns,
           STD_LOGIC_VECTOR(TO_UNSIGNED(3, WIDTH)) after 300 ns;

    sel_s <= "00", "01" after 500 ns, "10" after 700 ns, "11" after 900 ns;

    wait;

  end process sim_gen;

end architecture behavioral;
