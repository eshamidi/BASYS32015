library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; -- to_integer()
use IEEE.math_real.all; -- power

entity mux_comp is
    generic (n: natural);
    Port (
        x: in std_logic_vector(0 to 2*n-1);
        z: out std_logic;
        s: in std_logic_vector(n-1 downto 0)
    );
end mux_comp;

architecture Behavioral of mux_comp is
    begin

    process(s,x)
        variable temp : integer := 0;
    
        begin
        
        case s is 
            when "00" =>
                z <= x(0);
            when "01" =>
                z <= x(1);
            when "10" =>
                z <= x(2);
            when "11" =>
                z <= x(3);
            when others =>
                z <= '1';
        end case;
        z <= x(to_integer(unsigned(s)));
        for i in 0 to 2*n-1 loop
            if x(i) = '1' then
                temp := temp + 2**i;
            end if;
        end loop;
       z <= x(temp);
    end process;
end Behavioral;