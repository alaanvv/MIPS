library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.tipo.all;

entity mux32x32 is
  port (
         E : in tipo_vetor_de_palavras(0 to 31);
         Sel : in std_logic_vector(4 downto 0);
         Saida : out tipo_palavra
       );
end mux32x32;

architecture arq of mux32x32 is
  component mux_32 is
    port (
           I : in std_logic_vector(0 to 31);
           Sel : in std_logic_vector(4 downto 0);
           S : out std_logic
         );
  end component;

  signal matriz_invertida : tipo_matriz_transposta(31 downto 0);
begin

  gen_bits: for bit_idx in 31 downto 0 generate
    gen_cols: for word_idx in 0 to 31 generate
      matriz_invertida(bit_idx)(word_idx) <= E(word_idx)(bit_idx);
    end generate gen_cols;

    mux_bit: mux_32
      port map(
        I   => matriz_invertida(bit_idx),
        Sel => Sel,
        S   => Saida(bit_idx)
      );
  end generate gen_bits;

end arq;
