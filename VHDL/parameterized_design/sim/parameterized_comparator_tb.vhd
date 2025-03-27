----------------------------------------------------------------------------------
-- Company:
-- Engineer: Vladimir Galović
--
-- Create Date: 03/23/2025 12:09:17 PM
-- Design Name:
-- Module Name: parameterized_comparator_tb - Behavioral
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

entity parameterized_comparator_tb is
  generic (
    width : integer := 8
  );
--  Port ( );
end entity parameterized_comparator_tb;

architecture behavioral of parameterized_comparator_tb is

  component parameterized_comparator is
    generic (
      width : integer := width
    );
    port (
      a  : in    std_logic_vector(width - 1 downto 0);
      b  : in    std_logic_vector(width - 1 downto 0);
      eq : out   std_logic;
      lt : out   std_logic;
      gt : out   std_logic
    );
  end component parameterized_comparator;

  signal a : std_logic_vector(width - 1 downto 0);
  signal b : std_logic_vector(width - 1 downto 0);

  signal eq : std_logic;
  signal lt : std_logic;
  signal gt : std_logic;

begin

  dut : component parameterized_comparator
    port map (
      a  => a,
      b  => b,
      eq => eq,
      lt => lt,
      gt => gt
    );

  sim_gen : process is
  begin

    a <= std_logic_vector(to_unsigned(0, width)),
         std_logic_vector(to_unsigned(1, width)) after 100 ns,
         std_logic_vector(to_unsigned(2, width)) after 200 ns,
         std_logic_vector(to_unsigned(3, width)) after 300 ns;

    b <= std_logic_vector(to_unsigned(2, width)),
         std_logic_vector(to_unsigned(1, width)) after 100 ns,
         std_logic_vector(to_unsigned(0, width)) after 200 ns,
         std_logic_vector(to_unsigned(3, width)) after 300 ns;

    wait;

  end process sim_gen;

end architecture behavioral;
