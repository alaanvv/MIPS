library IEEE;
use IEEE.std_logic_1164.all;

entity mux_2x5_tb is
end mux_2x5_tb;

architecture tb of mux_2x5_tb is

  component mux_2x5 is
    port (
      A   : in  std_logic_vector(4 downto 0);
      B   : in  std_logic_vector(4 downto 0);
      Sel : in  std_logic;
      S   : out std_logic_vector(4 downto 0)
    );
  end component;

  signal A   : std_logic_vector(4 downto 0);
  signal B   : std_logic_vector(4 downto 0);
  signal Sel : std_logic;
  signal S   : std_logic_vector(4 downto 0);

begin

  dut: mux_2x5
    port map (
      A   => A,
      B   => B,
      Sel => Sel,
      S   => S
    );

  stim: process
  begin
    A <= "11111";
    B <= "10101";

    Sel <= '0'; wait for 10 ns;
    Sel <= '1'; wait for 10 ns;

    wait;
  end process;

end tb;
