library IEEE;
use IEEE.std_logic_1164.all;

entity reg_32_tb is
end reg_32_tb;

architecture tb of reg_32_tb is
    component reg_32 is
        port (
            D:      in  std_logic_vector(31 downto 0);
            Enable: in  std_logic;
            Preset: in  std_logic;
            Clear:  in  std_logic;
            Clk:    in  std_logic;
            O:      out std_logic_vector(31 downto 0)
        );
    end component;

    signal D      : std_logic_vector(31 downto 0);
    signal Enable : std_logic;
    signal Preset : std_logic;
    signal Clear  : std_logic;
    signal Clk    : std_logic := '0';
    signal O      : std_logic_vector(31 downto 0);

begin

    dut: reg_32 port map (
        D      => D,
        Enable => Enable,
        Preset => Preset,
        Clear  => Clear,
        Clk    => Clk,
        O      => O
    );

    stim: process
    begin
        D <= x"AAAAAAAA"; Enable <= '1'; Preset <= '0'; Clear <= '0';
        Clk <= '0'; wait for 5 ns;
        Clk <= '1'; wait for 5 ns;

        D <= x"12345678";
        Clk <= '0'; wait for 5 ns;
        Clk <= '1'; wait for 5 ns;

        Enable <= '0';
        D <= x"FFFFFFFF";
        Clk <= '0'; wait for 5 ns;
        Clk <= '1'; wait for 5 ns;

        Clear <= '1';
        Clk <= '0'; wait for 5 ns;
        Clk <= '1'; wait for 5 ns;
        Clear <= '0';

        Preset <= '1';
        Clk <= '0'; wait for 5 ns;
        Clk <= '1'; wait for 5 ns;
        Preset <= '0';

        wait;
    end process;

end tb;
