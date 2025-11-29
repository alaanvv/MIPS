library IEEE;
use IEEE.std_logic_1164.all;

--

entity alu_32 is
  port ( Invert: in  std_logic_vector(0 to 1);
         Op:     in  std_logic_vector(1 downto 0);
         A:      in  std_logic_vector(31 downto 0);
         B:      in  std_logic_vector(31 downto 0);
         S:      out std_logic_vector(31 downto 0);
         Zero:   out std_logic );
end alu_32;

---

architecture ar of alu_32 is

component alu_1 is
    port ( I:      in  std_logic_vector(0 to 1);
           Invert: in  std_logic_vector(0 to 1);
           Op:     in  std_logic_vector(1 downto 0);
           Cin:    in  std_logic;
           Less:   in  std_logic;
           Set:    out std_logic;
           Cout:   out std_logic;
           S:      out std_logic );
end component;

component or_32 is
  port ( Input: in  std_logic_vector(0 to 31);
         O:     out std_logic );
end component;

signal sSetAlu1Last: std_logic;
signal sCouts: std_logic_vector(0 to 31);
signal sSetsTrash: std_logic_vector(0 to 30);
signal sResults: std_logic_vector(31 downto 0);
signal sOOr32: std_logic;

begin

alu_1_first: alu_1 port map ( I(0)      => A(0),
                              I(1)      => B(0),
                              Invert(0) => Invert(0),
                              Invert(1) => Invert(1),
                              Op(0)     => Op(0),
                              Op(1)     => Op(1),
                              Cin       => Invert(1),
                              Less      => sSetAlu1Last,
                              Set       => sSetsTrash(0),
                              Cout      => sCouts(0),
                              S         => sResults(0) );

gen: for i in 1 to 30 generate

alu_1_n: alu_1 port map ( I(0)      => A(i),
                          I(1)      => B(i),
                          Invert(0) => Invert(0),
                          Invert(1) => Invert(1),
                          Op(0)     => Op(0),
                          Op(1)     => Op(1),
                          Cin       => sCouts(i - 1),
                          Less      => '0',
                          Set       => sSetsTrash(i),
                          Cout      => sCouts(i),
                          S         => sResults(i) );

end generate gen;

alu_1_last: alu_1 port map ( I(0)      => A(31),
                             I(1)      => B(31),
                             Invert(0) => Invert(0),
                             Invert(1) => Invert(1),
                             Op(0)     => Op(0),
                             Op(1)     => Op(1),
                             Cin       => sCouts(30),
                             Less      => '0',
                             Set       => sSetAlu1Last,
                             Cout      => sCouts(31),
                             S         => sResults(31) );

or_32_less: or_32 port map ( Input => sResults,
                             O     => sOOr32 );

S    <= sResults;
Zero <= NOT sOOr32;

end architecture ar;
