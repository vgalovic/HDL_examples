----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 03/26/2025 09:17:30 PM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
  generic (
    width : integer := 8
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
end top;

architecture Behavioral of top is

  component control_path is
    port (
      clk : in std_logic;

      count_0 : in std_logic;
      b_0     : in std_logic;

      start : in std_logic;
      reset : in std_logic;

      sel : out std_logic_vector(1 downto 0);

      ready : out std_logic
    );
  end component control_path;

  component data_path is
    generic (
      width : integer := width
    );
    port (
      clk : in STD_LOGIC;
      sel : in STD_LOGIC_VECTOR (1 downto 0);

      a_in : in STD_LOGIC_VECTOR (width-1 downto 0);
      b_in : in STD_LOGIC_VECTOR (width-1 downto 0);

      r_out : out STD_LOGIC_VECTOR (2*width-1 downto 0);

      b_0 : out STD_LOGIC;
      count_0 : out STD_LOGIC
    );
  end component data_path;

  signal sel     : std_logic_vector(1 downto 0);
  signal count_0 : std_logic;
  signal b_0     : std_logic;

begin

  control_path_0 : component control_path
    port map (
      clk => clk,

      count_0 => count_0,
      b_0     => b_0,

      start => start,
      reset => reset,

      sel => sel,

      ready => ready
    );

  data_path_0 : component data_path
    generic map (
      width => width
    )
    port map (
      clk => clk,
      sel => sel,

      a_in => a_in,
      b_in => b_in,

      r_out => r_out,

      b_0 => b_0,
      count_0 => count_0
    );

end Behavioral;
