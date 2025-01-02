----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 01/01/2025 07:14:25 PM
-- Design Name: 
-- Module Name: reg_file_128x32_read_first_with_wclk_and_rclk - Behavioral
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

entity reg_file_128x32_read_first_with_wclk_and_rclk is
    Generic (
        DATA_WIDTH : integer := 32;
        ADDR_WIDTH : integer := 7;
        MEM_CAPACITY : integer := 128
    );
    Port (
        wclk, rclk : in STD_LOGIC;
        reset : in STD_LOGIC;
        ce, en : in STD_LOGIC;
        address : in STD_LOGIC_VECTOR (ADDR_WIDTH-1 downto 0);
        wdata : in STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
        rdata : out STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0)
    );
end reg_file_128x32_read_first_with_wclk_and_rclk;

architecture Behavioral of reg_file_128x32_read_first_with_wclk_and_rclk is
    type reg_array is array (0 to MEM_CAPACITY -1) of STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal reg_s : reg_array := (others => (others => '0'));

begin
    reg_read_file: process(rclk)
    begin
        if rising_edge(rclk) then
            rdata <= reg_s(to_integer(unsigned(address)));
        end if;
    end process reg_read_file;

    reg_write_file: process(wclk, ce, en, reset)
    begin
        if rising_edge(wclk) then
            if reset = '1' then
                reg_s <= (others => (others => '0'));
            elsif ce = '1' and en = '1' then
                reg_s(to_integer(unsigned(address))) <= wdata;
            end if;
        end if;
    end process reg_write_file;

end Behavioral;
