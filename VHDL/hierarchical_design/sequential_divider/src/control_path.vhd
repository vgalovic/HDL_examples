library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity control_path is
  generic (
    WIDTH : integer := 8
  );
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;

    start : in STD_LOGIC;

    n_n : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);

    last : out STD_LOGIC;
    ready : out STD_LOGIC;

    sel : out STD_LOGIC_VECTOR(1 downto 0)
  );
end entity control_path;

architecture Behavioral of control_path is

  type state_type is (idle, op, final, done);
  signal state_next, state_reg : state_type;

begin

  reg : process(clk, rst) is
  begin
    if rising_edge(clk) then
      if rst = '1' then
        state_reg <= idle;
      else
       state_reg <= state_next;
     end if;
   end if;
 end process reg;

 mux : process(state_reg, start, n_n) is
 begin
   state_next <= state_reg;

   last  <= '0';
   ready <= '0';

   sel <= "00";

   case state_reg is
     when idle =>
       ready <= '1';
       sel <= "00";
       if start = '1' then
         state_next <= op;
       end if;
     when op =>
       sel <= "01";
      if unsigned(n_n) <= 1 then
         state_next <= final;
      end if;
     when final =>
       sel <= "10";
       state_next <= done;
     when done =>
       sel <= "11";
       last <= '1';
       state_next <= idle;
     when others => null;
   end case;
 end process mux;

end Behavioral;
