Library ieee;

Use ieee.std_logic_1164.all, work.p1_pack.all;

Entity sh_reg is
Generic (n : natural := 4); -- specifiable parameters (default to 4)

Port (x : in std_logic_vector(n-1 downto 0);
z : out std_logic;
sel : in sh_reg_sel;
ck : in std_logic);

End sh_reg; 

Architecture behav of sh_reg is
Signal temp : std_logic_vector(n-1 downto 0); -- holds the input
Begin -- architecture body



process(ck)

begin

If ck = '1' and ck'event then
case sel is
 	when no_op => null;
 	when load => temp <= x;
 	when shift =>
 		for i in n-2 downto 0 loop
 		temp(i) <= temp (i+1); -- temp(i) refers to the i-th bit of temp
 		end loop;
end case;
end if; 

end process; 

z <= temp(0); 


end behav; 