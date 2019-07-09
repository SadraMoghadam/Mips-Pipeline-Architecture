library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;  
-- VHDL code for the Instruction Memory of the MIPS Processor
entity Memory_VHDL is
port (
 clk: in std_logic;
 mem_write_data: in std_logic_Vector(15 downto 0);
 memRead: in  std_logic;
 memWrite: in  std_logic;
 lwsi: in  std_logic;
 state_of_memory: in  std_logic;
 address: in std_logic_vector(15 downto 0);
 instruction: out  std_logic_vector(15 downto 0)
);
end Memory_VHDL;

architecture Behavioral of Memory_VHDL is
signal ins_addr: std_logic_vector(15 downto 0);
signal i: integer;
signal data_addr: std_logic_vector(15 downto 0);
signal temp1, temp2: std_logic_vector(15 downto 0);
type data_mem is array (0 to 191 ) of std_logic_vector (15 downto 0);
signal RAM: data_mem :=((others=> (others=>'0')));
 -- lw $3, 0($0) -- pc=0
 -- Loop: sltiu  $1, $3, 11= pc = 2
 -- beq $1, $0, Skip = 4 --PCnext=PC_current+2+BranchAddr
 -- add $4, $4, $3 = 6
 -- addi $3, $3, 1 = 8
 -- beq $0, $0, Loop--a
 -- Skip c = 12 = 4 + 2 + br
 type RAM_ins is array (0 to 63 ) of std_logic_vector(15 downto 0);
 constant ramIns: RAM_ins:=(
   "1000000110000000",
   "0010110010001011",
   "1100010000000011",
   "0001000111000000",
   "1110110110000001",
   "1100000001111011",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "1000000110000000",
   "0010110010001011",
   "1100010000000011",
   "0001000111000000",
   "1110110110000001",
   "1100000001111011",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "1000000110000000",
   "0010110010001011",
   "1100010000000011",
   "0001000111000000",
   "1110110110000001",
   "1100000001111011",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "1000000110000000",
   "0010110010001011",
   "1100010000000011",
   "0001000111000000",
   "1110110110000001",
   "1100000001111011",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000"
  );
begin
 
 data_addr <= address(15 downto 0);
 process(clk)
 begin


-- Data Memory


  if(rising_edge(clk) and state_of_memory='1') then
   if (memWrite='1' and lwsi='0') then
    ram(to_integer(unsigned(data_addr))) <= mem_write_data;
   end if;
   if(memWrite='1' and lwsi='1') then
    temp1 <= ram(to_integer(unsigned(data_addr)));
    ram(to_integer(unsigned(temp1))) <= mem_write_data;	
    end if;
  end if;

 if(rising_edge(clk) and state_of_memory='1') then
   if (memRead='1' and lwsi='0') then
    instruction <= ram(to_integer(unsigned(data_addr)));
   end if;
   if(memRead='1' and lwsi='1') then
    temp2 <= ram(to_integer(unsigned(data_addr)));
    instruction <= ram(to_integer(unsigned(temp2)));
    end if;
  end if;


--Instruction Memory 


  if(rising_edge(clk) and state_of_memory='0') then
   ins_addr <= address(15 downto 0);
   instruction <= ramIns(to_integer(unsigned(ins_addr)));
  end if;

 
 end process;
 


 

end Behavioral;