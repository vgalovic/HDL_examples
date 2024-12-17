----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 11/30/2024 04:21:43 PM
-- Design Name: 
-- Module Name: mux4to1_16bit - Behavioral
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

entity mux4to1_16bit is
  Port (x0, x1, x2, x3 : in  STD_LOGIC_VECTOR (15 downto 0);
        sel : in  STD_LOGIC_VECTOR (1 downto 0);
        y : out  STD_LOGIC_VECTOR (15 downto 0));
end mux4to1_16bit;

architecture Behavioral of mux4to1_16bit is

begin
  mux4to1 : process (x0, x1, x2, x3, sel)
  begin
    case sel is
      when "00" => y <= x0;
      when "01" => y <= x1;
      when "10" => y <= x2;
      when "11" => y <= x3;
      when others => null;
    end case;
  end process;

end Behavioral;
