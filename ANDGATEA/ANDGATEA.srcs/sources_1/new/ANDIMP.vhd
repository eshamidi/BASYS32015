
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ANDIMP is
  Port (x : in std_logic_vector(15 downto 0);
        z : out std_logic );
end ANDIMP;

architecture struc of ANDIMP is

component AND1 is
 Port (
       x, y: in std_logic;
       z: out std_logic
   );
end component;

begin

begin

A1 port map(x(i), x(i+1), z <= z);






end struc;
