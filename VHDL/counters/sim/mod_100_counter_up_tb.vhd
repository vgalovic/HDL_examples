library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.MATH_REAL.ALL;

entity mod_100_counter_up_tb is
--  Port ( );
end entity mod_100_counter_up_tb;

architecture Behavioral of mod_100_counter_up_tb is
  component mod_100_counter_up is
    Generic (
      M : integer := 100;
      WIDTH : integer := integer(ceil(log2(real(100))))
    );
    Port (
      clk : in STD_LOGIC;
      ce, en : in STD_LOGIC;
      reset : in STD_LOGIC;
      q : out STD_LOGIC_VECTOR (WIDTH - 1 downto 0));
  end component mod_100_counter_up;

  signal clk_s : STD_LOGIC := '0';
  signal ce_s, en_s : STD_LOGIC := '0';
  signal reset_s : STD_LOGIC := '0';
  signal q_s : STD_LOGIC_VECTOR (6 downto 0);

begin
  duv: mod_100_counter_up
    Generic map (
        M => 100,
        WIDTH => integer(ceil(log2(real(100))))
    )
    Port map (
        clk => clk_s,
        ce => ce_s,
        en => en_s,
        reset => reset_s,
        q => q_s
    );

  clk_gen: process is
    variable period : time := 50 ns;
  begin
    clk_s <= '0', '1' after period/2;
    wait for period;
  end process clk_gen;

  stim_gen: process is
  begin
      ce_s <= '0', '1' after 100 ns;
      en_s <= '0', '1' after 200 ns;
      reset_s <= '0', '1' after 500 ns, '0' after 600 ns;

      wait;
  end process stim_gen;

end Behavioral;
