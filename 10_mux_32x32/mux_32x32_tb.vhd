library IEEE;
use IEEE.std_logic_1164.all;
use work.tipo.all;
use IEEE.numeric_std.all;

entity mux_32x32_tb is
end mux_32x32_tb;

architecture tb of mux_32x32_tb is
    component mux_32x32 is
        port (
            I     : in  tipo_vetor_de_palavras(0 to 31);
            Sel   : in  std_logic_vector(4 downto 0);
            S : out tipo_palavra
        );
    end component;

    signal I     : tipo_vetor_de_palavras(0 to 31);
    signal Sel   : std_logic_vector(4 downto 0);
    signal S : tipo_palavra;

begin

    dut: mux_32x32
        port map (
            I     => I,
            Sel   => Sel,
            S => S
        );

    stim: process
    begin
        for i in 0 to 31 loop
            I(i) <= std_logic_vector(to_unsigned(i, 32));
        end loop;

        Sel <= "00000"; wait for 10 ns;
        Sel <= "00101"; wait for 10 ns;
        Sel <= "01010"; wait for 10 ns;
        Sel <= "11111"; wait for 10 ns;

        wait;
    end process;

end tb;
