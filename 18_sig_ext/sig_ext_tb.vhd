library IEEE;
use IEEE.std_logic_1164.all;

entity sig_ext_tb is
end sig_ext_tb;

architecture tb of sig_ext_tb is

  component sig_ext is
    port (
      I : in  std_logic_vector(15 downto 0);
      O : out std_logic_vector(31 downto 0)
    );
  end component;

  signal I : std_logic_vector(15 downto 0);
  signal O : std_logic_vector(31 downto 0);

begin

  dut: sig_ext
    port map (
      I => I,
      O => O
    );

  stim: process
  begin
    I <= x"7FFF"; wait for 10 ns;
    I <= x"8000"; wait for 10 ns;
    I <= x"0001"; wait for 10 ns;
    I <= x"FFFF"; wait for 10 ns;

    wait;
  end process;

end tb;
