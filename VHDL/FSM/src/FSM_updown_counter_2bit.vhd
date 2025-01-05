----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 01/04/2025 05:55:11 PM
-- Design Name: 
-- Module Name: FSM_updown_counter_2bit - Behavioral
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
-- State diagram for up/down counter with 2 bit state:
--
--                     ┌────────┐   d=0   ┌────────┐
--                     │        │<────────│        │
--                     │  "01"  │         │  "00"  │
--                     │        │────────>│        │
--                     └────────┘   d=1   └────────┘
--                       │    ∧             │    ∧
--                       │    │             │    │
--                   d=0 │    │d=1      d=1 │    │d=0
--                       │    │             │    │
--                       ∨    │             ∨    │
--                     ┌────────┐   d=1   ┌────────┐
--                     │        │<────────│        │
--                     │  "10"  │         │  "11"  │
--                     │        │────────>│        │
--                     └────────┘   d=0   └────────┘
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

entity FSM_updown_counter_2bit is
    Port (
        clk : in std_logic;
        d : in std_logic;
        q : out std_logic_vector(1 downto 0)
    );
end FSM_updown_counter_2bit;

architecture Behavioral of FSM_updown_counter_2bit is
    signal curent_state : unsigned(1 downto 0) := "00";
    signal next_state : unsigned(1 downto 0);
begin
    -- cnt : process(clk)
    -- begin
    --     if rising_edge(clk) then
    --         if d = '0' then
    --             curent_state <= curent_state + 1;
    --         else
    --             curent_state <= curent_state - 1;
    --         end if;
    --     end if;
    -- end process cnt;
    --

    state : process(clk)
    begin
        if rising_edge(clk) then
            curent_state <= next_state;
        end if;
    end process state;

    fsm : process(curent_state)
    begin
        next_state <= curent_state;

        if d = '0' then
            case curent_state is
                when "00" =>
                    next_state <= "01";
                when "01" =>
                    next_state <= "10";
                when "10" =>
                    next_state <= "11";
                when others =>
                    next_state <= "00";
            end case;
        else
            case curent_state is
                when "11" =>
                    next_state <= "10";
                when "10" =>
                    next_state <= "01";
                when "01" =>
                    next_state <= "00";
                when others =>
                    next_state <= "11";
            end case;
        end if;
    end process fsm;

    q <= std_logic_vector(curent_state);

end Behavioral;
