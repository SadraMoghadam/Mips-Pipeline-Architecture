library ieee;
use ieee.std_logic_1164.all;

Entity sll2 is
 Port (
  A : in std_logic_vector(15 downto 0);
  Y : out std_logic_vector(15 downto 0));
 End;

Architecture behavior of sll2 is
begin
 Y <= A(12 downto 0) & "000";
end;