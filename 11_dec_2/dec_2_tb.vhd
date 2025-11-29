library IEEE;
use IEEE.std_logic_1164.all;

entity dec_2_tb is
end dec_2_tb;

architecture tb of dec_2_tb is
    component dec_2 is
        port (
            Enable : in  std_logic;
            Cod    : in  std_logic_vector(0 to 1);
            S      : out std_logic_vector(0 to 3)
        );
    end component;

    signal Enable : std_logic;
    signal Cod    : std_logic_vector(0 to 1);
    signal S      : std_logic_vector(0 to 3);

begin

    dut: dec_2
        port map (
            Enable => Enable,
            Cod    => Cod,
            S      => S
        );

    stim: process
    begin
        Enable <= '0'; Cod <= "00";
        wait for 10 ns;

        Enable <= '1'; Cod <= "00";
        wait for 10 ns;

        Cod <= "01";
        wait for 10 ns;

        Cod <= "10";
        wait for 10 ns;

        Cod <= "11";
        wait for 10 ns;

        wait;
    end process;

end tb;
