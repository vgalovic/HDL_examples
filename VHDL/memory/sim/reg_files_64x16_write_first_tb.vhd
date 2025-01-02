----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 01/01/2025 06:47:45 PM
-- Design Name: 
-- Module Name: reg_files_64x16_write_first_tb - Behavioral
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

entity reg_files_64x16_write_first_tb is
 -- Port ( );
end reg_files_64x16_write_first_tb;

architecture Behavioral of reg_files_64x16_write_first_tb is
    component reg_files_64x16_write_first is
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
    end component;

    signal clk_s : std_logic := '0';
    signal reset_s : std_logic := '0';
    signal ce_s, en_s : std_logic := '0';
    signal address_s : std_logic_vector(5 downto 0) := (others => '0');
    signal wdata_s : std_logic_vector(15 downto 0) := (others => '0');
    signal rdata_s : std_logic_vector(15 downto 0) := (others => '0');

begin
    duv : reg_files_64x16_write_first
        generic map (
            DATA_WIDTH => 16,
            ADDR_WIDTH => 6,
            MEM_CAPACITY => 64
        )
        port map (
            clk => clk_s,
            reset => reset_s,
            ce => ce_s,
            en => en_s,
            address => address_s,
            wdata => wdata_s,
            rdata => rdata_s
        );

    clk_gen : process
        variable period : time := 100 ns;
    begin
        clk_s <= '0', '1' after period/2;
        wait for period;
    end process;

    sim_gen : process
    begin
        address_s <= (others => '0');
        wdata_s <= (others => '0');

        ce_s <= '0';
        en_s <= '0';
        wait for 200 ns;

        en_s <= '1';

        address_s <= std_logic_vector(to_unsigned(15, 6));
        wdata_s <= std_logic_vector(to_unsigned(64, 16));

        wait for 100 ns;

        ce_s <= '1';

        for i in 0 to 63 loop
            address_s <= std_logic_vector(to_unsigned(i, 6));
            wdata_s <= std_logic_vector(to_unsigned(i, 16));
            wait for 100 ns;
        end loop;

        en_s <= '0';
        wait for 200 ns;

        for i in 0 to 63 loop
            address_s <= std_logic_vector(to_unsigned(i, 6));
            wait for 100 ns;
        end loop;

        reset_s <= '1';
        wait for 200 ns;
        reset_s <= '0';

        wait;
    end process;

end Behavioral;
