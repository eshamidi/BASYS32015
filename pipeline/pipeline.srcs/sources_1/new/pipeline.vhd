
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity pipeline is
generic (N: natural := 4);
port(                   x : in    std_logic_vector(N-1 downto 0);
                        y : in    std_logic;
                        z : out  std_logic;
                        ck, reset,b1,b2 : in    std_logic);
end pipeline;

architecture struc of pipeline is

-- individual cells 
component PE
port( x_i,y_i,c_in,ps_in: in std_logic;
y_out,c_out,ps_out: out std_logic;
ck, reset: in std_logic);
end component;

-- d flip flop - remember previous state for time delay 
component DFF
port( x, reset, ck : in std_logic;
	z  : out std_logic);

end component;

-- wires declaration
signal yy, c, ps: std_logic_vector(n-1 downto 0);
signal w, en: std_logic;
type state is (idle, loading, shifting);
signal n_s : state := idle;


begin
D: DFF port map(w, reset, en, ps(n-1)); 

g1: for i in 0 to n-1 generate

        g2: if i=0 generate
        cell: PE port map(x(i), yy(i), c(i), ps(i), yy(i+1), c(i+1), z, en, reset); 
        end generate g2;
        
        g3: if i > 0 and i < n-1 generate
        cell: PE port map(x(i), yy(i), c(i), ps(i), yy(i+1), c(i+1), ps(i-1), en, reset); 
        end generate g3;
        
        g4: if i=n-1 generate
        cell: PE port map(x(i), yy(i), c(i), ps(i), open, w, ps(i-1), en, reset); 
        end generate g4;
        
        
end generate g1;

-- Wire Input Ports c(0) <= ?; yy(0) <= ?
--

c(0) <= '0';
yy(0) <= y;

-- debouncer jawn 
process(ck)

     begin
        if ck'event and ck='1' then
            if reset='0' then
                case n_s is
                    when idle =>
                        en <= '0';
                        if b1='1' then
                            n_s <= loading;
                        end if;
                    when loading =>
                        en <= '0';
                        if b2='1' then
                            n_s <= shifting;
                        end if;
                    when shifting =>
                        en <= '1';
                        n_s <= idle;
                end case;
            end if;
        end if;
        
        
end process;
end struc;