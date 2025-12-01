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
            O      : out std_logic;
            NotO   : out std_logic
        );
    end component;

    signal D, Enable, Preset, Clear, Clk, O, NotO : std_logic := '0';

begin

    UUT: flip_flop_d
        port map(
            D      => D,
            Enable => Enable,
            Preset => Preset,
            Clear  => Clear,
            Clk    => Clk,
            O      => O,
            NotO   => NotO
        );

    stim: process
    begin
        Clk <= '0'; wait for 10 ns;
        Clk <= '1'; wait for 10 ns;

        Enable <= '1'; D <= '1';
        Clk <= '0'; wait for 10 ns;
        Clk <= '1'; wait for 10 ns;

        Enable <= '0'; D <= '0';
        Clk <= '0'; wait for 10 ns;
        Clk <= '1'; wait for 10 ns;

        wait for 10 ns;
        Clear <= '1';
        wait for 10 ns;
        wait;
    end process;

end sim;
