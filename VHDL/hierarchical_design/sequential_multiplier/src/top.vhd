library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity top is
  generic (
    WIDTH : integer := 8
    );
  port (
    a_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
    b_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);

    clk : in STD_LOGIC;
    start : in STD_LOGIC;
    reset : in STD_LOGIC;

    ready : out STD_LOGIC;

    r_out : out STD_LOGIC_VECTOR (2*WIDTH-1 downto 0)
  );
end entity top;

architecture Behavioral of top is

  component control_path is
    port (
      clk : in STD_LOGIC;

      count_0 : in STD_LOGIC;
      b_0     : in STD_LOGIC;

      start : in STD_LOGIC;
      reset : in STD_LOGIC;

      sel : out STD_LOGIC_VECTOR(1 downto 0);

      ready : out STD_LOGIC
    );
  end component control_path;

  component data_path is
    generic (
      WIDTH : integer := WIDTH
    );
    port (
      clk : in STD_LOGIC;
      sel : in STD_LOGIC_VECTOR (1 downto 0);

      a_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
      b_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);

      r_out : out STD_LOGIC_VECTOR (2*WIDTH-1 downto 0);

      b_0 : out STD_LOGIC;
      count_0 : out STD_LOGIC
    );
  end component data_path;

  signal sel     : STD_LOGIC_VECTOR(1 downto 0);
  signal count_0 : STD_LOGIC;
  signal b_0     : STD_LOGIC;

begin

  control_path_0 : component control_path
    port map (
      clk => clk,

      count_0 => count_0,
      b_0     => b_0,

      start => start,
      reset => reset,

      sel => sel,

      ready => ready
    );

  data_path_0 : component data_path
    generic map (
      WIDTH => WIDTH
    )
    port map (
      clk => clk,
      sel => sel,

      a_in => a_in,
      b_in => b_in,

      r_out => r_out,

      b_0 => b_0,
      count_0 => count_0
    );

end Behavioral;
