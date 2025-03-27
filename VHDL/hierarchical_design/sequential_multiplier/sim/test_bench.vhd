----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 03/26/2025 09:24:57 PM
-- Design Name: 
-- Module Name: test_bench - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_bench is
  generic (
    width : integer := 8;
    clk_period : time := 100 ns
    );
--  Port ( );
end test_bench;

architecture Behavioral of test_bench is

  component top is
    generic (
      width : integer := width
      );
    port (
      a_in : in STD_LOGIC_VECTOR (width-1 downto 0);
      b_in : in STD_LOGIC_VECTOR (width-1 downto 0);

      clk : in STD_LOGIC;
      start : in STD_LOGIC;
      reset : in STD_LOGIC;

      ready : out STD_LOGIC;

      r_out : out STD_LOGIC_VECTOR (2*width-1 downto 0)
    );
  end component top;

  signal a_in_s : std_logic_vector(width-1 downto 0);
  signal b_in_s : std_logic_vector(width-1 downto 0);

  signal clk_s : std_logic;
  signal start_s : std_logic;
  signal reset_s : std_logic;

  signal ready_s : std_logic;

  signal r_out_s : std_logic_vector(2*width-1 downto 0);

begin

  dut : component top
    generic map (
      width => width
    )
    port map (
      a_in => a_in_s,
      b_in => b_in_s,

      clk => clk_s,
      start => start_s,
      reset => reset_s,

      ready => ready_s,

      r_out => r_out_s
    );

  a_in_s <= X"05";
  b_in_s <= X"06";

  start_s <= '1', '0' after clk_period*4;
  reset_s <= '1', '0' after clk_period*2;

  clk_gen : process is
  begin
    clk_s <= '1', '0' after clk_period/2;
    wait for clk_period;
  end process clk_gen;


end Behavioral;
