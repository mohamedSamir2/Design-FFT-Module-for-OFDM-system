library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity counter is
    Port ( clk_50M,RST : in std_logic;
           Sel_MUX: out std_logic_vector(1 downto 0));
end counter;

architecture count_arch of counter is
   signal count : std_logic_vector(1 downto 0):="00";
    begin
      process(clk_50M,RST)
        begin
	if(RST='1') then
	count <="00";
          elsif (clk_50M'event and clk_50M = '1') then count <= count + 1;
          end if;
         end process;
         Sel_MUX <= count;
      end count_arch;