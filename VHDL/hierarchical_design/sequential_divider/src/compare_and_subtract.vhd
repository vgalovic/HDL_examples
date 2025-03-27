----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 03/27/2025 11:49:32 AM
-- Design Name: 
-- Module Name: compare_and_subtract - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity compare_and_subtract is
  generic (
    WIDTH : integer := 8
  );
  port (
    b_r : in std_logic_vector(WIDTH-1 downto 0);
    r_r : in std_logic_vector(WIDTH-1 downto 0);

    q_bit : out std_logic;
    r_temp : out std_logic_vector(WIDTH-1 downto 0)
  );
end compare_and_subtract;

architecture Behavioral of compare_and_subtract is

  signal sel : std_logic;

  signal subtractor: std_logic_vector(WIDTH-1 downto 0);

begin

  comparator : process(b_r, r_r) is
  begin
    if (r_r >= b_r) then
      sel <= '1';
    else
      sel <= '0';
    end if;
  end process;

  mux : process(sel, r_r, b_r, subtractor) is
  begin

    case sel is
      when '1' => r_temp <= subtractor;
      when '0' => r_temp <= r_r;
      when others => null;
    end case;

  end process;


  subtractor <= std_logic_vector(resize(unsigned(r_r), WIDTH) - resize(unsigned(b_r), WIDTH));

  q_bit <= sel;

end Behavioral;
