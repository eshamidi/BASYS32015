
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fifo16x4 is
  PORT (
  ck, btn0, btn1, reset, wen, ren : in std_logic; 
  x : in std_logic_vector(3 downto 0); 
  z : out std_logic_vector(3 downto 0); 
  eflag, fflag : out std_logic
);
end fifo16x4;

architecture struc of fifo16x4 is

component fifo is 
  PORT (
  clk : IN STD_LOGIC;
  rst : IN STD_LOGIC;
  din : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  wr_en : IN STD_LOGIC;
  rd_en : IN STD_LOGIC;
  dout : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  full : OUT STD_LOGIC;
  empty : OUT STD_LOGIC
);
end component; 

signal en : std_logic; 
begin

B4: fifo port map(
clk => ck, 
rst => reset, 
din => x, 
wr_en => wen, 
rd_en => ren, 
dout => z, 
full => fflag, 
empty => eflag);

end Behavioral;
