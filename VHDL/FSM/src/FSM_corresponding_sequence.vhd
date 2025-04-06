----------------------------------------------------------------------------------
-- The state diagram of the corresponding sequence:
--
--                    w=0                w=1
--                  ┌────┐             ┌────┐
--                  │    ∨             ∨    │
--                ┌───────┐          ┌───────┐
--                │  S00  │          │  S11  │<───┐
--                │       │<───┐     │       │    │
--                │  z=1  │    │     │  z=1  │    │
--                └───────┘    │     └───────┘    │
--                   │         │          │       │
--                   │         │          │       │
--               w=1 │         │ w=0      │ w=0   │ w=1
--                   │         └───────┐  │       │
--                   ∨                 │  ∨       │
--                ┌───────┐   w=0    ┌───────┐    │
--                │  S01  │─────────>│  S10  │    │
--                │       │          │       │    │
--                │  z=0  │<─────────│  z=0  │    │
--                └───────┘   w=1    └───────┘    │
--                   │                            │
--                   └────────────────────────────┘
--
----------------------------------------------------------------------------------

library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity FSM_corresponding_sequence is
    Port (
        clk : in STD_LOGIC;
        w : in STD_LOGIC;
        z : out STD_LOGIC
    );

end entity FSM_corresponding_sequence;

architecture Behavioral of FSM_corresponding_sequence is
   type state_type is (S00, S01, S10, S11);
    signal current_state, next_state : state_type;

begin
  state : process(clk) is
    begin
      if rising_edge(clk) then
          current_state <= next_state;
      end if;
  end process state;

  fsm_process : process(current_state, w) is
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

      when others => null;
    end case;
  end process fsm_process;
end Behavioral;
