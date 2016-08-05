
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ANDORSEL is
    Port (
        x, y, sel: in std_logic;
        z: out std_logic
    );
end ANDORSEL;

architecture dataflow of ANDORSEL is

begin
    
if sel = '1' then 
    
    z <= x and y;
end if; 
if sel = '0' then 
    z <= x or y; 
end if; 

end dataflow;
