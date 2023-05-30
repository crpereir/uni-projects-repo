LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity door_controller is port ( 
      dval : in std_logic;
		din: in std_logic_vector (4 downto 0);
		sopen:in std_logic;
		sclose : in std_logic;
		psensor: in std_logic;
		onoff: out std_logic;
		dout : out std_logic_vector (4 downto 0);
		done : out std_logic;
		reset : in std_logic;
		clk : in std_logic
);
end door_controller;


architecture arq of door_controller is


type STATE_TYPE is (STATE_WAITING, STATE_OPEN, STATE_CLOSE, STATE_END);


signal currentState, nextState: STATE_TYPE;


begin 

currentState <= STATE_WAITING when reset = '1' else nextState when rising_edge(clk); 


generatenextState:
process(currentState, dval, din, sopen, psensor, sclose)
    begin
        case currentState is 
            when STATE_WAITING   => if (dval = '1' and din(0) = '0') then 
													nextState <= STATE_CLOSE;
                                  elsif (dval = '1' and din(0) = '1') then
													nextState <= STATE_OPEN;
											 else 
												nextState <= STATE_WAITING; 
                                  end if;
											 
											 
            when STATE_CLOSE   => if (psensor = '1') then
													nextState <= STATE_OPEN;
											 elsif(psensor ='0' and sclose='0') then
													nextState <= STATE_CLOSE;
                                  else
                                       nextState <= STATE_END;
                                  end if;
												 
												 
				when STATE_OPEN   => if (sopen = '0') then 
				                           nextState <= STATE_OPEN;
										    elsif (sopen ='1' and din(0) = '1') then
												   nextState <= STATE_END;
											 else 
													nextState <= STATE_CLOSE;
											 end if;	  
											 
											 
				when STATE_END    => if (dval = '1') then 
				                           nextState <= STATE_END;
											 else 
												   nextState <= STATE_WAITING;
										    end if;	 								 
												 
end case;
end process;


-- generate outputs
onoff <= '1' when (currentState = STATE_OPEN) or (currentState = STATE_CLOSE) else '0';

dout(0) <= '1' when (currentState = STATE_OPEN) else '0';
             
done <= '1' when (currentState = STATE_END) else '0';
dout(4 downto 1) <= din(4 downto 1);




end arq;
