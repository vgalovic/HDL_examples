----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/01/2024 05:52:38 PM
-- Design Name: 
-- Module Name: demux1to2_with_logic_gates - Behavioral
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

entity demux1to2_with_logic_gates is
    Port (x : in STD_LOGIC;
          sel : in STD_LOGIC;
          y0, y1 : out STD_LOGIC);
end demux1to2_with_logic_gates;

architecture Behavioral of demux1to2_with_logic_gates is

begin
    y0 <= x and (not sel);
    y1 <= x and sel;

end Behavioral;
