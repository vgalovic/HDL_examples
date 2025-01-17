----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 01/01/2025 05:05:53 PM
-- Design Name: 
-- Module Name: rom64x16_tb - Behavioral
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

entity rom64x16_tb is
--  Port ( );
end rom64x16_tb;

architecture Behavioral of rom64x16_tb is
    component rom64x16 is
        generic (
            ADDR_WIDTH : integer := 6;
            DATA_WIDTH : integer := 16;
            MEM_CAPACITY : integer := 64
        );
        Port (
            address : in STD_LOGIC_VECTOR (ADDR_WIDTH-1 downto 0);
            rdata : out STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0)
        );
    end component;

    signal address_s : std_logic_vector(5 downto 0) := (others => '0');
    signal rdata_s : std_logic_vector(15 downto 0) := (others => '0');

begin
    duv : rom64x16
        generic map (
            ADDR_WIDTH => 6,
            DATA_WIDTH => 16,
            MEM_CAPACITY => 64
        )
        port map (
            address => address_s,
            rdata => rdata_s
        );

    sim_gen : process
    begin
        for i in 0 to 63 loop
            address_s <= std_logic_vector(to_unsigned(i, 6));
            wait for 100 ns;
        end loop;

        wait;
    end process;

end Behavioral;
