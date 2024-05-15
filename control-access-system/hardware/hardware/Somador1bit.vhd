LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity Somador1bit is

port 

(A, B, Cin : in STD_LOGIC;
S, Co : out STD_LOGIC);

end Somador1bit;

architecture arq_Somador1bit of Somador1bit is
begin

S <= A xor B xor Cin;
Co <= (A and B) or (A and Cin) or (B and Cin);

end arq_Somador1bit;
