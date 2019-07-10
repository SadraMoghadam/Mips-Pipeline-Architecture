library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Controller_TB is
end Controller_TB;

architecture TB of Controller_TB is

component f
port(
  mem_read : in std_logic;
  rs, rd : in std_logic_vector(15 downto 0);
  if_write, pc_write : out std_logic);
end component;
 signal rs, rd: std_logic_Vector(15 downto 0) := (others => '0');
 signal mem_read, if_write, pc_write : std_logic := '0';
begin
 uut: f PORT MAP (
  mem_read => mem_read,
  rs => rs,
  rd => rd,
  if_write => if_write,
  pc_write => pc_write
 );

stim_proc: process
 begin
  wait for 20 ns;
 
   rs <= "0000000000000010";
   rd <= "0000000000000001";
   mem_read <= '0';

  wait for 20 ns;

   rs <= "0000000000000111";
   rd <= "0000000000000111";
   mem_read <= '1';

  wait for 20 ns;

   rs <= "0000011000010010";
   rd <= "1110000000100001";
   mem_read <= '1';

  wait;

 end process;

end architecture;