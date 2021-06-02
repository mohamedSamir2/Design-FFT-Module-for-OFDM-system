library IEEE;
use IEEE.STD_LOGIC_1164.all;
use WORK.complexpack.all;

entity MAC is
 port(
 
     a,b,c : in complex;
     out_p, out_m: out complex
  );
end MAC;

architecture bhv of MAC is
begin
process (a, b, c) is
begin
	out_p <= mac_plus  (a, b, c) ;
	out_m <= mac_minus (a, b, c) ;
end process;
end bhv;
