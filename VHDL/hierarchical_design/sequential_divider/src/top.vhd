library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity top is
  generic (
    WIDTH : integer := 8
  );
  port (
    a_in : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    b_in : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);

    clk : in STD_LOGIC;
    rst : in STD_LOGIC;

    start : in STD_LOGIC;

    quotient : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    remainder : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);

    last : out STD_LOGIC;
    ready : out STD_LOGIC
  );
end entity top;

architecture Behavioral of top is

  component control_path is
    generic (
      WIDTH : integer := WIDTH
    );
    port (
      clk : in STD_LOGIC;
      rst : in STD_LOGIC;

      start : in STD_LOGIC;

      n_n : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);

      last  : out STD_LOGIC;
      ready : out STD_LOGIC;

      sel : out STD_LOGIC_VECTOR(1 downto 0)
    );
  end component control_path;

  component data_path is
    generic (
      WIDTH : integer := WIDTH
    );
    port (
      clk : in STD_LOGIC;
      rst : in STD_LOGIC;

      a_in : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
      b_in : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);

      sel : in STD_LOGIC_VECTOR(1 downto 0);

      n_n : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);

      quotient  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
      remainder : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
    );
  end component data_path;

  signal n_n : STD_LOGIC_VECTOR(WIDTH-1 downto 0);

  signal sel : STD_LOGIC_VECTOR(1 downto 0);

begin

  control_path_0 : control_path
    generic map (
      WIDTH => WIDTH
    )
    port map (
      clk => clk,
      rst => rst,

      start => start,

      n_n => n_n,

      last => last,
      ready => ready,

      sel => sel
    );

  data_path_0 : data_path
    generic map (
      WIDTH => WIDTH
    )
    port map (
      clk => clk,
      rst => rst,

      a_in => a_in,
      b_in => b_in,

      sel => sel,

      n_n => n_n,

      quotient  => quotient,
      remainder => remainder
    );


end Behavioral;
