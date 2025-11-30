library IEEE;
use IEEE.std_logic_1164.all;

--

entity alu_cu is
  port ( Funct:   in  std_logic_vector(5 downto 0);
         ALUOp:   in  std_logic_vector(1 downto 0);
         AInvert: out std_logic;
         BInvert: out std_logic;
         Op:      out std_logic_vector(1 downto 0) );
end alu_cu;

---

architecture ar of alu_cu is
begin

process(ALUOp, Funct)
begin

if    ALUOp = "00" then
  AInvert <= '0';
  BInvert <= '0';
  Op      <= "10";
elsif ALUOp = "01" then
  AInvert <= '0';
  BInvert <= '1';
elsif ALUOp = "10" then
  if    Funct = "100000" then
    AInvert <= '0';
    BInvert <= '0';
    Op      <= "10";
  elsif Funct = "100100" then
    AInvert <= '0';
    BInvert <= '0';
    Op      <= "00";
  elsif Funct = "100111" then
    AInvert <= '1';
    BInvert <= '1';
    Op      <= "00";
  elsif Funct = "100101" then
    AInvert <= '0';
    BInvert <= '0';
    Op      <= "01";
  elsif Funct = "101010" then
    AInvert <= '0';
    BInvert <= '1';
    Op      <= "11";
  elsif Funct = "100010" then
    AInvert <= '0';
    BInvert <= '1';
    Op      <= "10";
  end if;
end if;

end process;

end architecture ar;
