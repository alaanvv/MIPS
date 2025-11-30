library ieee;
use ieee.std_logic_1164.all;

entity mux_4_tb is
end mux_4_tb;

architecture tb of mux_4_tb is
    signal I   : std_logic_vector(0 to 3) := (others => '0');
    signal Sel : std_logic_vector(1 downto 0) := "00";
    signal S   : std_logic;
begin
    uut: entity work.mux_4
        port map (
            I   => I,
            Sel => Sel,
            S   => S
        );

    stim: process
    begin
        I <= "0000"; Sel <= "00"; wait for 10 ns;
        I <= "1000"; Sel <= "00"; wait for 10 ns;
        I <= "0010"; Sel <= "01"; wait for 10 ns;
        I <= "0100"; Sel <= "10"; wait for 10 ns;
        I <= "0001"; Sel <= "11"; wait for 10 ns;
        wait;
    end process;

end tb;
