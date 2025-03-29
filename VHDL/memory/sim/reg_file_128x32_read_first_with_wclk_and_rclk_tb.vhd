library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity reg_file_128x32_read_first_with_wclk_and_rclk_tb is
--  Port ( );
end entity reg_file_128x32_read_first_with_wclk_and_rclk_tb;

architecture Behavioral of reg_file_128x32_read_first_with_wclk_and_rclk_tb is
  component reg_file_128x32_read_first_with_wclk_and_rclk is
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
  end component reg_file_128x32_read_first_with_wclk_and_rclk;

  signal wclk_s, rclk_s : std_logic := '0';
  signal reset_s : std_logic := '0';
  signal ce_s, en_s : std_logic := '0';
  signal address_s : std_logic_vector(6 downto 0) := (others => '0');
  signal wdata_s : std_logic_vector(31 downto 0) := (others => '0');
  signal rdata_s : std_logic_vector(31 downto 0) := (others => '0');

begin

  duv : reg_file_128x32_read_first_with_wclk_and_rclk
    generic map (
      DATA_WIDTH => 32,
      ADDR_WIDTH => 7,
      MEM_CAPACITY => 128
    )
    port map (
      wclk => wclk_s,
      rclk => rclk_s,
      reset => reset_s,
      ce => ce_s,
      en => en_s,
      address => address_s,
      wdata => wdata_s,
      rdata => rdata_s
    );

    wclk_gen : process is
      variable period : time := 100 ns;
    begin
      wclk_s <= '0', '1' after period/2;
      wait for period;
    end process wclk_gen;

    rclk_gen : process is
      variable period : time := 200 ns;
    begin
      rclk_s <= '0', '1' after period/2;
      wait for period;
    end process rclk_gen;

    sim_gen : process is
    begin
      address_s <= (others => '0');
      wdata_s <= (others => '0');

      ce_s <= '0';
      en_s <= '0';
      wait for 200 ns;

      en_s <= '1';

      address_s <= std_logic_vector(to_unsigned(15, 7));
      wdata_s <= std_logic_vector(to_unsigned(128, 32));

      wait for 100 ns;

      ce_s <= '1';

      for i in 0 to 127 loop
        address_s <= std_logic_vector(to_unsigned(i, 7));
        wdata_s <= std_logic_vector(to_unsigned(i, 32));
        wait for 100 ns;
      end loop;

      en_s <= '0';
      wait for 200 ns;

      for i in 0 to 127 loop
        address_s <= std_logic_vector(to_unsigned(i, 7));
        wait for 100 ns;
      end loop;

      reset_s <= '1';
      wait for 200 ns;
      reset_s <= '0';

      wait;
    end process sim_gen;

end Behavioral;
