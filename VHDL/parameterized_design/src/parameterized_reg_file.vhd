library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity parameterized_reg_file is
  generic (
    WIDTH         : integer := 8;
    NUM_REGISTERS : integer := 4;
    ADR_BUS_WIDTH : integer := 2 -- log2(4) = 2 bits needed to address 8 registers
  );
  port (
    clk   : in    STD_LOGIC;
    reset : in    STD_LOGIC;

    ------------- Write Ports ---------------

    -- First Write Port
    waddress1 : in    STD_LOGIC_VECTOR(ADR_BUS_WIDTH - 1 downto 0);
    wdata1    : in    STD_LOGIC_VECTOR(WIDTH - 1 downto 0);

    -- Second Write Port
    waddress2 : in    STD_LOGIC_VECTOR(ADR_BUS_WIDTH - 1 downto 0);
    wdata2    : in    STD_LOGIC_VECTOR(WIDTH - 1 downto 0);

    -- Write Enable Port (active high)
    we : in    STD_LOGIC_VECTOR(1 downto 0);

    ------------- Read Ports ---------------

    -- First Read Port
    raddress1 : in    STD_LOGIC_VECTOR(ADR_BUS_WIDTH - 1 downto 0);
    rdata1    : out   STD_LOGIC_VECTOR(WIDTH - 1 downto 0);

    -- Second Read Port
    raddress2 : in    STD_LOGIC_VECTOR(ADR_BUS_WIDTH - 1 downto 0);
    rdata2    : out   STD_LOGIC_VECTOR(WIDTH - 1 downto 0)
  );
end entity parameterized_reg_file;

architecture behavioral of parameterized_reg_file is

  type reg_file_t is array (0 to num_registers - 1) of STD_LOGIC_VECTOR(WIDTH - 1 downto 0);

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
        addr1 := TO_INTEGER(UNSIGNED(waddress1));
        addr2 := TO_INTEGER(UNSIGNED(waddress2));

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
  rdata1 <= reg_file_s(TO_INTEGER(UNSIGNED(raddress1))) when TO_INTEGER(UNSIGNED(raddress1)) < num_registers else
            (others => '0');
  rdata2 <= reg_file_s(TO_INTEGER(UNSIGNED(raddress2))) when TO_INTEGER(UNSIGNED(raddress2)) < num_registers else
            (others => '0');

end architecture behavioral;
