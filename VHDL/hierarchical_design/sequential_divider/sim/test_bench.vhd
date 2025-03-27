----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 03/27/2025 12:42:55 PM
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
    WIDTH : integer := 8;
    clk_period : time := 100 ns
  );
--  Port ( );
end test_bench;

architecture Behavioral of test_bench is
  
  component top
    generic (
      WIDTH : integer := WIDTH
    );
    port (
      a_in : in std_logic_vector(WIDTH-1 downto 0);
      b_in : in std_logic_vector(WIDTH-1 downto 0);

      clk : in std_logic;
      rst : in std_logic;

      start : in std_logic;

      quotient : out std_logic_vector(WIDTH-1 downto 0);
      remainder : out std_logic_vector(WIDTH-1 downto 0);

      last : out std_logic;
      ready : out std_logic
    );
    end component top;

    signal a_in : std_logic_vector(WIDTH-1 downto 0);
    signal b_in : std_logic_vector(WIDTH-1 downto 0);

    signal clk : std_logic;
    signal rst : std_logic;

    signal start : std_logic;

    signal quotient : std_logic_vector(WIDTH-1 downto 0);
    signal remainder : std_logic_vector(WIDTH-1 downto 0);

    signal last : std_logic;
    signal ready : std_logic;

begin

  dut : top
    generic map (
      WIDTH => WIDTH
    )
    port map (
      a_in => a_in,
      b_in => b_in,

      clk => clk,
      rst => rst,

      start => start,

      quotient => quotient,
      remainder => remainder,

      last => last,
      ready => ready
    );

  a_in <= X"09";
  b_in <= X"03";

  start_gen: process is
  begin

    start <= '1';
    wait for clk_period;
    start <= '0';
    wait for clk_period*4;
    start <= '1';
    wait for clk_period;
    start <= '0';

    wait;

  end process start_gen;

  rst_gen : process is
  begin

    rst <= '0';
    wait for clk_period * 2;
    rst <= '1';
    wait for clk_period;
    rst <= '0';

    wait;

  end process rst_gen;

  clk_gen : process is
  begin
    clk <= '1', '0' after clk_period/2;
    wait for clk_period;
  end process clk_gen;

end Behavioral;
