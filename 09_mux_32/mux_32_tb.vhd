library IEEE;
use IEEE.std_logic_1164.all;

entity mux_32_tb is
end mux_32_tb;

architecture tb of mux_32_tb is
    component mux_32 is
        port (
            I:   in  std_logic_vector(0 to 31);
            Sel: in  std_logic_vector(4 downto 0);
            S:   out std_logic
        );
    end component;

    signal I   : std_logic_vector(0 to 31);
    signal Sel : std_logic_vector(4 downto 0);
    signal S   : std_logic;

begin

    dut: mux_32
        port map (
            I   => I,
            Sel => Sel,
            S   => S
        );

    stim: process
    begin
        I <= (others => '0');
        I(0) <= '1'; Sel <= "00000"; wait for 10 ns;
        I(5) <= '1'; Sel <= "00101"; wait for 10 ns;
        I(12) <= '1'; Sel <= "01100"; wait for 10 ns;
        I(31) <= '1'; Sel <= "11111"; wait for 10 ns;
                      Sel <= "11110"; wait for 10 ns;

        wait;
    end process;

end tb;
