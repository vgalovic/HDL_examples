----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/11/2024 04:28:39 PM
-- Design Name: 
-- Module Name: SR_flip_flop_with_falling_edge - Behavioral
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

entity SR_flip_flop_with_falling_edge is
    Port (S : in  STD_LOGIC;
	  R : in  STD_LOGIC;
          clk : in  STD_LOGIC;
	  Q : out  STD_LOGIC;
          nQ : out  STD_LOGIC);
end SR_flip_flop_with_falling_edge;

architecture Behavioral of SR_flip_flop_with_falling_edge is
begin
    flip_flop: process(clk)
        variable Q_internal : STD_LOGIC := '0';
    begin
        if falling_edge(clk) then
            if S = '0' and R = '0' then
                Q_internal := '1';
            elsif S = '1' and R = '0' then
                Q_internal := '1';
            elsif S = '0' and R = '1' then
                Q_internal := '0';
            else
                Q_internal := 'X';
            end if;
        end if;

        Q <= Q_internal;
        nQ <= not Q_internal;
    end process;

end Behavioral;
