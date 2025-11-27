library ieee;
use ieee.std_logic_1164.all;

entity mux_2_tb is
end mux_2_tb;

architecture tb of mux_2_tb is
    signal E   : std_logic_vector(0 to 1) := (others => '0');
    signal Sel : std_logic := '0';
    signal S   : std_logic;
begin
    uut: entity work.mux_2
        port map (
            E   => E,
            Sel => Sel,
            S   => S
        );

    stim: process
    begin
        E <= "00"; Sel <= '0'; wait for 10 ns;
        E <= "00"; Sel <= '1'; wait for 10 ns;
        E <= "01"; Sel <= '0'; wait for 10 ns;
        E <= "01"; Sel <= '1'; wait for 10 ns;
        E <= "10"; Sel <= '0'; wait for 10 ns;
        E <= "10"; Sel <= '1'; wait for 10 ns;
        E <= "11"; Sel <= '0'; wait for 10 ns;
        E <= "11"; Sel <= '1'; wait for 10 ns;
        wait;
    end process;

end tb;
