library IEEE;
use IEEE.std_logic_1164.all;

--

entity cu is
  port ( Opcode:   in  std_logic_vector(0 to 5);
         ALUOp:    out std_logic_vector(1 downto 0);
         RegWrite: out std_logic;
         RegDst:   out std_logic;
         ALUSrc:   out std_logic;
         Branch:   out std_logic;
         MemWrite: out std_logic;
         MemToReg: out std_logic;
         Jump:     out std_logic;
         MemRead:  out std_logic );
end cu;

---

architecture ar of cu is
begin

process(Opcode)
begin

if    Opcode = "000000" then
  ALUOp    <= "10";
  RegWrite <= '1';
  RegDst   <= '1';
  ALUSrc   <= '0';
  Branch   <= '0';
  MemWrite <= '0';
  MemToReg <= '0';
  Jump     <= '0';
  MemRead  <= '0';
elsif Opcode = "001000" then
  ALUOp    <= "00";
  RegWrite <= '1';
  RegDst   <= '0';
  ALUSrc   <= '1';
  Branch   <= '0';
  MemWrite <= '0';
  MemToReg <= '0';
  Jump     <= '0';
  MemRead  <= '0';
elsif Opcode = "100011" then
  ALUOp    <= "00";
  RegWrite <= '1';
  RegDst   <= '0';
  ALUSrc   <= '1';
  Branch   <= '0';
  MemWrite <= '0';
  MemToReg <= '1';
  Jump     <= '0';
  MemRead  <= '1';
elsif Opcode = "101011" then
  ALUOp    <= "00";
  RegWrite <= '0';
  ALUSrc   <= '1';
  Branch   <= '0';
  MemWrite <= '1';
  Jump     <= '0';
  MemRead  <= '0';
elsif Opcode = "000100" then
  ALUOp    <= "01";
  RegWrite <= '0';
  ALUSrc   <= '0';
  Branch   <= '1';
  MemWrite <= '0';
  Jump     <= '0';
  MemRead  <= '0';
elsif Opcode = "000010" then
  RegWrite <= '0';
  Branch   <= '0';
  MemWrite <= '0';
  Jump     <= '1';
  MemRead  <= '0';
end if;

end process;

end architecture ar;
