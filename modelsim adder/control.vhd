

Library ieee;

Use ieee.std_logic_1164.all, work.p1_pack.all;


Entity control is


Port (go, ck, reset, done : in std_logic;
 sel : out sh_reg_sel;
En : out std_logic);
End control;


Architecture behav of control is
-- declare enumeration type
Type state is (idle, loading, shifting);
-- internal state called n_s (next state)
Signal n_s : state;



Begin

Process(ck)

Begin
 If ck = '1' and ck'event then
		-- ck rising edge fence
 	if reset = '1' then n_s <= idle;
 	else
 		-- reset fence
 		Case n_s is
 			when idle =>
		 -- assign control signals
 				en <= '1'; -- serial_adder: no reset
 				sel <= no_op;-- sh_reg's: no operation
 			-- State Transition
 				if go = '1' then 
					n_s <= loading;
 				end if;
 			when loading =>
 				-- assign control signals
 				en <= '0'; -- serial_adder: reset
 				sel <= load; -- sh_reg's: load
 					-- State Transition
 				n_s <= shifting;
 			when shifting =>
 			 en <= '1';
             sel <= shift;
             if done ='1' then
               n_s <= idle;
             end if;

		 end case;


 end if;
 end if;
end process;
end behav;
