library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Register_FileTB is
end Register_FileTB;

architecture TB of Register_FileTB is

component f
port(
 clk,rst: in std_logic;
 memWrite: in std_logic;
 reg_write_dest: in std_logic_vector(3 downto 0);
 reg_write_data: in std_logic_vector(15 downto 0);
 reg_read_addr_1: in std_logic_vector(3 downto 0);
 reg_read_data_1: out std_logic_vector(15 downto 0);
 reg_read_addr_2: in std_logic_vector(3 downto 0);
 reg_read_data_2: out std_logic_vector(15 downto 0)
);
end component;
 signal reg_write_data, reg_read_data_1, reg_read_data_2: std_logic_Vector(15 downto 0) := (others => '0');
 signal clk, memWrite, rst : std_logic := '0';
 signal reg_write_dest, reg_read_addr_1, reg_read_addr_2 : std_logic_vector(3 downto 0) := (others => '0');
begin
 uut: f PORT MAP (
  reg_write_data => reg_write_data,
  reg_read_data_1 => reg_read_data_1,
  reg_read_data_2 => reg_read_data_2,
  clk => clk,
  memWrite => memWrite,
  rst => rst,
  reg_read_addr_2 => reg_read_addr_2,
  reg_read_addr_1 => reg_read_addr_1,
  reg_write_dest => reg_write_dest
 );

stim_proc: process
 begin
  wait for 20 ns;
 
   reg_write_data <= "0101010011110010";
   reg_write_dest <= "0001";
   reg_read_addr_1 <= "0001";
   reg_read_addr_2 <= "0011";
   rst <= '1';
   clk <= '1';
   memWrite <= '0';

  wait for 20 ns;

   reg_write_data <= "0101010011110010";
   reg_write_dest <= "0001";
   reg_read_addr_1 <= "0001";
   reg_read_addr_2 <= "0011";
   rst <= '0';
   clk <= '0';
   memWrite <= '1';

  wait for 20 ns;

   reg_write_data <= "0101010011110010";
   reg_write_dest <= "0001";
   reg_read_addr_1 <= "0001";
   reg_read_addr_2 <= "0011";
   rst <= '0';
   clk <= '1';
   memWrite <= '1';

  wait;

 end process;

end architecture;