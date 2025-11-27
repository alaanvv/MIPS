library IEEE;
use IEEE.std_logic_1164.all;

--

entity mux_2 is
    port ( E:   in  std_logic_vector(0 to 1);
           Sel: in  std_logic;
           S:   out std_logic );
end mux_2;

---

architecture ar of mux_2 is
begin

S <= (E(0) AND NOT Sel) OR (E(1) AND Sel);

end architecture ar;
