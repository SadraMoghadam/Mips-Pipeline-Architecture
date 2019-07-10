library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- VHDL code for Control Unit of the MIPS Processor
entity control_unit_VHDL is
port (
  opcode: in std_logic_vector(3 downto 0);
  noop: in std_logic;
  alu_op: out std_logic_vector(2 downto 0);
  jump,branch,mem_read,mem_write,alu_src1, alu_src2,reg_write,pc_or_addr,pc_write, lwsi, state,if_write, write_addr_src, write_data_src, is_mult: out std_logic
 );
end control_unit_VHDL;

architecture Behavioral of control_unit_VHDL is

begin
process(noop,opcode)
begin

 if(noop = '1') then
   pc_write <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src1 <= '0';
   alu_src2 <= '0';
   reg_write <= '0';
   lwsi <= '0';
   pc_or_addr <= '0';
   state <= '0';
   if_write <= '0';
   write_addr_src <= '0';
   write_data_src <= '0';
   is_mult <= '0';

 else 

 case opcode is

  when "0000" => -- add
    pc_write <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src1 <= '0';
   alu_src2 <= '0';
   reg_write <= '0';
   lwsi <= '0';
   pc_or_addr <= '0';
   state <= '0';
   if_write <= '0';
   write_addr_src <= '0';
   write_data_src <= '0';
   is_mult <= '0';

  when "0001" => -- add
   pc_write <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src1 <= '0';
   alu_src2 <= '0';
   reg_write <= '0';
   lwsi <= '0';
   pc_or_addr <= '0';
   state <= '0';
   if_write <= '0';
   write_addr_src <= '0';
   write_data_src <= '0';
   is_mult <= '0';

  when "0010" => -- subtract
   pc_write <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src1 <= '0';
   alu_src2 <= '0';
   reg_write <= '0';
   lwsi <= '0';
   pc_or_addr <= '0';
   state <= '0';
   if_write <= '0';
   write_addr_src <= '0';
   write_data_src <= '0';
   is_mult <= '0';

 when "0011" =>-- addi
   pc_write <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src1 <= '0';
   alu_src2 <= '0';
   reg_write <= '0';
   lwsi <= '0';
   pc_or_addr <= '0';
   state <= '0';
   if_write <= '0';
   write_addr_src <= '0';
   write_data_src <= '0';
   is_mult <= '0';

 when "0100" =>-- mult
   pc_write <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src1 <= '0';
   alu_src2 <= '0';
   reg_write <= '0';
   lwsi <= '0';
   pc_or_addr <= '0';
   state <= '0';
   if_write <= '0';
   write_addr_src <= '0';
   write_data_src <= '0';
   is_mult <= '0';

 when "0101" => -- and
   pc_write <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src1 <= '0';
   alu_src2 <= '0';
   reg_write <= '0';
   lwsi <= '0';
   pc_or_addr <= '0';
   state <= '0';
   if_write <= '0';
   write_addr_src <= '0';
   write_data_src <= '0';
   is_mult <= '0';

 when "0110" => -- sll
   pc_write <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src1 <= '0';
   alu_src2 <= '0';
   reg_write <= '0';
   lwsi <= '0';
   pc_or_addr <= '0';
   state <= '0';
   if_write <= '0';
   write_addr_src <= '0';
   write_data_src <= '0';
   is_mult <= '0';

 when "0111" =>-- lw
   pc_write <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src1 <= '0';
   alu_src2 <= '0';
   reg_write <= '0';
   lwsi <= '0';
   pc_or_addr <= '0';
   state <= '0';
   if_write <= '0';
   write_addr_src <= '0';
   write_data_src <= '0';
   is_mult <= '0';

 when "1000" =>-- lwi
   pc_write <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src1 <= '0';
   alu_src2 <= '0';
   reg_write <= '0';
   lwsi <= '0';
   pc_or_addr <= '0';
   state <= '0';
   if_write <= '0';
   write_addr_src <= '0';
   write_data_src <= '0';
   is_mult <= '0';

 when "1001" =>-- sw
   pc_write <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src1 <= '0';
   alu_src2 <= '0';
   reg_write <= '0';
   lwsi <= '0';
   pc_or_addr <= '0';
   state <= '0';
   if_write <= '0';
   write_addr_src <= '0';
   write_data_src <= '0';
   is_mult <= '0';

 when "1010" =>-- swi
   pc_write <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src1 <= '0';
   alu_src2 <= '0';
   reg_write <= '0';
   lwsi <= '0';
   pc_or_addr <= '0';
   state <= '0';
   if_write <= '0';
   write_addr_src <= '0';
   write_data_src <= '0';
   is_mult <= '0';

when "1011" =>-- clr
   pc_write <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src1 <= '0';
   alu_src2 <= '0';
   reg_write <= '0';
   lwsi <= '0';
   pc_or_addr <= '0';
   state <= '0';
   if_write <= '0';
   write_addr_src <= '0';
   write_data_src <= '0';
   is_mult <= '0';

when "1100" =>-- mov
   pc_write <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src1 <= '0';
   alu_src2 <= '0';
   reg_write <= '0';
   lwsi <= '0';
   pc_or_addr <= '0';
   state <= '0';
   if_write <= '0';
   write_addr_src <= '0';
   write_data_src <= '0';
   is_mult <= '0';

when "1101" =>-- compare
   pc_write <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src1 <= '0';
   alu_src2 <= '0';
   reg_write <= '0';
   lwsi <= '0';
   pc_or_addr <= '0';
   state <= '0';
   if_write <= '0';
   write_addr_src <= '0';
   write_data_src <= '0';
   is_mult <= '0';

when "1110" =>-- bne
   pc_write <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src1 <= '0';
   alu_src2 <= '0';
   reg_write <= '0';
   lwsi <= '0';
   pc_or_addr <= '0';
   state <= '0';
   if_write <= '0';
   write_addr_src <= '0';
   write_data_src <= '0';
   is_mult <= '0';

 when others =>--jmp
    pc_write <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src1 <= '0';
   alu_src2 <= '0';
   reg_write <= '0';
   lwsi <= '0';
   pc_or_addr <= '0';
   state <= '0';
   if_write <= '0';
   write_addr_src <= '0';
   write_data_src <= '0';
   is_mult <= '0';

 end case;
 end if;
end process;

end Behavioral;