----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 11/30/2024 12:41:14 PM
-- Design Name: 
-- Module Name: full_adder - Behavioral
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

entity full_adder is
  Port (A, B, Cin : in  STD_LOGIC;
        S, Cout : out  STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is
  signal xor1, and1, and2: STD_LOGIC;

begin

    -- xor1 <= A xor B;
    xor1_entry: entity work.xor_cir
      port map (a => A,
                b => B,
                f => xor1);

    -- S <= xor1 xor Cin;
    S_entry: entity work.xor_cir
      port map (a => xor1,
                b => Cin,
                f => S);

    -- and1 <= A and B;
    and1_entry: entity work.and_cir
      port map (a => A,
                b => B,
                f => and1);

    -- and2 <= xor1 and Cin;
    and2_entry: entity work.and_cir
      port map (a => xor1,
                b => Cin,
                f => and2);

    Cout <= and1 or and2;
end Behavioral;

