----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vladimir Galović
-- 
-- Create Date: 12/05/2024 10:36:00 AM
-- Design Name: 
-- Module Name: d_latch_with_delays_plus_assert_tb - Behavioral
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

entity d_latch_with_delays_plus_assert_tb is
--  Port ( );
end d_latch_with_delays_plus_assert_tb;

architecture Behavioral of d_latch_with_delays_plus_assert_tb is
    -- Component instantiation for d_latch
    component d_latch_with_delays_plus_assert is
        port (
            D    : in  std_logic;
            load : in  std_logic;
            Q    : out std_logic;
            nQ   : out std_logic
        );
    end component;

    -- Signals for D latch
    signal D_s     : std_logic := '0';
    signal load_s  : std_logic := '0';
    signal Q_s    : std_logic;
    signal nQ_s    : std_logic;

begin
    -- Instantiate the D latch
    duv: d_latch_with_delays_plus_assert
        port map (
            D => D_s,
            load => load_s,
            Q => Q_s,
            nQ => nQ_s
        );


    -- Stimulus process
    sim_gen : process
    begin
        -- Start of the simulation
        report "Start of simulation" severity note;

        -- Initialize signals
        D_s <= '0';  -- Set D_s to '0' initially
        load_s <= '0';  -- Set load_s to '0' initially (load disabled)
        wait for 20 ns;  -- Wait for 20 ns to ensure stability of initial signals

        -- TEST: when load is disabled
        report "Test load disabled" severity note;
        D_s <= '1';  -- Set D_s to '1'
        wait for 6 ns;  -- Wait for 6 ns for signal propagation
        assert Q_s = '0'  -- Assert that Q_s does not change when load is '0'
            report "Q should not change when load is '0'" severity error;
        wait for 14 ns;  -- Wait for 14 ns before the next test

        -- TEST: when load is enabled
        report "Test load enabled" severity note;
        load_s <= '1';  -- Set load_s to '1' (load enabled)
        wait for 6 ns;  -- Wait for 6 ns for signal propagation
        assert Q_s = '1'  -- Assert that Q_s follows D_s when load is '1'
            report "Q should follow D when load is '1'" severity error;
        wait for 14 ns;  -- Wait for 14 ns before the next test

        -- TEST: setup time violation
        report "Test setup time violation" severity note;
        load_s <= '1';  -- Ensure load is enabled
        wait for 1 ns;  -- Wait for 1 ns to ensure load_s is stable

        -- Needed step because D'event does not trigger properly and gives 0 ps as event_time
        D_s <= '0';  -- Set D_s to '0'
        wait for 1 fs;  -- Wait for 1 femtosecond (very short time) to simulate the setup violation
        D_s <= '1';  -- Change D_s to '1'
        wait for 1 fs;  -- Wait for another femtosecond

        D_s <= '0';  -- Set D_s to '0' again
        wait for 1 ns;  -- Wait for 1 ns to stabilize the signal
        assert Q_s = 'X'  -- Assert that Q_s should be 'X' due to a setup time violation
            report "Setup violation expected 'X'" severity error;
        wait for 19 ns;  -- Wait for 19 ns before the next test

        -- TEST: hold time violation
        report "Test hold time violation" severity note;
        D_s <= '1';  -- Set D_s to '1'
        wait for 1 fs;  -- Wait for a very short time to simulate a change
        load_s <= '0';  -- Set load_s to '0' (disable load)
        wait for 1 ns;  -- Wait for 1 ns to simulate hold time violation
        assert Q_s = 'X'  -- Assert that Q_s should be 'X' due to a hold time violation
            report "Hold violation expected 'X'" severity error;
        wait for 19 ns;  -- Wait for 19 ns before the next test

        -- TEST: normal operation
        report "Test normal operation" severity note;
        load_s <= '1';  -- Set load_s to '1' (enable load)
        wait for 2 ns;  -- Wait for 2 ns for signal propagation
        D_s <= '1';  -- Set D_s to '1'
        wait for 4 ns;  -- Wait for 4 ns to stabilize the signal
        assert Q_s = '1'  -- Assert that Q_s follows D_s when setup and hold are valid
            report "Q should follow D when setup and hold are valid" severity error;
        wait for 14 ns;  -- Wait for 14 ns before the end of the simulation

        -- End of the simulation
        report "End of simulation" severity note;
        wait;  -- Wait forever to terminate the process
    end process;
end Behavioral;

