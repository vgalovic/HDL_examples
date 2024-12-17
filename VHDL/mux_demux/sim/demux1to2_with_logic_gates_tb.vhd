----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/01/2024 06:01:32 PM
-- Design Name: 
-- Module Name: demux1to2_with_logic_gates_tb - Behavioral
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

entity demux1to2_with_logic_gates_tb is
--  Port ( );
end demux1to2_with_logic_gates_tb;

architecture Behavioral of demux1to2_with_logic_gates_tb is
    component demux1to2_with_logic_gates
        Port (x : in STD_LOGIC;
              sel : in STD_LOGIC;
              y0, y1 : out STD_LOGIC);
    end component;

    signal x_s : STD_LOGIC := '0';
    signal sel_s : STD_LOGIC := '0';
    signal y0_s, y1_s : STD_LOGIC;

begin
    duv: demux1to2_with_logic_gates
        port map (
            x => x_s,
            sel => sel_s,
            y0 => y0_s,
            y1 => y1_s
        );

    sim_gen: process
    begin
        x_s <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 300 ns;
        sel_s <= '0', '1' after 200 ns;
        wait;
    end process;


end Behavioral;
