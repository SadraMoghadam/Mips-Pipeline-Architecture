# Mips-Pipeline-Architecture
mips pipeline architecture using VHDL
CAP19 CPU => 16 bit RISC processor
it has 14 registers

Assembly language contains:
  1.Arithmatic
  2.Logical
  3.Data Transfer
  4.Compare And Conditional Branch
  5.Unconditional Jump
  
it has unique 4KB Memory 
first 1KB is for Instruction Memory
rest 3KB is for Data Memory
Of course it would have structural HAZARD

Machine Code In CAP19 CPU:
  1.R-format:
    |op|rd|rs|NOP|
    each size:4 bits
    op:op code 
    rs:source register
    rd:destination register
    NOP:no operation code
  2.I-format:
    |op|rd|immediate|
    immediate size:8 bits
    op and rd size:4 bits
  3.J-format:
    |op|address|
    op:4 bits
    address:12 bits
    
Registers:
  name      =>      register number       =>
  Zero      =>             0              =>      constant value 0
  D0~D3     =>            1-4             =>      Data Registers
  A0~A3     =>            5-8             =>      Address Registers
  SR        =>             9              =>      Status Register
  BA        =>             10             =>      Base Address
  PC        =>             11             =>      Program Counter
  Hi        =>             12             =>      High part for multiply
  Lo        =>             13             =>      Low part for multiply
