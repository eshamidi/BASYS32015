
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity t2gate is
generic ( n: natural;
           k1: natural;
           k2 : natural); 
           
  Port (    x: in std_logic_vector(n-1 downto 0);
            z: out std_logic_vector(1 downto 0) );
end t2gate;

architecture Behavioral of t2gate is
    



begin

process(x)

variable t1 : integer;
begin 

    
for i in 0 to n-1 loop -- loop 1: count input 

    if x(i) = '1' then 

        t1 := t1 + 1;

    end if; 

end loop; 


if t1 < k1 then

z <= "01"; 

elsif t1 > k1 and t1 < k2 then
z <= "10";
elsif t1 > k2 then
z <= "11";
end if; 

end process; 


end Behavioral;
