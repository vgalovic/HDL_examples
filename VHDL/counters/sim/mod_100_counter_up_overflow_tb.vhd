----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 01/02/2025 09:44:16 PM
-- Design Name: 
-- Module Name: mod_100_counter_up_overflow_tb - Behavioral
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

use IEEE.MATH_REAL.ALL;

entity mod_100_counter_up_overflow_tb is
--  Port ( );
end mod_100_counter_up_overflow_tb;

architecture Behavioral of mod_100_counter_up_overflow_tb is
    component mod_100_counter_up_overflow is
        Generic (
            M : integer := 100;
            WIDTH : integer := integer(ceil(log2(real(100))))
        );
        Port (
            clk : in STD_LOGIC;
            en : in STD_LOGIC;
            laod : in STD_LOGIC;
            counter_value: in STD_LOGIC_VECTOR(WIDTH -1 downto 0);
            overflow : out STD_LOGIC;
            q : out STD_LOGIC_VECTOR (WIDTH - 1 downto 0)
        );
    end component;

    signal clk_s : STD_LOGIC := '0';
    signal en_s : STD_LOGIC := '0';
    signal laod_s : STD_LOGIC := '0';
    signal counter_value_s : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
    signal overflow_s : STD_LOGIC := '0';
    signal q_s : STD_LOGIC_VECTOR (6 downto 0) := (others => '0');

begin
    duv: mod_100_counter_up_overflow
        Generic map (
            M => 100,
            WIDTH => integer(ceil(log2(real(100))))
        )
        Port map (
            clk => clk_s,
            en => en_s,
            laod => laod_s,
            counter_value => counter_value_s,
            overflow => overflow_s,
            q => q_s
        );

    clk_gen: process
        variable period : time := 50 ns;
    begin
        clk_s <= '0', '1' after period/2;
        wait for period;
    end process clk_gen;

    stim_gen: process
    begin
        en_s <= '0', '1' after 100 ns;
        laod_s <= '1', '0' after 100 ns, '1' after 300 ns, '0' after 400 ns;
        counter_value_s <= std_logic_vector(to_unsigned(95, 7));

        wait;
    end process stim_gen;

end Behavioral;
