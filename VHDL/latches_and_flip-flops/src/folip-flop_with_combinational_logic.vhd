library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity folip_flop_with_combinational_logic is
  Port (
    x1, x2 : in  STD_LOGIC;
    clk : in  STD_LOGIC;
    q1, q2 : out  STD_LOGIC
  );
end entity folip_flop_with_combinational_logic;

architecture Behavioral of folip_flop_with_combinational_logic is

   signal and1, and2, or1, q_in : std_logic := '0';

begin

  and1 <= x1 and (not q_in);
  and2 <= (not x2) and q_in;
  or1 <= and1 or and2;

  flip_flop : process(clk) is
  begin
    if (rising_edge(clk)) then
      q_in <= or1;
    end if;
  end process flip_flop;

  q1 <= q_in;
  q2 <= not q_in;

end Behavioral;
