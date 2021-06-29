library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity counter is
    Port ( clk_10M,clk_50M : in std_logic;
           Sel_MUX: out std_logic_vector(1 downto 0));
end counter;

architecture count_arch of counter is
   signal count : std_logic_vector(1 downto 0);
    begin
      process(clk_10M,clk_50M)
        begin
          if (clk_10M'event and clk_10M = '1') then count <= "00";
          elsif (clk_50M'event and clk_50M = '1' and count/="11") then count <= count + 1;
		  else count <= count ;
          end if;
         end process;
         Sel_MUX <= count;
      end count_arch;