library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- VHDL code for Control Unit of the MIPS Processor
entity control_unit_VHDL is
port (
  opcode: in std_logic_vector(3 downto 0);
  noop: in std_logic;
  alu_op: out std_logic_vector(2 downto 0);
  jump,branch,mem_read,mem_write,alu_src,reg_write,sign_or_zero,reg_dst,mem_to_reg: out std_logic
 );
end control_unit_VHDL;

architecture Behavioral of control_unit_VHDL is

begin
process(noop,opcode)
begin
 if(noop = '1') then
   reg_dst <= '0';
   mem_to_reg <= '0';
   alu_op <= "000";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '0';
   reg_write <= '0';
   sign_or_zero <= '1';
 else 
 case opcode is
  when "0000" => -- add
    reg_dst <= '1';
    mem_to_reg <= '0';
    alu_op <= "000";
    jump <= '0';
    branch <= '0';
    mem_read <= '0';
    mem_write <= '0';
    alu_src <= '0';
    reg_write <= '1';
    sign_or_zero <= '1';
  when "0001" => -- add
   reg_dst <= '0';
   mem_to_reg <= '0';
   alu_op <= "010";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '1';
   reg_write <= '1';
   sign_or_zero <= '0';
  when "0010" => -- subtract
   reg_dst <='0';
   mem_to_reg <= '0';
   alu_op <= "000";
   jump <= '1';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '0';
   reg_write <= '0';
   sign_or_zero <= '1';
 when "0011" =>-- addi
   reg_dst <= '0';
   mem_to_reg <= '0';
   alu_op <= "000";
   jump <= '1';
   branch <=  '0';
   mem_read <=  '0';
   mem_write <=  '0';
   alu_src <= '0';
   reg_write <=  '1';
   sign_or_zero <= '1';
 when "0100" =>-- mult
   reg_dst <= '0';
   mem_to_reg <= '1';
   alu_op <= "011";
   jump <= '0';
   branch <= '0';
   mem_read <= '1';
   mem_write <= '0';
   alu_src <= '1';
   reg_write <= '1';
   sign_or_zero <= '1';
 when "0101" => -- and
   reg_dst <= '0';
   mem_to_reg <= '0';
   alu_op <= "011";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '1';
   alu_src <= '1';
   reg_write <= '0';
   sign_or_zero <= '1';
 when "0110" => -- sll
   reg_dst <= '0';
   mem_to_reg <= '0';
   alu_op <= "001";
   jump <= '0';
   branch <= '1';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '0';
   reg_write <= '0';
   sign_or_zero <= '1';
 when "0111" =>-- lw
   reg_dst <= '0';
   mem_to_reg <= '0';
   alu_op <= "011";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '1';
   reg_write <= '1';
   sign_or_zero <= '1';
 when "1000" =>-- lwi
   reg_dst <= '0';
   mem_to_reg <= '0';
   alu_op <= "110";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '1';
   reg_write <= '1';
   sign_or_zero <= '1';
 when "1001" =>-- sw
   reg_dst <= '0';
   mem_to_reg <= '0';
   alu_op <= "111";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '1';
   reg_write <= '1';
   sign_or_zero <= '1';
 when "1010" =>-- swi
   reg_dst <= '0';
   mem_to_reg <= '0';
   alu_op <= "101";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '1';
   reg_write <= '1';
   sign_or_zero <= '1';
when "1011" =>-- clr
   reg_dst <= '0';
   mem_to_reg <= '0';
   alu_op <= "101";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '1';
   reg_write <= '1';
   sign_or_zero <= '1';
when "1100" =>-- mov
   reg_dst <= '0';
   mem_to_reg <= '0';
   alu_op <= "101";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '1';
   reg_write <= '1';
   sign_or_zero <= '1';
when "1101" =>-- compare
   reg_dst <= '0';
   mem_to_reg <= '0';
   alu_op <= "101";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '1';
   reg_write <= '1';
   sign_or_zero <= '1';
when "1110" =>-- bne
   reg_dst <= '0';
   mem_to_reg <= '0';
   alu_op <= "101";
   jump <= '0';
   branch <= '0';
   mem_read <= '0';
   mem_write <= '0';
   alu_src <= '1';
   reg_write <= '1';
   sign_or_zero <= '1';
 when others =>--jmp
    reg_dst <= '0';
    mem_to_reg <= '0';
    alu_op <= "000";
    jump <= '0';
    branch <= '0';
    mem_read <= '0';
    mem_write <= '0';
    alu_src <= '0';
    reg_write <= '0';
    sign_or_zero <= '0';
 end case;
 end if;
end process;

end Behavioral;