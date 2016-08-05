-- Hw 2 Problem 1 - Esmail Hamidi 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity orgate is
    generic (n: natural);
    Port (
        x: in std_logic_vector(1 to n);
        z: out std_logic
    );
end orgate;

architecture Behavioral of orgate is

    begin
    
    process(x)
        variable temp: std_logic;
        
        begin
        
        temp := '0';
        for i in 1 to n loop
            temp := temp or x(i);
        end loop;
        z <= temp;
    end process;

end Behavioral;