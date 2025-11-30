library IEEE;
use IEEE.std_logic_1164.all;

entity mux_2x32_tb is
end mux_2x32_tb;

architecture tb of mux_2x32_tb is

  component mux_2x32 is
    port (
      A   : in  std_logic_vector(31 downto 0);
      B   : in  std_logic_vector(31 downto 0);
      Sel : in  std_logic;
      S   : out std_logic_vector(31 downto 0)
    );
  end component;

  signal A   : std_logic_vector(31 downto 0);
  signal B   : std_logic_vector(31 downto 0);
  signal Sel : std_logic;
  signal S   : std_logic_vector(31 downto 0);

begin

  dut: mux_2x32
    port map (
      A   => A,
      B   => B,
      Sel => Sel,
      S   => S
    );

  stim: process
  begin
    A <= x"AAAAAAAA";
    B <= x"55555555";

    Sel <= '0'; wait for 10 ns;
    Sel <= '1'; wait for 10 ns;

    wait;
  end process;

end tb;
