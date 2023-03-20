LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Flipflop1 IS
PORT(	B : in std_logic;
		Reset : in std_logic;
		TC : in std_logic;
		V : out std_logic;
		EP : out STD_LOGIC;
		PL : out std_logic;
		clear : out STD_LOGIC;
		CE : out STD_LOGIC;
		A : out std_logic;
		S : out std_logic;
		VP : out std_logic;
		E : out std_logic
		);
END Flipflop1;

ARCHITECTURE logicFunction OF Flipflop1 IS

BEGIN

V <= (not Q(1)) and (not Q(0));
EP <= ((not Q(1)) and (not (Q0))) or ((not Q(1)) and Q(0)) or (Q(1) and (not Q(0)));
PL <= (not Q(1)) and (not Q(0));
clear <= (not Q(1)) and (not Q(0));
CE <= ((not Q(1)) and (not Q(0))) or ((not Q(1)) and Q(0)) or (Q(1) and (not Q(0))) or (Q(1) and Q(0));
A <= (not Q(1)) and Q(0);
S <= (not Q(1)) and Q(0);
VP <= Q(1) and Q(0);
E <= (Q(1) and (not Q(0))) or (Q(1) and Q(0));
D0 <= ((not Q(1)) and (not Q(0)) and B) or ((not Q(1)) and Q(0) and (not TC)) or (Q(1) and (not Q(0)) and (not TC)) or (Q(1) and Q(0) and (not TC));
D1 <= ((not Q(1)) and Q(0) and TC) or (Q(1) and (not Q(0)) and TC) or (Q(1) and (not Q(0)) and (not TC)) or (Q(1) and Q(0) and (not TC));

END LogicFunction;