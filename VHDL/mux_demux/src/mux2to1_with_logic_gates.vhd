----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 11/30/2024 03:00:13 PM
-- Design Name: 
-- Module Name: mux2to1_with_logic_gates - Behavioral
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

entity mux2to1_with_logic_gates is
    Port (x1,x2, sel: in STD_LOGIC;
        y: out STD_LOGIC);
end mux2to1_with_logic_gates;

architecture Behavioral of mux2to1_with_logic_gates is
    signal and1, and2 : STD_LOGIC;
begin
    and1 <= x1 and (not sel);
    and2 <= x2 and sel;

    y <= and1 or and2;

end Behavioral;
