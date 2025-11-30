library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_32_tb is
end alu_32_tb;

architecture sim of alu_32_tb is

    component alu_32 is
      port ( Invert: in  std_logic_vector(0 to 1);
             Op:     in  std_logic_vector(1 downto 0);
             A:      in  std_logic_vector(31 downto 0);
             B:      in  std_logic_vector(31 downto 0);
             S:      out std_logic_vector(31 downto 0);
             Zero:   out std_logic );
    end component;

    signal Invert : std_logic_vector(0 to 1);
    signal Op     : std_logic_vector(1 downto 0);
    signal A, B   : std_logic_vector(31 downto 0);
    signal S      : std_logic_vector(31 downto 0);
    signal Zero   : std_logic;

begin

    UUT: alu_32
        port map(
            Invert => Invert,
            Op     => Op,
            A      => A,
            B      => B,
            S      => S,
            Zero   => Zero
        );

    process
    begin
        Invert <= "01";

        A <= std_logic_vector(to_signed(10, 32));
        B <= std_logic_vector(to_signed(3, 32));

        Op <= "00"; wait for 20 ns;

        Op <= "01"; wait for 20 ns;

        Op <= "10"; wait for 20 ns;

        Op <= "11"; wait for 20 ns;

        A <= std_logic_vector(to_signed(0, 32));
        B <= std_logic_vector(to_signed(0, 32));
        Op <= "10"; wait for 20 ns;

        wait;
    end process;

end sim;
