----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 01/01/2025 06:47:17 PM
-- Design Name: 
-- Module Name: reg_files_64x16_write_first - Behavioral
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

entity reg_files_64x16_write_first is
    Generic (
        DATA_WIDTH : integer := 16;
        ADDR_WIDTH : integer := 6;
        MEM_CAPACITY : integer := 64
    );
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        ce, en : in STD_LOGIC;
        address : in STD_LOGIC_VECTOR (ADDR_WIDTH-1 downto 0);
        wdata : in STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
        rdata : out STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0)
    );
end reg_files_64x16_write_first;

architecture Behavioral of reg_files_64x16_write_first is
    type reg_array is array (0 to MEM_CAPACITY -1) of STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal reg_s : reg_array := (others => (others => '0'));

begin
    reg_write_first: process(clk, ce,en, reset)
    begin
        rdata <= (others => '0');

        if rising_edge(clk) then
            if reset = '1' then
                reg_s <= (others => (others => '0'));
            elsif ce = '1' and en = '1' then
                reg_s(to_integer(unsigned(address))) <= wdata;
                rdata <= wdata;
            end if;

            rdata <= reg_s(to_integer(unsigned(address)));
        end if;
    end process reg_write_first;

end Behavioral;
