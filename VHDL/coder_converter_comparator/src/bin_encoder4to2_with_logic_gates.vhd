----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/02/2024 12:50:13 PM
-- Design Name: 
-- Module Name: bin_encoder4to2_with_logic_gates - Behavioral
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

entity bin_encoder4to2_with_logic_gates is
    Port (
	  x : in  STD_LOGIC_VECTOR (3 downto 0);
	  y : out  STD_LOGIC_VECTOR (1 downto 0)

	  -- x0, x1, x2, x3 : in  STD_LOGIC;
	  -- y0, y1 : out  STD_LOGIC
    );
end bin_encoder4to2_with_logic_gates;

architecture Behavioral of bin_encoder4to2_with_logic_gates is

begin
    y(1) <= x(3) or x(2);
    y(0) <= x(3) or x(1);

    -- y0 <= x3 or x2;
    -- y1 <= x3 or x1;

end Behavioral;
