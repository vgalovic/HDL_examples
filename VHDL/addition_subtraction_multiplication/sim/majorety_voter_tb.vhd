----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/01/2024 07:45:47 PM
-- Design Name: 
-- Module Name: majorety_voter_tb - Behavioral
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

entity majorety_voter_tb is
--  Port ( );
end majorety_voter_tb;

architecture Behavioral of majorety_voter_tb is
    component majorety_voter is
        port ( X, Y, Z : in  STD_LOGIC;
               V : out  STD_LOGIC);
    end component;

    signal X_s, Y_s, Z_s: STD_LOGIC := '0';
    signal V_s : STD_LOGIC;

begin

    duv: majorety_voter
        port map(
            X => X_s,
            Y => Y_s,
            Z => Z_s,
            V => V_s
        );

    sim_gen: process
    begin
        X_s <= '0', '1' after 100 ns, '0' after 300 ns, '1' after 500 ns;
        Y_s <= '0', '1' after 200 ns, '0' after 400 ns, '1' after 600 ns;
        Z_s <= '0', '1' after 300 ns, '0' after 500 ns, '1' after 700 ns;

        wait;
   end process;

end Behavioral;
