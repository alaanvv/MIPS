library ieee;
use ieee.std_logic_1164.all;

entity full_adder_tb is
end full_adder_tb;

architecture tb of full_adder_tb is
    signal A, B, Cin : std_logic := '0';
    signal S, Cout   : std_logic;
begin
    uut: entity work.full_adder
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            S    => S,
            Cout => Cout
        );

    stim: process
    begin
        A <= '0'; B <= '0'; Cin <= '0'; wait for 10 ns;
        A <= '0'; B <= '0'; Cin <= '1'; wait for 10 ns;
        A <= '0'; B <= '1'; Cin <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; Cin <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; Cin <= '0'; wait for 10 ns;
        A <= '1'; B <= '0'; Cin <= '1'; wait for 10 ns;
        A <= '1'; B <= '1'; Cin <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; Cin <= '1'; wait for 10 ns;
        wait;
    end process;

end tb;
