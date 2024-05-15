LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity serial_control is port ( 
      enRx : in std_logic;
	   accept : in std_logic;
	   eq5 : in std_logic;
	   clr : out std_logic;
		wr : out std_logic;
		DXval : out std_logic;
		reset : in std_logic;
		clk : in std_logic;
		busy : out std_logic
);
end serial_control;


architecture arq of serial_control is


type STATE_TYPE is (STATE_CLEAR, STATE_WHILE, STATE_VALUE, STATE_WAIT);


signal currentState, nextState: STATE_TYPE;


begin 

currentState <= STATE_CLEAR when reset = '1' else nextState when rising_edge(clk); 


generatenextState:
process(currentState, enRx, eq5, accept)
    begin
        case currentState is 
            when STATE_CLEAR   => if (enRx = '0') then 
													nextState <= STATE_WHILE;
                                  else
													nextState <= STATE_CLEAR;
                                  end if;
											 
											 
            when STATE_WHILE   => if (eq5 = '1' and enRx = '1') then
													nextState <= STATE_VALUE;
											 elsif(enRx='1' and eq5='0') then
													nextState <= STATE_CLEAR;
                                  else
                                       nextState <= STATE_WHILE;
                                     end if;
												 
												 
				when STATE_VALUE   => if (accept = '1') then 
				                           nextState <= STATE_WAIT;
										    else 
												   nextState <= STATE_VALUE;
											 end if;	  
											 
											 
				when STATE_WAIT    => if (accept = '0') then 
				                           nextState <= STATE_CLEAR;
											 else 
												   nextState <= STATE_WAIT;
										    end if;	 								 
												 
end case;
end process;


-- generate outputs
clr <= '1' when (currentState = STATE_CLEAR) else '0';

wr <= '1' when (currentState = STATE_WHILE and enRx = '0') else '0';
             
DXval <= '1' when (currentState = STATE_VALUE) else '0';

busy <= '1' when (currentState = STATE_VALUE  or currentState = STATE_WAIT) else '0';




end arq;
