----------------------------------------------------------------------------------
-- Company:
-- Engineer: Vladimir Galović
--
-- Create Date: 03/23/2025 12:39:05 PM
-- Design Name:
-- Module Name: parameterized_PIPO_register_tb - Behavioral
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

entity parameterized_pipo_register_tb is
  generic (
    width_beh : integer := 16;
    width_str : integer := 32;
    period    : time    := 100 ns
  );
--  Port ( );
end entity parameterized_pipo_register_tb;

architecture behavioral of parameterized_pipo_register_tb is

  component parameterized_pipo_register is
    generic (
      width_beh : integer := width_beh;
      width_str : integer := width_str
    );
    port (
      clk   : in    std_logic;
      rst   : in    std_logic;
      d_beh : in    std_logic_vector(width_beh - 1 downto 0);
      y_beh : out   std_logic_vector(width_beh - 1 downto 0);
      d_str : in    std_logic_vector(width_str - 1 downto 0);
      y_str : out   std_logic_vector(width_str - 1 downto 0)
    );
  end component parameterized_pipo_register;

  signal clk_s : std_logic;
  signal rst_s : std_logic;

  signal d_beh_s : std_logic_vector(width_beh - 1 downto 0);
  signal y_beh_s : std_logic_vector(width_beh - 1 downto 0);

  signal d_str_s : std_logic_vector(width_str - 1 downto 0);
  signal y_str_s : std_logic_vector(width_str - 1 downto 0);

begin

  dut : component parameterized_pipo_register
    generic map (
      width_beh => width_beh,
      width_str => width_str
    )
    port map (
      clk   => clk_s,
      rst   => rst_s,
      d_beh => d_beh_s,
      y_beh => y_beh_s,
      d_str => d_str_s,
      y_str => y_str_s
    );

  -- Clock Generation Process (Continuous Clock)
  clk_gen : process is
  begin

    while true loop

      clk_s <= '0';
      wait for period / 2;
      clk_s <= '1';
      wait for period / 2;

    end loop;

  end process clk_gen;

  -- Generation Process of any other signal
  sim_gen : process is
  begin

    rst_s <= '0';
    wait for 2 * period;
    rst_s <= '1';
    wait for period;
    rst_s <= '0';
    wait;

  end process sim_gen;

  -- Data Generation Process for Behavioral Register
  data_beh_gen : process is
  begin

    for i in 0 to 15 loop

      d_beh_s <= std_logic_vector(to_unsigned(i, width_beh));
      wait for period;

    end loop;

    wait;

  end process data_beh_gen;

  -- Data Generation Process for Structural Register
  data_str_gen : process is
  begin

    for i in 0 to 31 loop

      d_str_s <= std_logic_vector(to_unsigned(i, width_str));
      wait for period / 2;

    end loop;

    wait;

  end process data_str_gen;

end architecture behavioral;
