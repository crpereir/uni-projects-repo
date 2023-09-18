LIBRARY IEEE;
use IEEE.std_logic_1164.all;
entity Registo is

port(F: in STD_LOGIC_VECTOR (3 downto 0);
clk_out: in std_logic;
CE: in std_logic;
A: out STD_LOGIC_VECTOR (3 downto 0)
);
end Registo;

architecture arq_registo of Registo is


component FFD
PORT(	CLK : in std_logic;
		RESET : in STD_LOGIC;
		SET : in std_logic;
		D : IN STD_LOGIC;
		EN : IN STD_LOGIC;
		Q : out std_logic
		);
end component;


signal EN : STD_LOGIC;

BEGIN
UFFD: FFD port map (
CLK => clk_out,
RESET => '0',
D => F(0),
Q => A(0),
EN => CE,
SET => '0'
);

UFFD1: FFD port map (
CLK => clk_out,
RESET => '0',
D => F(1),
Q => A(1),
EN => CE,
SET => '0'
);

UFFD2: FFD port map (
CLK => clk_out,
RESET => '0',
D => F(2),
Q => A(2),
EN => CE,
SET => '0'
);

UFFD3: FFD port map (
CLK => clk_out,
RESET => '0',
D => F(3),
Q => A(3),
EN => CE,
SET => '0'

);

end arq_Registo;