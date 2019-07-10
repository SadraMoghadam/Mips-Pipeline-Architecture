library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Controller_TB is
end Controller_TB;

architecture TB of Controller_TB is

component f
port(
  opcode: in std_logic_vector(3 downto 0);
  noop: in std_logic;
  alu_op: out std_logic_vector(2 downto 0);
  jump,branch,mem_read,mem_write,alu_src1, alu_src2,reg_write,pc_or_addr,pc_write, lwsi, state,if_write, write_addr_src, write_data_src, is_mult: out std_logic
);
end component;
 signal opcode: std_logic_Vector(3 downto 0) := (others => '0');
 signal alu_op: std_logic_Vector(2 downto 0) := (others => '0');
 signal noop,jump,branch,mem_read,mem_write,alu_src1, alu_src2,reg_write,pc_or_addr,pc_write, lwsi, state,if_write, write_addr_src, write_data_src, is_mult : std_logic := '0';
begin
 uut: f PORT MAP (
  opcode => opcode,
  alu_op => alu_op,
  noop => noop,
  jump => jump,
  branch => branch,
  mem_read => mem_read,
  mem_write => mem_write,
  alu_src1 => alu_src1,
  alu_src2 => alu_src2,
  reg_write => reg_write,
  pc_or_addr => pc_or_addr,
  lwsi => lwsi,
  pc_write => pc_write,
  state => state,
  if_write => if_write,
  write_addr_src => write_addr_src,
  write_data_src => write_data_src,
  is_mult => is_mult
 );

stim_proc: process
 begin
  wait for 20 ns;
 
   opcode <= "0010";
   noop <= '0';

  wait for 20 ns;

   opcode <= "0110";
   noop <= '1';

  wait for 20 ns;

   opcode <= "0011";
   noop <= '1';

  wait;

 end process;

end architecture;