----------------------------------------------------------------------------------
-- Company:
-- Engineer: Vladimir Galović
--
-- Create Date: 03/25/2025 11:10:13 AM
-- Design Name:
-- Module Name: dec_counter - Behavioral
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

entity dec_counter is
  port (
    clk   : in    std_logic;
    reset : in    std_logic;
    en    : in    std_logic;

    q     : out   std_logic_vector(3 downto 0);
    pulse : out   std_logic
  );
end entity dec_counter;

architecture behavioral of dec_counter is

  signal count_s : unsigned(3 downto 0);
  signal pulse_s : std_logic;

begin

 cnt : process (clk, reset) is
  begin
    if rising_edge(clk) then
      -- Reset counter and pulse when reset is asserted
      if reset = '1' then
        count_s <= (others => '0');
        pulse_s <= '0';
      elsif en = '1' then

        -- Send pulse one tick before counter reaches 9
        if count_s = 8 then
          pulse_s <= '1';
        else
          pulse_s <= '0';
        end if;

        -- Renset counter whent it reaches 9, otherwise increment
        if count_s = 9 then
          count_s <= (others => '0');
        else
          count_s <= count_s + 1;
        end if;
      end if;
    end if;
  end process cnt;

  q <= std_logic_vector(count_s);
  pulse <= pulse_s;

end architecture behavioral;
