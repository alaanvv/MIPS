library IEEE;
use IEEE.std_logic_1164.all;

--

entity flip_flop_d is port ( 
  D:      in  std_logic;
  Enable: in  std_logic; 
  Preset: in  std_logic; 
  Clear:  in  std_logic; 
  Clk:    in  std_logic; 
  O:      out std_logic;
  NotO:   out std_logic );
end flip_flop_d;

---

architecture ar of flip_flop_d is
begin

process(Preset, Clear, Clk)
begin

if Preset = '1' then
  O <= '1';
elsif Clear = '1' then
  O <= '0';
elsif falling_edge(Clk) AND Enable = '1' then
  O <= D;
end if;

end process;

NotO <= NOT O;

end architecture ar;
