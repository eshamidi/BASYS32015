----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cascade_reg_3 is
      Port ( X :   in std_logic_vector(3 downto 0);
         Z1 : out std_logic_vector(3 downto 0);
         Z2 : out std_logic_vector(3 downto 0);
     en, ck, btn0, btn1 : in std_logic);
end cascade_reg_3;

architecture Behavioral of cascade_reg_3 is

signal temp1, temp2: std_logic_vector(3 downto 0); 

signal ck_step: std_logic; 


begin

process(ck_step)

begin

if ck_step = '1' and ck_step'event then
    if en = '1' then 
        temp2 <= temp1; temp1 <= X; 
    end if; 
end if; 

end process; 

Z1 <= temp1; 
Z2 <= temp2; 

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

end Behavioral;
