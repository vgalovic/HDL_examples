library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity tree_digit_decimal_counter is
  port (
    clk   : in    STD_LOGIC;
    reset : in    STD_LOGIC;

    q_0 : out   STD_LOGIC_VECTOR(3 downto 0);
    q_1 : out   STD_LOGIC_VECTOR(3 downto 0);
    q_2 : out   STD_LOGIC_VECTOR(3 downto 0)

  );
end entity tree_digit_decimal_counter;

architecture behavioral of tree_digit_decimal_counter is

  component dec_counter is
    port (
      clk   : in    STD_LOGIC;
      reset : in    STD_LOGIC;
      en    : in    STD_LOGIC;

      q     : out   STD_LOGIC_VECTOR(3 downto 0);
      pulse : out   STD_LOGIC
    );
  end component dec_counter;

  signal pulse_0 : STD_LOGIC;
  signal pulse_1 : STD_LOGIC;

begin

  -- First 4-bit decimal counter
  dec_counter_0 : component dec_counter
    port map (
      clk   => clk,
      reset => reset,
      en    => '1',

      q     => q_0,
      pulse => pulse_0
    );

  -- Second 4-bit decimal counter
  dec_counter_1 : component dec_counter
    port map (
      clk   => clk,
      reset => reset,
      en    => pulse_0,

      q     => q_1,
      pulse => pulse_1
    );

  -- Third 4-bit decimal counter
  dec_counter_2 : component dec_counter
    port map (
      clk   => clk,
      reset => reset,
      en    => pulse_0 and pulse_1,

      q     => q_2,
      pulse =>  open
    );

end architecture behavioral;
