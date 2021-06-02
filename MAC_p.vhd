library IEEE;
use IEEE.STD_LOGIC_1164.all;
use WORK.complexpack.all;

entity mac_p is
 port(
 
     a,b,c : in complex;
     Z: out complex
  );
end mac_p;

architecture bhv0 of mac_p is
begin
process (a, b, c) is
begin
	Z <= mac_plus (a, b, c) ;
end process;
end bhv0;
