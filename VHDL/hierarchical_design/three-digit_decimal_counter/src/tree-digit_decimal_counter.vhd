----------------------------------------------------------------------------------
-- Company:
-- Engineer: Vladimir Galović
--
-- Create Date: 03/25/2025 12:09:08 PM
-- Design Name:
-- Module Name: tree_digit_decimal_counter - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

  -- Uncomment the following library declaration if using
  -- arithmetic functions with Signed or Unsigned values
  use ieee.numeric_std.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity tree_digit_decimal_counter is
  port (
    clk   : in    std_logic;
    reset : in    std_logic;

    q_0 : out   std_logic_vector(3 downto 0);
    q_1 : out   std_logic_vector(3 downto 0);
    q_2 : out   std_logic_vector(3 downto 0)

  );
end entity tree_digit_decimal_counter;

architecture behavioral of tree_digit_decimal_counter is

  component dec_counter is
    port (
      clk   : in    std_logic;
      reset : in    std_logic;
      en    : in    std_logic;

      q     : out   std_logic_vector(3 downto 0);
      pulse : out   std_logic
    );
  end component dec_counter;

  signal pulse_0 : std_logic;
  signal pulse_1 : std_logic;

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
