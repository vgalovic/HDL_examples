library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity counter_up_16bit_owerflow_tb is
--  Port ( );
end entity counter_up_16bit_owerflow_tb;

architecture Behavioral of counter_up_16bit_owerflow_tb is
  component counter_up_16bit_owerflow is
    Generic (
      WIDTH : integer := 16
    );
    Port (
      clk : in STD_LOGIC;
      ce, en : in STD_LOGIC;
      load : in STD_LOGIC;
      overflow : out STD_LOGIC;
      counter_value : in STD_LOGIC_VECTOR (WIDTH - 1 downto 0);
      q : out STD_LOGIC_VECTOR (WIDTH - 1 downto 0)
    );
  end component;

  signal clk_s : STD_LOGIC := '0';
  signal ce_s, en_s : STD_LOGIC := '0';
  signal load_s : STD_LOGIC := '0';
  signal overflow_s : STD_LOGIC := '0';
  signal counter_value_s : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
  signal q_s : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');

begin

  duv: counter_up_16bit_owerflow
    Generic map (
      WIDTH => 16
    )
    Port map (
      clk => clk_s,
      ce => ce_s,
      en => en_s,
      load => load_s,
      overflow => overflow_s,
      counter_value => counter_value_s,
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
    load_s <= '0', '1' after 500 ns, '0' after 600 ns;
    counter_value_s <= X"fffa";

    wait;
  end process stim_gen;

end Behavioral;
