-- HW 2 Problem 3 Implementation 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity threshimp is
  Port (X : in std_logic_vector(3 downto 0);
        Z : out std_logic);
end threshimp;

architecture Behavioral of threshimp is

component threshgate
    generic(n:natural := 4;
            k: natural := 2);
    Port ( 
        x: in std_logic_vector(1 to n); 
        z: out std_logic
        );
end component; 

        


begin

U2: threshgate generic map (4,2)
 port map (z => Z, x => X);

end Behavioral;
