library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity JK_flip_flop_with_rising_edge is
  Port (J : in  STD_LOGIC;
        K : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        Q : out  STD_LOGIC;
        nQ : out  STD_LOGIC);
end entity JK_flip_flop_with_rising_edge;

architecture Behavioral of JK_flip_flop_with_rising_edge is

begin

  flip_flop : process(clk) is
    variable Q_internal : STD_LOGIC := '0';
  begin

    if rising_edge(clk) then
      if J = '0' and K = '0' then
        Q_internal := Q_internal;
      elsif J = '1' and K = '1' then
        Q_internal := not Q_internal;
      elsif J = '1' and K = '0' then
        Q_internal := '1';
      else
        Q_internal := '0';
      end if;
    end if;

    Q <= Q_internal;
    nQ <= not Q_internal;

  end process flip_flop;

end Behavioral;
