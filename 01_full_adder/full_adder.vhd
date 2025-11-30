library IEEE;
use IEEE.std_logic_1164.all;

--

entity full_adder is port ( 
  A, B, Cin: in  std_logic;
  S, Cout:   out std_logic );
end full_adder;

--

architecture ar of full_adder is

component half_adder is port ( 
  A, B: in  std_logic; 
  S, C: out std_logic );
end component;

signal sS_half_adder_1: std_logic;
signal sC_half_adder_1: std_logic;
signal sC_half_adder_2: std_logic;

begin

half_adder_1: half_adder port map (
  A => A,
  B => B,
  S => sS_half_adder_1,
  C => sC_half_adder_1 );

half_adder_2: half_adder port map (
  A => sS_half_adder_1,
  B => Cin,
  S => S,
  C => sC_half_adder_2 );

Cout <= sC_half_adder_1 OR sC_half_adder_2;

end architecture ar;
