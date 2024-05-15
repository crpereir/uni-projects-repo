-- key control


LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity key_control is 
    port ( 
        clk : in std_logic;
        reset : in std_logic;
        Kack : in std_logic;
        Kpress : in std_logic;
        Kval : out std_logic;
        Kscan : out std_logic
    );
end key_control;


architecture arq of key_control is

-- STATE_EMPTY: quando está vazio, só passa para o prox estado qnd Kpress=1
-- STATE_SCANNING: espera pelo input, passa para o proximo estado quando Kack=1 e Kpress=0
-- STATE_SENDING: passa o input para o RingBuffer

type STATE_TYPE is (STATE_SCANNING, STATE_PRESSING, STATE_WAITING);


signal currentState, nextState: STATE_TYPE;

begin 

currentState <= STATE_SCANNING when reset = '1' else nextState when rising_edge(clk); 


generateNextState:
process(currentState,Kack,Kpress)
    begin
        case currentState is 
            when State_Scanning   => if (Kpress='1') then 
                                         NextState <= STATE_PRESSING;
                                     else
                                         NextState <= STATE_SCANNING;
                                     end if;
            when State_Pressing   => if (Kpress='0' and Kack='1') then
                                         NextState <= STATE_WAITING;
                                     else
                                         NextState <= STATE_PRESSING;
                                     end if;
				when State_Waiting    => if (Kack = '0') then 
				                             NextState <= STATE_SCANNING;
												 else 
												     NextState <= STATE_WAITING;
												 end if;	  
    end case;
end process;


-- generate outputs
Kscan <= '1' when (currentState = STATE_SCANNING and Kpress='0') else '0';
             
Kval <= '1' when (currentState = STATE_PRESSING) else '0';






end arq;