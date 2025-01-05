----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 01/04/2025 09:35:03 PM
-- Design Name: 
-- Module Name: FSM_serial_adder_tb - Behavioral
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

entity FSM_serial_adder_tb is
--  Port ( );
end FSM_serial_adder_tb;

architecture Behavioral of FSM_serial_adder_tb is
    component FSM_serial_adder
        Port (
            clk : in std_logic;
            reset : in std_logic;
            a : in std_logic;
            b : in std_logic;
            s : out std_logic
        );
    end component;

    signal clk_s : std_logic := '0';
    signal reset_s : std_logic := '0';
    signal a_s : std_logic := '0';
    signal b_s : std_logic := '0';
    signal s_s : std_logic := '0';

    signal A : std_logic_vector(3 downto 0) := "0011";
    signal B : std_logic_vector(3 downto 0) := "1001";
    signal sum : std_logic_vector(3 downto 0) := (others => '0'); -- 0c (1100)

    constant clk_period : time := 100 ns;

begin
    duv : FSM_serial_adder
        port map (
            clk => clk_s,
            reset => reset_s,
            a => a_s,
            b => b_s,
            s => s_s
        );

    clk_gen : process
    begin
        while true loop
            clk_s <= '0', '1' after clk_period / 2;
            wait for clk_period;
        end loop;
    end process clk_gen;

    stim_gen : process
    begin
        reset_s <= '0';

        for i in 0 to 3 loop
            a_s <= A(i);
            b_s <= B(i);
            wait for clk_period/2;
            sum(i) <= s_s;
        end loop;

        wait for clk_period;
        sum <= (others => '0');


        for i in 0 to 3 loop
            a_s <= A(i);
            b_s <= B(i);
            if i = 2 then
                reset_s <= '1', '0' after clk_period;
            end if;
            wait for clk_period / 2;
            sum(i) <= s_s;
        end loop;

        wait;
    end process stim_gen;
end Behavioral;

