library IEEE;
use IEEE.std_logic_1164.all;

--

entity half_adder is port ( 
  A, B: in  std_logic; 
  S, C: out std_logic );
end half_adder;

--

architecture ar of half_adder is
begin

S <= A XOR B;
C <= A AND B;

end architecture ar;
