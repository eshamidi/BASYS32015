-- HW2 Problem 3 Esmail Hamidi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity threshgate is
  generic (n : natural;
           k : natural);


port(x: in std_logic_vector(1 to n);
     z: out std_logic);
     
     
end threshgate;

architecture Behavioral of threshgate is

begin

process(x)
    
variable acc : integer;

begin

    
for i in 1 to n loop

    if x(i) = '1' then 

        acc := acc + 1;

    end if; 

end loop; 

if acc >= k then

z <= '1'; 

else

z <= '0';
end if; 

acc := 0;

end process; 


end Behavioral;
