----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/19/2024 11:55:52 AM
-- Design Name: 
-- Module Name: SISO_sync_4bit_register_with_ce_we_tb - Behavioral
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

entity SISO_sync_4bit_register_with_ce_we_tb is
--  Port ( );
end SISO_sync_4bit_register_with_ce_we_tb;

architecture Behavioral of SISO_sync_4bit_register_with_ce_we_tb is
    component SISO_sync_4bit_register_with_ce_we is
        Generic (
            WIDTH : integer := 4
        );
        Port (
            D : in  STD_LOGIC;
            clk : in  STD_LOGIC;
            ce, we : in  STD_LOGIC;
            set, reset : in  STD_LOGIC;
            Q : out  STD_LOGIC
        );
    end component;

    signal D_s : STD_LOGIC := '0';
    signal clk_s : STD_LOGIC := '0';
    signal ce_s, we_s : STD_LOGIC := '0';
    signal set_s, reset_s : STD_LOGIC := '0';
    signal Q_s : STD_LOGIC;

begin
    duv: SISO_sync_4bit_register_with_ce_we
        Generic map (
            WIDTH => 4
        )
        Port map (
            D => D_s,
            clk => clk_s,
            ce => ce_s,
            we => we_s,
            set => set_s,
            reset => reset_s,
            Q => Q_s
        );

    clk_gen: process
        constant PERIOD : time := 100 ns;
    begin
        clk_s <= '0', '1' after PERIOD/2;
        wait for PERIOD;
    end process;

    -- Generate random values for D_s
    random_gen: process
        constant WAIT_TIME  : time := 100 ns;

        variable rand_value : real; -- Random value between 0.0 and 1.0
        variable seed1 : positive := 13670; -- Seed for randomness
        variable seed2 : positive := 34681; -- Second seed for randomness
    begin
        -- Generate random real number in range [0.0, 1.0)
        uniform(seed1, seed2, rand_value);

        -- Map real number to a random bit using if-then-else
        if rand_value < 0.5 then
            D_s <= '0';
        else
            D_s <= '1';
        end if;

        wait for WAIT_TIME;
    end process;

    sim_gen: process
    begin
        ce_s <= '0', '1' after 50 ns;
        we_s <= '0', '1' after 100 ns;
        set_s <= '0', '1' after 300 ns, '0' after 400 ns;
        reset_s <= '0', '1' after 500 ns, '0' after 600 ns;

        wait;
    end process;

end Behavioral;
