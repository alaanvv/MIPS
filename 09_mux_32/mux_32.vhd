library IEEE;
use IEEE.std_logic_1164.all;

--

entity mux_32 is
    port ( I:   in  std_logic_vector(0 to 31);
           Sel: in  std_logic_vector(4 downto 0);
           S:   out std_logic );
end mux_32;

---

architecture ar of mux_32 is

component mux_2 is
    port ( I:   in  std_logic_vector(0 to 1);
           Sel: in  std_logic;
           S:   out std_logic );
end component;

component mux_4 is
    port ( I:   in  std_logic_vector(0 to 3);
           Sel: in  std_logic_vector(1 downto 0);
           S:   out std_logic );
end component;

signal sSlayer_1: std_logic_vector(0 to 7);
signal sSlayer_2: std_logic_vector(0 to 1);

begin

layer_1: for k in 0 to 7 generate

mux_4_n: mux_4 port map (
    I(0)   => I(k * 4 + 0),
    I(1)   => I(k * 4 + 1),
    I(2)   => I(k * 4 + 2),
    I(3)   => I(k * 4 + 3),
    Sel(0) => Sel(0),
    Sel(1) => Sel(1),
    S => sSlayer_1(k) );

end generate layer_1;

layer_2: for k in 0 to 1 generate

mux_4_n: mux_4 port map (
    I(0)   => sSlayer_1(k * 4 + 0),
    I(1)   => sSlayer_1(k * 4 + 1),
    I(2)   => sSlayer_1(k * 4 + 2),
    I(3)   => sSlayer_1(k * 4 + 3),
    Sel(0) => Sel(2),
    Sel(1) => Sel(3),
    S => sSlayer_2(k) );

end generate layer_2;

mux_2_1: mux_2 port map (
    I(0) => sSlayer_2(0),
    I(1) => sSlayer_2(1),
    Sel  => Sel(4),
    S    => S );

end architecture ar;
