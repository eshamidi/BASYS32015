----------------------------------------------------------------------------------

-- Engineer: Cascade Register - Esmail Hamidi October 2015

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity cascade_reg is
    Port ( X :   in std_logic_vector(3 downto 0);
           Z1 : out std_logic_vector(3 downto 0);
           Z2 : out std_logic_vector(3 downto 0);
       en, ck, btn0, btn1 : in std_logic);
end cascade_reg;

architecture structural of cascade_reg is

component reg
generic (n: natural); 

Port ( ck, ld_en : in std_logic;
       x         : in std_logic_vector(n-1 downto 0);
       z         : out std_logic_vector(n-1 downto 0)); 
        
end component; 

signal w : std_logic_vector(3 downto 0); 
signal ck_step : std_logic; 


begin
R1: reg generic map (4)
    port map(x=>x, z=>w, ck=>ck, ld_en=> en);

R2: reg generic map (4)
    port map(x=>w, z=>Z2, ck=>ck, ld_en=>en);
    
Z1 <= w; 

process(ck)
type state is (not_rdy, rdy, pulse);
variable ns: state;
begin

if ck='1' and ck'event then
    case ns is 
        when not_rdy => ck_step <= '0';
        if btn1 = '1' then ns := rdy; 
        end if; 
        when rdy => ck_step <= '0';
        if btn0 = '1' then ns := pulse; 
        end if; 
        when pulse => ck_step <= '1';
        ns := not_rdy;
        when others =>null; 
        end case; 
end if;

end process; 
         



end structural;

