----------------------------------------------------------------------------------
-- Company:
-- Engineer: Vlado Galović
--
-- Create Date: 03/24/2025 12:54:31 PM
-- Design Name:
-- Module Name: parameterized_counter_tb - Behavioral
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

entity parameterized_counter_tb is
  generic (
    -- width of 8bit and 10bit counters
    w_8bit  : integer := 8;
    w_10bit : integer := 10;

    -- clock period
    period : time := 100 ns
  );
--  Port ( );
end entity parameterized_counter_tb;

architecture behavioral of parameterized_counter_tb is

  component parameterized_counter is
    generic (
      width : integer := 8
    );
    port (
      clk   : in    std_logic;
      reset : in    std_logic;
      q     : out   std_logic_vector(width - 1 downto 0)
    );
  end component parameterized_counter;

  signal clk_s   : std_logic;
  signal reset_s : std_logic;

  signal q_8bit  : std_logic_vector(w_8bit - 1 downto 0);
  signal q_10bit : std_logic_vector(w_10bit - 1 downto 0);

begin

  dut_8bit : component parameterized_counter
    generic map (
      width => w_8bit
    )
    port map (
      clk   => clk_s,
      reset => reset_s,
      q     => q_8bit
    );

  dut_10bit : component parameterized_counter
    generic map (
      width => w_10bit
    )
    port map (
      clk   => clk_s,
      reset => reset_s,
      q     => q_10bit
    );

  clk_gen : process is
  begin

    while true loop

      clk_s <= '0';
      wait for period / 2;
      clk_s <= '1';
      wait for period / 2;

    end loop;

    wait;

  end process clk_gen;

  reset_gen : process is
  begin

    -- Initial reset to start counter from 0
    reset_s <= '1';
    wait for period;

    reset_s <= '0';
    wait for period * 4;

    -- Reset coutner
    reset_s <= '1';
    wait for period;

    -- Let simulation run with counter runing normally
    reset_s <= '0';

    wait;

  end process reset_gen;

end architecture behavioral;


