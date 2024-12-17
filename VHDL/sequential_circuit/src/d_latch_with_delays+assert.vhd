----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/05/2024 10:35:04 AM
-- Design Name: 
-- Module Name: d_latch_with_delays_plus_assert - Behavioral
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

entity d_latch_with_delays_plus_assert is
    port (
        D    : in  std_logic;    -- D input
        load : in  std_logic;    -- load input
        Q    : out std_logic;    -- Q output
        nQ   : out std_logic     -- nQ output (inverted Q)
    );
end d_latch_with_delays_plus_assert;

architecture Behavioral of d_latch_with_delays_plus_assert is
    constant tsu : time := 2 ns;  -- Setup time
    constant th  : time := 1.5 ns;  -- Hold time
    constant tq  : time := 3 ns;  -- Propagation delay

    signal event_time : time := 0 ns;
    signal last_D : std_logic := '0';
    signal last_load : std_logic := '0';
    signal Q_internal : std_logic := '0';   -- Internal Q signal
begin

    latch_with_delay: process (D, last_D, load, last_load, event_time)
        variable setup_violation : boolean := false;
        variable hold_violation  : boolean := false;
    begin
        -- Detect change in D
        if D /= last_D then
            event_time <= now;
            last_D <= D;
        end if;

        if load /= last_load then
            last_load <= load;
        end if;

        -- Check Setup time when load is '1'
        if (load = '1') then
            -- report "Setup check: now(" & time'image(now) & ") - event_time(" & time'image(event_time) & ") < tsu(" & time'image(tsu) & ")";

            if (D /= last_D and now - event_time < tsu) then
                setup_violation := true;
                Q_internal <= 'X';  -- Invalid state
            else
                Q_internal <= D after tq;  -- Propagate D to Q after delay
            end if;

        elsif (load = '0' and load /= last_load) then
            -- report "Hold check: now(" & time'image(now) & ") - event_time(" & time'image(event_time) & ") < th(" & time'image(th) & ")";

            if(now - event_time < th) then
                hold_violation := true;
                Q_internal <= 'X';  -- Invalid state
            end if;
        end if;

        assert not setup_violation
             report "Setup violation detected at time " & time'image(now)
             severity error;

        assert not hold_violation
            report "Hold violation detected at time " & time'image(now)
            severity error;

        setup_violation := false;
        hold_violation := false;
    end process;

    -- Outputs
    Q <= Q_internal;
    nQ <= not Q_internal;

end Behavioral;

