----------------------------------------------------------------------------------
-- Company:
-- Engineer: Vladimir Galović
--
-- Create Date: 03/23/2025 12:18:07 PM
-- Design Name:
-- Module Name: parameterized_PIPO_register - Behavioral
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

entity parameterized_pipo_register is
  generic (
    width_beh : integer := 16;
    width_str : integer := 32
  );
  port (
    clk   : in    std_logic;
    rst   : in    std_logic;
    d_beh : in    std_logic_vector(width_beh - 1 downto 0);
    y_beh : out   std_logic_vector(width_beh - 1 downto 0);
    d_str : in    std_logic_vector(width_str - 1 downto 0);
    y_str : out   std_logic_vector(width_str - 1 downto 0)
  );
end entity parameterized_pipo_register;

architecture mixed of parameterized_pipo_register is

  -- Internal signal for structural register storage
  signal reg_str : std_logic_vector(width_str - 1 downto 0);

begin

  -- Behavioral Register Implementation
  behavioral_register : process (clk, rst) is
  begin

    if (rst = '1') then
      y_beh <= (others => '0');
    elsif rising_edge(clk) then
      y_beh <= d_beh;
    end if;

  end process behavioral_register;

  -- Structural Register Implementation

  strucural_registar : for i in 0 to width_str - 1 generate
  begin

    ff : process (clk, rst) is
    begin

      if (rst = '1') then
        reg_str(i) <= '0';
      elsif rising_edge(clk) then
        reg_str(i) <= d_str(i);
      end if;

    end process ff;

  end generate strucural_registar;

  -- Output Assignment for Structural Register
  y_str <= reg_str;

end architecture mixed;
