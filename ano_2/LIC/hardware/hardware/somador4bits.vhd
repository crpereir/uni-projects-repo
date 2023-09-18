LIBRARY IEEE;
use IEEE.std_logic_1164.all;


entity somador4bits is

port (A, B: in STD_LOGIC_VECTOR(3 downto 0);
Cin: in STD_LOGIC;
S: out STD_LOGIC_VECTOR(3 downto 0);
Co: out STD_LOGIC 
);

end somador4bits;



architecture arq_somador4bits of somador4bits is

component Somador1bit

port (A, B, Cin : in STD_LOGIC;
S, Co : out STD_LOGIC
);

end component;

SIGNAL sig_Co0 , sig_Co1 , sig_Co2 : std_logic ;

begin

USomador1bit0 : Somador1bit port map (
A=>A(0),
B=>B(0),
Cin=>Cin,
S=>S(0),
Co=>sig_Co0
);

USomador1bit1 : Somador1bit port map (
A=>A(1),
B=>B(1),
Cin=>sig_Co0,
S=>S(1),
Co=>sig_Co1
);

USomador1bit2 : Somador1bit port map (
A=>A(2),
B=>B(2),
Cin=>sig_Co1,
S=>S(2),
Co=>sig_Co2
);

USomador1bit3 : Somador1bit port map (
A=>A(3),
B=>B(3),
Cin=>sig_Co2,
S=>S(3),
Co=>Co
);


end arq_somador4bits;
