library IEEE;
use IEEE.std_logic_1164.all;

--

entity sig_ext is
  port ( I: in  std_logic_vector(15 downto 0);
         O: out std_logic_vector(31 downto 0) );
end sig_ext;

---

architecture ar of sig_ext is
begin

O(15 downto 0) <= I;

gen: for k in 31 downto 16 generate

O(k) <= I(15);

end generate gen;

end architecture ar;
