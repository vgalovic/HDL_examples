----------------------------------------------------------------------------------
-- Company:
-- Engineer: Vladimir Galović
--
-- Create Date: 03/22/2025 04:54:53 PM
-- Design Name:
-- Module Name: parameterized_demultiplexer_tb - Behavioral
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

entity parameterized_demultiplexer_tb is
  generic (
    width : integer := 4
  );
--  Port ( );
end entity parameterized_demultiplexer_tb;

architecture behavioral of parameterized_demultiplexer_tb is

  component parameterized_demultiplexer is
    generic (
      width : integer := width
    );
    port (
      x   : in    std_logic_vector(width - 1 downto 0);
      sel : in    std_logic_vector(1 downto 0);
      y0  : out   std_logic_vector(width - 1 downto 0);
      y1  : out   std_logic_vector(width - 1 downto 0);
      y2  : out   std_logic_vector(width - 1 downto 0);
      y3  : out   std_logic_vector(width - 1 downto 0)
    );
  end component parameterized_demultiplexer;

  signal x_s : std_logic_vector(width - 1 downto 0);

  signal sel_s : std_logic_vector(1 downto 0);

  signal y0_s : std_logic_vector(width - 1 downto 0);
  signal y1_s : std_logic_vector(width - 1 downto 0);
  signal y2_s : std_logic_vector(width - 1 downto 0);
  signal y3_s : std_logic_vector(width - 1 downto 0);

begin

  dut : component parameterized_demultiplexer
    port map (
      x   => x_s,
      sel => sel_s,
      y0  => y0_s,
      y1  => y1_s,
      y2  => y2_s,
      y3  => y3_s
    );

  sim_gen : process is
  begin

    x_s <= std_logic_vector(to_unsigned(0, width)),
           std_logic_vector(to_unsigned(1, width)) after 100 ns,
           std_logic_vector(to_unsigned(2, width)) after 200 ns,
           std_logic_vector(to_unsigned(3, width)) after 300 ns;

    sel_s <= "00", "01" after 500 ns, "10" after 700 ns, "11" after 900 ns;

    wait;

  end process sim_gen;

end architecture behavioral;
