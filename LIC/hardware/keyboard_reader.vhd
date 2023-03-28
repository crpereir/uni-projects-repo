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


begin
	u_key_decode: key_decode port map( 
		Kack => Kack,
		Lines => Lines,
		Columns => Columns,
		Kval => Dval,
		K => Q,
		reset => reset,
		Mclk => Mclk
		);

		end arq;	