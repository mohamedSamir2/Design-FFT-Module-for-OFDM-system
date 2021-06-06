library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.STD_LOGIC_ARITH.all;




entity ADD is
 generic(bus_width : integer := 20 ; floating_bits : integer := 6 );
 port(
     input_1  	  : in  std_logic_vector (bus_width-1 downto 0) ;
     input_2      : in  std_logic_vector (bus_width-1 downto 0) ;
     result 	  : out std_logic_vector (bus_width-1 downto 0) 
  );
end ADD;

architecture bhv of ADD is

  signal  add_result : std_logic_vector (bus_width-1 downto 0) ;
  signal  sign 	     : std_logic := input_1(bus_width-1) xor input_2(bus_width-1) ;
  signal output_sign : std_logic ;

begin
process (input_1 , input_2 , add_result , sign) is  
  begin 
    if   (sign = '0') then     				--input1 +ve && input2 +ve
       add_result <= unsigned(input_1(bus_width-2 downto 0)) + unsigned(input_2(bus_width-2 downto 0)) ;
       output_sign <= input_1(bus_width-1) ;

    elsif(input_1(bus_width-2 downto 0) >= input_2(bus_width-2 downto 0))  then --input1 > input2
	add_result <= unsigned(input_1(bus_width-2 downto 0)) - unsigned(input_2(bus_width-2 downto 0)) ;
	if(input_1(bus_width-2 downto 0) > input_2(bus_width-2 downto 0)) then
	  output_sign <= input_1(bus_width-1) ;
	else 
	  output_sign <= '0' ;
	end if ;
    else 				     --input2 > input1
	add_result <= unsigned(input_2(bus_width-2 downto 0)) - unsigned(input_1(bus_width-2 downto 0)) ;
	output_sign <= input_2(bus_width-1) ;
    end if ;
    --result <= output_sign & add_result(bus_width-2 downto 0)) ;
end process;
  result <= output_sign & add_result(bus_width-2 downto 0) ;
end bhv;
