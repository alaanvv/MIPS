library IEEE;
use IEEE.std_logic_1164.all;

entity cu_tb is
end cu_tb;

architecture tb of cu_tb is

    component cu is
        port (
            Opcode   : in  std_logic_vector(0 to 5);
            ALUOp    : out std_logic_vector(1 downto 0);
            RegWrite : out std_logic;
            RegDst   : out std_logic;
            ALUSrc   : out std_logic;
            Branch   : out std_logic;
            MemWrite : out std_logic;
            MemToReg : out std_logic;
            Jump     : out std_logic;
            MemRead  : out std_logic
        );
    end component;

    signal Opcode   : std_logic_vector(0 to 5);
    signal ALUOp    : std_logic_vector(1 downto 0);
    signal RegWrite : std_logic;
    signal RegDst   : std_logic;
    signal ALUSrc   : std_logic;
    signal Branch   : std_logic;
    signal MemWrite : std_logic;
    signal MemToReg : std_logic;
    signal Jump     : std_logic;
    signal MemRead  : std_logic;

begin

    dut: cu
        port map (
            Opcode   => Opcode,
            ALUOp    => ALUOp,
            RegWrite => RegWrite,
            RegDst   => RegDst,
            ALUSrc   => ALUSrc,
            Branch   => Branch,
            MemWrite => MemWrite,
            MemToReg => MemToReg,
            Jump     => Jump,
            MemRead  => MemRead
        );

    stim: process
    begin
        Opcode <= "000000"; wait for 20 ns;
        Opcode <= "100011"; wait for 20 ns;
        Opcode <= "101011"; wait for 20 ns;
        Opcode <= "000100"; wait for 20 ns;
        Opcode <= "000010"; wait for 20 ns;
        wait;
    end process;

end tb;
