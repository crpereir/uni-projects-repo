
-- key decode

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity key_decode is 
    port ( 
        Mclk : in std_logic;
		  reset : in std_logic;
        Kack : in std_logic;
		  Lines : in std_logic_vector (3 downto 0);     -- linhas
        Columns : out std_logic_vector (2 downto 0);    -- colunas
        K : out std_logic_vector (3 downto 0);
		  Kval: out std_logic
		  
    );
end key_decode;


architecture arq of key_decode is

component key_scan is port ( 
        kscan : in std_logic;
        clk : in std_logic;
		  reset : in std_logic;
        L : in std_logic_vector (3 downto 0);     -- linhas
        K : out std_logic_vector (3 downto 0);
        C : out std_logic_vector (2 downto 0);    -- colunas
        kpress : out std_logic
    );
end component;



component key_control is port ( 
        clk : in std_logic;
		  reset : in std_logic;
        Kack : in std_logic;     
        Kpress : in std_logic;
        Kval : out std_logic;   
        Kscan : out std_logic
    );
end component;

component clkdiv generic (div: NATURAL := 25000000);
    port (
        clk_in : in std_logic;
        clk_out : out std_logic
    );
end component;


signal  clks,kscan_s, kpress_s: std_logic;

begin 
	u_key_scan: key_scan port map (
		kscan => kscan_s,
		clk => clks,
		reset => reset,
		L => Lines,
		K => K,
		kpress => kpress_s,
		C => Columns
		
);


	u_key_control: key_control port map (
		clk => clks,
		Kack => Kack,
		Kpress => kpress_s,
		reset => reset,
		Kval => kval,
		Kscan => kscan_s
);
u_clk : clkdiv generic map (10000) port map (  -- no simulador meter ´clkdiv generic map (2) port map´ para conseguir ver a onda 
        clk_in => Mclk,
        clk_out => clks
);


end arq;
		
		












