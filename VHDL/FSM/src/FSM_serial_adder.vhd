----------------------------------------------------------------------------------
-- State diagram for serial adder:
--
--                                  a=1 and b=1 /
--                                      S<=0
--              reset=1 ────┐  ┌───────────────────┐
--                          ∨  │                   ∨
--     a=0 and b=0/s<=0    ┌────────┐         ┌────────┐      a=0 and b=1/s<=0
--            or        ┌──│        │         │        │────┐        or
--     a=0 and b=1/s<=1 │  │  NCI   │         │   CI   │    │ a=1 and b=0/s<=0
--            or        └─>│        │         │        │<───┘        or
--     a=1 and b=0/s<=1    └────────┘         └────────┘      a=1 and b=1/s<=1
--                             ∧                   │
--                             └───────────────────┘
--                                  a=0 and b=0 /
--                                      s<=1
--
----------------------------------------------------------------------------------

library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity FSM_serial_adder is
  Port (
      clk : in std_logic;
      reset : in std_logic;
      a : in std_logic;
      b : in std_logic;
      s : out std_logic
  );

end FSM_serial_adder;

architecture Behavioral of FSM_serial_adder is
  type state_type is (NCI, CI);
  signal current_state : state_type := NCI;
  signal next_state : state_type;

  signal s_s : std_logic := '0';

begin
  state : process(clk) is
  begin
    if rising_edge(clk) then
      if reset = '1' then
        current_state <= NCI;
      else
        current_state <= next_state;
      end if;
    end if;
  end process state;

  fsm : process(a, b, current_state) is
  begin
    next_state <= current_state;

    case current_state is
      when NCI =>
        s_s <= a xor b;
        if a = '1' and b = '1' then
          next_state <= CI;
        else
          next_state <= NCI;
        end if;

      when CI =>
        s_s <= a xor b xor '1';
        if a = '0' and b = '0' then
          next_state <= NCI;
        else
          next_state <= CI;
        end if;

      when others =>
        s_s <= '0';
        next_state <= NCI;
    end case;
  end process fsm;

  s <= s_s;

end Behavioral;
