library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ls_2_tb is
end ls_2_tb;

architecture tb of ls_2_tb is

    component ls_2 is
        port (
            I : in  std_logic_vector(31 downto 0);
            O : out std_logic_vector(31 downto 0)
        );
    end component;

    signal I : std_logic_vector(31 downto 0);
    signal O : std_logic_vector(31 downto 0);

begin

    dut: ls_2 port map (
        I => I,
        O => O
    );

    stim: process
    begin
        I <= x"00000001"; wait for 10 ns;
        I <= x"00000010"; wait for 10 ns;
        I <= x"0000FFFF"; wait for 10 ns;
        I <= x"F0000000"; wait for 10 ns;
        I <= x"AAAAAAAA"; wait for 10 ns;
        wait;
    end process;

end tb;
