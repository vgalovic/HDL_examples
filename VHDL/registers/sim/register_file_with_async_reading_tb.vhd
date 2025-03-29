library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity register_file_with_async_reading_tb is
--  Port ( );
end entity register_file_with_async_reading_tb;

architecture Behavioral of register_file_with_async_reading_tb is
  constant WIDTH_s : integer := 8;  -- Data width
  constant ADDR_WIDTH_s : integer := 3;  -- Address width
  constant m_s : integer := 32;  -- Number of registers
  constant clk_period : time := 100 ns;

  component register_file_with_async_reading is
    generic (
      WIDTH : integer := WIDTH_s;
      ADDR_WIDTH : integer := ADDR_WIDTH_s;
      m : integer := m_s
    );
    port (
      clk       : in  std_logic;
      reset     : in  std_logic;
      ce        : in  std_logic;
      en        : in  std_logic;
      waddress1 : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
      wdata1    : in  std_logic_vector(WIDTH-1 downto 0);

      waddress2 : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
      wdata2    : in  std_logic_vector(WIDTH-1 downto 0);

      we        : in  std_logic_vector(1 downto 0);
      raddress1 : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
      rdata1    : out std_logic_vector(WIDTH-1 downto 0);

      raddress2 : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
      rdata2    : out std_logic_vector(WIDTH-1 downto 0)
    );
  end component register_file_with_async_reading;

  signal clk_s : std_logic := '0';
  signal reset_s : std_logic := '0';
  signal ce_s : std_logic := '0';
  signal en_s : std_logic := '0';

  signal waddress1_s : std_logic_vector(ADDR_WIDTH_s-1 downto 0) := (others => '0');
  signal wdata1_s : std_logic_vector(WIDTH_s-1 downto 0) := (others => '0');

  signal waddress2_s : std_logic_vector(ADDR_WIDTH_s-1 downto 0) := (others => '0');
  signal wdata2_s : std_logic_vector(WIDTH_s-1 downto 0) := (others => '0');

  signal we_s : std_logic_vector(1 downto 0) := (others => '0');

  signal raddress1_s : std_logic_vector(ADDR_WIDTH_s-1 downto 0) := (others => '0');
  signal rdata1_s : std_logic_vector(WIDTH_s-1 downto 0) := (others => '0');

  signal raddress2_s : std_logic_vector(ADDR_WIDTH_s-1 downto 0) := (others => '0');
  signal rdata2_s : std_logic_vector(WIDTH_s-1 downto 0) := (others => '0');

begin
  duv: register_file_with_async_reading
    generic map (
      WIDTH => WIDTH_s,
      ADDR_WIDTH => ADDR_WIDTH_s,
      m => m_s
    )
    port map (
      clk => clk_s,
      reset => reset_s,
      ce => ce_s,
      en => en_s,
      waddress1 => waddress1_s,
      wdata1 => wdata1_s,
      waddress2 => waddress2_s,
      wdata2 => wdata2_s,
      we => we_s,
      raddress1 => raddress1_s,
      rdata1 => rdata1_s,
      raddress2 => raddress2_s,
      rdata2 => rdata2_s
    );


  clk_gen: process is
  begin
    clk_s <= '0', '1' after clk_period/2;
    wait for clk_period;
  end process clk_gen;

  sim_gen: process is
  begin
    -- Initial Setup before Reset
    -- Ensure registers are at initial state
    reset_s <= '0';  -- Ensure reset is off initially
    ce_s <= '1';  -- Enable chip enable
    en_s <= '1';  -- Enable write enable

    -- Start of simulation, no reset yet
    wait for 50 ns;  -- Wait for initial 50 ns

    -- TEST: Reset in the middle of the simulation
    reset_s <= '1';  -- Trigger reset
    wait for 100 ns;  -- Wait for reset duration (100 ns)
    reset_s <= '0';  -- Release reset

    -- After reset, ensure registers are reset to zero
    wait for 50 ns;  -- Wait for some time after reset to stabilize
    assert (rdata1_s = "00000000") report "Test failed: Register 1 data after reset" severity error;
    assert (rdata2_s = "00000000") report "Test failed: Register 2 data after reset" severity error;

    -- TEST: Write Enable with ce_s and en_s enabled
    -- Set ce_s and en_s to '1' to allow writes to the registers
    ce_s <= '1';  -- Enable chip enable
    en_s <= '1';  -- Enable write enable

    -- TEST: Write 1
    waddress1_s <= "000";  -- Address 0
    wdata1_s <= "10101010"; -- Data to write
    we_s <= "01";          -- Enable write for address1
    wait for 150 ns;  -- Wait for 150 ns for write operation

    -- Read after writing
    raddress1_s <= "000";  -- Address 0 (read)
    wait for 50 ns;  -- Wait for 50 ns before reading
    assert (rdata1_s = "10101010") report "Test failed: Register 1 data after write" severity error;

    -- TEST: Write 2
    waddress2_s <= "001";  -- Address 1
    wdata2_s <= "11001100"; -- Data to write
    we_s <= "10";          -- Enable write for address2
    wait for 150 ns;  -- Wait for 150 ns for write operation

    -- Read after writing
    raddress2_s <= "001";  -- Address 1 (read)
    wait for 50 ns;  -- Wait for 50 ns before reading
    assert (rdata2_s = "11001100") report "Test failed: Register 2 data after write" severity error;

    -- TEST: Manipulating ce_s (Chip Enable) first, keeping en_s = '1'
    --       Write with ce_s = '0' (no write should happen)
    ce_s <= '0';  -- Disable chip enable
    waddress1_s <= "010";  -- Address 2
    wdata1_s <= "11110000"; -- Data to write (should not write due to ce_s = '0')
    we_s <= "01";          -- Enable write for address1
    wait for 150 ns;  -- Wait for 150 ns for write operation

    -- Read after attempting to write with ce_s = '0'
    raddress1_s <= "010";  -- Address 2 (should not be written to)
    wait for 50 ns;  -- Wait for 50 ns before reading
    assert (rdata1_s = "00000000") report "Test failed: Register 2 data after ce_s = '0'" severity error;

    -- TEST: Manipulating en_s (Enable) after ce_s is restored to '1'
    ce_s <= '1';  -- Enable chip enable
    en_s <= '0';  -- Disable enable (no write should happen)
    waddress1_s <= "011";  -- Address 3
    wdata1_s <= "10101010"; -- Data to write (should not write due to en_s = '0')
    we_s <= "01";          -- Enable write for address1
    wait for 150 ns;  -- Wait for 150 ns for write operation

    -- Read after attempting to write with en_s = '0'
    raddress1_s <= "011";  -- Address 3 (should not be written to)
    wait for 50 ns;  -- Wait for 50 ns before reading
    assert (rdata1_s = "00000000") report "Test failed: Register 3 data after en_s = '0'" severity error;

    -- TEST: Manipulating both ce_s and en_s together
    en_s <= '1';  -- Enable write enable
    waddress2_s <= "100";  -- Address 4
    wdata2_s <= "11110000"; -- Data to write
    we_s <= "10";          -- Enable write for address2
    wait for 150 ns;  -- Wait for 150 ns for write operation

    -- Read after writing with both ce_s and en_s enabled
    raddress2_s <= "100";  -- Address 4 (read)
    wait for 50 ns;  -- Wait for 50 ns before reading
    assert (rdata2_s = "11110000") report "Test failed: Register 4 data after write" severity error;

    -- TEST: no write (we_s = "00")
    we_s <= "00";          -- Disable writes
    raddress1_s <= "000";  -- Read address 0
    raddress2_s <= "001";  -- Read address 1
    wait for 150 ns;  -- Wait for 150 ns before checking

    -- Ensure no data is written in this case
    assert (rdata1_s = "10101010") report "Test failed: Register 1 data should not change" severity error;
    assert (rdata2_s = "11001100") report "Test failed: Register 2 data should not change" severity error;

    -- End of simulation
    wait;
  end process sim_gen;

end Behavioral;
