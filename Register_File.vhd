library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;  
-- VHDL code for the register file of the MIPS Processor
entity register_file_VHDL is
port (
 clk,rst: in std_logic;
 memWrite: in std_logic;
 reg_write_dest: in std_logic_vector(3 downto 0);
 reg_write_data: in std_logic_vector(15 downto 0);
 reg_read_addr_1: in std_logic_vector(3 downto 0);
 reg_read_data_1: out std_logic_vector(15 downto 0);
 reg_read_addr_2: in std_logic_vector(3 downto 0);
 reg_read_data_2: out std_logic_vector(15 downto 0)
);
end register_file_VHDL;

architecture Behavioral of register_file_VHDL is
type reg_type is array (0 to 13 ) of std_logic_vector (15 downto 0);
signal reg_array: reg_type;
begin
 process(clk,rst) 
 begin
 if(rst='1') then
   reg_array(0) <= x"0001";--D0
   reg_array(1) <= x"0002";--D1
   reg_array(2) <= x"0003";--D2
   reg_array(3) <= x"0004";--D3
   reg_array(4) <= x"0005";--A0
   reg_array(5) <= x"0006";--A1
   reg_array(6) <= x"0007";--A2
   reg_array(7) <= x"0008";--A3
   reg_array(8) <= x"0009";--BA
   reg_array(9) <= x"0010";--PC
   reg_array(10) <= x"0011";--SR
   reg_array(11) <= x"0012";--zero
   reg_array(12) <= x"0013";--Hi
   reg_array(13) <= x"0014";--Lo
 elsif(rising_edge(clk)) then
   if(memWrite='1') then
    reg_array(to_integer(unsigned(reg_write_dest))) <= reg_write_data;
   end if;
 end if;
 end process;

 reg_read_data_1 <= x"0000" when reg_read_addr_1 = "0000" else reg_array(to_integer(unsigned(reg_read_addr_1)));
 reg_read_data_2 <= x"0000" when reg_read_addr_2 = "0000" else reg_array(to_integer(unsigned(reg_read_addr_2)));

end Behavioral;