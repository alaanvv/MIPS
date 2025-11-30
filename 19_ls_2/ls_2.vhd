library IEEE;
use IEEE.std_logic_1164.all;

--

entity ls_2 is port ( 
  I: in  std_logic_vector(31 downto 0);
  O: out std_logic_vector(31 downto 0) );
end ls_2;

---

architecture ar of ls_2 is
begin

O(31 downto 2) <= I(29 downto 0);
O(0) <= '0';
O(1) <= '0';

end architecture ar;
