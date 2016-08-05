

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity andtry is
  Port (x : in std_logic_vector(15 downto 0); 
        z: out std_logic );
end andtry;

architecture struc of andtry is

component AND1 is 
    Port (
    x, y: in std_logic;
    z: out std_logic
);
end component; 


signal oot : std_logic_vector(7 downto 0); 
signal oot2 : std_logic_vector(3 downto 0); 
signal oot3 : std_logic_vector(1 downto 0); 


begin

g1: for i in 0 to 7 generate
 
 cell: AND1 port map(x(i), x(i+1), oot(i));
end generate g1;



g3: if i > 7 and i < 10 generate
 cell: AND1 port map(oot(i), oot(i+1), oot2(i));
 end generate g3;

g4: if i > 10 generate  


end struc;
