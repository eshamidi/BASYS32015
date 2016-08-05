----------------------------------------------------------------------------------
--Esmail Hamidi Register Bank pt. 3
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity viisegii is
  Port (sw    : in std_logic_vector(15 downto 0);
        z     : out std_logic_vector(7 downto 0);
       disp_en: out std_logic_vector(3 downto 0);
     ck,reset, ld : in std_logic);
end viisegii;

architecture Behavioral of viisegii is

Type My_state is (s0, s1, s2, s3); -- state machine for display mux 
signal n_s : my_state;
signal ck_div : std_logic;
signal sw_sel : std_logic_vector(0 to 3); 

begin

process(sw_sel,ld, ck_div)

variable temp : std_logic_vector(3 downto 0);
variable temp2: std_logic_vector(3 downto 0); 

begin 




case sw_sel is 
    when "1000" => temp := sw(15 downto 12);
    when "0100" => temp := sw(11 downto 8); 
    when "0010" => temp := sw(7 downto 4); 
    when "0001" => temp := sw(3 downto 0); 
    when others => temp := "0000";
end case;



case temp is 
   when "0000" => z <= "00000011";  -- 0
   when "0001" => z <= "10011111";
   when "0010" => z <= "00100101";
   when "0011" => z <= "00001101";
   when "0100" => z <= "10011001";
   when "0101" => z <= "01001001"; 
   when "0110" => z <= "01000001"; -- 6
   when "0111" => z <= "00011111"; -- 7
   when "1000" => z <= "00000001"; -- 8
   when "1001" => z <= "00001001"; -- 9
   when "1010" => z <= "00010001"; -- A
   when "1011" => z <= "11000001"; -- B 
   when "1100" => z <= "01100011"; -- C 
   when "1101" => z <= "10000101"; -- D
   when "1110" => z <= "01100001"; -- E
   when "1111" => z <= "01110001"; -- F
   when others => null;   
end case; 


end process; 

process(ck_div)
begin 
if ck_div'event and ck_div = '1' then
case n_s is 
    when s0 => sw_sel <= "1000"; 
        disp_en <= "0111";
        n_s <= s1;
    when s1 => sw_sel <= "0100"; 
        disp_en <= "1011";
        n_s <= s2;   
    when s2 => sw_sel <= "0010"; 
        disp_en <= "1101";
        n_s <= s3;
    when s3 => sw_sel <= "0001"; 
        disp_en <= "1110";
        n_s <= s0;  
end case;
end if;
end process;


process(ck)

variable count : integer;

begin           -- clock divider 
if ck = '1' and ck'event then
    if reset = '1' then
        count := 0;
        ck_div <= '0';
    elsif reset = '0' then
        if count = 99999 then
            ck_div <= not ck_div;
            count := 0; 
        else 
            count := count +1;
        end if;
    end if;
end if;

end process; 

         
end Behavioral;
