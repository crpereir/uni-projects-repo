LIBRARY IEEE;
use IEEE.std_logic_1164.all;
entity Sistema is

port(Data_in : in STD_LOGIC_VECTOR(3 downto 0);
CLK, PL, CE, clear: in std_logic;
Q: out std_logic_vector(3 downto 0);
	SEG7: out std_logic_vector(7 downto 0); -- dpgfedcba
	TC: out std_logic
);
end Sistema;


architecture arq_sistema of Sistema is


component MUX
port(R, Q : in std_logic_VECTOR (3 downto 0);
S : in std_logic;
F : out std_logic_vector (3 downto 0)
);
end component;



component CLKDIV 
port(clk_in: in std_logic;
clk_out: out std_logic
);
end component;



component Registo
port(F: in STD_LOGIC_VECTOR (3 downto 0);
clk_out: in std_logic;
CE: in std_logic;
A: out STD_LOGIC_VECTOR (3 downto 0)
);
end component;



component Somador
port(A, B: in STD_LOGIC_VECTOR (3 downto 0);
Cin: in STD_LOGIC;
R: out STD_LOGIC_VECTOR (3 downto 0);
Cout: out STD_LOGIC
);
end component;



component decoderHex
port(A: in std_logic_vector(3 downto 0);		
		clear : in std_logic;
		HEX0 : out std_logic_vector(7 downto 0)
);
end component;




component int7seg
port(d : IN STD_LOGIC_vector(3 downto 0);
		dOut: out std_logic_vector(7 downto 0)
);
end component;


Signal R, F, A: STD_LOGIC_VECTOR (3 downto 0);
Signal clk_in, clk_out: STD_LOGIC;


BEGIN

Q <= A;

TC <= not (A(3) or A(2) or A(1) or A(0));

UMUX: MUX port map (
R => Data_in, 
Q => R,
S => PL,
F => F
);


UCLKDIV: CLKDIV port map (
clk_in => CLK,
clk_out => clk_in
);


URegisto: Registo port map (
F => F,
clk_out => clk_in,
CE => CE,
A => A
);

  
 
USomador: Somador port map (
A => A,
B => "1111",
Cin => '0',
Cout => open,
R => R
);



UdecoderHex: decoderHex port map (
A => A,
clear => clear,
HEX0 => SEG7
);

end arq_Sistema;
