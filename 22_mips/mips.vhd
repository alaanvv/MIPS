library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.tipo.all;

--

entity mips is
  port ( Clk:           in  std_logic;
         Inicializar:   in  std_logic;
         DebugEndereco: in  std_logic_vector(31 downto 0);
         DebugPalavra:  out std_logic_vector(31 downto 0) );
end mips;

---

architecture ar of mips is

component alu_32 is
  port ( Invert: in  std_logic_vector(0 to 1);
         Op:     in  std_logic_vector(1 downto 0);
         A:      in  std_logic_vector(31 downto 0);
         B:      in  std_logic_vector(31 downto 0);
         S:      out std_logic_vector(31 downto 0);
         Zero:   out std_logic );
end component;

component reg_file is port ( Clk:    in  std_logic;
                             Write:  in  std_logic;
                             AddrW:  in  std_logic_vector(4 downto 0);
                             DataW:  in  std_logic_vector(31 downto 0);
                             AddrR1: in  std_logic_vector(4 downto 0);
                             AddrR2: in  std_logic_vector(4 downto 0);
                             DataR1: out tipo_palavra;
                             DataR2: out tipo_palavra );
end component;

component pc is
  port ( D:      in  std_logic_vector(31 downto 0);
         Preset: in  std_logic; 
         Clk:    in  std_logic; 
         O:      out std_logic_vector(31 downto 0) );
end component;

component mux_2x32 is
  port ( A:   in  std_logic_vector(31 downto 0);
         B:   in  std_logic_vector(31 downto 0);
         Sel: in  std_logic;
         S:   out std_logic_vector(31 downto 0) );
end component;

component mux_2x5 is
  port ( A:   in  std_logic_vector(4 downto 0);
         B:   in  std_logic_vector(4 downto 0);
         Sel: in  std_logic;
         S:   out std_logic_vector(4 downto 0) );
end component;

component sig_ext is
  port ( I: in  std_logic_vector(15 downto 0);
         O: out std_logic_vector(31 downto 0) );
end component;

component ls_2 is
  port ( I: in  std_logic_vector(31 downto 0);
         O: out std_logic_vector(31 downto 0) );
end component;

component cu is
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
end component;

component alu_cu is
  port ( Funct:   in  std_logic_vector(5 downto 0);
         ALUOp:   in  std_logic_vector(1 downto 0);
         AInvert: out std_logic;
         BInvert: out std_logic;
         Op:      out std_logic_vector(1 downto 0) );
end component;

component memDados is
	port (
		DadoLido : out std_logic_vector (31 downto 0);
		DadoEscrita : in std_logic_vector (31 downto 0);
		Endereco : in std_logic_vector (31 downto 0);
		EscreverMem : in std_logic;
		Clock : in std_logic;
		LerMem : in std_logic;
		DebugEndereco : in std_logic_vector(31 downto 0);
		DebugPalavra : out std_logic_vector(31 downto 0));
end component;

component memInstrucoes is
	port (
		Endereco : in std_logic_vector(31 downto 0);
		Palavra : out std_logic_vector(31 downto 0)
	);
end component;

signal PCOut: std_logic_vector(31 downto 0); -- -- --
signal Instruction: std_logic_vector(31 downto 0); -- -- -- -- -- -- -- --
signal RegDst: std_logic; -- --
signal WriteReg: std_logic_vector(4 downto 0); -- --
signal WriteData: std_logic_vector(31 downto 0); -- --
signal RegWrite: std_logic; -- --
signal ReadData1: std_logic_vector(31 downto 0); -- --
signal ReadData2: std_logic_vector(31 downto 0); -- -- --
signal Extended: std_logic_vector(31 downto 0); -- -- --
signal ALUSrc: std_logic; -- --
signal ALUIn2: std_logic_vector(31 downto 0); -- --
signal ALUOp: std_logic_vector(1 downto 0); -- --
signal ALUControlAInvert: std_logic; -- --
signal ALUControlBInvert: std_logic; -- --
signal ALUControlOp: std_logic_vector(1 downto 0); -- --
signal Zero: std_logic; -- --
signal ALUResult: std_logic_vector(31 downto 0); -- -- --
signal MemWrite: std_logic; -- --
signal MemReadData: std_logic_vector(31 downto 0); -- --
signal MemRead: std_logic; -- --
signal MemToReg: std_logic; -- --
signal NextPC: std_logic_vector(31 downto 0); -- -- --
signal ShiftedJump: std_logic_vector(31 downto 0); -- --
signal ShiftedBranch: std_logic_vector(31 downto 0); -- --
signal BranchResult: std_logic_vector(31 downto 0); -- --
signal Branch: std_logic; -- --
signal ShouldBranch: std_logic; -- --
signal MuxedNextPCBranch: std_logic_vector(31 downto 0); -- --
signal Jump: std_logic; -- --
signal MuxedNextPCBranchJump: std_logic_vector(31 downto 0); -- --

begin

pc_inst: pc port map ( D      => MuxedNextPCBranchJump,
                       Preset => Inicializar,
                       Clk    => Clk,
                       O      => PCOut );

mem_instrucoes_inst: memInstrucoes port map ( Endereco => PCOut,
                                           Palavra  => Instruction );

mux_reg_dst: mux_2x5 port map ( A   => Instruction(20 downto 16),
                                B   => Instruction(15 downto 11),
                                Sel => RegDst,
                                S   => WriteReg );

reg_file_inst: reg_file port map ( Clk    => Clk,
                                Write  => RegWrite,
                                AddrW  => WriteReg,
                                DataW  => WriteData,
                                AddrR1 => Instruction(25 downto 21),
                                AddrR2 => Instruction(20 downto 16),
                                DataR1 => ReadData1,
                                DataR2 => ReadData2 );

mux_alu_src: mux_2x32 port map ( A   => ReadData2,
                                 B   => Extended,
                                 Sel => ALUSrc,
                                 S   => ALUIn2 );

cu_inst: cu port map ( Opcode   => Instruction(31 downto 26),
                     ALUOp    => ALUOp,
                     RegWrite => RegWrite,
                     RegDst   => RegDst,
                     ALUSrc   => ALUSrc,
                     Branch   => Branch,
                     MemWrite => MemWrite,
                     MemToReg => MemToReg,
                     Jump     => Jump,
                     MemRead  => MemRead );

alu_cu_inst: alu_cu port map ( Funct   => Instruction(5 downto 0),
                            ALUOp   => ALUOp,
                            AInvert => ALUControlAInvert,
                            BInvert => ALUControlBInvert,
                            Op      => ALUControlOp );

alu_32_inst: alu_32 port map ( Invert(0) => ALUControlAInvert,
                            Invert(1) => ALUControlBInvert,
                            Op        => ALUControlOp,
                            A         => ReadData1,
                            B         => ALUIn2,
                            S         => ALUResult,
                            Zero      => Zero );

sig_ext_inst: sig_ext port map ( I => Instruction(15 downto 0),
                              O => Extended );

mem_dados_inst: memDados port map ( DadoLido      => MemReadData,
                                 DadoEscrita   => ReadData2,
                                 Endereco      => ALUResult,
                                 EscreverMem   => MemWrite,
                                 Clock         => Clk,
                                 LerMem        => MemRead,
                                 DebugEndereco => DebugEndereco,
                                 DebugPalavra  => DebugPalavra );

mux_mem_to_reg: mux_2x32 port map ( A   => ALUResult,
                                    B   => MemReadData,
                                    Sel => MemToReg,
                                    S   => WriteData );

ls_2_branch_inst: ls_2 port map ( I => Extended,
                               O => ShiftedBranch );

ls_2_jump_inst: ls_2 port map ( I(31 downto 26) => "000000",
                                I(25 downto 0) => Instruction(25 downto 0),
                                O => ShiftedJump );

pc_alu_inst: alu_32 port map ( Invert(0) => '0',
                            Invert(1) => '0',
                            Op        => "00",
                            A         => PCOut,
                            B         => "00000000000000000000000000000100",
                            S         => NextPC,
                            Zero      => open );

branch_alu_inst: alu_32 port map ( Invert(0) => '0',
                                Invert(1) => '0',
                                Op        => "00",
                                A         => NextPC,
                                B         => ShiftedBranch,
                                S         => BranchResult,
                                Zero      => open );

mux_branch: mux_2x32 port map ( A   => NextPC,
                                B   => BranchResult,
                                Sel => ShouldBranch,
                                S   => MuxedNextPCBranch );

mux_jump: mux_2x32 port map ( A   => MuxedNextPCBranch,
                              B   => ShiftedJump,
                              Sel => Jump,
                              S   => MuxedNextPCBranchJump );

ShouldBranch <= Branch AND Zero;

end architecture ar;
