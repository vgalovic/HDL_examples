----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 03/26/2025 06:22:13 PM
-- Design Name: 
-- Module Name: data_path - Behavioral
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

entity data_path is
  generic (
    width : integer := 8
  );
  port (
    clk : in STD_LOGIC;
    sel : in STD_LOGIC_VECTOR (1 downto 0);

    a_in : in STD_LOGIC_VECTOR (width-1 downto 0);
    b_in : in STD_LOGIC_VECTOR (width-1 downto 0);

    r_out : out STD_LOGIC_VECTOR (2*width-1 downto 0);

    b_0 : out STD_LOGIC;
    count_0 : out STD_LOGIC
  );
end data_path;

architecture Behavioral of data_path is

  signal a_reg  : STD_LOGIC_VECTOR (2*width-1 downto 0);
  signal a_next : STD_LOGIC_VECTOR (2*width-1 downto 0);

  signal b_reg  : STD_LOGIC_VECTOR (width-1 downto 0);
  signal b_next : STD_LOGIC_VECTOR (width-1 downto 0);

  signal n_reg  : STD_LOGIC_VECTOR (width-1 downto 0);
  signal n_next : STD_LOGIC_VECTOR (width-1 downto 0);

  signal p_reg  : STD_LOGIC_VECTOR (2*width-1 downto 0);
  signal p_next : STD_LOGIC_VECTOR (2*width-1 downto 0);

begin

  reg: process (clk) is
  begin
    if rising_edge(clk) then
      a_reg <= a_next;
      b_reg <= b_next;
      n_reg <= n_next;
      p_reg <= p_next;
    end if;
  end process reg;

  mux: process (a_in, b_in, a_reg, b_reg, n_reg, p_reg, sel) is
  begin
    case sel is
      when "00" =>
        a_next <= std_logic_vector(to_unsigned(0, width)) & a_in;
        b_next <= b_in;
        n_next <= std_logic_vector(to_unsigned(width, width));
        p_next <= (others => '0');
      when "01" =>
        a_next <= a_reg;
        b_next <= b_reg;
        n_next <= n_reg;
        p_next <= std_logic_vector(unsigned(p_reg) + unsigned(a_reg));
      when "10" =>
        a_next <= a_reg(2*width-2 downto 0) & '0';
        b_next <= '0' & b_reg(width-1 downto 1);
        n_next <= std_logic_vector(unsigned(n_reg) - to_unsigned(1, width));
        p_next <= p_reg;
      when "11" =>
        a_next <= (others => '0');
        b_next <= (others => '0');
        n_next <= (others => '0');
        p_next <= (others => '0');
      when others => null;
    end case;
  end process mux;

  b_0 <= b_next(0);

  count_0 <= '1'
    when n_next = std_logic_vector(to_unsigned(0, width))
  else '0';

  r_out <= p_reg;

end Behavioral;
