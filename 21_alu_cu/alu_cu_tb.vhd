library IEEE;
use IEEE.std_logic_1164.all;

entity alu_cu_tb is
end alu_cu_tb;

architecture tb of alu_cu_tb is

    component alu_cu is
        port (
            Funct   : in  std_logic_vector(5 downto 0);
            ALUOp   : in  std_logic_vector(1 downto 0);
            AInvert : out std_logic;
            BInvert : out std_logic;
            Op      : out std_logic_vector(1 downto 0)
        );
    end component;

    signal Funct   : std_logic_vector(5 downto 0);
    signal ALUOp   : std_logic_vector(1 downto 0);
    signal AInvert : std_logic;
    signal BInvert : std_logic;
    signal Op      : std_logic_vector(1 downto 0);

begin

    dut: alu_cu
        port map (
            Funct   => Funct,
            ALUOp   => ALUOp,
            AInvert => AInvert,
            BInvert => BInvert,
            Op      => Op
        );

    stim: process
    begin
        ALUOp <= "00"; Funct <= "000000"; wait for 20 ns;
        ALUOp <= "01"; Funct <= "000000"; wait for 20 ns;
        ALUOp <= "10"; Funct <= "100000"; wait for 20 ns;
        ALUOp <= "10"; Funct <= "100010"; wait for 20 ns;
        ALUOp <= "10"; Funct <= "100100"; wait for 20 ns;
        ALUOp <= "10"; Funct <= "100101"; wait for 20 ns;
        ALUOp <= "10"; Funct <= "101010"; wait for 20 ns;

        wait;
    end process;

end tb;
