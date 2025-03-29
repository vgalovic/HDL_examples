library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity mux8to1_tb is
--  Port ( );
end entity mux8to1_tb;

architecture Behavioral of mux8to1_tb is
  component mux8to1 is
    port (
        x0, x1, x2, x3, x4, x5, x6, x7 : in  STD_LOGIC;
        sel : in  STD_LOGIC_VECTOR(2 downto 0);
        y : out  STD_LOGIC
    );
  end component mux8to1;

  signal x0_s, x1_s, x2_s, x3_s, x4_s, x5_s, x6_s, x7_s: STD_LOGIC := '0';
  signal sel_s: STD_LOGIC_VECTOR(2 downto 0) := "000";
  signal y_s: STD_LOGIC;

begin
  duv: mux8to1
    port map(
      x0 => x0_s,
      x1 => x1_s,
      x2 => x2_s,
      x3 => x3_s,
      x4 => x4_s,
      x5 => x5_s,
      x6 => x6_s,
      x7 => x7_s,
      sel => sel_s,
      y => y_s
    );

  sim_proc: process is
  begin

    x0_s <= '0', '1' after 100 ns, '0' after 300 ns, '1' after 600 ns;
    x1_s <= '0', '1' after 200 ns, '0' after 400 ns, '1' after 800 ns;
    x2_s <= '0', '1' after 100 ns, '0' after 500 ns, '1' after 900 ns;
    x3_s <= '0', '1' after 300 ns, '0' after 600 ns, '1' after 800 ns;
    x4_s <= '0', '1' after 200 ns, '0' after 300 ns, '1' after 500 ns;
    x5_s <= '0', '1' after 400 ns, '0' after 600 ns, '1' after 800 ns;
    x6_s <= '0', '1' after 200 ns, '0' after 700 ns, '1' after 900 ns;
    x7_s <= '0', '1' after 300 ns, '0' after 500 ns, '1' after 800 ns;
    sel_s <= "000" after 100 ns, "001" after 200 ns, "010" after 300 ns, "011" after 400 ns,
             "100" after 500 ns, "101" after 600 ns, "110" after 700 ns, "111" after 800 ns;
    wait;

  end process sim_proc;

end Behavioral;
