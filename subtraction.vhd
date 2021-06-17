library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.STD_LOGIC_ARITH.all;


entity SUB is
 generic(bus_width : integer := 24 ; floating_bits : integer := 6 );
 port(
     input_1  	  : in  std_logic_vector (bus_width-1 downto 0) ;
     input_2      : in  std_logic_vector (bus_width-1 downto 0) ;
     result 	  : out std_logic_vector (bus_width-1 downto 0) 
  );
end SUB;

architecture bhv of SUB is

  signal  sub_result : std_logic_vector (bus_width-2 downto 0) ;

  signal  sign2      : std_logic :='0';
  signal output_sign : std_logic ;

begin
process (input_1 , input_2 , sub_result) is  
  begin 
	sign2<=input_1(bus_width-1) xor input_2(bus_width-1);
    if   (sign2 = '1') then     				--input1 +ve && input2 +ve
       sub_result  <= unsigned(input_1(bus_width-2 downto 0)) + unsigned(input_2(bus_width-2 downto 0)) ;--??? ?????? ?? ?????
       output_sign <= input_1(bus_width-1) ;

    elsif(input_1(bus_width-2 downto 0) >= input_2(bus_width-2 downto 0))  then --input1 > input2
	sub_result    <= unsigned(input_1(bus_width-2 downto 0)) - unsigned(input_2(bus_width-2 downto 0)) ;
	if(input_1(bus_width-2 downto 0) > input_2(bus_width-2 downto 0)) then
	  output_sign <= input_1(bus_width-1) ;
	else 
	  output_sign <= '0' ;
	end if ;
    else 				     --input2 > input1
	sub_result  <= unsigned(input_2(bus_width-2 downto 0)) - unsigned(input_1(bus_width-2 downto 0)) ;
	output_sign <= not(input_2(bus_width-1)) ;
    end if ;
    --result <= output_sign & add_result(bus_width-2 downto 0)) ;
end process;
  result <= output_sign & sub_result(bus_width-2 downto 0) ;
end bhv;

