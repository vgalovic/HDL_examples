library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity data_path is
  generic (
    WIDTH : integer := 8
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
end entity data_path;

architecture Behavioral of data_path is

  signal a_reg  : STD_LOGIC_VECTOR (2*WIDTH-1 downto 0);
  signal a_next : STD_LOGIC_VECTOR (2*width-1 downto 0);

  signal b_reg  : STD_LOGIC_VECTOR (WIDTH-1 downto 0);
  signal b_next : STD_LOGIC_VECTOR (WIDTH-1 downto 0);

  signal n_reg  : STD_LOGIC_VECTOR (WIDTH-1 downto 0);
  signal n_next : STD_LOGIC_VECTOR (WIDTH-1 downto 0);

  signal p_reg  : STD_LOGIC_VECTOR (2*WIDTH-1 downto 0);
  signal p_next : STD_LOGIC_VECTOR (2*WIDTH-1 downto 0);

begin

  reg: process (clk) is
  begin
    if rising_edge(clk) then
      a_reg <= a_next;
      b_reg <= b_next;
      n_reg <= n_next;
      p_reg <= p_next;
    end if;
  end process reg;

  mux: process (a_in, b_in, a_reg, b_reg, n_reg, p_reg, sel) is
  begin
    case sel is
      when "00" =>
        a_next <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, WIDTH)) & a_in;
        b_next <= b_in;
        n_next <= STD_LOGIC_VECTOR(TO_UNSIGNED(WIDTH, WIDTH));
        p_next <= (others => '0');
      when "01" =>
        a_next <= a_reg;
        b_next <= b_reg;
        n_next <= n_reg;
        p_next <= STD_LOGIC_VECTOR(UNSIGNED(p_reg) + UNSIGNED(a_reg));
      when "10" =>
        a_next <= a_reg(2*WIDTH-2 downto 0) & '0';
        b_next <= '0' & b_reg(WIDTH-1 downto 1);
        n_next <= STD_LOGIC_VECTOR(UNSIGNED(n_reg) - TO_UNSIGNED(1, WIDTH));
        p_next <= p_reg;
      when "11" =>
        a_next <= (others => '0');
        b_next <= (others => '0');
        n_next <= (others => '0');
        p_next <= (others => '0');
      when others => null;
    end case;
  end process mux;

  b_0 <= b_next(0);

  count_0 <= '1'
    when n_next = STD_LOGIC_VECTOR(TO_UNSIGNED(0, WIDTH))
  else '0';

  r_out <= p_reg;

end Behavioral;
