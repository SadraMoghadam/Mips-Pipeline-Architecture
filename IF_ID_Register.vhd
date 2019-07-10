library ieee;
use ieee.std_logic_1164.all;

-- Auxiliar register 1 - IF stage to ID stage

Entity reg1 is
 Port (
  instruction_reg : in std_logic_vector(15 downto 0);
  pcplus2 : in std_logic_vector(15 downto 0);
  clk : in std_logic;
  if_write : in std_logic;
  instr_out : out std_logic_vector(15 downto 0);
  mem_data_reg : out std_logic_vector(15 downto 0);
  pc_out : out std_logic_vector(15 downto 0));
 End entity;

Architecture behavior of reg1 is
 begin
  process(clk)
  begin
   if( clk'event and clk = '1' and if_write = '1') then
    instr_out <= instruction_reg;
    mem_data_reg <= instruction_reg;
    pc_out <= pcplus2;
   end if;
  end process;
 end;