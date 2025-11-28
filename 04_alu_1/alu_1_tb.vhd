library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_1_tb is
end alu_1_tb;

architecture sim of alu_1_tb is

    component alu_1 is
        port(
            I      : in  std_logic_vector(0 to 1);
            Invert : in  std_logic_vector(0 to 1);
            Op     : in  std_logic_vector(0 to 1);
            Cin    : in  std_logic;
            Less   : in  std_logic;
            Set    : out std_logic;
            cout   : out std_logic;
            S      : out std_logic
        );
    end component;

    signal I      : std_logic_vector(0 to 1);
    signal Invert : std_logic_vector(0 to 1);
    signal Op     : std_logic_vector(0 to 1);
    signal Cin    : std_logic;
    signal Less   : std_logic;
    signal Set    : std_logic;
    signal cout   : std_logic;
    signal S      : std_logic;

begin

    UUT: alu_1 port map(
        I      => I,
        Invert => Invert,
        Op     => Op,
        Cin    => Cin,
        Less   => Less,
        Set    => Set,
        cout   => cout,
        S      => S
    );

    stim: process
    begin
        I      <= "11";
        Invert <= "01";
        Cin    <= '0';
        Less   <= '0';

        Op <= "00"; wait for 20 ns; -- AND
        Op <= "01"; wait for 20 ns; -- OR
        Op <= "10"; wait for 20 ns; -- SOMA
        Op <= "11"; wait for 20 ns; -- LESS

        I      <= "01"; wait for 20 ns;
        I      <= "10"; wait for 20 ns;
        I      <= "11"; wait for 20 ns;

        Invert <= "10"; Cin <= '1'; Op <= "10"; wait for 20 ns; -- SUB

        Less <= '1'; Op <= "11"; wait for 20 ns;

        wait;
    end process;

end sim;
