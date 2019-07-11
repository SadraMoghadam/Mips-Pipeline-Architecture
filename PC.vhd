library ieee;
use ieee.std_logic_1164.all;

Entity pc_unit is
 Port (
  pc : in std_logic_vector(15 downto 0);
  pc_write : in std_logic;
  pc_out : out std_logic_vector(15 downto 0));
 End;

Architecture behavior of pc_unit is
  begin
   process(pc, pc_write)
   begin
    if(pc_write = '1') then
      pc_out <= pc;
    end if;
   end process;
  end;