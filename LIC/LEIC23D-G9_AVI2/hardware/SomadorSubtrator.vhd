LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity SomadorSubtrator is

port (
A, B: in STD_LOGIC_VECTOR(3 downto 0);
Cin: in STD_LOGIC;
SubNSoma: in STD_LOGIC;
S: out STD_LOGIC_VECTOR(3 downto 0);
Co: out STD_LOGIC 
);

end SomadorSubtrator;



architecture arq_SomadorSubtrator of SomadorSubtrator is

component Fulladder
port
(A, B: in STD_LOGIC_VECTOR(3 downto 0);
Cin: in STD_LOGIC;
S: out STD_LOGIC_VECTOR(3 downto 0);
Co: out STD_LOGIC 
);

end component;

signal 
sigInv : std_logic_vector (3 downto 0); 

signal
sigCin : std_logic;

begin

UFulladder : Fulladder port map (
A=>A,
B=>sigInv,
Cin=>sigCin,
S=>S,
Co=>Co
);


sigInv(0)<=(B(0) xor SubNSoma);
sigInv(1)<=(B(1) xor SubNSoma);
sigInv(2)<=(B(2) xor SubNSoma);
sigInv(3)<=(B(3) xor SubNSoma);

sigCin<=SubNSoma;

end arq_SomadorSubtrator;