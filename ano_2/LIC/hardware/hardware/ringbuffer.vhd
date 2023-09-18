
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity ringbuffer is port ( 
		D : in std_logic_vector (3 downto 0);
		DAV : in std_logic;
		CTS : in std_logic;
		Q : out std_logic_vector (3 downto 0);
		Wreg : out std_logic;
		DAC : out std_logic;
		clk: in std_logic;
		reset: in std_logic
);
	 
end ringbuffer;
	
architecture arq of ringbuffer is

component RAM is 
	generic(
		ADDRESS_WIDTH : natural := 3;
		DATA_WIDTH : natural := 4
	);
	port(
		address : in std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
		wr: in std_logic;
		din: in std_logic_vector(DATA_WIDTH - 1 downto 0);
		dout: out std_logic_vector(DATA_WIDTH - 1 downto 0)
	);
		
end component;



component mac is port (
		  put_notGet :in std_logic;
        clk : in std_logic;
		  reset : in std_logic;
        incPut : in std_logic;     
        incGet : in std_logic;
        address : out std_logic_vector (2 downto 0); 
        empty : out std_logic;
		  full: out std_logic
);
end component;



component ring_controller is port (
		dAv : in std_logic;
		empty:in std_logic;
		full : in std_logic;
		cts: in std_logic;
		clk : in std_logic;
		reset : in std_logic;
		wr: out std_logic;
		sel_pg: out std_logic;
		incPut: out std_logic;
		incGet: out std_logic;
		wReg : out std_logic;
		dAc: out std_logic
	);
end component;



	


signal wr_s, sel_pg_s, incPut_s, incGet_s : std_logic;
signal empty_s, full_s: std_logic;
signal address_s: std_logic_vector (2 downto 0);



begin
u_ram : RAM port map (
		din => D,
		wr => wr_s,
		address => address_s,
		dout => Q
);
	

u_mac: mac port map(
		put_notget => sel_pg_s,
		incPut => incPut_s,
		incGet => incGet_s,
		full => full_s,
		empty => empty_s, 
		clk => clk,
		reset => reset,
		address => address_s
);	
	
	
	
u_ring_controller: ring_controller port map (
		dAv => DAV,
		CTS => CTS,
		full => full_s,
		empty => empty_s,
		DAC => DAC,
		wreg => wreg,
		incPut => incPut_s,
		incGet => incGet_s,
		sel_pg => sel_pg_s,
		wr => wr_s,
		reset => reset,
		clk => clk
);



end arq;


	