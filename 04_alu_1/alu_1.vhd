library IEEE;
use IEEE.std_logic_1164.all;

--

entity alu_1 is port ( 
  I:      in  std_logic_vector(0 to 1);
  Invert: in  std_logic_vector(0 to 1);
  Op:     in  std_logic_vector(1 downto 0);
  Cin:    in  std_logic;
  Less:   in  std_logic;
  Set:    out std_logic;
  cout:   out std_logic;
  S:      out std_logic );
end alu_1;

---

architecture ar of alu_1 is

component half_adder is port ( 
  A, B: in  std_logic; 
  S, C: out std_logic );
end component;

component full_adder is port ( 
  A, B, Cin: in  std_logic;
  S, Cout:   out std_logic );
end component;


component mux_2 is port ( 
  I:   in  std_logic_vector(0 to 1);
  Sel: in  std_logic;
  S:   out std_logic );
end component;

component mux_4 is port ( 
  I:   in  std_logic_vector(0 to 3);
  Sel: in  std_logic_vector(1 downto 0);
  S:   out std_logic );
end component;

signal sInvertedI:  std_logic_vector(0 to 1);
signal sFinalI:     std_logic_vector(0 to 1);
signal sSFullAdder: std_logic;

begin

sInvertedI(0) <= NOT I(0);
sInvertedI(1) <= NOT I(1);

mux_2_1: mux_2 port map (
  I(0) => I(0),
  I(1) => sInvertedI(0),
  Sel  => Invert(0),
  S    => sFinalI(0) );

mux_2_2: mux_2 port map (
  I(0) => I(1),
  I(1) => sInvertedI(1),
  Sel  => Invert(1),
  S    => sFinalI(1) );

full_adder_1: full_adder port map (
  A    => sFinalI(0),
  B    => sFinalI(1),
  Cin  => Cin,
  Cout => Cout,
  S   => sSFullAdder );

mux_4_1: mux_4 port map (
  I(0)   => sFinalI(0) AND sFinalI(1),
  I(1)   => sFinalI(0)  OR sFinalI(1),
  I(2)   => sSFullAdder,
  I(3)   => Less,
  Sel(0) => Op(0),
  Sel(1) => Op(1),
  S      => S );

Set <= sSFullAdder;

end architecture ar;
