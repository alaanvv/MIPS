library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.tipo.all;

entity reg_file_tb is
end reg_file_tb;

architecture tb of reg_file_tb is

    component reg_file is
        port (
            Clk    : in  std_logic;
            Write  : in  std_logic;
            AddrW  : in  std_logic_vector(4 downto 0);
            DataW  : in  std_logic_vector(31 downto 0);
            AddrR1 : in  std_logic_vector(4 downto 0);
            AddrR2 : in  std_logic_vector(4 downto 0);
            DataR1 : out std_logic_vector(31 downto 0);
            DataR2 : out std_logic_vector(31 downto 0)
        );
    end component;

    signal Clk    : std_logic := '0';
    signal Write  : std_logic;
    signal AddrW  : std_logic_vector(4 downto 0);
    signal DataW  : std_logic_vector(31 downto 0);
    signal AddrR1 : std_logic_vector(4 downto 0);
    signal AddrR2 : std_logic_vector(4 downto 0);
signal DataR1 : tipo_palavra;
signal DataR2 : tipo_palavra;

begin

    dut: reg_file
        port map (
            Clk    => Clk,
            Write  => Write,
            AddrW  => AddrW,
            DataW  => DataW,
            AddrR1 => AddrR1,
            AddrR2 => AddrR2,
            DataR1 => DataR1,
            DataR2 => DataR2
        );

    stim: process
    begin
        Write <= '1';

        for i in 0 to 31 loop
            AddrW <= std_logic_vector(to_unsigned(i, 5));
            DataW <= std_logic_vector(to_unsigned(i, 32));
            Clk <= '1'; wait for 10 ns;
            Clk <= '0'; wait for 10 ns;
        end loop;

        Write <= '0';

        for i in 0 to 31 loop
            AddrR1 <= std_logic_vector(to_unsigned(i, 5));
            AddrR2 <= std_logic_vector(to_unsigned(i, 5));
            Clk <= '1'; wait for 10 ns;
            Clk <= '0'; wait for 10 ns;
        end loop;

        wait;
    end process;

end tb;
