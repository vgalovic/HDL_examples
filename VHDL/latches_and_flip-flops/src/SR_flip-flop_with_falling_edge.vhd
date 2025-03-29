library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity SR_flip_flop_with_falling_edge is
  Port (S : in  STD_LOGIC;
        R : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        Q : out  STD_LOGIC;
        nQ : out  STD_LOGIC);
end entity SR_flip_flop_with_falling_edge;

architecture Behavioral of SR_flip_flop_with_falling_edge is

begin

  flip_flop: process(clk) is
    variable Q_internal : STD_LOGIC := '0';
  begin

    if falling_edge(clk) then
      if S = '0' and R = '0' then
        Q_internal := '1';
      elsif S = '1' and R = '0' then
        Q_internal := '1';
      elsif S = '0' and R = '1' then
        Q_internal := '0';
      else
        Q_internal := 'X';
      end if;
    end if;

    Q <= Q_internal;
    nQ <= not Q_internal;

  end process flip_flop;

end Behavioral;
