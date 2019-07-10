library ieee;
use ieee.std_logic_1164.all;

Entity signextension is
 Port (
  A : in std_logic_vector(7 downto 0);
  Y : out std_logic_vector(15 downto 0));
 End;

Architecture behavior of signextension is
 begin
  Y <= X"00" & A when A(7)='0' else X"ff" & A;
 end;