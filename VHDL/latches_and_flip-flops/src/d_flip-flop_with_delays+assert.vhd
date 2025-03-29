library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity d_flip_flop_with_delays_plus_assert is
  Port (
    D : in  STD_LOGIC;
    clk : in  STD_LOGIC;
    Q : out  STD_LOGIC
  );
end entity d_flip_flop_with_delays_plus_assert;

architecture Behavioral of d_flip_flop_with_delays_plus_assert is

  constant tsu : time := 2 ns;
  constant th : time := 1.5 ns;
  constant tcq : time := 3 ns;

  signal Q_internal : STD_LOGIC := '0';
  signal last_D : STD_LOGIC := '0';
  signal D_last_event : time := 0 ns;

begin
  flip_flop: process(clk, D, last_D, D_last_event, Q_internal) is
    variable setup_violation : boolean := false;
    variable hold_violation  : boolean := false;
  begin
    if D /= last_D then
      last_D <= D;
      D_last_event <= now;
    end if;

    if rising_edge(clk) then
      -- Check setup time violation
      if now - D_last_event < tsu then
        setup_violation := true;
        Q_internal <= 'X';
      else
        -- Propagate input to output after tcq delay
        Q_internal <= D after tcq;
      end if;
    end if;

    if D /= last_D and not rising_edge(clk) then
      if now - D_last_event > th then
        hold_violation := true;
        Q_internal <= 'X';
      end if;
    end if;

    assert not setup_violation
     report "Setup violation detected at time " & time'image(now)
     severity error;

    assert not hold_violation
      report "Hold violation detected at time " & time'image(now)
      severity error;

    setup_violation := false;
    hold_violation := false;

    Q <= Q_internal;
  end process flip_flop;

end Behavioral;

