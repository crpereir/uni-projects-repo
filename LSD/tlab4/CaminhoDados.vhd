LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity CaminhoDados is
	port(PL, CE, Eacc, Er, RST, clear: in std_logic;
		Mclk: in std_logic;
		M : in std_logic_VECTOR(3 downto 0);
		md : in std_logic_VECTOR(3 downto 0);
		TC : out std_logic;
		reset: in std_logic;
		HEX0 : out std_logic_vector(7 downto 0);
		HEX1 : out std_logic_vector(7 downto 0);
		HEX2 : out std_logic_vector(7 downto 0);
		HEX3 : out std_logic_vector(7 downto 0);
		HEX4 : out std_logic_vector(7 downto 0);
		HEX5 : out std_logic_vector(7 downto 0);
		LEDS : out std_logic_VECTOR(6 downto 0)
	);
end CaminhoDados;

architecture arq_caminhodados of CaminhoDados is

component CONTADORDOWN
	port (m : in STD_LOGIC_VECTOR(3 downto 0);
			PL : in STD_LOGIC;
			reset: in std_logic;
			CE : in std_logic;
			CLK : in STD_LOGIC;
			TC: out std_logic
	);
end component;

component Registo
	port (CLK: in std_logic;
	      Er : in STD_LOGIC;
			M : in STD_LOGIC_vector(3 downto 0);
			Q : out std_logic_vector(6 downto 0)
	);
end component;

component Somador is
	port (A : in STD_LOGIC_VECTOR(6 downto 0);
			B : in STD_LOGIC_VECTOR(6 downto 0);
			Cin: in STD_LOGIC;
			S : out STD_LOGIC_VECTOR(6 downto 0);
			Cout: out STD_LOGIC
	);
end component;

component Acc is
	port( CLK: in std_logic;
	      Eacc : in STD_LOGIC;
			D : in STD_LOGIC_vector(6 downto 0);
			Rst: in std_logic;
			Q : out std_logic_vector(6 downto 0)
	);
end component;

component decoderHex IS
PORT (A, B: in std_logic_vector(3 downto 0);		
		P : in std_logic_vector(6 downto 0);
		clear : in std_logic;
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 : out std_logic_vector(7 downto 0));		
END component;

signal sA, sD, sQ: std_logic_vector(6 downto 0);

begin
		
UContadorDown: ContadorDown port map(
		m => md,
      PL => PL,
		reset => reset,
		CE => CE,
		CLK => Mclk,
		TC => TC);
		
URegisto: Registo port map(
		CLK => Mclk,
      Er => Er,
		M => M,
		Q => sA);
		
USomador: Somador port map(
		A => sA,
      B => sQ,
		Cin =>'0',
		S => sD,
		Cout => open);
		
UAcc: Acc port map(
		CLK => Mclk,
      Eacc => Eacc,
		D => sD,
	   Rst => RST,
		Q => sQ);
		
UdecoderHex: decoderHex port map(
		A => M,
      B => md,
		P => sQ,
	   clear => clear,
		HEX0 => HEX0,
		HEX1 => HEX1,
		HEX2 => HEX2,
		HEX3 => HEX3,
		HEX4 => HEX4,
		HEX5 => HEX5);
		
LEDS <= sQ;		
		
end arq_caminhodados;