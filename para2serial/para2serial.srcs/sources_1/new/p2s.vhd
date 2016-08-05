

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity p2s is
  Port (ck,  btn0, btn1 : in std_logic; 
    x: in std_logic_vector(3 downto 0);
    z: out std_logic;
    f: out std_logic_vector(3 downto 0));
end p2s;

architecture Behavioral of p2s is
signal en : std_logic;

begin 
process(ck)

type db_state is(not_rdy, rdy, pulse);
variable db_ns: db_state; 
variable n : std_logic_vector(3 downto 0);
variable count : integer := 0;

begin

if ck = '1' and ck'event then 

case db_ns is 
    when not_rdy => en <= '0';
    if btn1 ='1' then db_ns := rdy;
    end if; 
    when rdy => en <= '0';
    if btn1 = '1' then db_ns := pulse; 
    end if; 
    when pulse => en <= '1';
    db_ns := not_rdy; 
    when others => null; 
end case; 
end if; 

f <= x;
if en'event and en = '1' and count = 3 then
n :=  x ;
count := 0; 
end if; 

if en'event and en = '1' then 
z <= n(count);
count := count +1; 
end if; 

 

end process; 


end Behavioral;
