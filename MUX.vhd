library IEEE;
use IEEE.STD_LOGIC_1164.all;
use WORK.complexpack.all;

entity mux_4to1 is
 port(
 
     A,B,C,D : in complex;
     S0,S1: in STD_LOGIC;
     Z: out complex
  );
end mux_4to1;
 
architecture bhv of mux_4to1 is
begin
process (A,B,C,D,S0,S1) is
begin
  if (S0 ='0' and S1 = '0') then
      Z <= A;
  elsif (S0 ='1' and S1 = '0') then
      Z <= B;
  elsif (S0 ='0' and S1 = '1') then
      Z <= C;
  else
      Z <= D;
  end if;
 
end process;
end bhv;
