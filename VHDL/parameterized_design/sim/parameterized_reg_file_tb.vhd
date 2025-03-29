library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity parameterized_reg_file_tb is
  generic (
    -- Register File 1
    WIDTH_1         : integer := 32;
    NUM_REGISTERS_1 : integer := 32;
    ADR_BUS_WIDTH_1 : integer := 5;

    -- Register File 2
    WIDTH_2         : integer := 16;
    NUM_REGISTERS_2 : integer := 16;
    ADR_BUS_WIDTH_2 : integer := 4;

    -- Clock period
    period : time := 100 ns
  );
--  Port ( );
end entity parameterized_reg_file_tb;

architecture behavioral of parameterized_reg_file_tb is

  component parameterized_reg_file is
    generic (
      WIDTH         : integer := 8;
      NUM_REGISTERS : integer := 4;
      ADR_BUS_WIDTH : integer := 2
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
  end component parameterized_reg_file;

  ----------- Signals for Clock and Reset ------------

  signal clk_s   : STD_LOGIC;
  signal reset_s : STD_LOGIC;

  ----------- Signals for Register File 1 -------------

  signal waddress1_1 : STD_LOGIC_VECTOR(ADR_BUS_WIDTH_1 - 1 downto 0);
  signal wdata1_1    : STD_LOGIC_VECTOR(WIDTH_1 - 1 downto 0);
  signal waddress2_1 : STD_LOGIC_VECTOR(ADR_BUS_WIDTH_1 - 1 downto 0);
  signal wdata2_1    : STD_LOGIC_VECTOR(WIDTH_1 - 1 downto 0);

  signal we_1 : STD_LOGIC_VECTOR(1 downto 0);

  signal raddress1_1 : STD_LOGIC_VECTOR(ADR_BUS_WIDTH_1 - 1 downto 0);
  signal rdata1_1    : STD_LOGIC_VECTOR(WIDTH_1 - 1 downto 0);
  signal raddress2_1 : STD_LOGIC_VECTOR(ADR_BUS_WIDTH_1 - 1 downto 0);
  signal rdata2_1    : STD_LOGIC_VECTOR(WIDTH_1 - 1 downto 0);

  ----------- Signals for Register File 2 -------------

  signal waddress1_2 : STD_LOGIC_VECTOR(ADR_BUS_WIDTH_2 - 1 downto 0);
  signal wdata1_2    : STD_LOGIC_VECTOR(WIDTH_2 - 1 downto 0);
  signal waddress2_2 : STD_LOGIC_VECTOR(ADR_BUS_WIDTH_2 - 1 downto 0);
  signal wdata2_2    : STD_LOGIC_VECTOR(WIDTH_2 - 1 downto 0);

  signal we_2 : STD_LOGIC_VECTOR(1 downto 0);

  signal raddress1_2 : STD_LOGIC_VECTOR(ADR_BUS_WIDTH_2 - 1 downto 0);
  signal rdata1_2    : STD_LOGIC_VECTOR(WIDTH_2 - 1 downto 0);
  signal raddress2_2 : STD_LOGIC_VECTOR(ADR_BUS_WIDTH_2 - 1 downto 0);
  signal rdata2_2    : STD_LOGIC_VECTOR(WIDTH_2 - 1 downto 0);

begin

  -- Component Instantiation
  dut_of_reg_file_1 : component parameterized_reg_file
    generic map (
      WIDTH         => WIDTH_1,
      NUM_REGISTERS => NUM_REGISTERS_1,
      ADR_BUS_WIDTH => ADR_BUS_WIDTH_1
    )
    port map (
      clk       => clk_s,
      reset     => reset_s,
      waddress1 => waddress1_1,
      wdata1    => wdata1_1,
      waddress2 => waddress2_1,
      wdata2    => wdata2_1,
      we        => we_1,
      raddress1 => raddress1_1,
      rdata1    => rdata1_1,
      raddress2 => raddress2_1,
      rdata2    => rdata2_1
    );

  dut_of_reg_file_2 : component parameterized_reg_file
    generic map (
      WIDTH         => WIDTH_2,
      NUM_REGISTERS => NUM_REGISTERS_2,
      ADR_BUS_WIDTH => ADR_BUS_WIDTH_2
    )
    port map (
      clk       => clk_s,
      reset     => reset_s,
      waddress1 => waddress1_2,
      wdata1    => wdata1_2,
      waddress2 => waddress2_2,
      wdata2    => wdata2_2,
      we        => we_2,
      raddress1 => raddress1_2,
      rdata1    => rdata1_2,
      raddress2 => raddress2_2,
      rdata2    => rdata2_2
    );

  -- Clock Generation Process (Continuous Clock)
  clk_gen : process is
  begin

    while true loop

      clk_s <= '0';
      wait for period / 2;
      clk_s <= '1';
      wait for period / 2;

    end loop;

  end process clk_gen;

  -- Generation Process of any other signal
  sim_gen : process is
  begin

    reset_s <= '0';
    we_1    <= "00";
    we_2    <= "00";
    wait for period;
    we_1    <= "11";
    we_2    <= "01";
    wait for 2 * period;
    we_1    <= "10";
    we_2    <= "10";
    reset_s <= '1';
    wait for period;
    we_1    <= "01";
    we_2    <= "11";
    reset_s <= '0';
    wait;

  end process sim_gen;

  -- Data Generation Process for Register File 1
  data_reg_file_1_gen : process is

    -- Declaration and initialization of variables for write and read addresses

    variable write_address_1 : integer := 0;
    variable write_address_2 : integer := 1;

    variable read_address_1 : integer := 0;
    variable read_address_2 : integer := WIDTH_1 - 1;

  begin

    for i in 0 to WIDTH_1 - 1 loop

      ------------------ Write Ports ---------------

      -- First Write Port (prva adresa)
      waddress1_1 <= STD_LOGIC_VECTOR(TO_UNSIGNED(write_address_1, ADR_BUS_WIDTH_1));
      wdata1_1    <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, WIDTH_1));

      -- Second Write Port (druga adresa, inkrementirano)
      waddress2_1 <= STD_LOGIC_VECTOR(TO_UNSIGNED(write_address_2, ADR_BUS_WIDTH_1));
      wdata2_1    <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, WIDTH_1));

      -- Inkrementation for next write address
      write_address_1 := (write_address_1 + 1) mod WIDTH_1;
      write_address_2 := (write_address_2 - 1) mod WIDTH_1;

      ------------------ Read Ports ---------------

      -- First Read Port
      raddress1_1 <= STD_LOGIC_VECTOR(TO_UNSIGNED(read_address_1, ADR_BUS_WIDTH_1));

      -- Second Read Port
      raddress2_1 <= STD_LOGIC_VECTOR(TO_UNSIGNED(read_address_2, ADR_BUS_WIDTH_1));

      --  Incrementation for next read address
      read_address_1 := (read_address_1 + 1) mod WIDTH_1;
      read_address_2 := (read_address_2 - 1) mod WIDTH_1;

      wait for period / 2;

    end loop;

    wait;

  end process data_reg_file_1_gen;

  -- Data Generation Process for Register File 2
  data_reg_file_2_gen : process is

    -- Declaration and initialization of variables for write and read addresses

    variable write_address_1 : integer := 1;
    variable write_address_2 : integer := 0;

    variable read_address_1 : integer := 0;
    variable read_address_2 : integer := WIDTH_2 - 1;

  begin

    for i in 0 to WIDTH_2 - 1 loop

      ------------------ Write Ports ---------------

      -- First Write Port
      waddress1_2 <= STD_LOGIC_VECTOR(TO_UNSIGNED(write_address_1, ADR_BUS_WIDTH_2));
      wdata1_2    <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, WIDTH_2));

      -- Second Write Port
      waddress2_2 <= STD_LOGIC_VECTOR(TO_UNSIGNED(write_address_2, ADR_BUS_WIDTH_2));
      wdata2_2    <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, WIDTH_2));

      -- Increment for next write address
      write_address_1 := (write_address_1 + 1) mod WIDTH_2;
      write_address_2 := (write_address_2 - 1) mod WIDTH_2;

      ------------------ Read Ports ---------------

      -- First Read Port
      raddress1_2 <= STD_LOGIC_VECTOR(TO_UNSIGNED(read_address_1, ADR_BUS_WIDTH_2));

      -- Second Read Port
      raddress2_2 <= STD_LOGIC_VECTOR(TO_UNSIGNED(read_address_2, ADR_BUS_WIDTH_2));

      wait for period;

      -- Increment for next read address
      read_address_1 := (read_address_1 + 1) mod WIDTH_2;
      read_address_2 := (read_address_2 - 1) mod WIDTH_2;

    end loop;

    wait;

  end process data_reg_file_2_gen;

end architecture behavioral;
