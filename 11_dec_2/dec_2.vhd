library IEEE;
use IEEE.std_logic_1164.all;

--

entity dec_2 is port ( Enable: in  std_logic;
                Cod:    in  std_logic_vector(0 to 1);
                S:      out std_logic_vector(0 to 3) );
end dec_2;

---

architecture ar of dec_2 is
begin

S(0) <= Enable AND NOT Cod(0) AND NOT Cod(1);
S(1) <= Enable AND     Cod(0) AND NOT Cod(1);
S(2) <= Enable AND NOT Cod(0) AND     Cod(1);
S(3) <= Enable AND     Cod(0) AND     Cod(1);

end architecture ar;
