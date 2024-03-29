library ieee;
use ieee.std_logic_1164.all;

-- Auxiliar register 3 - EX stage to MEM stage

Entity reg3 is
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
 End;

Architecture behavior of reg3 is
begin
 process(clk)
 begin
  if( clk'event and clk = '1') then
   outS_RegWriteM <= S_RegWriteM;
   outS_MemtoRegM <= S_MemtoRegM;
   outS_MemWriteM <=S_MemWriteM;
   outS_BranchM <= S_BranchM;
   outZeroM <= ZeroM;
   outAluOutM <= AluOutM;
   outWriteDataM <= WriteDataM;
   outWriteRegM <= WriteRegM;
   outPcBranchM <= PcBranchM;
  end if;
 end process;
end;