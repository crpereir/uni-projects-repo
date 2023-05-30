
-- keyboard reader

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity keyboard_reader is
	port ( 
        Mclk : in std_logic;
		  reset : in std_logic;
        Kack : in std_logic;
		  Lines : in std_logic_vector (3 downto 0);     -- linhas
        Columns : out std_logic_vector (2 downto 0);    -- colunas
        Q : out std_logic_vector (3 downto 0);
		  Dval: out std_logic
    );
	 
	 end keyboard_reader;
	
architecture arq of keyboard_reader is

component key_decode is 
    port ( 
        Mclk : in std_logic;
		  reset : in std_logic;
        Kack : in std_logic;
		  Lines : in std_logic_vector (3 downto 0);     -- linhas
        Columns : out std_logic_vector (2 downto 0);    -- colunas
        K : out std_logic_vector (3 downto 0);
		  Kval: out std_logic
		  
    );
end component;

component ringbuffer is 
    port ( 
       D : in std_logic_vector (3 downto 0);
		DAV : in std_logic;
		CTS : in std_logic;
		Q : out std_logic_vector (3 downto 0);
		Wreg : out std_logic;
		DAC : out std_logic;
		clk: in std_logic;
		reset: in std_logic
		  
    );
end component;


component outputbuffer is 
    port ( 
       Load	 : in std_logic;
	   ACK	 : in std_logic;
		D		 : in std_logic_vector  (3 downto 0);
	   Q      : out std_logic_vector (3 downto 0);
		OBfree : out std_logic;
		Dval	 : out std_logic;
		clk	 : in std_logic;
		reset  : in std_logic
		  
    );
end component;


signal dac_s, dav_s, obfree_s, load_s: std_logic;
signal d_s,dd_s: std_logic_vector(3 downto 0);


begin
u_key_decode: key_decode port map( 
		Kack => dac_s,
		Lines => Lines,
		Columns => Columns,
		Kval => dav_s,
		K => d_s,
		reset => reset,
		Mclk => Mclk
);

u_ringbuffer: ringbuffer port map(
		CTS => obfree_s,
		DAV => dav_s,
		D => d_s,
		wreg => load_s,
		Q => dd_s,
		DAC => dac_s,
		reset => reset,
		clk => Mclk
		
);

u_outputbuffer: outputbuffer port map(
		load => load_s,
		D => dd_s,
		ACK => kack,
		OBfree => obfree_s,
		Q => Q,
		dval => dval,
		clk => Mclk,
		reset => reset
);




end arq;	