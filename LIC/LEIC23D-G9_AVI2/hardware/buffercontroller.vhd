
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity buffercontroller is 
    port ( 
      Load	 : in std_logic;
	   ACK	 : in std_logic;
	   Wreg 	 : out std_logic;
		OBfree : out std_logic;
		Dval	 : out std_logic;
		clk	 : in std_logic;
		reset	 : in std_logic
    );
end buffercontroller;


architecture arq of buffercontroller is


type STATE_TYPE is (STATE_FREE, STATE_REGISTERING, STATE_CONSUME, STATE_DONE);


signal currentState, nextState: STATE_TYPE;


begin 

currentState <= STATE_FREE when  reset = '1' else nextState when rising_edge(clk); 


generateNextState:
process(currentState, Load, ACK)
    begin
        case currentState is 
            when State_FREE	  		  => if (Load = '1') then 
                                         NextState <= STATE_REGISTERING;
                                     else
                                         NextState <= STATE_FREE;
                                     end if;
            when State_REGISTERING    => if (Load = '0') then
                                         NextState <= STATE_CONSUME;
                                     else
                                         NextState <= STATE_REGISTERING;
                                     end if;
				when State_CONSUME	    => if (ACK = '1') then 
				                             NextState <= STATE_DONE;
												 else 
												     NextState <= STATE_CONSUME;
												 end if;	  
				when State_DONE		    => if (ACK = '0') then 
				                             NextState <= STATE_FREE;
												 else 
												     NextState <= STATE_DONE;
												 end if;	 								 
												 
    end case;
end process;


-- generate outputs

Wreg   <= '1' when (currentState = STATE_REGISTERING ) else '0';
             
Dval   <= '1' when (currentState = STATE_CONSUME) else '0';

OBfree <= '1' when (currentState = STATE_FREE) else '0';




end arq;