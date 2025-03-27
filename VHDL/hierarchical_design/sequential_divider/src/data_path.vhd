----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 03/27/2025 11:57:00 AM
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
    WIDTH : integer := 8
  );
  port (
    clk : in std_logic;
    rst : in std_logic;

    a_in : in std_logic_vector(WIDTH-1 downto 0);
    b_in : in std_logic_vector(WIDTH-1 downto 0);

    sel : in std_logic_vector(1 downto 0);

    n_n : out std_logic_vector(WIDTH-1 downto 0);

    quotient : out std_logic_vector(WIDTH-1 downto 0);
    remainder : out std_logic_vector(WIDTH-1 downto 0)
  );
end data_path;

architecture Behavioral of data_path is

  component compare_and_subtract
    generic (
      WIDTH : integer := WIDTH
    );
    port (
      b_r : in std_logic_vector(WIDTH-1 downto 0);
      r_r : in std_logic_vector(WIDTH-1 downto 0);

      q_bit : out std_logic;
      r_temp : out std_logic_vector(WIDTH-1 downto 0)
    );
  end component compare_and_subtract;

  signal a_n : std_logic_vector(WIDTH-1 downto 0);
  signal a_r : std_logic_vector(WIDTH-1 downto 0);

  signal b_n : std_logic_vector(WIDTH-1 downto 0);
  signal b_r : std_logic_vector(WIDTH-1 downto 0);

  signal n_n_s : std_logic_vector(WIDTH-1 downto 0);
  signal n_r : std_logic_vector(WIDTH-1 downto 0);

  signal r_n    : std_logic_vector(WIDTH-1 downto 0);
  signal r_r    : std_logic_vector(WIDTH-1 downto 0);
  signal r_temp : std_logic_vector(WIDTH-1 downto 0);

  signal q_bit : std_logic;

  signal sh_l_0 : std_logic_vector(WIDTH-1 downto 0);
  signal sh_l_1 : std_logic_vector(WIDTH-1 downto 0);

  signal dec : std_logic_vector(WIDTH-1 downto 0);
begin

  compare_and_subtract_0 : compare_and_subtract
    generic map (
      WIDTH => WIDTH
    )
    port map (
      b_r => b_r,
      r_r => r_r,

      q_bit => q_bit,
      r_temp => r_temp
    );

    reg: process(clk) is
    begin
      if rising_edge(clk) then
        if rst = '1' then
          a_r <= (others => '0');
          b_r <= (others => '0');
          n_r <= (others => '0');
          r_r <= (others => '0');
        else
          a_r <= a_n;
          b_r <= b_n;
          n_r <= n_n_s;
          r_r <= r_n;
        end if;
      end if;
    end process reg;

  sh_l_0 <= a_r(WIDTH-2 downto 0) & q_bit;
  sh_l_1 <= r_temp(WIDTH-2 downto 0) & a_r(WIDTH-1);

  dec <= std_logic_vector(unsigned(n_r) - to_unsigned(1, WIDTH));

 
  -- First way to implement multiplexers is by using competitive signal assignment.
  -- This method is generally more efficient and can be faster to simulate as it directly
  -- evaluates the conditions for each signal assignment in a concise manner.
  --
  a_n <= a_in when sel = "00" else
         sh_l_0 when sel = "01" or sel = "10" else
         a_r;

  b_n <= b_in when sel = "00" else b_r;

  n_n_s <= std_logic_vector(to_unsigned(WIDTH+1, WIDTH)) when sel = "00" else
           dec when sel = "01" else
           n_r;

  r_n <= (others => '0') when sel = "00" else
         sh_l_1 when sel = "01" else
         r_temp when sel = "10" else
         r_r;

  -- Second way to implement multiplexers is by using a process with a case statement.
  -- This is the classical method of implementing multiplexers, where the signal assignments
  -- are based on the value of the selection signal (`sel`). This method can be less efficient
  -- for simulation, as it involves checking each possible case in a process, making it potentially
  -- slower compared to the competitive assignment approach.
  --
  -- mux : process(sel, a_in, b_in, a_r, b_r, n_r, r_temp, r_r, sh_l_0, sh_l_1, dec) is
  -- begin
  --   case sel is
  --     when "00" =>
  --       a_n <= a_in;
  --       b_n <= b_in;
  --       n_n_s <= std_logic_vector(to_unsigned(width+1, width));
  --       r_n <= (others => '0');
  --     when "01" =>
  --       a_n <= sh_l_0;
  --       b_n <= b_r;
  --       n_n_s <= dec;
  --       r_n <= sh_l_1;
  --     when "10" =>
  --       a_n <= sh_l_0;
  --       b_n <= b_r;
  --       n_n_s <= n_r;
  --       r_n <= r_temp;
  --     when "11" =>
  --       a_n <= a_r;
  --       b_n <= b_r;
  --       n_n_s <= n_r;
  --       r_n <= r_r;
  --     when others => null;
  --   end case;
  -- end process mux;

  n_n <= n_n_s;

  quotient  <= a_r;
  remainder <= r_r;

end Behavioral;
