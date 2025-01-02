----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/31/2024 04:29:51 PM
-- Design Name: 
-- Module Name: ram1024x32 - Behavioral
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

entity ram1024x32 is
    generic (
        ADDR_WIDTH : integer := 10;
        DATA_WIDTH : integer := 32
    );
     Port (
        clk : in STD_LOGIC;

        address : in STD_LOGIC_VECTOR (ADDR_WIDTH-1 downto 0);
        rdata : out STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
        wdata : in STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
        write : in STD_LOGIC
    );
end ram1024x32;

architecture Behavioral of ram1024x32 is
    type ram_type is array (0 to 2**ADDR_WIDTH-1) of std_logic_vector(DATA_WIDTH-1 downto 0);
    signal ram_s : ram_type := (others => (others => '0'));

begin
    ram: process(clk) is
    begin
        if rising_edge(clk) then
            if write = '1' then
                ram_s(to_integer(unsigned(address))) <= wdata;
            end if;
        end if;

        -- Synchronous read
        rdata <= ram_s(to_integer(unsigned(address)));
    end process ram;

    -- Asynchronous read
    -- rdata <= ram_s(to_integer(unsigned(address)));

end Behavioral;
