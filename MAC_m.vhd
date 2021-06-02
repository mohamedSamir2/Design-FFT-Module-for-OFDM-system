library IEEE;
use IEEE.STD_LOGIC_1164.all;
use WORK.complexpack.all;

entity mac_m is
 port(
 
     a,b,c : in complex;
     Z: out complex 
  );
end mac_m;
 
architecture bhv1 of mac_m is
begin
process (a, b, c) is
begin
	Z <= mac_minus (a, b, c) ;
end process;
end bhv1;
