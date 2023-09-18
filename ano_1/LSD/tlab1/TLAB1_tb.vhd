LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity TLAB1 is
end TLAB1;

architecture Arq of TLAB1 is
component Circuit
  port(I : in STD_LOGIC_VECTOR(3 downto 0);
  sel : in STD_LOGIC_VECTOR(1 downto 0);
  R : out STD_LOGIC
  );
end component;

signal I :  std_logic_vector(3 downto 0);
signal sel : std_logic_vector(1 downto 0);
signal R : std_logic;

begin

U0 : Circuit port map (I => I, sel(0) => sel(0),
    sel(1) => sel(1), R => R);

process
begin
 I <= "0101";
 sel(0) <= '0';
 sel(1) <= '0';
 wait for 10 ns;

 I <= "0101";
 sel(0) <= '1';
 sel(1) <= '0';
 wait for 10 ns;

 I <= "0101";
 sel(0) <= '0';
 sel(1) <= '1';
 wait for 10 ns;

 I <= "0101";
 sel(0) <= '1';
 sel(1) <= '1';
 wait for 10 ns;

 I <= "1101";
 sel(0) <= '0';
 sel(1) <= '0';
 wait for 10 ns;

 I <= "1101";
 sel(0) <= '1';
 sel(1) <= '0';
 wait for 10 ns;

 I <= "1101";
 sel(0) <= '0';
 sel(1) <= '1';
 wait for 10 ns;

 I <= "1101";
 sel(0) <= '1';
 sel(1) <= '1';
 wait for 10 ns;


wait;

end process;

end Arq;
