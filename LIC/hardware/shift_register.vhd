

-- shift register

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity shift_register is port ( 
		data: in std_logic;
		clk : in std_logic;
		enable : in std_logic;
		D: out std_logic_vector (4 downto 0);
		reset : in std_logic
);
	 
end shift_register;

architecture arq of shift_register is

component FFD is port (
		clk : in std_logic;
		reset : in std_logic;
		set : in std_logic;
		D : in std_logic;
		EN : in std_logic;
		Q : out std_logic
);
		
end component;

signal q : std_logic_vector(4 downto 0);

begin

u_ffd0 : FFD port map (
			EN => enable,
			reset => reset,
			set => '0',
			clk => clk,
			D => data,
			Q => q(0)
);
		
u_ffd1 : FFD port map (
			EN => enable,
			reset => reset,
			set => '0',
			clk => clk,
			D => q(0),
			Q => q(1)
);

u_ffd2 : FFD port map (
			EN => enable,
			reset => reset,
			set => '0',
			clk => clk,
			D => q(1),
			Q => q(2)
);

u_ffd3 : FFD port map (
			EN => enable,
			reset => reset,
			set => '0',
			clk => clk,
			D => q(2),
			Q => q(3)
);	

u_ffd4 : FFD port map (
			EN => enable,
			reset => reset,
			set => '0',
			clk => clk,
			D => q(3),
			Q => q(4)
);


D(0) <= q(4);
D(1) <= q(3);
D(2) <= q(2);
D(3) <= q(1);
D(4) <= q(0);

end arq;
