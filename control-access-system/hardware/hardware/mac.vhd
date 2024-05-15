LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity mac is 
    port ( 
		put_notGet :in std_logic;
        clk : in std_logic;
		  reset : in std_logic;
        incPut : in std_logic;     
        incGet : in std_logic;
        address : out std_logic_vector (2 downto 0); 
        empty : out std_logic;
		  full: out std_logic
    );
end mac;

architecture arq of mac is

component mac_counter
    port (
		incGet : in std_logic;
        ce : in std_logic;
        clk : in std_logic;
        Q : out std_logic_vector (3 downto 0);
		  reset: in std_logic
    );
end component;

component counter
    port (
		CE, reset : in std_logic;
		clk : in std_logic;
		Q : out std_logic_vector(3 downto 0)
    );
end component;

component mux2X1
    port (
        S : in std_logic;
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
		  Y : out std_logic_vector(3 downto 0)
    );
end component;


signal put_signal : std_logic_vector (3 downto 0);
signal get_signal : std_logic_vector (3 downto 0);
signal Ys, ce_s : std_logic;
signal mac_counter_out_s: std_logic_vector (3 downto 0);
signal none : std_logic;

begin

u_counterPut : counter port map (
        ce => incPut,
        clk => clk,
		  reset => reset,
		  Q => put_signal
);

u_counterGet : counter port map (
        ce => incGet,
        clk => clk,
		  reset => reset,
		  Q => get_signal
		  
);
u_mac_counter : mac_counter port map(
		incGet => incGet,
        ce =>  ce_s,
        clk => clk,
        Q => mac_counter_out_s,
		  reset=> reset
);

u_mux : MUX2x1 port map (
			A => put_signal,
			B => get_signal,
			S=>put_notGet,
			Y(3) => none,
			Y(2 downto 0) => address
			
);

 empty <= not mac_counter_out_s(0) and not mac_counter_out_s(1) 
		 and not mac_counter_out_s(2) and not  mac_counter_out_s(3);	

			
full <= not mac_counter_out_s(0) and not mac_counter_out_s(1) 
		 and not mac_counter_out_s(2) and  mac_counter_out_s(3);

			
ce_s <= incGet or incPut;
end arq;