library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.STD_LOGIC_ARITH.all;




entity MUL is
 generic(bus_width : integer := 24 ; floating_bits : integer := 6 );
 port(
     multiplicand    : in  std_logic_vector (bus_width-1 downto 0) ;
     multiplier      : in  std_logic_vector (bus_width-1 downto 0) ;
     result 	     : out std_logic_vector (bus_width-1 downto 0) 
  );
end MUL;

architecture bhv of MUL is
  signal  mul_result : std_logic_vector (((bus_width-1)*2)-1 downto 0) ;
  signal  sign 	     : std_logic ;
begin
process (multiplicand , multiplier , mul_result , sign) is  --multiplication process
  begin
    mul_result	<= unsigned(multiplicand(bus_width-2 downto 0)) * unsigned(multiplier(bus_width-2 downto 0)) ;
    sign	<= multiplicand(bus_width-1) xor multiplier(bus_width-1) ;
end process;
    result	<= sign & mul_result( bus_width+floating_bits-2 downto floating_bits) ;
end bhv;
