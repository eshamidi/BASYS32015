----------------------------------------------------------------------------------
-- Register Bank Part 2: 7 segment display

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity segment is
  Port (sw    : in std_logic_vector(7 downto 0);
        z     : out std_logic_vector(7 downto 0);
       btns   : in std_logic_vector(3 downto 0);
       disp_en: out std_logic_vector(3 downto 0) );
end segment;

architecture Behavioral of segment is

begin

process(sw, btns)

variable temp : std_logic_vector(1 downto 0);

begin 

-- logic selector, assigns 
case btns is 
    when "1000" => temp := sw(7 downto 6); 
        disp_en <= "0111";
    when "0100" => temp := sw(5 downto 4); 
        disp_en <= "1011";
    when "0010" => temp := sw(3 downto 2); 
        disp_en <= "1101";    
    when "0001" => temp := sw(1 downto 0); 
        disp_en <= "1110";   
    when others => temp := "00"; 
        disp_en <= "1111";
end case;

-- decodes temp into 7 seg display signal 
case temp is 
    when "00" => z <= "00000011"; 
    when "01" => z <= "10011111"; 
    when "10" => z <= "00100101"; 
    when "11" => z <= "00001101";    
    when others => null;
    
end case;

end process;

              
            
                 
end Behavioral;
