LIBRARY IEEE;
use IEEE.std_logic_1164.all;
entity ALU is

port(W, Y : in STD_LOGIC_VECTOR(3 downto 0);
OP : in STD_LOGIC_VECTOR (2 downto 0);
F : out STD_LOGIC_VECTOR (3 downto 0);
CyBw, OV, Z, P, GE: out STD_LOGIC
);
end ALU;


architecture arq_ALU of ALU is


component Divisor 
port(W: in std_logic_vector (3 downto 0);
OP1: in std_logic;
AX: out std_logic_vector (3 downto 0)
);
end component;



component Circuit
port(AY, B : in STD_LOGIC_VECTOR(3 downto 0);
Opalu : in STD_LOGIC;
R : out STD_LOGIC_VECTOR (3 downto 0);
CB, OV: out STD_LOGIC
);
end component;



component ModuloLogica
port(A, B : in std_logic_vector (3 downto 0);
OP0, OP1 : in std_logic;
Q : out std_logic_vector (3 downto 0)
);
end component;



component MUX
port(R, Q : in std_logic_VECTOR (3 downto 0);
S : in std_logic;
F : out std_logic_vector (3 downto 0)
);
end component;



component FLAGS
port(CB, Overflow: in STD_LOGIC;
F: in STD_LOGIC_VECTOR (3 downto 0);
CyBw, OV, Z, P, GE: out STD_LOGIC
);
end component;



SIGNAL A,RX,FX,QX: STD_LOGIC_VECTOR (3 downto 0);
SIGNAL CBX,OVX: STD_LOGIC;


BEGIN

F<=FX;

UDivisor: Divisor port map (
W => W, 
OP1 => OP(1),
AX => A 
);


UCircuit: Circuit port map (
AY => A, 
B => Y,
CB => CBX,
OV => OVX,
R => RX,
Opalu =>OP(0)
);


UFLAGS: FLAGS port map (
CB => CBX,
Overflow => OVX,
F => FX,--
OV => OV,
CyBw => CyBw,
Z => Z,
GE => GE, 
P => P
);

 
 
UModuloLogica: ModuloLogica port map (
A => W,
B => Y,
Q => QX,
OP1=>OP(1),
OP0=>OP(0)
);



UMUX: MUX port map (
R => RX,
Q => QX,
F => FX,--
S => OP(2)
);

end arq_ALU;
