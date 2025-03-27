----------------------------------------------------------------------------------
-- Company:
-- Engineer: Vladimir Galovic
--
-- Create Date: 03/23/2025 03:12:21 PM
-- Design Name:
-- Module Name: parameterized_reg_file - Behavioral
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

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity parameterized_reg_file is
  generic (
    width         : integer := 8;
    num_registers : integer := 4;
    adr_bus_width : integer := 2 -- log2(4) = 2 bits needed to address 8 registers
  );
  port (
    clk   : in    std_logic;
    reset : in    std_logic;

    ------------- Write Ports ---------------

    -- First Write Port
    waddress1 : in    std_logic_vector(adr_bus_width - 1 downto 0);
    wdata1    : in    std_logic_vector(width - 1 downto 0);

    -- Second Write Port
    waddress2 : in    std_logic_vector(adr_bus_width - 1 downto 0);
    wdata2    : in    std_logic_vector(width - 1 downto 0);

    -- Write Enable Port (active high)
    we : in    std_logic_vector(1 downto 0);

    ------------- Read Ports ---------------

    -- First Read Port
    raddress1 : in    std_logic_vector(adr_bus_width - 1 downto 0);
    rdata1    : out   std_logic_vector(width - 1 downto 0);

    -- Second Read Port
    raddress2 : in    std_logic_vector(adr_bus_width - 1 downto 0);
    rdata2    : out   std_logic_vector(width - 1 downto 0)
  );
end entity parameterized_reg_file;

architecture behavioral of parameterized_reg_file is

  type reg_file_t is array (0 to num_registers - 1) of std_logic_vector(width - 1 downto 0);

  signal reg_file_s : reg_file_t;

begin

  -- Register Write Process

  -- Register Write Process
  reg_file_write : process (clk) is

    variable addr1 : integer;
    variable addr2 : integer;

  begin

    if rising_edge(clk) then
      if (reset = '1') then
        reg_file_s <= (others => (others => '0')); -- Reset registers
      else
        -- Convert addresses only when needed
        addr1 := to_integer(unsigned(waddress1));
        addr2 := to_integer(unsigned(waddress2));

        --------------- Write Henries ---------------

        -- Write to first register
        if (we(0) = '1' and addr1 < num_registers) then
          reg_file_s(addr1) <= wdata1;
        end if;

        -- Write to second register
        if (we(1) = '1' and addr2 < num_registers) then
          -- Block write to the same address
          if (addr1 /= addr2) then
            reg_file_s(addr2) <= wdata2;
          end if;
        end if;
      end if;
    end if;

  end process reg_file_write;

  -- Register Read Process (Asynchronous)
  rdata1 <= reg_file_s(to_integer(unsigned(raddress1))) when to_integer(unsigned(raddress1)) < num_registers else
            (others => '0');
  rdata2 <= reg_file_s(to_integer(unsigned(raddress2))) when to_integer(unsigned(raddress2)) < num_registers else
            (others => '0');

end architecture behavioral;
