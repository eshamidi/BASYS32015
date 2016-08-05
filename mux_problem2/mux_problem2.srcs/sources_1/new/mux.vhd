----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2015 01:54:35 PM
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
    Port (
        x: in std_logic_vector(0 to 3);
        z: out std_logic;
        s: in std_logic_vector(1 downto 0)
    );
end mux;

architecture Behavioral of mux is
    component mux_comp
        generic (n: natural := 2);
        Port (
            x: in std_logic_vector(0 to 2*n-1);
            z: out std_logic;
            s: in std_logic_vector(n-1 downto 0)
        );
    end component;

begin

U3: mux_comp generic map (2) port map (x => x, z => z, s => s);
end Behavioral;