library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pc_tb is
end pc_tb;

architecture tb of pc_tb is

    component pc is
        port (
            D      : in  std_logic_vector(31 downto 0);
            Preset : in  std_logic;
            Clk    : in  std_logic;
            O      : out std_logic_vector(31 downto 0)
        );
    end component;

    signal D      : std_logic_vector(31 downto 0);
    signal Preset : std_logic;
    signal Clk    : std_logic := '0';
    signal O      : std_logic_vector(31 downto 0);

begin

    dut: pc
        port map (
            D      => D,
            Preset => Preset,
            Clk    => Clk,
            O      => O
        );

    stim: process
    begin
        Preset <= '1';
        D <= x"00000010";
        Clk <= '0'; wait for 10 ns;
        Clk <= '1'; wait for 10 ns;

        Preset <= '0';

        D <= x"00000020";
        Clk <= '0'; wait for 10 ns;
        Clk <= '1'; wait for 10 ns;

        D <= x"00000030";
        Clk <= '0'; wait for 10 ns;
        Clk <= '1'; wait for 10 ns;

        wait;
    end process;

end tb;
