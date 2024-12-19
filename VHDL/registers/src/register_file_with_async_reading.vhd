----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/19/2024 04:06:46 PM
-- Design Name: 
-- Module Name: register_file_with_async_reading - Behavioral
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

entity register_file_with_async_reading is
    generic (
        WIDTH : integer := 8;  -- Data width
        ADDR_WIDTH : integer := 3;  -- Address width
        m : integer := 32  -- Number of reg_file_s:
    );
    port (
        clk     : in  std_logic;
        reset   : in  std_logic;
        ce  : in  std_logic;
        en  : in  std_logic;

        waddress1: in  std_logic_vector(ADDR_WIDTH-1 downto 0);
        wdata1: in  std_logic_vector(WIDTH-1 downto 0);

        waddress2: in  std_logic_vector(ADDR_WIDTH-1 downto 0);
        wdata2: in  std_logic_vector(WIDTH-1 downto 0);

        we : in  std_logic_vector(1 downto 0);

        raddress1 : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
        rdata1 : out std_logic_vector(WIDTH-1 downto 0);

        raddress2 : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
        rdata2 : out std_logic_vector(WIDTH-1 downto 0)

    );

end register_file_with_async_reading;

architecture Behavioral of register_file_with_async_reading is
    type reg_file_t is array (0 to m-1) of std_logic_vector(WIDTH-1 downto 0);
    signal reg_file_s : reg_file_t := (others => (others => '0'));

begin

    reg_file_write : process (clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                reg_file_s <= (others => (others => '0'));
            elsif ce = '1' and en = '1' then
                case we is
                    when "01" =>
                         reg_file_s(to_integer(unsigned(waddress1))) <= wdata1;
                    when "10" =>
                        reg_file_s(to_integer(unsigned(waddress2))) <= wdata2;
                    when others =>
                        null; -- No write operation
                end case;
            end if;
        end if;
    end process;

    rdata1 <= reg_file_s(to_integer(unsigned(raddress1)));
    rdata2 <= reg_file_s(to_integer(unsigned(raddress2)));

end Behavioral;
