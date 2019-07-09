library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_TB is
end ALU_TB;

architecture TB of ALU_TB is

component f
generic(
 nr_of_bits : positive := 32
);
port(
 clk : in std_logic;
 a,b : in std_logic_vector(15 downto 0); -- src1, src2
 aluop : in std_logic_vector(2 downto 0); -- function select
 alu_result: out std_logic_vector(15 downto 0); -- ALU Output Result
 mult_high: out std_logic_vector(15 downto 0); -- multipication Output high
 mult_low: out std_logic_vector(15 downto 0); -- multipication Output low
 zero: out std_logic; -- Zero Flag
 z_flag, n_flag : out std_logic
);
end component;
 signal a, b: std_logic_Vector(15 downto 0) := (others => '0');
 signal aluop: std_logic_Vector(2 downto 0) := (others => '0');
 signal clk, z_flag, n_flag, zero : std_logic := '0';
 signal alu_result, mult_high, mult_low : std_logic_vector(15 downto 0) := (others => '0');
begin
 uut: f PORT MAP (
  a => a,
  b => b,
  aluop => aluop,
  clk => clk,
  alu_result => alu_result,
  mult_high => mult_high,
  mult_low => mult_low,
  z_flag => z_flag,
  n_flag => n_flag,
  zero => zero
 );

stim_proc: process
 begin
  wait for 20 ns;
 
   a <= "0000000000000010";
   b <= "0000000000000001";
   aluop <= "000";
   clk <= '1';

  wait for 20 ns;

   a <= "0101010011110010";
   b <= "0000110000000001";
   aluop <= "010";
   clk <= '1';

  wait;

 end process;

end architecture;