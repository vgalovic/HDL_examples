----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 03/27/2025 12:35:55 PM
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
    WIDTH : integer := 8
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
end top;

architecture Behavioral of top is

  component control_path
    generic (
      WIDTH : integer := WIDTH
    );
    port (
      clk : in std_logic;
      rst : in std_logic;

      start : in std_logic;

      n_n : in std_logic_vector(WIDTH-1 downto 0);

      last : out std_logic;
      ready : out std_logic;

      sel : out std_logic_vector(1 downto 0)
    );
  end component control_path;

  component data_path
    generic (
      WIDTH : integer := WIDTH
    );
    port (
      clk : in std_logic;
      rst : in std_logic;

      a_in : in std_logic_vector(WIDTH-1 downto 0);
      b_in : in std_logic_vector(WIDTH-1 downto 0);

      sel : in std_logic_vector(1 downto 0);

      n_n : out std_logic_vector(WIDTH-1 downto 0);

      quotient : out std_logic_vector(WIDTH-1 downto 0);
      remainder : out std_logic_vector(WIDTH-1 downto 0)
    );
  end component data_path;

  signal n_n : std_logic_vector(WIDTH-1 downto 0);

  signal sel : std_logic_vector(1 downto 0);

begin

  control_path_0 : control_path
    generic map (
      WIDTH => WIDTH
    )
    port map (
      clk => clk,
      rst => rst,

      start => start,

      n_n => n_n,

      last => last,
      ready => ready,

      sel => sel
    );

  data_path_0 : data_path
    generic map (
      WIDTH => WIDTH
    )
    port map (
      clk => clk,
      rst => rst,

      a_in => a_in,
      b_in => b_in,

      sel => sel,

      n_n => n_n,

      quotient => quotient,
      remainder => remainder
    );


end Behavioral;
