----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 01/05/2025 02:26:54 PM
-- Design Name: 
-- Module Name: FSM_corresponding_sequence - Behavioral
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
-- The state diagram of the corresponding sequence:
--
--
--                     ┌───────┐   w=1    ┌───────┐
--                     │  S00  │─────────>│  S01  │
--                     │       │          │       │
--                     │  z=1  │<─────────│  z=0  │
--                     └───────┘   w=0    └───────┘
--                       │   ∧              ∧   │
--                       │   │              │   │
--                   w=1 │   │ w=0      w=0 │   │  w=1
--                       │   │              │   │
--                       ∨   │              │   ∨
--                     ┌───────┐   w=1    ┌───────┐
--                     │  S10  │─────────>│  S11  │
--                     │       │          │       │
--                     │  z=0  │<─────────│  z=1  │
--                     └───────┘   w=0    └───────┘
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

entity FSM_corresponding_sequence is
    Port (
        clk : in STD_LOGIC;
        w : in STD_LOGIC;
        z : out STD_LOGIC
    );

end FSM_corresponding_sequence;

architecture Behavioral of FSM_corresponding_sequence is
   type state_type is (S00, S01, S10, S11);
    signal current_state, next_state : state_type;

begin
    state : process(clk)
    begin
        if rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process state;

    fsm_process : process(current_state, w)
    begin
        next_state <= current_state;
        z <= '0';

        case current_state is
            when S00 =>
                z <= '1';
                if w = '0' then
                    next_state <= S00;
                else
                    next_state <= S01;
                end if;

            when S01 =>
                z <= '0';
                if w = '0' then
                    next_state <= S10;
                else
                    next_state <= S11;
                end if;

            when S10 =>
                z <= '0';
                if w = '0' then
                    next_state <= S00;
                else
                    next_state <= S01;
                end if;

            when S11 =>
                z <= '1';
                if w = '0' then
                    next_state <= S10;
                else
                    next_state <= S11;
                end if;

            when others =>
                next_state <= S00;
                z <= '0';
        end case;
    end process;
end Behavioral;
