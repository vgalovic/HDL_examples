----------------------------------------------------------------------------------
-- Company:
-- Engineer: Vladimir Galović
--
-- Create Date: 03/25/2025 02:19:48 PM
-- Design Name:
-- Module Name: tree_digit_decimal_counter_tb - Behavioral
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
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity tree_digit_decimal_counter_tb is
  generic (
    clk_period : time := 100 ns
  );
--  Port ( );
end entity tree_digit_decimal_counter_tb;

architecture behavioral of tree_digit_decimal_counter_tb is

  component tree_digit_decimal_counter is
    port (
      clk   : in    std_logic;
      reset : in    std_logic;

      q_0 : out   std_logic_vector(3 downto 0);
      q_1 : out   std_logic_vector(3 downto 0);
      q_2 : out   std_logic_vector(3 downto 0)

    );
  end component tree_digit_decimal_counter;

  signal clk_s   : std_logic;
  signal reset_s : std_logic;

  signal q_0_s : std_logic_vector(3 downto 0);
  signal q_1_s : std_logic_vector(3 downto 0);
  signal q_2_s : std_logic_vector(3 downto 0);

begin

  dut : component tree_digit_decimal_counter
    port map (
      clk   => clk_s,
      reset => reset_s,

      q_0 => q_0_s,
      q_1 => q_1_s,
      q_2 => q_2_s
    );

  clk_gen : process is
  begin

    while true loop

      clk_s <= '0';
      wait for clk_period / 2;
      clk_s <= '1';
      wait for clk_period / 2;

    end loop;

    wait;

  end process clk_gen;

  reset_gen : process is
  begin

    reset_s <= '1';
    wait for clk_period;
    reset_s <= '0';
    wait for clk_period * 4;

    reset_s <= '1';
    wait for clk_period;
    reset_s <= '0';

    wait;

  end process reset_gen;

end architecture behavioral;
