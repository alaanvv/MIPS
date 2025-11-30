library IEEE;
use IEEE.std_logic_1164.all;

--

entity mux_2x32 is
  port ( A:   in  std_logic_vector(31 downto 0);
         B:   in  std_logic_vector(31 downto 0);
         Sel: in  std_logic;
         S:   out std_logic_vector(31 downto 0) );
end mux_2x32;

---

architecture ar of mux_2x32 is

component mux_2 is
    port ( I:   in  std_logic_vector(0 to 1);
           Sel: in  std_logic;
           S:   out std_logic );
end component;

begin

gen: for k in 0 to 31 generate

mux_2_n: mux_2 port map ( I(0) => A(k),
                          I(1) => B(k),
                          Sel  => Sel,
                          S    => S(k) );

end generate gen;

end architecture ar;
