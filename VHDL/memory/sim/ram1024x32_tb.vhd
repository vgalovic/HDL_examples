library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity ram1024x32_tb is
--  Port ( );
  end entity ram1024x32_tb;

architecture Behavioral of ram1024x32_tb is
  component ram1024x32 is
    generic (
      ADDR_WIDTH : integer := 10;
      DATA_WIDTH : integer := 32
    );
     Port (
      clk : in STD_LOGIC;
      address : in STD_LOGIC_VECTOR (ADDR_WIDTH-1 downto 0);
      rdata : out STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
      wdata : in STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
      write : in STD_LOGIC
    );
    end component ram1024x32;

  signal clk_s : std_logic := '0';
  signal address_s : std_logic_vector(9 downto 0) := (others => '0');
  signal wdata_s : std_logic_vector(31 downto 0) := (others => '0');
  signal write_s : std_logic := '0';
  signal rdata_s : std_logic_vector(31 downto 0);

begin

  duv: ram1024x32
    generic map (
      ADDR_WIDTH => 10,
      DATA_WIDTH => 32
    )
    port map (
      clk => clk_s,
      address => address_s,
      rdata => rdata_s,
      wdata => wdata_s,
      write => write_s
    );

  clk_gen: process is
    variable period : time := 100 ns;
  begin
    clk_s <= '0', '1' after period/2;
    wait for period;
  end process clk_gen;

  sim_gen: process is
  begin
    address_s <= (others => '0');
    wdata_s <= (others => '0');
    write_s <= '0';
    wait for 200 ns;

    write_s <= '1';

    for i in 0 to 1023 loop
      address_s <= std_logic_vector(to_unsigned(i, 10));
      wdata_s <= std_logic_vector(to_unsigned(i, 32));
      wait for 200 ns;
    end loop;

    write_s <= '0';
    wait for 200 ns;

    for i in 0 to 1023 loop
      address_s <= std_logic_vector(to_unsigned(i, 10));
      wait for 200 ns;
    end loop;

    wait;
  end process sim_gen;

end Behavioral;
