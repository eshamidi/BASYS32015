LIBRARY ieee ; 
USE ieee.std_logic_1164.ALL;
ENTITY serial_add IS

Generic (N : natural := 8);

PORT(
	SIGNAL a, b, clk, en : IN std_logic; 
	SIGNAL s : OUT std_logic_vector (N-1 DOWNTO 0);
	SIGNAL cout, done : OUT std_logic ); 
END serial_add;

ARCHITECTURE behav OF serial_add IS 
	SIGNAL state, carry, sum : std_logic; 
	SIGNAL temp : std_logic_vector (N-1 DOWNTO 0); 

BEGIN
trans_and_count : PROCESS (clk, en )
	VARIABLE counter : INTEGER := 0;
	BEGIN
		IF (en = '0') THEN 
			state <= '0';
			counter := 0;
			temp <=  (others => '0');
			done <=  '0';
		ELSIF clk = '1' and clk'event THEN
			IF (counter < N) THEN 
				done <= '0';
				state <= carry;
				counter := counter + 1; 
				temp(N-1)<= sum;
				FOR i IN N-2 downto 0 LOOP
					temp(i) <= temp(i+1);
				END LOOP;
			ELSE
				done <= '1';
			END IF; 
		END IF; 
	END PROCESS trans_and_count;

cout <=state;

output : PROCESS (a,b,state)
	BEGIN
		sum <= a XOR b XOR state;
		carry <= (a AND b) OR (a AND state) OR (b AND state); 
	END PROCESS output; 

	s <= temp;

END behav; 
	