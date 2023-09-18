LIBRARY IEEE;
use IEEE.std_logic_1164.all;
entity semaforo is

port(Tempo : in std_logic_VECTOR (3 downto 0);
reset, B, clk : in std_logic;
Q: out std_logic_VECTOR (3 downto 0);
SEG7: out std_logic_vector(7 downto 0); -- dpgfedcba
E, A, V, EP, VP : out std_logic
);
end semaforo;


architecture arq_semaforo of semaforo is


component MUX1
port(Tempo, two : in std_logic_VECTOR (3 downto 0);
S : in std_logic;
Q : out std_logic_vector (3 downto 0)
);
end component;



component Sistema 
port(Data_in : in STD_LOGIC_VECTOR(3 downto 0);
clk, PL, CE, clear: in std_logic;
Q: out std_logic_vector(3 downto 0);
SEG7: out std_logic_vector(7 downto 0); -- dpgfedcba
TC: out std_logic
);
end component;




component maquinaestados
port(B : in std_logic;
reset : in std_logic;
TC : in std_logic;
CLK : in std_logic;
V : out std_logic;
EP : out STD_LOGIC;
PL : out std_logic;
clear : out STD_LOGIC;
CE : out STD_LOGIC;
A : out std_logic;
S : out std_logic;
VP : out std_logic;
E : out std_logic
);
end component;


SIGNAL S, PL, CE, clear, TC: STD_LOGIC;
SIGNAL F : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN

UMUX1: MUX1 port map (
Tempo => Tempo, 
two => "0010",
S => S,
Q => F 
);


USistema: Sistema port map (
Data_in => F ,
clk => clk,
PL => PL,
CE => CE,
clear => clear,
Q => Q,
SEG7 => SEG7,
TC => TC
);


Umaquinaestados: maquinaestados port map (
B => B ,
reset => reset,
TC => TC,
V => V,
EP => EP ,
PL => PL ,
clear => clear , 
CE => CE, 
A => A, 
S => S , 
VP => VP,
E => E,
CLK => CLK

     );
end arq_semaforo;