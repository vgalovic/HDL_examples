library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity majorety_voter_tb is
--  Port ( );
end  entity majorety_voter_tb;

architecture Behavioral of majorety_voter_tb is
  component majorety_voter is
    port ( X, Y, Z : in  STD_LOGIC;
           V : out  STD_LOGIC);
  end component majorety_voter;

  signal X_s, Y_s, Z_s: STD_LOGIC := '0';
  signal V_s : STD_LOGIC;

begin

  duv: majorety_voter
    port map(
      X => X_s,
      Y => Y_s,
      Z => Z_s,
      V => V_s
    );

  sim_gen: process is
  begin
    X_s <= '0', '1' after 100 ns, '0' after 300 ns, '1' after 500 ns;
    Y_s <= '0', '1' after 200 ns, '0' after 400 ns, '1' after 600 ns;
    Z_s <= '0', '1' after 300 ns, '0' after 500 ns, '1' after 700 ns;

    wait;
 end process;

end Behavioral;
