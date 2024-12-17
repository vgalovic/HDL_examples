----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/17/2024 06:46:49 PM
-- Design Name: 
-- Module Name: D_flip_flop_synchro_en_tb - Behavioral
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

entity D_flip_flop_synchro_en_tb is
--  Port ( );
end D_flip_flop_synchro_en_tb;

architecture Behavioral of D_flip_flop_synchro_en_tb is
    component D_flip_flop_synchro_en
        Port (
            D : in STD_LOGIC;
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            set : in STD_LOGIC;
            en : in STD_LOGIC;
            Q : out STD_LOGIC
        );
    end component;

    signal D_s, clk_s, reset_s, set_s, en_s : STD_LOGIC := '0';
    signal Q_s : STD_LOGIC := '0';

begin
    duv: D_flip_flop_synchro_en
        port map (
            D => D_s,
            clk => clk_s,
            reset => reset_s,
            set => set_s,
            en => en_s,
            Q => Q_s
        );
        
    clk_gen: process
    begin
        clk_s <= '0', '1' after 50 ns;
        wait for 100 ns;
    end process;

    sim_gen: process
    begin
        D_s <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 300 ns, '0' after 400 ns, '1' after 500 ns, '0' after 600 ns, '1' after 700 ns, '0' after 800 ns, '1' after 900 ns;
        reset_s <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 500 ns, '0' after 600 ns;
        set_s <= '0', '1' after 200 ns, '0' after 300 ns , '1' after 400 ns, '0' after 500 ns;
        en_s <= '0', '1' after 300 ns;
        wait;
    end process;

end Behavioral;
