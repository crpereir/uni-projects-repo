LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity ring_controller is port ( 
      dAv : in std_logic;
		empty:in std_logic;
		full : in std_logic;
		cts: in std_logic;
		clk : in std_logic;
		reset : in std_logic;
		wr: out std_logic;
		sel_pg: out std_logic;
		incPut: out std_logic;
		incGet: out std_logic;
		wReg : out std_logic;
		dAc: out std_logic
		
		
);
end ring_controller;


architecture arq of ring_controller is


type STATE_TYPE is (STATE_WAITING, STATE_SET_PUT, STATE_WRITING, STATE_PUT,STATE_DAC,
STATE_SET_GET,STATE_READING,STATE_GET);


signal currentState, nextState: STATE_TYPE;


begin 

currentState <= STATE_WAITING when reset = '1' else nextState when rising_edge(clk); 


generatenextState:
process(currentState, dAv, empty, full, cts)--INPUT'S
    begin
        case currentState is 
            when STATE_WAITING   => if (dAv = '1' and full= '0') then 
													nextState <= STATE_SET_PUT;
                                  elsif (dAv = '1' and full = '1' and cts ='1') then
													nextState <= STATE_SET_GET;
											elsif (dAv = '1' and full = '1' and cts ='0') then
													nextState <= STATE_WAITING;
											elsif (dAv = '0' and empty = '1' ) then
													nextState <= STATE_WAITING;
											elsif (dAv = '0' and empty = '0' and cts ='1') then
													nextState <= STATE_SET_GET;
											 else 
												nextState <= STATE_WAITING; 
                                  end if;
											 
											 
            when STATE_SET_PUT   => nextState <= STATE_WRITING;
				
				 when STATE_WRITING   => nextState <= STATE_PUT;
												 
												 
				when STATE_PUT   => nextState <= STATE_DAC;
											 
											 
				when STATE_DAC    => if (dAv = '1') then 
				                           nextState <= STATE_DAC;
											 else 
												   nextState <= STATE_WAITING;
										    end if;
				when STATE_SET_GET   => nextState <= STATE_READING;
				
				when STATE_READING   => nextState <= STATE_GET;
				
				 when STATE_GET   => nextState <= STATE_WAITING;
												 
end case;
end process;


-- generate outputs
dAc <= '1' when (currentState = STATE_DAC) else '0';

wr <= '1' when (currentState = STATE_WRITING) else '0';
             
incGet<= '1' when (currentState = STATE_GET) else '0';

incPut<= '1' when (currentState = STATE_PUT) else '0';

sel_pg<= '1' when (currentState = STATE_SET_PUT or currentState = STATE_WRITING or currentState = STATE_PUT) else '0';

wReg<= '1' when (currentState = STATE_READING) else '0';







end arq;