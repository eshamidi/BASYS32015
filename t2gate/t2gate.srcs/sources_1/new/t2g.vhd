
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity t2g is
  Port ( x: in std_logic_vector(7 downto 0);
         z: out std_logic_vector(1 downto 0));
end t2g;

architecture Behavioral of t2g is



component t2gate
    generic(n:natural := 8;
            k1: natural := 2;
            k2: natural := 4);
    Port ( 
        x: in std_logic_vector(1 to n); 
        z: out std_logic_vector(1 downto 0)
        );
end component; 


begin

U2: t2gate generic map(8,2,4) port map (x => x, z => z);


end Behavioral;
