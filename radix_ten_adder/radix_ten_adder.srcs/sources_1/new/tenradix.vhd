library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity tenradix is

    generic (r : natural := 5; -- r radix
             n : natural := 3);-- # of bits  - n is the least integer > log r

port (  x, y : in std_logic_vector(n-1 downto 0);
        ck,btn0,btn1, reset: in std_logic;
         z : out std_logic_vector(n-1 downto 0));

end tenradix;

architecture Behavioral of tenradix is
    
    

signal en: std_logic;
type db_state is (not_rdy, rdy, pulse);
signal db_ns: db_state;

type state is (no_carry, carry);
signal n_s: state := no_carry;
    
begin 

process(x,y,en)
variable temp_x, temp_y, temp_z: std_logic_vector(n downto 0); 

begin



if en = '1' and en'event then 
temp_x := '0'&x;
temp_y := '0'&y;
    if reset = '1' then 
        n_s <= no_carry;
    else
        case n_s is 
            when no_carry =>
                temp_z := unsigned(temp_x) + unsigned(temp_y);
                 -- add together unsigned ints 
                if temp_z >= r then
                     n_s <= carry; 
                end if; 
            when carry => 
                temp_z := temp_z - r; 
            when others => null; 
         end case; 
     end if; 
end if;               
z <= temp_z(n-1 downto 0); 




end process;

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
