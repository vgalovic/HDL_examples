----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/11/2024 05:57:05 PM
-- Design Name: 
-- Module Name: JK_flip_flop_with_rising_edge - Behavioral
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

entity JK_flip_flop_with_rising_edge is
    Port (J : in  STD_LOGIC;
          K : in  STD_LOGIC;
          clk : in  STD_LOGIC;
          Q : out  STD_LOGIC;
          nQ : out  STD_LOGIC);
end JK_flip_flop_with_rising_edge;

architecture Behavioral of JK_flip_flop_with_rising_edge is

begin
    process(clk)
        variable Q_internal : STD_LOGIC := '0';
    begin
        if rising_edge(clk) then
            if J = '0' and K = '0' then
                Q_internal := Q_internal;
            elsif J = '1' and K = '1' then
                Q_internal := not Q_internal;
            elsif J = '1' and K = '0' then
                Q_internal := '1';
            else
                Q_internal := '0';
            end if;
        end if;
        Q <= Q_internal;
        nQ <= not Q_internal;
    end process;

end Behavioral;
