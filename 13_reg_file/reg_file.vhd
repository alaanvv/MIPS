library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.tipo.all;

--

entity reg_file is port ( Clk:    in  std_logic;
                          Write:  in  std_logic;
                          AddrW:  in  std_logic_vector(4 downto 0);
                          DataW:  in  std_logic_vector(31 downto 0);
                          AddrR1: in  std_logic_vector(4 downto 0);
                          AddrR2: in  std_logic_vector(4 downto 0);
                          DataR1: out tipo_palavra;
                          DataR2: out tipo_palavra );
end reg_file;

---

architecture ar of reg_file is

component dec_5 is 
  port ( Enable: in  std_logic;
         Cod:    in  std_logic_vector(4 downto 0);
         S:      out std_logic_vector(0 to 31) );
end component;

component reg_32 is
  port ( D:      in  std_logic_vector(31 downto 0);
         Enable: in  std_logic; 
         Preset: in  std_logic; 
         Clear:  in  std_logic; 
         Clk:    in  std_logic; 
         O:      out std_logic_vector(31 downto 0) );
end component;

component mux_32x32 is 
  port ( I : in tipo_vetor_de_palavras(0 to 31);
         Sel : in std_logic_vector(4 downto 0);
         S : out tipo_palavra );
end component;

signal sOutRegisters: tipo_vetor_de_palavras(0 to 31);
signal sWriteEnable: std_logic_vector(0 to 31);

begin

address_decoder: dec_5 port map ( Enable => Write,
                                  Cod    => AddrW,
                                  S      => sWriteEnable );

---

reg_zero: reg_32 port map ( D      => x"00000000",
                            Enable => '0', 
                            Preset => '0', 
                            Clear  => '1', 
                            Clk    => '0', 
                            O      => sOutRegisters(0) );

register_layer: for k in 1 to 31 generate

reg_n: reg_32 port map ( D      => DataW,
                         Enable => sWriteEnable(k), 
                         Preset => '0', 
                         Clear  => '0', 
                         Clk    => Clk, 
                         O      => sOutRegisters(k) );

end generate register_layer;

---

datar1_mux: mux_32x32 port map ( I   => sOutRegisters,
                                 Sel => AddrR1,
                                 S   => DataR1 );

datar2_mux: mux_32x32 port map ( I   => sOutRegisters,
                                 Sel => AddrR2,
                                 S   => DataR2 );
end architecture ar;
