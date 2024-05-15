
-- CLK_div

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;

entity clkdiv is generic (div : natural := 25); 
	port (
		 clk_in : in std_logic;
		 clk_out : out std_logic);
end clkdiv;


architecture bhv of clkdiv is

signal count : integer := 1;
signal tmp : std_logic := '0';

	
begin

process (clk_in)
begin

	if (clk_in'event and clk_in = '1') then
		count <= count + 1;
		if (count = div/2) then
			tmp <= not tmp;
			count <= 1;
		end if;
	end if;
end process;

clk_out <= tmp;

end bhv;