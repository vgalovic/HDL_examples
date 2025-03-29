library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity rom64x16 is
  generic (
    ADDR_WIDTH : integer := 6;
    DATA_WIDTH : integer := 16;
    MEM_CAPACITY : integer := 64
  );
  Port (
    address : in STD_LOGIC_VECTOR (ADDR_WIDTH-1 downto 0);
    rdata : out STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0)
  );
  end entity rom64x16;

architecture Behavioral of rom64x16 is

  type rom_type is array (0 to MEM_CAPACITY-1) of std_logic_vector(DATA_WIDTH-1 downto 0);
  signal rom_s : rom_type := (
    X"0000", X"0003", X"0001", X"0005", X"0008", X"0002", X"0004", X"000A",
    X"0007", X"000F", X"0009", X"000C", X"0010", X"0013", X"0012", X"0014",
    X"0011", X"0017", X"0015", X"0019", X"0021", X"0020", X"0024", X"0023",
    X"0026", X"0025", X"0028", X"0029", X"0030", X"0031", X"0034", X"0032",
    X"0035", X"0036", X"0037", X"0038", X"0033", X"0039", X"003A", X"003B",
    X"003C", X"003D", X"003E", X"003F", X"0040", X"0041", X"0042", X"0044",
    X"0045", X"0046", X"0047", X"0048", X"0049", X"004A", X"004B", X"004C",
    X"004D", X"004E", X"004F", X"0050", X"0051", X"0052", X"0053", X"0054"
  );

begin

  -- Asynchronous read
  rdata <= rom_s(to_integer(unsigned(address)));

end Behavioral;
