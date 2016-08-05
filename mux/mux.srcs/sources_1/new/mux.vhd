----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/21/2015 03:49:18 PM
-- Design Name: 
-- Module Name: mux - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
port (sel : in std_logic_vector(1 downto 0);
    x : in std_logic_vector(3 downto 0); 
    z : out std_logic;
    z_L : out std_logic);
  
end mux;

architecture Behavioral of mux is

begin
process (sel, x)
begin 
case sel is 
    when "00" =>
        z <= x(0);
        z_L <= not x(0);
    when "01" =>
         z <= x(1);
         z_L <= not x(0);    

end Behavioral;
