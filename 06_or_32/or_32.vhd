library IEEE;
use IEEE.std_logic_1164.all;

--

entity or_32 is
  port ( Input: in  std_logic_vector(0 to 31);
         O:     out std_logic );
end or_32;

---

architecture ar of or_32 is

signal sOLayer1: std_logic_vector(0 to 7);
signal sOLayer2: std_logic_vector(0 to 1);

begin

layer_1: for i in 0 to 7 generate
  sOLayer1(i) <= Input(i * 4 + 0) OR Input(i * 4 + 1) OR Input(i * 4 + 2) OR Input(i * 4 + 3);
end generate layer_1;

layer_2: for i in 0 to 1 generate
  sOLayer2(i) <= sOLayer1(i * 4 + 0) OR sOLayer1(i * 4 + 1) OR sOLayer1(i * 4 + 2) OR sOLayer1(i * 4 + 3);
end generate layer_2;

O <= sOLayer2(0) OR sOLayer2(1);

end architecture ar;
