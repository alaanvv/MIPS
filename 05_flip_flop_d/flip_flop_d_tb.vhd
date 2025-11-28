library IEEE;
use IEEE.std_logic_1164.all;

entity flip_flop_d_tb is
end flip_flop_d_tb;

architecture sim of flip_flop_d_tb is

    component flip_flop_d is
        port(
            D      : in  std_logic;
            Enable : in  std_logic;
            Preset : in  std_logic;
            Clear  : in  std_logic;
            Clk    : in  std_logic;
            O      : out std_logic
        );
    end component;

    signal D, Enable, Preset, Clear, Clk, O : std_logic := '0';

begin

    UUT: flip_flop_d
        port map(
            D      => D,
            Enable => Enable,
            Preset => Preset,
            Clear  => Clear,
            Clk    => Clk,
            O      => O
        );

    stim: process
    begin
        -- clk manual
        Clk <= '0'; wait for 10 ns;
        Clk <= '1'; wait for 10 ns;

        Enable <= '1'; D <= '1';
        Clk <= '0'; wait for 10 ns;
        Clk <= '1'; wait for 10 ns;

        D <= '0';
        Clk <= '0'; wait for 10 ns;
        Clk <= '1'; wait for 10 ns;

        Preset <= '1';
        wait for 10 ns;
        Preset <= '0';

        Clear <= '1';
        wait for 10 ns;
        Clear <= '0';

        wait;
    end process;

end sim;
