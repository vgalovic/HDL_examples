----------------------------------------------------------------------------------
-- Company:
-- Engineer: Vladimir Galović
--
-- Create Date: 03/23/2025 04:03:58 PM
-- Design Name:
-- Module Name: parameterized_reg_file_tb - Behavioral
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

  -- Uncomment the following library declaration if using
  -- arithmetic functions with Signed or Unsigned values
  use ieee.numeric_std.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity parameterized_reg_file_tb is
  generic (
    -- Register File 1
    width_1         : integer := 32;
    num_registers_1 : integer := 32;
    adr_bus_width_1 : integer := 5;

    -- Register File 2
    width_2         : integer := 16;
    num_registers_2 : integer := 16;
    adr_bus_width_2 : integer := 4;

    -- Clock period
    period : time := 100 ns
  );
--  Port ( );
end entity parameterized_reg_file_tb;

architecture behavioral of parameterized_reg_file_tb is

  component parameterized_reg_file is
    generic (
      width         : integer := 8;
      num_registers : integer := 4;
      adr_bus_width : integer := 2
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
  end component parameterized_reg_file;

  ----------- Signals for Clock and Reset ------------

  signal clk_s   : std_logic;
  signal reset_s : std_logic;

  ----------- Signals for Register File 1 -------------

  signal waddress1_1 : std_logic_vector(adr_bus_width_1 - 1 downto 0);
  signal wdata1_1    : std_logic_vector(width_1 - 1 downto 0);
  signal waddress2_1 : std_logic_vector(adr_bus_width_1 - 1 downto 0);
  signal wdata2_1    : std_logic_vector(width_1 - 1 downto 0);

  signal we_1 : std_logic_vector(1 downto 0);

  signal raddress1_1 : std_logic_vector(adr_bus_width_1 - 1 downto 0);
  signal rdata1_1    : std_logic_vector(width_1 - 1 downto 0);
  signal raddress2_1 : std_logic_vector(adr_bus_width_1 - 1 downto 0);
  signal rdata2_1    : std_logic_vector(width_1 - 1 downto 0);

  ----------- Signals for Register File 2 -------------

  signal waddress1_2 : std_logic_vector(adr_bus_width_2 - 1 downto 0);
  signal wdata1_2    : std_logic_vector(width_2 - 1 downto 0);
  signal waddress2_2 : std_logic_vector(adr_bus_width_2 - 1 downto 0);
  signal wdata2_2    : std_logic_vector(width_2 - 1 downto 0);

  signal we_2 : std_logic_vector(1 downto 0);

  signal raddress1_2 : std_logic_vector(adr_bus_width_2 - 1 downto 0);
  signal rdata1_2    : std_logic_vector(width_2 - 1 downto 0);
  signal raddress2_2 : std_logic_vector(adr_bus_width_2 - 1 downto 0);
  signal rdata2_2    : std_logic_vector(width_2 - 1 downto 0);

begin

  -- Component Instantiation
  dut_of_reg_file_1 : component parameterized_reg_file
    generic map (
      width         => width_1,
      num_registers => num_registers_1,
      adr_bus_width => adr_bus_width_1
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
      width         => width_2,
      num_registers => num_registers_2,
      adr_bus_width => adr_bus_width_2
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

    -- Declaration of variables for write and read addresses

    variable write_address_1 : integer;
    variable write_address_2 : integer;

    variable read_address_1 : integer;
    variable read_address_2 : integer;

  begin

    -- Iniclaistion of write and read addresses

    write_address_1 := 0;
    write_address_2 := 1;

    read_address_1 := 0;
    read_address_2 := width_1 - 1;

    for i in 0 to width_1 - 1 loop

      ------------------ Write Ports ---------------

      -- First Write Port (prva adresa)
      waddress1_1 <= std_logic_vector(to_unsigned(write_address_1, adr_bus_width_1));
      wdata1_1    <= std_logic_vector(to_unsigned(i, width_1));

      -- Second Write Port (druga adresa, inkrementirano)
      waddress2_1 <= std_logic_vector(to_unsigned(write_address_2, adr_bus_width_1));
      wdata2_1    <= std_logic_vector(to_unsigned(i, width_1));

      -- Inkrementation for next write address
      write_address_1 := (write_address_1 + 1) mod width_1;
      write_address_2 := (write_address_2 - 1) mod width_1;

      ------------------ Read Ports ---------------

      -- First Read Port
      raddress1_1 <= std_logic_vector(to_unsigned(read_address_1, adr_bus_width_1));

      -- Second Read Port
      raddress2_1 <= std_logic_vector(to_unsigned(read_address_2, adr_bus_width_1));

      --  Incrementation for next read address
      read_address_1 := (read_address_1 + 1) mod width_1;
      read_address_2 := (read_address_2 - 1) mod width_1;

      wait for period / 2;

    end loop;

    wait;

  end process data_reg_file_1_gen;

  -- Data Generation Process for Register File 2
  data_reg_file_2_gen : process is

    -- Declaration of variables for write and read addresses

    variable write_address_1 : integer;
    variable write_address_2 : integer;

    variable read_address_1 : integer;
    variable read_address_2 : integer;

  begin

    -- Inicijalizacija write i read adresa

    write_address_1 := 1;
    write_address_2 := 0;

    read_address_1 := 0;
    read_address_2 := width_2 - 1;

    for i in 0 to width_2 - 1 loop

      ------------------ Write Ports ---------------

      -- First Write Port
      waddress1_2 <= std_logic_vector(to_unsigned(write_address_1, adr_bus_width_2));
      wdata1_2    <= std_logic_vector(to_unsigned(i, width_2));

      -- Second Write Port
      waddress2_2 <= std_logic_vector(to_unsigned(write_address_2, adr_bus_width_2));
      wdata2_2    <= std_logic_vector(to_unsigned(i, width_2));

      -- Increment for next write address
      write_address_1 := (write_address_1 + 1) mod width_2;
      write_address_2 := (write_address_2 - 1) mod width_2;

      ------------------ Read Ports ---------------

      -- First Read Port
      raddress1_2 <= std_logic_vector(to_unsigned(read_address_1, adr_bus_width_2));

      -- Second Read Port
      raddress2_2 <= std_logic_vector(to_unsigned(read_address_2, adr_bus_width_2));

      wait for period;

      -- Increment for next read address
      read_address_1 := (read_address_1 + 1) mod width_2;
      read_address_2 := (read_address_2 - 1) mod width_2;

    end loop;

    wait;

  end process data_reg_file_2_gen;

end architecture behavioral;
