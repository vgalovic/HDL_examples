----------------------------------------------------------------------------------
-- VHDL model of the Finite State Machine (FSM)
-- defined by the state transition and output table below:
--
--     +----------+-----------------------------------+
--     |          |         Next state/output         |
--     |          +-----------------------------------+
--     |  Current |          Inputs:(x, y)            |
--     |  Status  +--------+--------+--------+--------+
--     |          | (0, 0) | (0, 1) | (1, 0) | (1, 1) |
--     +----------+--------+--------+--------+--------+
--     |    S1    | S3 / 0 | S3 / 0 | S2 / 1 | S2 / 1 |
--     |    S2    | S1 / 0 | S1 / 0 | S1 / 0 | S1 / 0 |
--     |    S3    | S4 / 1 | S4 / 1 | S4 / 1 | S4 / 1 |
--     |    S4    | S1 / 0 | S2 / 0 | S1 / 0 | S2 / 0 |
--     +----------+--------+--------+--------+--------+
--
----------------------------------------------------------------------------------

library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity FSM_from_table is
  Port (
      clk : in STD_LOGIC;
      x : in STD_LOGIC;
      y : in STD_LOGIC;
      o : out STD_LOGIC
  );
end entity FSM_from_table;

architecture Behavioral of FSM_from_table is
    type state_type is (S1, S2, S3, S4);
    signal current_state : state_type := S1;
    signal next_state : state_type;
    signal output_s : STD_LOGIC := '0';
begin
  state: process(clk) is
    begin
      if rising_edge(clk) then
          current_state <= next_state;
      end if;
  end process state;

  fsm: process(x, y) is
  begin
    next_state <= current_state;
    output_s <= '0';

    case current_state is
      when S1 =>
        if x = '0' and y = '0' then
            next_state <= S3;
            output_s <= '0';
        elsif x = '0' and y = '1' then
            next_state <= S3;
            output_s <= '0';
        elsif x = '1' and y = '0' then
            next_state <= S2;
            output_s <= '1';
        elsif x = '1' and y = '1' then
            next_state <= S2;
            output_s <= '1';
        end if;
      when S2 =>
        if x = '0' and y = '0' then
            next_state <= S1;
            output_s <= '0';
        elsif x = '0' and y = '1' then
            next_state <= S1;
            output_s <= '0';
        elsif x = '1' and y = '0' then
            next_state <= S1;
            output_s <= '0';
        elsif x = '1' and y = '1' then
            next_state <= S1;
            output_s <= '0';
        end if;
      when S3 =>
        if x = '0' and y = '0' then
            next_state <= S4;
            output_s <= '1';
        elsif x = '0' and y = '1' then
            next_state <= S4;
            output_s <= '1';
        elsif x = '1' and y = '0' then
            next_state <= S4;
            output_s <= '1';
        elsif x = '1' and y = '1' then
            next_state <= S4;
            output_s <= '1';
        end if;
      when S4 =>
        if x = '0' and y = '0' then
            next_state <= S1;
            output_s <= '0';
        elsif x = '0' and y = '1' then
            next_state <= S2;
            output_s <= '0';
        elsif x = '1' and y = '0' then
            next_state <= S1;
            output_s <= '0';
        elsif x = '1' and y = '1' then
            next_state <= S2;
            output_s <= '0';
        end if;
  end case;
  end process fsm;

  o <= output_s;

end Behavioral;

