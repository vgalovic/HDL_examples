----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 03/27/2025 12:19:15 PM
-- Design Name: 
-- Module Name: control_path - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_path is
  generic (
    WIDTH : integer := 8
  );
  port (
    clk : in std_logic;
    rst : in std_logic;

    start : in std_logic;

    n_n : in std_logic_vector(WIDTH-1 downto 0);

    last : out std_logic;
    ready : out std_logic;

    sel : out std_logic_vector(1 downto 0)
  );
end control_path;

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
