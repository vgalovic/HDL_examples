----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/02/2024 03:22:10 PM
-- Design Name: 
-- Module Name: bin_encoder4to2_with_logic_gates_tb - Behavioral
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

entity bin_encoder4to2_with_logic_gates_tb is
--  Port ( );
end bin_encoder4to2_with_logic_gates_tb;

architecture Behavioral of bin_encoder4to2_with_logic_gates_tb is
    component bin_encoder4to2_with_logic_gates
	  Port (
		  x : in  STD_LOGIC_VECTOR (3 downto 0);
		  y : out  STD_LOGIC_VECTOR (1 downto 0)
	  );
	end component;

	signal x_s : STD_LOGIC_VECTOR (3 downto 0);
	signal y_s : STD_LOGIC_VECTOR (1 downto 0);
begin

    duv: bin_encoder4to2_with_logic_gates 
        port map (
            x => x_s,
            y => y_s
        );

    sim_gen: process
    begin
        x_s <= "0001", "0010" after 200 ns, "0100" after 400 ns, "1000" after 600 ns;
        wait;
    end process;


end Behavioral;
