library ieee;
use ieee.std_logic_1164.all;

entity half_adder_tb is
end half_adder_tb;

architecture tb of half_adder_tb is
    signal A, B : std_logic := '0';
    signal S, C : std_logic;
begin
    uut: entity work.half_adder
        port map (
            A => A,
            B => B,
            S => S,
            C => C
        );

    stim: process
    begin
        A <= '0'; B <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; wait for 10 ns;
        wait;
    end process;

end tb;
