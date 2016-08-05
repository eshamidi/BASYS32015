----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2015 02:19:08 PM
-- Design Name: 
-- Module Name: orgateimp - Behavioral
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


entity orgateimp is
Port (
    v: in std_logic_vector(1 to 4);
    y: out std_logic
);
end orgateimp;

architecture Behavioral of orgateimp is
    component orgate
        generic (n: natural := 4);
        Port (
            x: in std_logic_vector(1 to n);
            z: out std_logic
        );
    end component;

    begin

    U2: orgate generic map (4) port map (z => y, x => v);
end Behavioral;
