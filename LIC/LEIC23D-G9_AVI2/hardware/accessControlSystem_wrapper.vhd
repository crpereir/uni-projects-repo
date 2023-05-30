
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity accessControlSystem_wrapper is
	port ( 
        Mclk : in std_logic;
		  reset : in std_logic;
		  Lines : in std_logic_vector (3 downto 0);     -- linhas
        --sopen : in std_logic;
		  --sclose : in std_logic;
		  --psensor : in std_logic;
		  M: in std_logic;
		  Columns : out std_logic_vector (2 downto 0);    -- colunas
		  rs: out std_logic;
		  en: out std_logic;
		  data: out std_logic_vector (7 downto 4);
		  D: out std_logic_vector (3 downto 0); 
		  V: out std_logic_vector (3 downto 0);
		  leds: out std_logic_vector (5 downto 0);
		  openclose : out std_logic;
		  onoff : out std_logic;
		  pswitch : in std_logic;
		  HEX0: out std_logic_vector(7 downto 0);
		  HEX1: out std_logic_vector(7 downto 0);
		  HEX2: out std_logic_vector(7 downto 0);
		  HEX3: out std_logic_vector(7 downto 0);
		  HEX4: out std_logic_vector(7 downto 0);
		  HEX5: out std_logic_vector(7 downto 0)
		  
		  
		  
    );
	 
end accessControlSystem_wrapper;
	
architecture arq of accessControlSystem_wrapper is

component accessControlSystem is 
	port ( 
        Mclk : in std_logic;
		  reset : in std_logic;
		  Lines : in std_logic_vector (3 downto 0);     -- linhas
        sopen : in std_logic;
		  sclose : in std_logic;
		  psensor : in std_logic;
		  M: in std_logic;
		  Columns : out std_logic_vector (2 downto 0);    -- colunas
		  rs: out std_logic;
		  en: out std_logic;
		  data: out std_logic_vector (7 downto 4);
		  D: out std_logic_vector (3 downto 0); 
		  V: out std_logic_vector (3 downto 0);
		  leds: out std_logic_vector (5 downto 0);
		  openclose : out std_logic;
		  onoff : out std_logic
		  
    );  
end component;



component door_mecanism PORT(	
		MCLK 			: in std_logic;
		RST			: in std_logic;
		onOff			: in std_logic;
		openClose	: in std_logic;
		v			: in std_logic_vector(3 downto 0);
		Pswitch		: in std_logic;
		Sopen			: out std_logic;
		Sclose		: out std_logic;
		Pdetector	: out std_logic;
		HEX0			: out std_logic_vector(7 downto 0);
		HEX1			: out std_logic_vector(7 downto 0);
		HEX2			: out std_logic_vector(7 downto 0);
		HEX3			: out std_logic_vector(7 downto 0);
		HEX4			: out std_logic_vector(7 downto 0);
		HEX5			: out std_logic_vector(7 downto 0)
		);
	 
end component;


signal onoff_s, openclose_s, sopen_s, sclose_s, psensor_s : std_logic;
signal V_s : std_logic_vector(3 downto 0);


begin

u_accesscontrol: accessControlSystem port map( 
		mclk => mclk,
		reset => reset,
		lines => lines,
		sopen => sopen_s,
		sclose => sclose_s,
		psensor => psensor_s,
		M => M,
		columns => columns,
		rs => rs,
		en => en, 
		data => data,
		D => D,
		V => V_s,
		leds => leds,
		openclose => openclose_s,
		onoff => onoff_s
);

u_door_mechanism: door_mecanism port map(
		mclk => mclk,
		rst => reset,
		onoff => onoff_s,
		openclose => openclose_s,
		V => V_s,
		pswitch => pswitch ,
		sopen => sopen_s,
		sclose => sclose_s,
		pdetector => psensor_s ,
		HEX0 => HEX0,
		HEX1 => HEX1,
		HEX2 => HEX2,
		HEX3 => HEX3,
		HEX4 => HEX4,
		HEX5 => HEX5
);


 V <= v_s;
 onoff <= onoff_s;
 openclose <= openclose_s;
 --sopen <= sopen_s;
 --sclose <= sclose_s;
 --psensor <= psensor_s;
 
end arq;
 
