library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

entity bin_encoder4to2_with_logic_gates_tb is
--  Port ( );
end entity bin_encoder4to2_with_logic_gates_tb;

architecture Behavioral of bin_encoder4to2_with_logic_gates_tb is
  component bin_encoder4to2_with_logic_gates is
	  Port (
		  x : in  STD_LOGIC_VECTOR (3 downto 0);
		  y : out  STD_LOGIC_VECTOR (1 downto 0));
	end component;

	signal x_s : STD_LOGIC_VECTOR (3 downto 0);
	signal y_s : STD_LOGIC_VECTOR (1 downto 0);
begin

  duv: bin_encoder4to2_with_logic_gates
    port map (
        x => x_s,
        y => y_s
    );

  sim_gen: process is
  begin
    x_s <= "0001", "0010" after 200 ns, "0100" after 400 ns, "1000" after 600 ns;
    wait;
  end process sim_gen;

end Behavioral;
