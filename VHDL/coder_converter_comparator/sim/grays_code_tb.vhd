library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity grays_code_tb is
--  Port ( );
end entity grays_code_tb;

architecture Behavioral of grays_code_tb is
  component grays_code is
    Port ( b : in  STD_LOGIC_VECTOR (2 downto 0);
           g : out  STD_LOGIC_VECTOR (2 downto 0));
    end component grays_code;

    signal b_s : STD_LOGIC_VECTOR (2 downto 0);
    signal g_s : STD_LOGIC_VECTOR (2 downto 0);

begin
  duv : grays_code
    Port Map(
      b => b_s,
      g => g_s
    );

  sim_gen : process is
  begin
    for i in 0 to 7 loop
      b_s <= std_logic_vector(to_unsigned(i, 3));
      wait for 100 ns;
    end loop;

    wait;
  end process sim_gen;

end Behavioral;
