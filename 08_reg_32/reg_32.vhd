library IEEE;
use IEEE.std_logic_1164.all;

--

entity reg_32 is port (
  D:      in  std_logic_vector(31 downto 0);
  Enable: in  std_logic; 
  Preset: in  std_logic; 
  Clear:  in  std_logic; 
  Clk:    in  std_logic; 
  O:      out std_logic_vector(31 downto 0) );
end reg_32;

---

architecture ar of reg_32 is

component flip_flop_d is port (
  D:      in  std_logic;
  Enable: in  std_logic; 
  Preset: in  std_logic; 
  Clear:  in  std_logic; 
  Clk:    in  std_logic; 
  O:      out std_logic;
  NotO:   out std_logic );
end component;

begin

gen: for i in 31 downto 0 generate 

flip_flop_d_n: flip_flop_d port map (
  D      => D(i),
  Enable => Enable,
  Preset => Preset,
  Clear  => Clear,
  Clk    => Clk,
  O      => O(i),
  NotO   => open );

end generate gen;

end architecture ar;
