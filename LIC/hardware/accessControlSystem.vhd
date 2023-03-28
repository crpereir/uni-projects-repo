LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity accessControlSystem is
	port ( 
        Mclk : in std_logic;
		  reset : in std_logic;
		  Lines : in std_logic_vector (3 downto 0);     -- linhas
        Columns : out std_logic_vector (2 downto 0);    -- colunas
		  rs: out std_logic;
		  en: out std_logic;
		  data: out std_logic_vector (7 downto 0)
    );
	 
end accessControlSystem;
	
architecture arq of accessControlSystem is

component keyboard_reader is 
    port ( 
        Mclk : in std_logic;
		  reset : in std_logic;
        Kack : in std_logic;
		  Lines : in std_logic_vector (3 downto 0);     -- linhas
        Columns : out std_logic_vector (2 downto 0);   -- colunas
        Q : out std_logic_vector (3 downto 0);
		  Dval: out std_logic
		  
    );	  
end component;

component UsbPort is port (
		inputPort:  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		outputPort :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end component;

signal Kack_s, Dval_s: std_logic;
signal Q_s : std_logic_vector(3 downto 0);
signal di_s, oi_s: std_logic_vector (3 downto 0);
signal rt_s, wr_s: std_logic;


begin
	u_keyboard_reader: keyboard_reader port map( 
		Kack => Kack_s,
		Lines => Lines,
		Columns => Columns,
		reset => reset,
		Mclk => Mclk,
		Q => Q_s,
		Dval =>  Dval_s
		);

	u_UsbPort: UsbPort port map(
		inputPort(0) => Dval_s,
		inputPort(4 downto 1) => Q_s, 
		inputPort(5) => '0',
		inputPort(6) => '0',
		inputPort(7) => '0',
		outputPort(0) => Kack_s,
		outputPort(1) => data(4),
		outputPort(2) => data(5),
		outputPort(3) => data(6),
		outputPort(4) => data(7),
		outputPort(5) => rs,
		outputPort(6) => en
		);
	
		end arq;	