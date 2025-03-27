----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 03/26/2025 08:09:32 PM
-- Design Name: 
-- Module Name: control_path - Behavioral
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

entity control_path is
  port (
    clk : in std_logic;

    count_0 : in std_logic;
    b_0     : in std_logic;

    start : in std_logic;
    reset : in std_logic;

    sel : out std_logic_vector(1 downto 0);

    ready : out std_logic
  );
end control_path;

architecture Behavioral of control_path is
  type fsm_states is (idle, shift, add);
  signal state_reg, state_next : fsm_states;

begin

  reg: process (clk) is
  begin
    if rising_edge(clk) then
      if reset = '1' then
        state_reg <= idle;
      else
        state_reg <= state_next;
      end if;
    end if;
  end process reg;

  fsm: process (state_reg, start, count_0, b_0) is
  begin
    state_next <= state_reg;

    sel   <= "00";
    ready <= '0';

    case state_reg is
      when idle =>
        sel   <= "00";
        ready <= '1';

        if (start = '1') then
          if (b_0 = '1') then
            state_next <= add;
          else
            state_next <= shift;
          end if;
        end if;
      when add =>
        sel <= "01";

        state_next <= shift;
      when shift =>
        sel <= "10";

        if (count_0 = '0') then
          if (b_0 = '1') then
            state_next <= add;
          end if;
        else
          state_next <= idle;
        end if;
      when others => null;
    end case;
  end process fsm;

end Behavioral;
