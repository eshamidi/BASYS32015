
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ram_block_mem is
    PORT (
  ck, en : IN STD_LOGIC;
  wen : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
  addr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  din : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  dout1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  dout2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
end ram_block_mem;

architecture struc of ram_block_mem is

component blk_mem_gen_0 is
  PORT (
  clka : IN STD_LOGIC;
  ena : IN STD_LOGIC;
  wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
  addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  dina : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  douta : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
end component; 




begin

B1: blk_mem_gen_0 port map(
clka => ck, 
ena => en , 
wea => wen, 
addra => addr, 
dina => din, 
douta => dout1);  

B2: blk_mem_gen_0 port map(
clka => ck, 
ena => en , 
wea => wen, 
addra => addr, 
dina => din, 
douta => dout2);  

end struc;
