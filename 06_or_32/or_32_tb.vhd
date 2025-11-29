library IEEE;
use IEEE.std_logic_1164.all;

entity or_32_tb is
end or_32_tb;

architecture sim of or_32_tb is

    component or_32 is
        port (
            Input : in  std_logic_vector(0 to 31);
            O  : out std_logic
        );
    end component;

    signal Input  : std_logic_vector(0 to 31) := (others => '0');
    signal O   : std_logic;

begin

    UUT: or_32
        port map(
            Input => Input,
            O  => O
        );

    stim: process
    begin
        Input <= (others => '0'); wait for 20 ns;
        Input(5) <= '1'; wait for 20 ns;
        Input(17) <= '1'; wait for 20 ns;
        Input <= (others => '1'); wait for 20 ns;

        wait;
    end process;

end sim;
