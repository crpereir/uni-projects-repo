LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY maquinaestados IS
PORT(	B, Reset, TC,CLK : in std_logic;
V, EP, PL, CLEAR, CE, A, S, VP, E : out std_logic
);
END maquinaestados;

ARCHITECTURE arq_maquinaestados OF maquinaestados IS

component FFD
port (CLK, RESET, SET, D, EN : in std_logic;
Q : out std_logic
		);
end component;


SIGNAL D0, D1,Q1, Q0  : STD_LOGIC;

BEGIN

UFFD: FFD port map (
CLK => CLK,
RESET => RESET,
SET => '0',
D => D1,
EN => '1' ,
Q => Q1
);

UFFD1: FFD port map (
CLK => CLK,
RESET => RESET,
SET => '0' ,
D => D0,
EN => '1' ,
Q => Q0
);


V <= (not Q1) and (not Q0);
EP <= ((not Q1) and (not Q0)) or ((not Q1) and Q0) or (Q1 and (not Q0));
PL <= ((not Q1) and (not Q0)) or (Q1 and (not Q0));
clear <= (not Q1) and (not Q0);
CE <= ((not Q1) and (not Q0)) or ((not Q1) and Q0) or (Q1 and (not Q0)) or (Q1 and Q0);
A <= (not Q1) and Q0;
S <= Q1 and (not Q0);
VP <= Q1 and Q0;
E <= (Q1 and (not Q0)) or (Q1 and Q0);
D0 <= ((not Q1) and (not Q0) and B) or ((not Q1) and Q0 and (not TC)) or (Q1 and (not Q0) and (not TC)) or (Q1 and Q0 and (not TC));
D1 <= ((not Q1) and Q0 and TC) or (Q1 and (not Q0) and TC) or (Q1 and (not Q0) and (not TC)) or (Q1 and Q0 and (not TC));

END arq_maquinaestados;