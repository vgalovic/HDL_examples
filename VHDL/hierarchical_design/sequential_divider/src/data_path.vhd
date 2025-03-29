library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity data_path is
  generic (
    WIDTH : integer := 8
  );
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;

    a_in : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    b_in : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);

    sel : in STD_LOGIC_VECTOR(1 downto 0);

    n_n : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);

    quotient : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    remainder : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
  );
end entity data_path;

architecture Behavioral of data_path is

  component compare_and_subtract is
    generic (
      WIDTH : integer := WIDTH
    );
    port (
      b_r : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
      r_r : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);

      q_bit : out STD_LOGIC;
      r_temp : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
    );
  end component compare_and_subtract;

  signal a_n : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
  signal a_r : STD_LOGIC_VECTOR(WIDTH-1 downto 0);

  signal b_n : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
  signal b_r : STD_LOGIC_VECTOR(WIDTH-1 downto 0);

  signal n_n_s : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
  signal n_r : STD_LOGIC_VECTOR(WIDTH-1 downto 0);

  signal r_n    : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
  signal r_r    : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
  signal r_temp : STD_LOGIC_VECTOR(WIDTH-1 downto 0);

  signal q_bit : STD_LOGIC;

  signal sh_l_0 : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
  signal sh_l_1 : STD_LOGIC_VECTOR(WIDTH-1 downto 0);

  signal dec : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
begin

  compare_and_subtract_0 : compare_and_subtract
    generic map (
      WIDTH => WIDTH
    )
    port map (
      b_r => b_r,
      r_r => r_r,

      q_bit => q_bit,
      r_temp => r_temp
    );

    reg: process(clk) is
    begin
      if rising_edge(clk) then
        if rst = '1' then
          a_r <= (others => '0');
          b_r <= (others => '0');
          n_r <= (others => '0');
          r_r <= (others => '0');
        else
          a_r <= a_n;
          b_r <= b_n;
          n_r <= n_n_s;
          r_r <= r_n;
        end if;
      end if;
    end process reg;

  sh_l_0 <= a_r(WIDTH-2 downto 0) & q_bit;
  sh_l_1 <= r_temp(WIDTH-2 downto 0) & a_r(WIDTH-1);

  dec <= STD_LOGIC_VECTOR(UNSIGNED(n_r) - TO_UNSIGNED(1, WIDTH));

 
  -- First way to implement multiplexers is by using competitive signal assignment.
  -- This method is generally more efficient and can be faster to simulate as it directly
  -- evaluates the conditions for each signal assignment in a concise manner.
  --
  a_n <= a_in when sel = "00" else
         sh_l_0 when sel = "01" or sel = "10" else
         a_r;

  b_n <= b_in when sel = "00" else b_r;

  n_n_s <= STD_LOGIC_VECTOR(TO_UNSIGNED(WIDTH+1, WIDTH)) when sel = "00" else
           dec when sel = "01" else
           n_r;

  r_n <= (others => '0') when sel = "00" else
         sh_l_1 when sel = "01" else
         r_temp when sel = "10" else
         r_r;

  -- Second way to implement multiplexers is by using a process with a case statement.
  -- This is the classical method of implementing multiplexers, where the signal assignments
  -- are based on the value of the selection signal (`sel`). This method can be less efficient
  -- for simulation, as it involves checking each possible case in a process, making it potentially
  -- slower compared to the competitive assignment approach.
  --
  -- mux : process(sel, a_in, b_in, a_r, b_r, n_r, r_temp, r_r, sh_l_0, sh_l_1, dec) is
  -- begin
  --   case sel is
  --     when "00" =>
  --       a_n <= a_in;
  --       b_n <= b_in;
  --       n_n_s <= STD_LOGIC_VECTOR(TO_UNSIGNED(WIDTH+1, WIDTH));
  --       r_n <= (others => '0');
  --     when "01" =>
  --       a_n <= sh_l_0;
  --       b_n <= b_r;
  --       n_n_s <= dec;
  --       r_n <= sh_l_1;
  --     when "10" =>
  --       a_n <= sh_l_0;
  --       b_n <= b_r;
  --       n_n_s <= n_r;
  --       r_n <= r_temp;
  --     when "11" =>
  --       a_n <= a_r;
  --       b_n <= b_r;
  --       n_n_s <= n_r;
  --       r_n <= r_r;
  --     when others => null;
  --   end case;
  -- end process mux;

  n_n <= n_n_s;

  quotient  <= a_r;
  remainder <= r_r;

end Behavioral;
