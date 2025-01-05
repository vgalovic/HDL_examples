----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 01/03/2025 08:53:02 PM
-- Design Name: 
-- Module Name: FSM_from_state_diagram - Behavioral
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
-- The finite state machine is specified using the following state diagram:
--
--                               ┌────────┐
--                               │        │
--             ┌───────────────> │  "00"  │ <───────────────┐
--             │                 │        │                 │
--             │                 └────────┘                 │
--             │                      │                     │
--             │                      │   - /               │
--             │                      │ Y <= 0              │
--             │                      │                     │
--             │                      ∨                     │
--        - /  │                 ┌────────┐                 │   - /
--      Y <= 0 │         C = 0 / │        │ C = 1 /         │ Y <= 0
--             │          Y <= 0 │  "01"  │ Y = 1           │
--             │         ┌───────│        │───────┐         │
--             │         │       └────────┘       │         │
--             │         │                        │         │
--             │         ∨                        ∨         │
--             │    ┌────────┐                ┌────────┐    │
--             │    │        │                │        │    │
--             └────│  "10"  │                │  "11"  │────┘
--                  │        │                │        │
--                  └────────┘                └────────┘
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

entity FSM_from_state_diagram is
    Port (
        clk : in STD_LOGIC;
        C : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end FSM_from_state_diagram;

architecture Behavioral of FSM_from_state_diagram is
    signal current_state : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal next_state : STD_LOGIC_VECTOR(1 downto 0);
    signal y_s : STD_LOGIC := '0';

begin
    state: process(clk)
    begin
        if rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    fsm: process(current_state)
    begin
        next_state <= current_state;
        y_s <= '0';

        case current_state is
            when "00" =>
                    next_state <= "01";
            when "01" =>
                if C = '0' then
                    next_state <= "10";
                    y_s <= '0';
                else
                    next_state <= "11";
                    y_s <= '1';
                end if;
            when "10" =>
                    next_state <= "00";
                    y_s <= '0';
            when "11" =>
                    next_state <= "00";
                    y_s <= '0';
            when others => null;
        end case;
    end process;

    Y <= y_s;

end Behavioral;
