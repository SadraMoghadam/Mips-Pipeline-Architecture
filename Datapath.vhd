library ieee;
library std;

use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;


-- Datapath

Entity datapath is
Port(
 clock,reset: in std_logic;
 pc_out, alu_result,status_register,data_memory1,data_memory2,memory_address1,memory_address2: out std_logic_vector(15 downto 0));
end datapath;

architecture behaviour of datapath is

 component ALU_VHDL
 port(
 clk : in std_logic;
 a,b : in std_logic_vector(15 downto 0); -- src1, src2
 aluop : in std_logic_vector(2 downto 0); -- function select
 alu_result: out std_logic_vector(15 downto 0); -- ALU Output Result
 mult_high: out std_logic_vector(15 downto 0); -- multipication Output high
 mult_low: out std_logic_vector(15 downto 0); -- multipication Output low
 zero: out std_logic; -- Zero Flag
 z_flag, n_flag : out std_logic;
 Overflow   : out std_logic;
 CarryOut   : out std_logic);
 end component;
 --for alu0: ALU_VHDL use entity work.ALU_VHDL;

 component control_unit_VHDL
 port(
  opcode: in std_logic_vector(3 downto 0);
  noop: in std_logic;
  alu_op: out std_logic_vector(2 downto 0);
  jump,branch,mem_read,mem_write,alu_src1, alu_src2,reg_write,pc_or_addr,pc_write, lwsi, state,if_write, write_addr_src, write_data_src, is_mult: out std_logic
 );
 end component;
 --for controller : control_unit_VHDL use entity work.control_unit_VHDL;

 component adder
 port(
  A, B : in std_logic_vector(15 downto 0);
  Y    : out std_logic_vector(15 downto 0));
 end component;
 --for pcadder : adder use entity work.adder;
 --for pcadder2 : adder use entity work.adder;

 component signextension
 port(
  A : in std_logic_vector(7 downto 0);
  Y : out std_logic_vector(15 downto 0));
 end component;
 --for signext0 : signextension use entity work.signextension;

 component sll1
 port(
  A : in std_logic_vector(15 downto 0);
  Y : out std_logic_vector(15 downto 0));
 end component;
 --for shift_left_logical : sll1 use entity work.sll1;

 component mux 
 port(
  a, b : in std_logic_vector(15 downto 0);
  S : in std_logic;
  Y : out std_logic_vector(15 downto 0));
 end component;
 --for muxregdest : mux use entity work.mux;
 --for muxalusrc : mux use entity work.mux;
 --for muxaluout : mux use entity work.mux;

 component reg1
 Port (
  instruction_reg : in std_logic_vector(15 downto 0);
  pcplus2 : in std_logic_vector(15 downto 0);
  clk : in std_logic;
  if_write : in std_logic;
  instr_out : out std_logic_vector(15 downto 0);
  mem_data_reg : out std_logic_vector(15 downto 0);
  pc_out : out std_logic_vector(15 downto 0));
 end component;
 --for regpipe1 : reg1 use entity work.reg1;

 component reg2 is
 Port (
  clk : in std_logic;
  S_RegWriteD : in std_logic;
  S_MemtoRegD : in std_logic;
  S_MemWriteD : in std_logic;
  S_BranchD   : in std_logic_vector(15 downto 0);
  S_ALUCOntrolD : in std_logic_vector(2 downto 0);
  S_ALUSrcD : in std_logic;
  S_RegDstD : in std_logic;
  RD1 : in std_logic_vector(15 downto 0);
  RD2 : in std_logic_vector(15 downto 0);
  RtE : in std_logic_vector(3 downto 0);
  RdE : in std_logic_vector(3 downto 0);
  SignExt : in std_logic_vector(15 downto 0);
  PCPlus2 : in std_logic_vector(15 downto 0);
  outS_RegWriteD : out std_logic;
  outS_MemtoRegD : out std_logic;
  outS_MemWriteD : out std_logic;
  outS_BranchD : out std_logic_vector(15 downto 0);
  outS_ALUCOntrolD : out std_logic_vector(2 downto 0);
  outS_ALUSrcD : out std_logic;
  outS_RegDstD : out std_logic;
  outRD1 : out std_logic_vector(15 downto 0);
  outRD2 : out std_logic_vector(15 downto 0);
  outRtE : out std_logic_vector(3 downto 0);
  outRdE : out std_logic_vector(3 downto 0);
  outSignExt : out std_logic_vector(15 downto 0);
  outPCPlus2 : out std_logic_vector(15 downto 0));
 end component;
 --for regpipe2 : reg2 use entity work.reg2;

 component reg3
 Port (
  clk : in std_logic;
  S_RegWriteM : in std_logic;
  S_MemtoRegM : in std_logic;
  S_MemWriteM : in std_logic;
  S_BranchM : in std_logic_vector(15 downto 0);
  ZeroM : in std_logic;
  AluOutM : in std_logic_vector(15 downto 0);
  WriteDataM : in std_logic_vector(15 downto 0);
  WriteRegM : in std_logic_vector(3 downto 0);
  PcBranchM : in std_logic_vector(15 downto 0);
  outS_RegWriteM : out std_logic;
  outS_MemtoRegM : out std_logic;
  outS_MemWriteM : out std_logic;
  outS_BranchM : out std_logic_vector(15 downto 0);
  outZeroM: out std_logic;
  outAluOutM : out std_logic_vector(15 downto 0);
  outWriteDataM : out std_logic_vector(15 downto 0);
  outWriteRegM : out std_logic_vector(3 downto 0);
  outPcBranchM : out std_logic_vector(15 downto 0));
 end component;
 --for regpipe3 : reg3 use entity work.reg3;

 component reg4
 Port (
  clk : in std_logic;
  S_RegWriteW : in std_logic;
  S_MemtoRegW : in std_logic;
  n_flag : in std_logic;
  z_flag : in std_logic;
  CarryOut : in std_logic;
  overflow : in std_logic;
  ReadDataW : in std_logic_vector(15 downto 0);
  AluOutW : in std_logic_vector(15 downto 0);
  WriteRegW : in std_logic_vector(3 downto 0);
  outS_RegWriteW : out std_logic;
  outS_MemtoRegW : out std_logic;
  out_n_flag : out std_logic;
  out_z_flag : out std_logic;
  out_CarryOut : out std_logic;
  out_overflow : out std_logic;
  outReadDataW : out std_logic_vector(15 downto 0);
  outAluOutW : out std_logic_vector(15 downto 0);
  outWriteRegW : out std_logic_vector(3 downto 0));
 end component;
 --for regpipe4 : reg4 use entity work.reg4;

 Component hazard_detection is
 Port ( 
  mem_read : in std_logic;
  rs, rd : in std_logic_vector(15 downto 0);
  if_write, pc_write : out std_logic);
 end component;
 --for hazard_detector : hazard_detection use entity work.hazard_detection;

 Component Memory_VHDL is
 Port ( 
 clk: in std_logic;
 mem_write_data: in std_logic_Vector(15 downto 0);
 memRead: in  std_logic;
 memWrite: in  std_logic;
 lwsi: in  std_logic;
 state_of_memory: in  std_logic;
 address: in std_logic_vector(15 downto 0);
 instruction: out  std_logic_vector(15 downto 0));
 end component;
 --for memory : Memory_VHDL use entity work.Memory_VHDL;

 Component pc_unit is
 Port ( 
  pc : in std_logic_vector(15 downto 0);
  pc_write : in std_logic;
  pc_out : out std_logic_vector(15 downto 0));
 end component;
 --for program_counter : pc_unit use entity work.pc_unit;

 Component register_file_VHDL is
 Port ( 
 clk,rst: in std_logic;
 memWrite: in std_logic;
 reg_write_dest: in std_logic_vector(3 downto 0);
 reg_write_data: in std_logic_vector(15 downto 0);
 reg_read_addr_1: in std_logic_vector(3 downto 0);
 reg_read_data_1: out std_logic_vector(15 downto 0);
 reg_read_addr_2: in std_logic_vector(3 downto 0);
 reg_read_data_2: out std_logic_vector(15 downto 0));
 end component;
 --for register_file : register_file_VHDL use entity work.register_file_VHDL;

 signal writereg, writerege, writeregm, writeregW  : std_logic_vector(4 downto 0);
 signal instructiond, instructionE, ReadDataW, writedataE, writedM : std_logic_vector(31 downto 0);
 signal memtoregE, memtoregM, memtoregW, alusrcE, memwrite : std_logic;
 signal ZeroE, regwriteE, regwriteM, regwriteW, regdstE : std_logic;
 signal alucontrolE : std_logic_vector(2 downto 0);
 signal pcjump, pcnext, pcnextbr, pcbranchE, pcbranchM, sigimnE, srcae,
        pcplus4, pcbranch, sigimn, aluoutM, aluoutW, pcplus4D, pcplus4E,
        signimsh, srca, srcb, result : std_logic_vector(31 downto 0);
 signal temp : std_logic_vector(31 downto 0);

 begin
 -- IF

  

 -- ID

  

 -- EX

  
 -- MEM

  

 -- WB

  


end behaviour;