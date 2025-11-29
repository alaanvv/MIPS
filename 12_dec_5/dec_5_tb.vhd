library IEEE;
use IEEE.std_logic_1164.all;

entity dec_5_tb is
end dec_5_tb;

architecture tb of dec_5_tb is
    component dec_5 is
        port (
            Enable : in  std_logic;
            Cod    : in  std_logic_vector(0 to 4);
            S      : out std_logic_vector(0 to 31)
        );
    end component;

    signal Enable : std_logic;
    signal Cod    : std_logic_vector(0 to 4);
    signal S      : std_logic_vector(0 to 31);

begin

    dut: dec_5
        port map (
            Enable => Enable,
            Cod    => Cod,
            S      => S
        );

    stim: process
    begin
        Enable <= '0'; Cod <= "00000";
        wait for 10 ns;

        Enable <= '1'; Cod <= "00000";
        wait for 10 ns;

        Cod <= "00001";
        wait for 10 ns;

        Cod <= "00100";
        wait for 10 ns;

        Cod <= "11111";
        wait for 10 ns;

        wait;
    end process;

end tb;
