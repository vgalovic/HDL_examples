library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity comparator_8bit_tb is
--  Port ( );
end  entity comparator_8bit_tb;

architecture Behavioral of comparator_8bit_tb is
  component comparator_8bit is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           neq : out  STD_LOGIC;
           gt : out  STD_LOGIC;
           lt : out  STD_LOGIC);
    end component comparator_8bit;

  signal a_s : STD_LOGIC_VECTOR (7 downto 0);
  signal b_s : STD_LOGIC_VECTOR (7 downto 0);
  signal neq_s : STD_LOGIC;
  signal gt_s : STD_LOGIC;
  signal lt_s : STD_LOGIC;

begin
  duv : comparator_8bit
	Port map (
    a => a_s,
    b => b_s,
    neq => neq_s,
    gt => gt_s,
    lt => lt_s
	);

  sim_gen : process is
	begin
    a_s <= std_logic_vector(to_unsigned(0, 8)), std_logic_vector(to_unsigned(3, 8)) after 200 ns, std_logic_vector(to_unsigned(10, 8)) after 400 ns;
    b_s <= std_logic_vector(to_unsigned(0, 8)), std_logic_vector(to_unsigned(5, 8)) after 200 ns, std_logic_vector(to_unsigned(4, 8)) after 400 ns;

    wait;
	end process sim_gen;

end Behavioral;
