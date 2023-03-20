LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity Controlador is
	port (START: in STD_LOGIC;
			reset: in STD_LOGIC;
			Mclk: in STD_LOGIC;
			TC: in STD_LOGIC;
			PL, CE, CLEAR, RST, Eacc, Er: out std_logic
	);
end Controlador;

architecture arq_controlador of Controlador is

component RegistoME
	port (
			D : in STD_LOGIC_vector(1 downto 0);	
			CLK : in STD_LOGIC;
			Reset : in STD_LOGIC;
			Q : out STD_LOGIC_vector(1 downto 0)
	);
end component;

component MaquinaEstados is
	port( START, TC : in std_logic; 
		EP : in std_logic_vector(1 downto 0);
		PL, CE, CLEAR, RST, Eacc, Er: out std_logic;
		ES : out std_logic_vector(1 downto 0)
	);
end component;

signal sD, sQ : std_logic_vector(1 downto 0);

begin

URegistoME: RegistoME port map(
	   D => sD,
		CLK => Mclk,
		Reset => reset,
		Q => sQ);

UMaquinaEstados: MaquinaEstados port map(
	   START => START,
		TC => TC,
		EP => sQ,
		PL => PL,
		CE => CE,
		CLEAR => CLEAR,
		RST => RST,
		Eacc => Eacc,
		Er => Er,
		ES => sD); 		

end arq_controlador;