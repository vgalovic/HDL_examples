----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/04/2024 09:15:24 PM
-- Design Name: 
-- Module Name: comparator_8bit_tb - Behavioral
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

entity comparator_8bit_tb is
--  Port ( );
end comparator_8bit_tb;

architecture Behavioral of comparator_8bit_tb is
    component comparator_8bit
	Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
	       b : in  STD_LOGIC_VECTOR (7 downto 0);
	       neq : out  STD_LOGIC;
	       gt : out  STD_LOGIC;
	       lt : out  STD_LOGIC);
    end component;

    signal a_s : STD_LOGIC_VECTOR (7 downto 0);
    signal b_s : STD_LOGIC_VECTOR (7 downto 0);
    signal neq_s : STD_LOGIC;
    signal gt_s : STD_LOGIC;
    signal lt_s : STD_LOGIC;

begin
    duv : comparator_8bit
	Port map (
	    a => a_s,
	    b => b_s,
	    neq => neq_s,
	    gt => gt_s,
	    lt => lt_s
	);

	sim_gen : process
	begin
	    a_s <= std_logic_vector(to_unsigned(0, 8)), std_logic_vector(to_unsigned(3, 8)) after 200 ns, std_logic_vector(to_unsigned(10, 8)) after 400 ns;
	    b_s <= std_logic_vector(to_unsigned(0, 8)), std_logic_vector(to_unsigned(5, 8)) after 200 ns, std_logic_vector(to_unsigned(4, 8)) after 400 ns;

	    wait;
	end process;

end Behavioral;
