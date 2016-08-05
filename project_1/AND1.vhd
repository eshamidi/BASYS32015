
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND1 is
    Port (
        x, y: in std_logic;
        z: out std_logic
    );
end AND1;

architecture dataflow of AND1 is

    begin
    
z <= x and y;

end dataflow;
