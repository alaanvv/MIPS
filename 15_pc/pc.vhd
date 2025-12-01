library IEEE;
use IEEE.std_logic_1164.all;

--

entity pc is port ( 
  D:      in  std_logic_vector(31 downto 0);
  Preset: in  std_logic; 
  Clk:    in  std_logic; 
  O:      out std_logic_vector(31 downto 0) );
end pc;

---

architecture ar of pc is

component flip_flop_d_rising is port ( 
  D:      in  std_logic;
  Enable: in  std_logic; 
  Preset: in  std_logic; 
  Clear:  in  std_logic; 
  Clk:    in  std_logic; 
  O:      out std_logic;
  NotO:   out std_logic );
end component;

signal sPresets: std_logic_vector(31 downto 0);
signal sClears:  std_logic_vector(31 downto 0);

begin

---

process(Preset)
begin

if Preset = '1' then
  sPresets <= "00000000010000000000000000000000";
  sClears  <= "11111111101111111111111111111111";
else
  sPresets <= "00000000000000000000000000000000";
  sClears  <= "00000000000000000000000000000000";
end if;

end process;

---

gen: for k in 31 downto 0 generate

flip_flop_d_rising_n: flip_flop_d_rising port map ( 
  D      => D(k),
  Enable => '1',
  Preset => sPresets(k), 
  Clear  => sClears(k), 
  Clk    => Clk, 
  O      => O(k),
  NotO   => open );

end generate gen;

end architecture ar;
