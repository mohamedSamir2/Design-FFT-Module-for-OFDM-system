library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.STD_LOGIC_ARITH.all;

entity Butterfly is
 generic(bus_width : integer := 24);
port(
 c_real , b_real , a_real    : in  std_logic_vector (bus_width-1 downto 0) ;
 c_imaj , b_imaj , a_imaj    : in  std_logic_vector (bus_width-1 downto 0) ;
 output1_real , output1_imaj : out std_logic_vector (bus_width-1 downto 0) ;
 output2_real , output2_imaj : out std_logic_vector (bus_width-1 downto 0) 
);
end entity;

architecture STRUCT of Butterfly is

  component MUL
      port(
     multiplicand    : in  std_logic_vector (bus_width-1 downto 0) ;
     multiplier      : in  std_logic_vector (bus_width-1 downto 0) ;
     result 	     : out std_logic_vector (bus_width-1 downto 0) 
  );
  end component;



  component ADD
 	port(
    	  input_1  	  : in  std_logic_vector (bus_width-1 downto 0) ;
     	  input_2         : in  std_logic_vector (bus_width-1 downto 0) ;
     	  result 	  : out std_logic_vector (bus_width-1 downto 0) 
 	 );
  end component;

  component SUB
 	port(
    	  input_1  	  : in  std_logic_vector (bus_width-1 downto 0) ;
     	  input_2         : in  std_logic_vector (bus_width-1 downto 0) ;
     	  result 	  : out std_logic_vector (bus_width-1 downto 0) 
 	 );
  end component;

	signal  real_part1  , real_part2  : std_logic_vector (bus_width-1 downto 0) ;
	signal  imaj_part1  , imaj_part2  : std_logic_vector (bus_width-1 downto 0) ;
	signal  real_result , imaj_result : std_logic_vector (bus_width-1 downto 0) ;
begin

     MUL1 : MUL   --a_r * b_r
    port map(a_real ,  b_real , real_part1 );
     MUL2 : MUL   --a_i * b_i   
    port map(a_imaj ,  b_imaj , real_part2 );
     MUL3 : MUL   --a_r * b_i
    port map(a_real ,  b_imaj , imaj_part1 );
     MUL4 : MUL   --a_i * b_r
    port map(a_imaj ,  b_real , imaj_part2 );
     SUB1 : SUB   --raal part =  a_r * b_r -  a_i * b_i
    port map(real_part1 ,  real_part2 , real_result );
     ADD1 : ADD   --raal part =  a_r * b_i +  a_i * b_r
    port map(imaj_part1 ,  imaj_part2 , imaj_result );

------------------------------------------------------------now we have u = R + jI 

--------------------output due to addition
     ADD2 : ADD   --raal part of output 1  =  c_r +  u_r
    port map(c_real ,  real_result , output1_real );
     ADD3 : ADD   --imaj part of output 1  =  c_r +  u_r  
    port map(c_imaj ,  imaj_result , output1_imaj );

--------------------output due to subtraction
     SUB2 : SUB   --raal part of output 2  =  c_r -  u_r
    port map(c_real ,  real_result , output2_real );
     SUB3 : SUB   --imaj part of output 2  =  c_r -  u_r  
    port map(c_imaj ,  imaj_result , output2_imaj );


end architecture;