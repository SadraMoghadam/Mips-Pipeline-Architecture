library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Entity hazard_detection is
 Port (
  mem_read : in std_logic;
  rs, rd : in std_logic_vector(15 downto 0);
  if_write, pc_write : out std_logic);
 End;

Architecture behavior of hazard_detection is
begin
 process(rs, rd, mem_read)
 begin
  if(mem_read = '1' and rs = rd) then
   if_write <= '0';
   pc_write <= '0';
  end if;
 end process; 
end;