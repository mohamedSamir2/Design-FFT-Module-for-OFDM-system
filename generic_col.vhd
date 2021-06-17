library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity generic_col is
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
   
   --------inputs for mux 4 
   M4_in1_real , M4_in2_real , M4_in3_real , M4_in4_real	: in  std_logic_vector (bus_width-1 downto 0) ;
   M4_in1_imaj , M4_in2_imaj , M4_in3_imaj , M4_in4_imaj	: in  std_logic_vector (bus_width-1 downto 0) ;
	--------inputs for mux 5 
   M5_in1_real , M5_in2_real , M5_in3_real , M5_in4_real	: in  std_logic_vector (bus_width-1 downto 0) ;
   M5_in1_imaj , M5_in2_imaj , M5_in3_imaj , M5_in4_imaj	: in  std_logic_vector (bus_width-1 downto 0) ;
	--------inputs for mux 6
   M6_in1_real , M6_in2_real , M6_in3_real , M6_in4_real	: in  std_logic_vector (bus_width-1 downto 0) ;
   M6_in1_imaj , M6_in2_imaj , M6_in3_imaj , M6_in4_imaj	: in  std_logic_vector (bus_width-1 downto 0) ;
   
   --------inputs for mux 7 
   M7_in1_real , M7_in2_real , M7_in3_real , M7_in4_real	: in  std_logic_vector (bus_width-1 downto 0) ;
   M7_in1_imaj , M7_in2_imaj , M7_in3_imaj , M7_in4_imaj	: in  std_logic_vector (bus_width-1 downto 0) ;
	--------inputs for mux 8 
   M8_in1_real , M8_in2_real , M8_in3_real , M8_in4_real	: in  std_logic_vector (bus_width-1 downto 0) ;
   M8_in1_imaj , M8_in2_imaj , M8_in3_imaj , M8_in4_imaj	: in  std_logic_vector (bus_width-1 downto 0) ;
	--------inputs for mux 9
   M9_in1_real , M9_in2_real , M9_in3_real , M9_in4_real	: in  std_logic_vector (bus_width-1 downto 0) ;
   M9_in1_imaj , M9_in2_imaj , M9_in3_imaj , M9_in4_imaj	: in  std_logic_vector (bus_width-1 downto 0) ;
   
   --------inputs for mux 10 
   M10_in1_real , M10_in2_real , M10_in3_real , M10_in4_real	: in  std_logic_vector (bus_width-1 downto 0) ;
   M10_in1_imaj , M10_in2_imaj , M10_in3_imaj , M10_in4_imaj	: in  std_logic_vector (bus_width-1 downto 0) ;
	--------inputs for mux 11 
   M11_in1_real , M11_in2_real , M11_in3_real , M11_in4_real	: in  std_logic_vector (bus_width-1 downto 0) ;
   M11_in1_imaj , M11_in2_imaj , M11_in3_imaj , M11_in4_imaj	: in  std_logic_vector (bus_width-1 downto 0) ;
	--------inputs for mux 12
   M12_in1_real , M12_in2_real , M12_in3_real , M12_in4_real	: in  std_logic_vector (bus_width-1 downto 0) ;
   M12_in1_imaj , M12_in2_imaj , M12_in3_imaj , M12_in4_imaj	: in  std_logic_vector (bus_width-1 downto 0) ;
   
	--------output from latch 1 
   L1_out1_real , L1_out2_real , L1_out3_real , L1_out4_real	: out std_logic_vector (bus_width-1 downto 0) ;
   L1_out1_imaj , L1_out2_imaj , L1_out3_imaj , L1_out4_imaj	: out std_logic_vector (bus_width-1 downto 0) ;
	--------output from latch 2 
   L2_out1_real , L2_out2_real , L2_out3_real , L2_out4_real	: out std_logic_vector (bus_width-1 downto 0) ;
   L2_out1_imaj , L2_out2_imaj , L2_out3_imaj , L2_out4_imaj	: out std_logic_vector (bus_width-1 downto 0) ;
   
   --------output from latch 3 
   L3_out1_real , L3_out2_real , L3_out3_real , L3_out4_real	: out std_logic_vector (bus_width-1 downto 0) ;
   L3_out1_imaj , L3_out2_imaj , L3_out3_imaj , L3_out4_imaj	: out std_logic_vector (bus_width-1 downto 0) ;
	--------output from latch 4 
   L4_out1_real , L4_out2_real , L4_out3_real , L4_out4_real	: out std_logic_vector (bus_width-1 downto 0) ;
   L4_out1_imaj , L4_out2_imaj , L4_out3_imaj , L4_out4_imaj	: out std_logic_vector (bus_width-1 downto 0) ;
   
   --------output from latch 5 
   L5_out1_real , L5_out2_real , L5_out3_real , L5_out4_real	: out std_logic_vector (bus_width-1 downto 0) ;
   L5_out1_imaj , L5_out2_imaj , L5_out3_imaj , L5_out4_imaj	: out std_logic_vector (bus_width-1 downto 0) ;
	--------output from latch 6 
   L6_out1_real , L6_out2_real , L6_out3_real , L6_out4_real	: out std_logic_vector (bus_width-1 downto 0) ;
   L6_out1_imaj , L6_out2_imaj , L6_out3_imaj , L6_out4_imaj	: out std_logic_vector (bus_width-1 downto 0) ;
   
   --------output from latch 7
   L7_out1_real , L7_out2_real , L7_out3_real , L7_out4_real	: out std_logic_vector (bus_width-1 downto 0) ;
   L7_out1_imaj , L7_out2_imaj , L7_out3_imaj , L7_out4_imaj	: out std_logic_vector (bus_width-1 downto 0) ;
	--------output from latch 8
   L8_out1_real , L8_out2_real , L8_out3_real , L8_out4_real	: out std_logic_vector (bus_width-1 downto 0) ;
   L8_out1_imaj , L8_out2_imaj , L8_out3_imaj , L8_out4_imaj	: out std_logic_vector (bus_width-1 downto 0) 
);

end entity;

architecture STRUCTURE of generic_col is
 
   component process_1
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
    end component;
  
  begin
 -- in this design we have 3 mux 4*1 & one MAC & 2 latches module too ^-^
  block_1 : process_1
    port map ( CLK , RST , EN1 , EN2 , EN3 , EN4  , SEL ,M1_in1_real , M1_in2_real , M1_in3_real , M1_in4_real	,M1_in1_imaj , M1_in2_imaj , M1_in3_imaj , M1_in4_imaj ,M2_in1_real , M2_in2_real , M2_in3_real , M2_in4_real	,M2_in1_imaj , M2_in2_imaj , M2_in3_imaj , M2_in4_imaj ,M3_in1_real , M3_in2_real , M3_in3_real , M3_in4_real,M3_in1_imaj , M3_in2_imaj , M3_in3_imaj , M3_in4_imaj,L1_out1_real , L1_out2_real , L1_out3_real , L1_out4_real,L1_out1_imaj , L1_out2_imaj , L1_out3_imaj , L1_out4_imaj, L2_out1_real , L2_out2_real , L2_out3_real , L2_out4_real	,L2_out1_imaj , L2_out2_imaj , L2_out3_imaj , L2_out4_imaj	);
 
  block_2 : process_1
    port map ( CLK , RST , EN1 , EN2 , EN3 , EN4  , SEL ,M4_in1_real , M4_in2_real , M4_in3_real , M4_in4_real	,M4_in1_imaj , M4_in2_imaj , M4_in3_imaj , M4_in4_imaj ,M5_in1_real , M5_in2_real , M5_in3_real , M5_in4_real	,M5_in1_imaj , M5_in2_imaj , M5_in3_imaj , M5_in4_imaj ,M6_in1_real , M6_in2_real , M6_in3_real , M6_in4_real,M6_in1_imaj , M6_in2_imaj , M6_in3_imaj , M6_in4_imaj,L3_out1_real , L3_out2_real , L3_out3_real , L3_out4_real,L3_out1_imaj , L3_out2_imaj , L3_out3_imaj , L3_out4_imaj, L4_out1_real , L4_out2_real , L4_out3_real , L4_out4_real	,L4_out1_imaj , L4_out2_imaj , L4_out3_imaj , L4_out4_imaj	);
 
  block_3 : process_1
    port map ( CLK , RST , EN1 , EN2 , EN3 , EN4  , SEL ,M7_in1_real , M7_in2_real , M7_in3_real , M7_in4_real	,M7_in1_imaj , M7_in2_imaj , M7_in3_imaj , M7_in4_imaj ,M8_in1_real , M8_in2_real , M8_in3_real , M8_in4_real	,M8_in1_imaj , M8_in2_imaj , M8_in3_imaj , M8_in4_imaj ,M9_in1_real , M9_in2_real , M9_in3_real , M9_in4_real,M9_in1_imaj , M9_in2_imaj , M9_in3_imaj , M9_in4_imaj,L5_out1_real , L5_out2_real , L5_out3_real , L5_out4_real,L5_out1_imaj , L5_out2_imaj , L5_out3_imaj , L5_out4_imaj, L6_out1_real , L6_out2_real , L6_out3_real , L6_out4_real	,L6_out1_imaj , L6_out2_imaj , L6_out3_imaj , L6_out4_imaj	);

  block_4 : process_1
    port map ( CLK , RST , EN1 , EN2 , EN3 , EN4  , SEL ,M10_in1_real , M10_in2_real , M10_in3_real , M10_in4_real	,M10_in1_imaj , M10_in2_imaj , M10_in3_imaj , M10_in4_imaj,M11_in1_real , M11_in2_real , M11_in3_real , M11_in4_real	,M11_in1_imaj , M11_in2_imaj , M11_in3_imaj , M11_in4_imaj,M12_in1_real , M12_in2_real , M12_in3_real , M12_in4_real,M12_in1_imaj , M12_in2_imaj , M12_in3_imaj , M12_in4_imaj,L7_out1_real , L7_out2_real , L7_out3_real , L7_out4_real,L7_out1_imaj , L7_out2_imaj , L7_out3_imaj , L7_out4_imaj, L8_out1_real , L8_out2_real , L8_out3_real , L8_out4_real	,L8_out1_imaj , L8_out2_imaj , L8_out3_imaj , L8_out4_imaj	);

  
end architecture;
