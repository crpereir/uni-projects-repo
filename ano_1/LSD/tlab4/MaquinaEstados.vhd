library ieee;
use ieee.std_logic_1164.all;

entity MaquinaEstados is
port(	START, TC : in std_logic; 
		EP : in std_logic_vector(1 downto 0);
		PL, CE, CLEAR, RST, Eacc, Er: out std_logic;
		ES : out std_logic_vector(1 downto 0)
		);
end MaquinaEstados;

architecture logicFunction of MaquinaEstados is

signal data : std_logic_vector(7 downto 0);
signal address : std_logic_vector(3 downto 0);

begin

address <= EP & START & TC;

ES <= data(7 downto 6);
PL <= data(5);
RST <= data(4);
CLEAR <= data(3);
CE <= data(2);
Eacc <= data(1);
Er <= data(0);

data <= "01111101" when address = "0000" else
		  "01111101" when address = "0001" else
		  "00111101" when address = "0010" else
        "00111101" when address = "0011" else
        "01000110" when address = "0100" else
		  "10000000" when address = "0101" else
		  "01000110" when address = "0110" else
        "10000000" when address = "0111" else
		  "10000000" when address = "1000" else
		  "10000000" when address = "1001" else
		  "00000000" when address = "1010" else
		  "00000000"; 
		
end logicFunction;