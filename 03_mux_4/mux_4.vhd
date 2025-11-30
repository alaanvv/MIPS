library IEEE;
use IEEE.std_logic_1164.all;

--

entity mux_4 is port ( 
  I:   in  std_logic_vector(0 to 3);
  Sel: in  std_logic_vector(1 downto 0);
  S:   out std_logic );
end mux_4;

---

architecture ar of mux_4 is

component mux_2 is port ( 
  I:   in  std_logic_vector(0 to 1);
  Sel: in  std_logic;
  S:   out std_logic );
end component;

signal sSmux_2_1: std_logic;
signal sSmux_2_2: std_logic;

begin

mux_2_1: mux_2 port map (
  I(0 to 1) => I(0 to 1),
  Sel => Sel(0),
  S => sSmux_2_1 );

mux_2_2: mux_2 port map (
  I(0 to 1) => I(2 to 3),
  Sel => Sel(0),
  S => sSmux_2_2 );

S <= (sSmux_2_1 AND NOT Sel(1)) OR (sSmux_2_2 AND Sel(1));

end architecture ar;
