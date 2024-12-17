----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/01/2024 04:46:57 PM
-- Design Name: 
-- Module Name: barrel_shifter_4bit - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity barrel_shifter_4bit is
  Port (x : in STD_LOGIC_VECTOR(3 downto 0);
        s : in STD_LOGIC_VECTOR(1 downto 0);
        y : out STD_LOGIC_VECTOR(3 downto 0)
  );
end barrel_shifter_4bit;

architecture Behavioral of barrel_shifter_4bit is

begin
    -- process(x, s) is
    -- begin
    --     case s is 
    --         when "00" =>
    --             y(3) <= x(3);
    --             y(2) <= x(2);
    --             y(1) <= x(1);
    --             y(0) <= x(0);
    --         when "01" =>
    --             y(3) <= x(0);
    --             y(2) <= x(3);
    --             y(1) <= x(2);
    --             y(0) <= x(1);
    --         when "10" =>
    --             y(3) <= x(1);
    --             y(2) <= x(0);
    --             y(1) <= x(3);
    --             y(0) <= x(2);
    --         when "11" =>
    --             y(3) <= x(2);
    --             y(2) <= x(1);
    --             y(1) <= x(0);
    --             y(0) <= x(3);
    --         when others => null;
    --     end case;
    -- end process;

    mux4to1_0: entity work.mux4to1
    port map (
        x0 => x(3),
        x1 => x(0),
        x2 => x(1),
        x3 => x(2),
        sel => s,
        y => y(3)
    );

    mux4to1_1: entity work.mux4to1
    port map (
        x0 => x(2),
        x1 => x(3),
        x2 => x(0),
        x3 => x(1),
        sel => s,
        y => y(2)
    );

    mux4to1_2: entity work.mux4to1
    port map (
        x0 => x(1),
        x1 => x(2),
        x2 => x(3),
        x3 => x(0),
        sel => s,
        y => y(1)
    );

    mux4to1_3: entity work.mux4to1
    port map (
        x0 => x(0),
        x1 => x(1),
        x2 => x(2),
        x3 => x(3),
        sel => s,
        y => y(0)
    );


end Behavioral;
