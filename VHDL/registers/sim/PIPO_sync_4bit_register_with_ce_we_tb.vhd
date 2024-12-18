----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/18/2024 04:55:25 PM
-- Design Name: 
-- Module Name: PIPO_PIPO_sync_4bit_register_with_ce_we_tb - Behavioral
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

entity PIPO_sync_4bit_register_with_ce_we_tb is
--  Port ( );
end PIPO_sync_4bit_register_with_ce_we_tb;

architecture Behavioral of PIPO_sync_4bit_register_with_ce_we_tb is
    component PIPO_sync_4bit_register_with_ce_we
        Port (
            D : in STD_LOGIC_VECTOR (3 downto 0);
            ce, we : in STD_LOGIC;
            clk : in STD_LOGIC;
            set, reset : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    signal D_s, Q_s : STD_LOGIC_VECTOR (3 downto 0);
    signal clk_s, ce_s, we_s, set_s, reset_s : STD_LOGIC;

begin
    duv: PIPO_sync_4bit_register_with_ce_we
        port map (
            D => D_s,
            ce => ce_s,
            we => we_s,
            clk => clk_s,
            set => set_s,
            reset => reset_s,
            Q => Q_s
        );

    clk_gen: process
    begin
        clk_s <= '0', '1' after 50 ns;
        wait for 100 ns;
    end process;
    
     -- Generate values for D_s
    random_gen: process
        constant WAIT_TIME  : time := 100 ns;
    
        variable rand_value  : real;            -- Random value between 0.0 and 1.0
        variable rand_int  : integer;         -- Integer representation of the random value
        variable seed1     : positive := 13579;  -- Seed for randomness
        variable seed2     : positive := 24680;  -- Second seed for randomness
    begin
        -- Generate random real number in range [0.0, 1.0)
        uniform(seed1, seed2, rand_value);
            
        -- Map the random real number to an integer in the range [0, 15]
        rand_int := integer(rand_value * 16.0);  -- Multiply by 16 to map to 4-bit range
            
        -- Assign the random value to D_s as a 4-bit std_logic_vector
        D_s <= std_logic_vector(to_unsigned(rand_int, 4));

        -- Wait for some time before generating the next random value
        wait for WAIT_TIME;
    end process;

    sim_gen: process
    begin
        ce_s <= '0', '1' after 100 ns;
        we_s <= '0', '1' after 200 ns;
        set_s <= '0', '1' after 300 ns, '0' after 500 ns;
        reset_s <= '0', '1' after 600 ns, '0' after 800 ns;

        wait;
    end process;

end Behavioral;
