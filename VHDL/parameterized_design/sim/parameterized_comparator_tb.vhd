library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity parameterized_comparator_tb is
  generic (
    WIDTH : integer := 8
  );
--  Port ( );
end entity parameterized_comparator_tb;

architecture behavioral of parameterized_comparator_tb is

  component parameterized_comparator is
    generic (
      WIDTH : integer := WIDTH
    );
    port (
      a  : in    STD_LOGIC_VECTOR(WIDTH - 1 downto 0);
      b  : in    STD_LOGIC_VECTOR(WIDTH - 1 downto 0);
      eq : out   STD_LOGIC;
      lt : out   STD_LOGIC;
      gt : out   STD_LOGIC
    );
  end component parameterized_comparator;

  signal a : STD_LOGIC_VECTOR(WIDTH - 1 downto 0);
  signal b : STD_LOGIC_VECTOR(WIDTH - 1 downto 0);

  signal eq : STD_LOGIC;
  signal lt : STD_LOGIC;
  signal gt : STD_LOGIC;

begin

  dut : component parameterized_comparator
    port map (
      a  => a,
      b  => b,
      eq => eq,
      lt => lt,
      gt => gt
    );

  sim_gen : process is
  begin

    a <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, WIDTH)),
         STD_LOGIC_VECTOR(TO_UNSIGNED(1, WIDTH)) after 100 ns,
         STD_LOGIC_VECTOR(TO_UNSIGNED(2, WIDTH)) after 200 ns,
         STD_LOGIC_VECTOR(TO_UNSIGNED(3, WIDTH)) after 300 ns;

    b <= STD_LOGIC_VECTOR(TO_UNSIGNED(2, WIDTH)),
         STD_LOGIC_VECTOR(TO_UNSIGNED(1, WIDTH)) after 100 ns,
         STD_LOGIC_VECTOR(TO_UNSIGNED(0, WIDTH)) after 200 ns,
         STD_LOGIC_VECTOR(TO_UNSIGNED(3, WIDTH)) after 300 ns;

    wait;

  end process sim_gen;

end architecture behavioral;
