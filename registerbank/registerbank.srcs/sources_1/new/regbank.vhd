----------------------------------------------------------------------------------
-- Project 1: Register Bank 
 -- ECEC 302 Esmail Hamidi 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity regbank is
 port ( x    : in std_logic_vector(1 downto 0); -- 
        LEDS : out std_logic_vector(7 downto 0);
        btns : in std_logic_vector(3 downto 0);
        ck   : in std_logic); 
        
end regbank;

architecture Behavioral of regbank is

signal r0, r1, r2, r3: std_logic_vector(1 downto 0); 


begin

-- wiring register contents to output LEDs 
LEDS(7 downto 6) <= r3; 
LEDS(5 downto 4) <= r2;
LEDS(3 downto 2) <= r1;
LEDS(1 downto 0) <= r0;

process(ck)

-- selective load into reg banks using buttons 
begin 
if ck ='1' and ck'event then
    case btns is
        when "1000" => r0 <= x;
        when "0100" => r1 <= x;
        when "0010" => r2 <= x;
        when "0001" => r3 <= x;
        when others => null;
    end case;
end if; 

end process;    
 
end Behavioral;
