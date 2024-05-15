	-- dispatcher

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity dispatcher is port ( 
      dval : in std_logic;
	   din : in std_logic_vector (4 downto 0);
	   wrl : out std_logic;
	   dout : out std_logic_vector(4 downto 0);
		done : out std_logic;
		clk : in std_logic; 
		reset : in std_logic
);
end dispatcher;

architecture arq of dispatcher is


type STATE_TYPE is (STATE_INITIAL, STATE_WAITING, STATE_DONE);


signal currentState, nextState: STATE_TYPE;


begin 

currentState <= STATE_INITIAL when reset = '1' else nextState when rising_edge(clk); 


generatenextState:
process(currentState, dval)
    begin
        case currentState is 
            when STATE_INITIAL   => if (dval = '1') then 
													nextState <= STATE_WAITING;
                                  else
													nextState <= STATE_INITIAL;
                                  end if;
											 
											 
            when STATE_WAITING   => nextState <= STATE_DONE;
												 
												 
				when STATE_DONE   => if (dval = '0') then 
				                           nextState <= STATE_INITIAL;
										    else 
												   nextState <= STATE_DONE;
											 end if;	  
											 
											 
			
end case;
end process;


-- generate outputs
wrl <= '1' when (currentState = STATE_WAITING) else '0';

done <= '1' when (currentState = STATE_DONE) else '0';
       

dout <= din;		 

end arq;

