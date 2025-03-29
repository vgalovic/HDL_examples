library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity control_path is
  port (
    clk : in STD_LOGIC;

    count_0 : in STD_LOGIC;
    b_0     : in STD_LOGIC;

    start : in STD_LOGIC;
    reset : in STD_LOGIC;

    sel : out STD_LOGIC_VECTOR(1 downto 0);

    ready : out STD_LOGIC
  );
end entity control_path;

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
