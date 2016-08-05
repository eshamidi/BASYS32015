
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity regbuf is
 Port (x : in std_logic;
       btn1, btn0, ck : in std_logic;
       z : out std_logic;
        );
end regbuf;

architecture Behavioral of regbuf is

begin

signal en: std_logic;
type db_state is (not_rdy, rdy, pulse);
signal db_ns: db_state;

type sw_state is (ld1out2, ld2out1);
signal flop: sw_state; 
signal temp1, temp2  : std_logic_vector(3 downto 0); 
signal sel : std_logic; 

process(x)

begin

if en = '1' and en'event then
    sel := not sel; 
end if; 


if sel = '1' then 
        flop := ld1out2;
elsif sel = '0' then
        flop := ld2out1; 
end if; 


case flop is
    when ld1out2 =>
        temp1 := x;
        z <= temp2;
    when ld2out1 =>
        temp2 := x; 
        z <= temp1;
end case; 
    





-- debouncer jawn 
process(ck)

        begin
        
        if ck='1' and ck'event then
            case db_ns is
                when not_rdy =>
                    if btn0 = '1' then 
                    db_ns <= rdy; 
                    end if;
                    en <= '0';
                when rdy =>
                    if btn1 = '1' then 
                    db_ns <= pulse;
                    end if;
                    en <= '0';
                when pulse =>
                    db_ns <= not_rdy;
                    en <= '1';
                when others => null;
            end case;
            
        end if;
        
    end process;





end Behavioral;
