library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.STD_LOGIC_ARITH.all;

entity Process_1 is
 generic(bus_width : integer := 24);
port(
   CLK , RST   							: in  std_logic ;
   EN1 , EN2 , EN3 , EN4   					: in  std_logic ;
   SEL 								: in  std_logic_vector (1 downto 0) ;
	--------inputs for mux 1 
   M1_in1_real , M1_in2_real , M1_in3_real , M1_in4_real	: in  std_logic_vector (bus_width-1 downto 0) ;
   M1_in1_imaj , M1_in2_imaj , M1_in3_imaj , M1_in4_imaj	: in  std_logic_vector (bus_width-1 downto 0) ;
	--------inputs for mux 2 
   M2_in1_real , M2_in2_real , M2_in3_real , M2_in4_real	: in  std_logic_vector (bus_width-1 downto 0) ;
   M2_in1_imaj , M2_in2_imaj , M2_in3_imaj , M2_in4_imaj	: in  std_logic_vector (bus_width-1 downto 0) ;
	--------inputs for mux 3
   M3_in1_real , M3_in2_real , M3_in3_real , M3_in4_real	: in  std_logic_vector (bus_width-1 downto 0) ;
   M3_in1_imaj , M3_in2_imaj , M3_in3_imaj , M3_in4_imaj	: in  std_logic_vector (bus_width-1 downto 0) ;
	--------output from latch 1 
   L1_out1_real , L1_out2_real , L1_out3_real , L1_out4_real	: out std_logic_vector (bus_width-1 downto 0) ;
   L1_out1_imaj , L1_out2_imaj , L1_out3_imaj , L1_out4_imaj	: out std_logic_vector (bus_width-1 downto 0) ;
	--------output from latch 2 
   L2_out1_real , L2_out2_real , L2_out3_real , L2_out4_real	: out std_logic_vector (bus_width-1 downto 0) ;
   L2_out1_imaj , L2_out2_imaj , L2_out3_imaj , L2_out4_imaj	: out std_logic_vector (bus_width-1 downto 0) 
);
end entity;

architecture STRUCT of Process_1 is

  component mux_2_4by1
     port(
     sel 			 : in  std_logic_vector (1 downto 0) ;
     A_real,B_real,C_real,D_real : in  std_logic_vector (bus_width-1 downto 0) ;
     A_imaj,B_imaj,C_imaj,D_imaj : in  std_logic_vector (bus_width-1 downto 0) ;
     Z_real , Z_imaj 		 : out std_logic_vector (bus_width-1 downto 0) 
  );
  end component;
 
  component Butterfly
    port(
	a_real , b_real , c_real    : in  std_logic_vector (bus_width-1 downto 0) ;
 	a_imaj , b_imaj , c_imaj    : in  std_logic_vector (bus_width-1 downto 0) ;
 	output1_real , output1_imaj : out std_logic_vector (bus_width-1 downto 0) ;
 	output2_real , output2_imaj : out std_logic_vector (bus_width-1 downto 0) 
	);
  end component;

  component Latchs_4by2
    port(
	CLK , RST   				: in  std_logic ;
	D_real , D_imaj 		     	: in  std_logic_vector (bus_width-1 downto 0) ;
	Q1_real , Q2_real , Q3_real , Q4_real	: out std_logic_vector (bus_width-1 downto 0) ;
	Q1_imaj , Q2_imaj , Q3_imaj , Q4_imaj	: out std_logic_vector (bus_width-1 downto 0) ;
	EN1 , EN2 , EN3 , EN4   		: in  std_logic
	);
  end component;

	signal  mac_in1_real  , mac_in2_real , mac_in3_real : std_logic_vector (bus_width-1 downto 0) ;
	signal  mac_in1_imaj  , mac_in2_imaj , mac_in3_imaj : std_logic_vector (bus_width-1 downto 0) ;
	signal  mac_out1_real , mac_out2_real 		    : std_logic_vector (bus_width-1 downto 0) ;
	signal  mac_out1_imaj , mac_out2_imaj 	   	    : std_logic_vector (bus_width-1 downto 0) ;
 
begin
 -- in this design we have 3 mux 4*1 & one MAC & 2 latches module too ^-^
  MOUX1 : mux_2_4by1
    port map(SEL ,  M1_in1_real , M1_in2_real , M1_in3_real , M1_in4_real ,  M1_in1_imaj , M1_in2_imaj , M1_in3_imaj , M1_in4_imaj , mac_in1_real , mac_in1_imaj );
 
  MUX2 : mux_2_4by1
    port map (SEL ,  M2_in1_real , M2_in2_real , M2_in3_real , M2_in4_real ,  M2_in1_imaj , M2_in2_imaj , M2_in3_imaj , M2_in4_imaj , mac_in2_real , mac_in2_imaj );
 
  MUX3 : mux_2_4by1
    port map (SEL ,  M3_in1_real , M3_in2_real , M3_in3_real , M3_in4_real ,  M3_in1_imaj , M3_in2_imaj , M3_in3_imaj , M3_in4_imaj , mac_in3_real , mac_in3_imaj );

  Butterfly1 : Butterfly
    port map (mac_in1_real , mac_in2_real , mac_in3_real , mac_in1_imaj , mac_in2_imaj , mac_in3_imaj , mac_out1_real , mac_out1_imaj , mac_out2_real , mac_out2_imaj);

  LATCH1 : Latchs_4by2
    port map (CLK , RST , mac_out1_real , mac_out1_imaj , L1_out1_real , L1_out2_real , L1_out3_real , L1_out4_real , L1_out1_imaj , L1_out2_imaj , L1_out3_imaj ,
		 L1_out4_imaj ,  EN1 , EN2 , EN3 , EN4);

  LATCH2 : Latchs_4by2
    port map (CLK , RST , mac_out2_real , mac_out2_imaj , L2_out1_real , L2_out2_real , L2_out3_real , L2_out4_real , L2_out1_imaj , L2_out2_imaj , L2_out3_imaj ,
		 L2_out4_imaj ,  EN1 , EN2 , EN3 , EN4);

end architecture;
