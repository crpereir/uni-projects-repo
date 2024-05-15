 LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity outputbuffer is port ( 
      Load	 : in std_logic;
	   ACK	 : in std_logic;
		D		 : in std_logic_vector  (3 downto 0);
	   Q      : out std_logic_vector (3 downto 0);
		OBfree : out std_logic;
		Dval	 : out std_logic;
		clk	 : in std_logic;
		reset  : in std_logic
);
	 
end outputbuffer;
	
architecture arq of outputbuffer is

component buffercontroller is port ( 
      Load	 : in std_logic;
	   ACK	 : in std_logic;
	   Wreg 	 : out std_logic;
		OBfree : out std_logic;
		Dval	 : out std_logic;
		clk    : in std_logic;
		reset  : in std_logic
);
end component;

component reg is port (
		F : in std_logic_vector(3 downto 0);
		CE, reset : in std_logic;
		clk : in std_logic;
		Q : out std_logic_vector(3 downto 0)
);
end component;


signal s_Wreg : std_logic;

begin


	
u_BufferControl: buffercontroller port map (
		Load => Load,
		ACK => ACK,
		Wreg => s_Wreg,
		OBfree => OBfree,
		Dval => Dval,
		clk => clk,
		reset => reset
);

u_OutputRegister: reg port map (	
	F => D,
	Q => Q,
	clk => clk,
	CE => s_Wreg,
	reset => reset
	
	
);


end arq;	