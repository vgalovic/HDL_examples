----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/04/2024 09:02:13 PM
-- Design Name: 
-- Module Name: comaprator_4bit_tb - Behavioral
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

entity comaprator_4bit_tb is
--  Port ( );
end comaprator_4bit_tb;

architecture Behavioral of comaprator_4bit_tb is
    component comparator_4bit
	Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
	       b : in  STD_LOGIC_VECTOR (3 downto 0);
	       eq : out  STD_LOGIC;
	       lt : out  STD_LOGIC;
	       gt : out  STD_LOGIC);
    end component;

    signal a_s : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal b_s : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal eq_s : STD_LOGIC;
    signal lt_s : STD_LOGIC;
    signal gt_s : STD_LOGIC;

begin
    duv: comparator_4bit
	port map(
	    a => a_s,
	    b => b_s,
	    eq => eq_s,
	    lt => lt_s,
	    gt => gt_s
	);

    sim_gen: process
    begin
	a_s <= "1011", "0110" after 100 ns , "0101" after 200 ns, "0111" after 300 ns;
	b_s <= "1001", "1111" after 100 ns , "0100" after 200 ns, "0111" after 300 ns;
	wait;
    end process;


end Behavioral;
