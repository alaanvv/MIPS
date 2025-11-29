library IEEE;
use IEEE.std_logic_1164.all;

--

entity dec_5 is port ( Enable: in  std_logic;
                       Cod:    in  std_logic_vector(0 to 4);
                       S:      out std_logic_vector(0 to 31) );
end dec_5;

---

architecture ar of dec_5 is

component dec_2 is port ( Enable: in  std_logic;
                          Cod:    in  std_logic_vector(0 to 1);
                          S:      out std_logic_vector(0 to 3) );
end component;

signal sSLayer_1: std_logic_vector(0 to 1);
signal sSLayer_2: std_logic_vector(0 to 7);

begin

sSLayer_1(0) <= Enable AND NOT Cod(4);
sSLayer_1(1) <= Enable AND     Cod(4);

layer_2: for i in 0 to 1 generate

dec_2_layer_2: dec_2 port map ( Enable => sSlayer_1(i),
                                Cod(0) => Cod(2),
                                Cod(1) => Cod(3),
                                S(0)   => sSlayer_2(i * 4 + 0),
                                S(1)   => sSlayer_2(i * 4 + 1),
                                S(2)   => sSlayer_2(i * 4 + 2),
                                S(3)   => sSlayer_2(i * 4 + 3) );

end generate layer_2;

layer_3: for i in 0 to 7 generate

dec_2_layer_3: dec_2 port map ( Enable => sSlayer_2(i),
                                Cod(0) => Cod(0),
                                Cod(1) => Cod(1),
                                S(0)   => S(i * 4 + 0),
                                S(1)   => S(i * 4 + 1),
                                S(2)   => S(i * 4 + 2),
                                S(3)   => S(i * 4 + 3) );

end generate layer_3;

end architecture ar;
