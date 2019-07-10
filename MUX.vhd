library ieee;
use ieee.std_logic_1164.all;

Entity mux is
 Port (
  a, b : in std_logic_vector(15 downto 0);
  S : in std_logic;
  Y : out std_logic_vector(15 downto 0));
 End;

Architecture behavior of mux is
  begin
   y <= a when S = '0' else b;
  end;
