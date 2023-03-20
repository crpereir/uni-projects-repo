
-- key scan


LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity key_scan is 
    port ( 
        kscan : in std_logic;
        clk : in std_logic;
		  reset : in std_logic;
        L : in std_logic_vector (3 downto 0);     -- linhas
        K : out std_logic_vector (3 downto 0);
        C : out std_logic_vector (2 downto 0);    -- colunas
        kpress : out std_logic
    );
end key_scan;



architecture arq of key_scan is

component counter
    port (
        ce : in std_logic;
        clk : in std_logic;
        Q : out std_logic_vector (3 downto 0);
		  reset: in std_logic
    );
end component;


component dec 
    port (
        S : in std_logic_vector (1 downto 0);
        CL : out std_logic_vector (2 downto 0)
    );
end component;


component mux 
    port (
        S : in std_logic_vector (1 downto 0);
        A : in std_logic_vector (3 downto 0);
        Y : out std_logic
    );
end component;






signal Qs : std_logic_vector (3 downto 0);
signal Cs : std_logic_vector (2 downto 0);
signal Ys : std_logic;


begin



K(0) <= Qs(0);
K(1) <= Qs(1);
K(2) <= Qs(2);
K(3) <= Qs(3);
kpress <= not Ys;
C <= not Cs;



u_counter : counter port map (
        ce => kscan,
        clk => clk,
        Q(0) => Qs(0),
        Q(1) => Qs(1),
        Q(2) => Qs(2),
        Q(3) => Qs(3),
		  reset => reset
);


u_dec : dec port map (
        S(0) => Qs(2),
        S(1) => Qs(3),
        CL => Cs
);
        

u_mux : mux port map (
        A => L,
        Y => Ys,
        S(0) => Qs(0),
        s(1) => Qs(1)
);




end arq;