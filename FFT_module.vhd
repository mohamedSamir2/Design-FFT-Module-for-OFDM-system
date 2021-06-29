library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity top_fft is
 generic(bus_width : integer := 24);
port(
clk_10M,clk_50M , RST   					: in  std_logic ;
 
-- inputs 
in0_re,in1_re,in2_re,in3_re,in4_re,in5_re,in6_re,in7_re,in8_re,in9_re ,in10_re,in11_re,in12_re,in13_re,in14_re,in15_re,in16_re,in17_re,in18_re,in19_re,in20_re,in21_re,in22_re,in23_re,in24_re,in25_re,in26_re,in27_re,in28_re,in29_re,in30_re,in31_re   : in std_logic_vector (bus_width-1 downto 0) ;

--outputs
out0_re,out1_re,out2_re,out3_re,out4_re,out5_re,out6_re,out7_re,out8_re,out9_re,out10_re,out11_re,out12_re,out13_re,out14_re,out15_re,out16_re,out17_re,out18_re,out19_re,out20_re,out21_re,out22_re,out23_re,out24_re,out25_re,out26_re,out27_re,out28_re,out29_re,out30_re,out31_re: out  std_logic_vector(bus_width-1 downto 0);
out0_imag,out1_imag,out2_img,out3_img,out4_img,out5_img,out6_img,out7_img,out8_img,out9_img,out10_img,out11_img,out12_img,out13_img,out14_img,out15_img,out16_img,out17_img,out18_img,out19_img,out20_img,out21_img,out22_img,out23_img,out24_img,out25_img,out26_img,out27_img,out28_img,out29_img,out30_img,out31_img: out  std_logic_vector(bus_width-1 downto 0)

);

end entity;

architecture STRUCTURE of top_fft is

-- twiddle factor 
signal w_unity_re: std_logic_vector (bus_width-1  downto 0) 	:="000000000000000001000000"; --  (6 => '1', others => '0'); 
signal w_unity_img: std_logic_vector (bus_width-1 downto 0)  	:="000000000000000000000000"; --(others => '0');
signal w0_r: std_logic_vector (bus_width-1 downto 0)	:="000000000000000001000000"; --(6 => '1', others => '0');
signal w0_i: std_logic_vector (bus_width-1 downto 0)    :="000000000000000000000000"; --(others => '0');
signal w1_r: std_logic_vector (bus_width-1 downto 0)    :="000000000000000000111110"; --(5 => '1',4 => '1',3 => '1',2 => '1' ,1 => '1', others => '0');
signal w1_i: std_logic_vector (bus_width-1 downto 0) 	:="100000000000000000001100"; --(23 => '1',3 => '1',2 => '1' , others => '0');	
signal w2_r: std_logic_vector (bus_width-1 downto 0) 	:="000000000000000000111011"; --(5 => '1',4 => '1',3 => '1',1 => '1' ,0 => '1', others => '0');
signal w2_i: std_logic_vector (bus_width-1 downto 0) 	:="100000000000000000011000"; --(23 => '1',4 => '1',3 => '1' , others => '0');
signal w3_r: std_logic_vector (bus_width-1 downto 0) 	:="000000000000000000110101"; --(5 => '1',4 => '1',2 => '1' ,0 => '1', others => '0');
signal w3_i: std_logic_vector (bus_width-1 downto 0) 	:="100000000000000000100011"; --(23 => '1',5 => '1',1 => '1' ,0 => '1', others => '0');
signal w4_r: std_logic_vector (bus_width-1 downto 0) 	:="000000000000000000101101"; --(5 => '1',3 => '1',2 => '1' ,0 => '1', others => '0');	
signal w4_i: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000101101"; --(23 => '1',5 => '1',3 => '1',2 => '1' ,0 => '1', others => '0');
signal w5_r: std_logic_vector (bus_width-1 downto 0)  	:="000000000000000000100011"; --(5 => '1',1 => '1' ,0 => '1', others => '0'); 
signal w5_i: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000110101"; --(23 => '1',5 => '1',4 => '1',2 => '1' ,0 => '1', others => '0');
signal w6_r: std_logic_vector (bus_width-1 downto 0)  	:="000000000000000000011000"; --(4 => '1' ,3 => '1', others => '0');						 
signal w6_i: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000111011"; --(23 => '1',5 => '1',4 => '1',3 => '1',1 => '1' ,0 => '1', others => '0');
signal w7_r: std_logic_vector (bus_width-1 downto 0)  	:="000000000000000000001100"; --(3 => '1',2 => '1' , others => '0');	 
signal w7_i: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000111110"; --(23 => '1',5 => '1',4 => '1',3 => '1',2 => '1' ,1 => '1', others => '0');
signal w8_r: std_logic_vector (bus_width-1 downto 0)  	:="000000000000000000000000"; --(others => '0');
signal w8_i: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000001000000"; --(23 => '1',6 => '1', others => '0');
signal w9_r: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000001100"; --(23 => '1',3 => '1' ,2 => '1', others => '0');
signal w9_i: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000111110"; --(23 => '1',5 => '1',4 => '1',3 => '1',2 => '1' ,1 => '1', others => '0');
signal w10_r: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000011000"; --(23 => '1',4 => '1' ,3 => '1', others => '0');
signal w10_i: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000111011"; --(23 => '1',5 => '1',4 => '1',3 => '1',1 => '1' ,0 => '1', others => '0');
signal w11_r: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000100011"; --(23 => '1',5 => '1',1 => '1' ,0 => '1', others => '0');
signal w11_i: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000110101"; --(23 => '1',5 => '1',4 => '1',2 => '1' ,0 => '1', others => '0');
signal w12_r: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000101101"; --(23 => '1',5 => '1',3 => '1',2 => '1' ,0 => '1', others => '0'); 
signal w12_i: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000101101"; --(23 => '1',5 => '1',3 => '1',2 => '1' ,0 => '1', others => '0');
signal w13_r: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000100011"; --(23 => '1',5 => '1',4 => '1',2 => '1' ,0 => '1', others => '0');
signal w13_i: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000100011"; -- (23 => '1',5 => '1',1 => '1' ,0 => '1', others => '0');
signal w14_r: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000111011"; --(23 => '1',5 => '1',4 => '1',3 => '1',1 => '1' ,0 => '1', others => '0'); 
signal w14_i: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000011000"; --(23 => '1',4 => '1',3 => '1', others => '0');							
signal w15_r: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000111110"; --(23 => '1',5 => '1',4 => '1',3 => '1',2 => '1' ,1 => '1', others => '0'); 
signal w15_i: std_logic_vector (bus_width-1 downto 0)  	:="100000000000000000001100"; --(23 => '1',3 => '1',2 => '1' , others => '0');

--internal inputs
signal in0_img,in1_img,in2_img,in3_img,in4_img,in5_img,in6_img,in7_img,in8_img,in9_img,in10_img,in11_img,in12_img,in13_img,in14_img,in15_img,in16_img,in17_img,in18_img,in19_img,in20_img,in21_img,in22_img,in23_img,in24_img,in25_img,in26_img,in27_img,in28_img,in29_img,in30_img,in31_img: std_logic_vector (bus_width-1 downto 0):=(others => '0') ;

--register x_input
signal x0_re ,x1_re,x2_re,x3_re,x4_re,x5_re,x6_re,x7_re,x8_re,x9_re,x10_re,x11_re,x12_re,x13_re,x14_re,x15_re,x16_re,x17_re,x18_re,x19_re,x20_re,x21_re,x22_re,x23_re,x24_re,x25_re,x26_re,x27_re,x28_re,x29_re,x30_re,x31_re :  std_logic_vector (bus_width-1 downto 0) ;
signal x0_img,x1_img,x2_img,x3_img,x4_img,x5_img,x6_img,x7_img,x8_img,x9_img,x10_img,x11_img,x12_img,x13_img,x14_img,x15_img,x16_img,x17_img,x18_img,x19_img,x20_img,x21_img,x22_img,x23_img,x24_img,x25_img,x26_img,x27_img,x28_img,x29_img,x30_img,x31_img:  std_logic_vector (bus_width-1 downto 0);

--register x_output
signal x0_out_re ,x1_out_re,x2_out_re,x3_out_re,x4_out_re,x5_out_re,x6_out_re,x7_out_re,x8_out_re,x9_out_re,x10_out_re,x11_out_re,x12_out_re,x13_out_re,x14_out_re,x15_out_re,x16_out_re,x17_out_re,x18_out_re,x19_out_re,x20_out_re,x21_out_re,x22_out_re,x23_out_re,x24_out_re,x25_out_re,x26_out_re,x27_out_re,x28_out_re,x29_out_re,x30_out_re,x31_out_re :  std_logic_vector (bus_width-1 downto 0) ;
signal x0_out_img,x1_out_img,x2_out_img,x3_out_img,x4_out_img,x5_out_img,x6_out_img,x7_out_img,x8_out_img,x9_out_img,x10_out_img,x11_out_img,x12_out_img,x13_out_img,x14_out_img,x15_out_img,x16_out_img,x17_out_img,x18_out_img,x19_out_img,x20_out_img,x21_out_img,x22_out_img,x23_out_img,x24_out_img,x25_out_img,x26_out_img,x27_out_img,x28_out_img,x29_out_img,x30_out_img,x31_out_img:  std_logic_vector (bus_width-1 downto 0);

--register y_input
signal y0_re ,y1_re,y2_re,y3_re,y4_re,y5_re,y6_re,y7_re,y8_re,y9_re,y10_re,y11_re,y12_re,y13_re,y14_re,y15_re,y16_re,y17_re,y18_re,y19_re,y20_re,y21_re,y22_re,y23_re,y24_re,y25_re,y26_re,y27_re,y28_re,y29_re,y30_re,y31_re :  std_logic_vector (bus_width-1 downto 0) ;
signal y0_img,y1_img,y2_img,y3_img,y4_img,y5_img,y6_img,y7_img,y8_img,y9_img,y10_img,y11_img,y12_img,y13_img,y14_img,y15_img,y16_img,y17_img,y18_img,y19_img,y20_img,y21_img,y22_img,y23_img,y24_img,y25_img,y26_img,y27_img,y28_img,y29_img,y30_img,y31_img:  std_logic_vector (bus_width-1 downto 0);

--register y_output
signal y0_out_re ,y1_out_re,y2_out_re,y3_out_re,y4_out_re,y5_out_re,y6_out_re,y7_out_re,y8_out_re,y9_out_re,y10_out_re,y11_out_re,y12_out_re,y13_out_re,y14_out_re,y15_out_re,y16_out_re,y17_out_re,y18_out_re,y19_out_re,y20_out_re,y21_out_re,y22_out_re,y23_out_re,y24_out_re,y25_out_re,y26_out_re,y27_out_re,y28_out_re,y29_out_re,y30_out_re,y31_out_re :  std_logic_vector (bus_width-1 downto 0) ;
signal y0_out_img,y1_out_img,y2_out_img,y3_out_img,y4_out_img,y5_out_img,y6_out_img,y7_out_img,y8_out_img,y9_out_img,y10_out_img,y11_out_img,y12_out_img,y13_out_img,y14_out_img,y15_out_img,y16_out_img,y17_out_img,y18_out_img,y19_out_img,y20_out_img,y21_out_img,y22_out_img,y23_out_img,y24_out_img,y25_out_img,y26_out_img,y27_out_img,y28_out_img,y29_out_img,y30_out_img,y31_out_img:  std_logic_vector (bus_width-1 downto 0);

--register z_input
signal z0_re ,z1_re,z2_re,z3_re,z4_re,z5_re,z6_re,z7_re,z8_re,z9_re,z10_re,z11_re,z12_re,z13_re,z14_re,z15_re,z16_re,z17_re,z18_re,z19_re,z20_re,z21_re,z22_re,z23_re,z24_re,z25_re,z26_re,z27_re,z28_re,z29_re,z30_re,z31_re :  std_logic_vector (bus_width-1 downto 0) ;
signal z0_img,z1_img,z2_img,z3_img,z4_img,z5_img,z6_img,z7_img,z8_img,z9_img,z10_img,z11_img,z12_img,z13_img,z14_img,z15_img,z16_img,z17_img,z18_img,z19_img,z20_img,z21_img,z22_img,z23_img,z24_img,z25_img,z26_img,z27_img,z28_img,z29_img,z30_img,z31_img:  std_logic_vector (bus_width-1 downto 0);

--register z_output
signal z0_out_re ,z1_out_re,z2_out_re,z3_out_re,z4_out_re,z5_out_re,z6_out_re,z7_out_re,z8_out_re,z9_out_re,z10_out_re,z11_out_re,z12_out_re,z13_out_re,z14_out_re,z15_out_re,z16_out_re,z17_out_re,z18_out_re,z19_out_re,z20_out_re,z21_out_re,z22_out_re,z23_out_re,z24_out_re,z25_out_re,z26_out_re,z27_out_re,z28_out_re,z29_out_re,z30_out_re,z31_out_re :  std_logic_vector (bus_width-1 downto 0) ;
signal z0_out_img,z1_out_img,z2_out_img,z3_out_img,z4_out_img,z5_out_img,z6_out_img,z7_out_img,z8_out_img,z9_out_img,z10_out_img,z11_out_img,z12_out_img,z13_out_img,z14_out_img,z15_out_img,z16_out_img,z17_out_img,z18_out_img,z19_out_img,z20_out_img,z21_out_img,z22_out_img,z23_out_img,z24_out_img,z25_out_img,z26_out_img,z27_out_img,z28_out_img,z29_out_img,z30_out_img,z31_out_img:  std_logic_vector (bus_width-1 downto 0);

--register D_input
signal d0_re ,d1_re,d2_re,d3_re,d4_re,d5_re,d6_re,d7_re,d8_re,d9_re,d10_re,d11_re,d12_re,d13_re,d14_re,d15_re,d16_re,d17_re,d18_re,d19_re,d20_re,d21_re,d22_re,d23_re,d24_re,d25_re,d26_re,d27_re,d28_re,d29_re,d30_re,d31_re :  std_logic_vector (bus_width-1 downto 0) ;
signal d0_img,d1_img,d2_img,d3_img,d4_img,d5_img,d6_img,d7_img,d8_img,d9_img,d10_img,d11_img,d12_img,d13_img,d14_img,d15_img,d16_img,d17_img,d18_img,d19_img,d20_img,d21_img,d22_img,d23_img,d24_img,d25_img,d26_img,d27_img,d28_img,d29_img,d30_img,d31_img:  std_logic_vector (bus_width-1 downto 0);

--register D_output

signal d0_out_re ,d1_out_re,d2_out_re,d3_out_re,d4_out_re,d5_out_re,d6_out_re,d7_out_re,d8_out_re,d9_out_re,d10_out_re,d11_out_re,d12_out_re,d13_out_re,d14_out_re,d15_out_re,d16_out_re,d17_out_re,d18_out_re,d19_out_re,d20_out_re,d21_out_re,d22_out_re,d23_out_re,d24_out_re,d25_out_re,d26_out_re,d27_out_re,d28_out_re,d29_out_re,d30_out_re,d31_out_re :  std_logic_vector (23 downto 0) ;
signal d0_out_img,d1_out_img,d2_out_img,d3_out_img,d4_out_img,d5_out_img,d6_out_img,d7_out_img,d8_out_img,d9_out_img,d10_out_img,d11_out_img,d12_out_img,d13_out_img,d14_out_img,d15_out_img,d16_out_img,d17_out_img,d18_out_img,d19_out_img,d20_out_img,d21_out_img,d22_out_img,d23_out_img,d24_out_img,d25_out_img,d26_out_img,d27_out_img,d28_out_img,d29_out_img,d30_out_img,d31_out_img:  std_logic_vector (23 downto 0);

--register Q_input

signal q0_re ,q1_re,q2_re,q3_re,q4_re,q5_re,q6_re,q7_re,q8_re,q9_re,q10_re,q11_re,q12_re,q13_re,q14_re,q15_re,q16_re,q17_re,q18_re,q19_re,q20_re,q21_re,q22_re,q23_re,q24_re,q25_re,q26_re,q27_re,q28_re,q29_re,q30_re,q31_re :  std_logic_vector (23 downto 0) ;
signal q0_img,q1_img,q2_img,q3_img,q4_img,q5_img,q6_img,q7_img,q8_img,q9_img,q10_img,q11_img,q12_img,q13_img,q14_img,q15_img,q16_img,q17_img,q18_img,q19_img,q20_img,q21_img,q22_img,q23_img,q24_img,q25_img,q26_img,q27_img,q28_img,q29_img,q30_img,q31_img:  std_logic_vector (23 downto 0);


signal SEL : std_logic_vector(1 downto 0);

signal EN1, EN2, EN3, EN4  : std_logic ;


	--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--

 --components---------------------------
 --controller
component counter 
    Port ( clk_10M,clk_50M : in std_logic;
           Sel_MUX         : out std_logic_vector(1 downto 0)); 
 end component;
 -- decoder
 component decoder2 
 port(
 Counter_out : in STD_LOGIC_VECTOR(1 downto 0);
 EN_0 : out STD_LOGIC;
 EN_1 : out STD_LOGIC;
 EN_2 : out STD_LOGIC;
 EN_3 : out STD_LOGIC
 );
end component;

 --register
 component DFF
 port(
clk :in std_logic;     
RESET :in std_logic;  
Q1  : out std_logic_vector(23 downto 0);
Q2  : out std_logic_vector(23 downto 0);
Q3  : out std_logic_vector(23 downto 0);
Q4  : out std_logic_vector(23 downto 0); 
Q5  : out std_logic_vector(23 downto 0);
Q6  : out std_logic_vector(23 downto 0); 
Q7  : out std_logic_vector(23 downto 0);
Q8  : out std_logic_vector(23 downto 0); 
Q9  : out std_logic_vector(23 downto 0);
Q10 : out std_logic_vector(23 downto 0); 
Q11 : out std_logic_vector(23 downto 0);
Q12 : out std_logic_vector(23 downto 0);
Q13 : out std_logic_vector(23 downto 0);
Q14 : out std_logic_vector(23 downto 0);
Q15 : out std_logic_vector(23 downto 0);
Q16 : out std_logic_vector(23 downto 0); 
Q17 : out std_logic_vector(23 downto 0);
Q18 : out std_logic_vector(23 downto 0); 
Q19 : out std_logic_vector(23 downto 0);
Q20 : out std_logic_vector(23 downto 0); 
Q21 : out std_logic_vector(23 downto 0);
Q22 : out std_logic_vector(23 downto 0); 
Q23 : out std_logic_vector(23 downto 0);
Q24 : out std_logic_vector(23 downto 0); 
Q25 : out std_logic_vector(23 downto 0);
Q26 : out std_logic_vector(23 downto 0);
Q27 : out std_logic_vector(23 downto 0);
Q28 : out std_logic_vector(23 downto 0); 
Q29 : out std_logic_vector(23 downto 0);
Q30 : out std_logic_vector(23 downto 0); 
Q31 : out std_logic_vector(23 downto 0);
Q32 : out std_logic_vector(23 downto 0);    
D1 :in  std_logic_vector(23 downto 0);
D2 :in  std_logic_vector(23 downto 0);
D3 :in  std_logic_vector(23 downto 0);
D4 :in  std_logic_vector(23 downto 0);
D5 :in  std_logic_vector(23 downto 0);
D6 :in  std_logic_vector(23 downto 0);
D7 :in  std_logic_vector(23 downto 0);
D8 :in  std_logic_vector(23 downto 0);
D9 :in  std_logic_vector(23 downto 0);
D10 :in  std_logic_vector(23 downto 0);
D11 :in  std_logic_vector(23 downto 0);
D12 :in  std_logic_vector(23 downto 0);
D13 :in  std_logic_vector(23 downto 0);
D14 :in  std_logic_vector(23 downto 0);
D15 :in  std_logic_vector(23 downto 0);
D16 :in  std_logic_vector(23 downto 0);
D17 :in  std_logic_vector(23 downto 0);
D18 :in  std_logic_vector(23 downto 0);
D19 :in  std_logic_vector(23 downto 0);
D20 :in  std_logic_vector(23 downto 0);
D21 :in  std_logic_vector(23 downto 0);
D22 :in  std_logic_vector(23 downto 0);
D23 :in  std_logic_vector(23 downto 0);
D24 :in  std_logic_vector(23 downto 0);
D25 :in  std_logic_vector(23 downto 0);
D26 :in  std_logic_vector(23 downto 0);
D27 :in  std_logic_vector(23 downto 0);
D28 :in  std_logic_vector(23 downto 0);
D29 :in  std_logic_vector(23 downto 0);
D30 :in  std_logic_vector(23 downto 0);
D31 :in  std_logic_vector(23 downto 0);
D32 :in  std_logic_vector(23 downto 0));
    end component;
	
--generic coloumn
component generic_col
 port(
   clk, RST   							: in  std_logic ;
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

    end component;
	
	--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
	
  begin
  -------------------------------------
 controller : counter 
 Port map( clk_10M,clk_50M , SEL ); 
 ----------------------------------------
 decoder : decoder2 
 port map( SEL ,EN1 , EN2 , EN3 , EN4 );
 ------------------------------------

 

  col_0 : generic_col
   port map( clk_50M , RST  ,EN1 , EN2 , EN3 , EN4 ,SEL ,
   	--------inputs for mux 1 
   in0_re  , in8_re  , in4_re  , in12_re    ,	
   in0_img , in8_img , in4_img , in12_img   ,
	--------inputs for mux 2   
   in16_re  , in24_re  , in20_re   , in28_re	,
   in16_img , in24_img , in20_img  , in28_img	,  
   	--------inputs for mux 3
   w_unity_re  , w_unity_re  , w_unity_re  , w_unity_re	, --for weights
   w_unity_img , w_unity_img , w_unity_img , w_unity_img	, 
	--------inputs for mux 4 
   in2_re  , in10_re  , in6_re  , in14_re	,
   in2_img , in10_img , in6_img , in14_img	,  
   	--------inputs for mux 5
   in18_re  , in26_re  , in22_re  , in30_re	,
   in18_img , in26_img , in22_img , in30_img	,  
   	--------inputs for mux 6
   w_unity_re , w_unity_re , w_unity_re , w_unity_re	,--for weights
   w_unity_img , w_unity_img , w_unity_img , w_unity_img	,
   	--------inputs for mux 7
   in1_re  , in9_re  , in5_re  , in13_re	,
   in1_img , in9_img , in5_img , in13_img	, 
   	--------inputs for mux 8
   in17_re  , in25_re  , in21_re  , in29_re	,
   in17_img , in25_img , in21_img , in29_img	,
   	--------inputs for mux 9
   w_unity_re  , w_unity_re  , w_unity_re  , w_unity_re	,--for weights
   w_unity_img , w_unity_img , w_unity_img , w_unity_img	,
   	--------inputs for mux 10
   in3_re  , in11_re  , in7_re  , in15_re	,
   in3_img , in11_img , in7_img , in15_img	,
   	--------inputs for mux 11
   in19_re  , in27_re  , in23_re  , in31_re  	,
   in19_img , in27_img , in23_img , in31_img	,
   	--------inputs for mux 12
   w_unity_re  , w_unity_re  , w_unity_re  , w_unity_re	,--for weights
   w_unity_img , w_unity_img , w_unity_img , w_unity_img	, 
	--------output from latch 1 
   x0_re  , x2_re  , x4_re  , x6_re	    ,
   x0_img , x2_img , x4_img , x6_img	,
	--------output from latch 2 
   x1_re  , x3_re  , x5_re  , x7_re  	,
   x1_img , x3_img , x5_img , x7_img	,  
   --------output from latch 3 
   x8_re  , x10_re  , x12_re  , x14_re	,
   x8_img , x10_img , x12_img , x14_img	,
	--------output from latch 4 
   x9_re  , x11_re  , x13_re  , x15_re	    ,
   x9_img , x11_img , x13_img , x15_img	,
   --------output from latch 5 
   x16_re  , x18_re  , x20_re  , x22_re	    ,
   x16_img , x18_img , x20_img , x22_img	,
	--------output from latch 6 
   x17_re  , x19_re  , x21_re  , x23_re	    ,
   x17_img , x19_img , x21_img , x23_img	,
   --------output from latch 7
   x24_re  , x26_re  , x28_re  , x30_re	    ,
   x24_img , x26_img , x28_img , x30_img	,
	--------output from latch 8
   x25_re  , x27_re  , x29_re  , x31_re	    ,
   x25_img , x27_img , x29_img , x31_img	
);


 reg1 : DFF -- for real values stage 1
 port map(
clk_10M   ,  
RST ,
--out
x0_out_re ,x1_out_re,x2_out_re,x3_out_re,x4_out_re,x5_out_re,x6_out_re,x7_out_re,x8_out_re,x9_out_re,x10_out_re,x11_out_re,x12_out_re,x13_out_re,x14_out_re,x15_out_re,x16_out_re,x17_out_re,x18_out_re,x19_out_re,x20_out_re,x21_out_re,x22_out_re,x23_out_re,x24_out_re,x25_out_re,x26_out_re,x27_out_re,x28_out_re,x29_out_re,x30_out_re,x31_out_re , 
--in
x0_re ,x1_re,x2_re,x3_re,x4_re,x5_re,x6_re,x7_re,x8_re,x9_re,x10_re,x11_re,x12_re,x13_re,x14_re,x15_re,x16_re,x17_re,x18_re,x19_re,x20_re,x21_re,x22_re,x23_re,x24_re,x25_re,x26_re,x27_re,x28_re,x29_re,x30_re,x31_re 
);
----------------------------------------
  reg2 : DFF --for imag values stage 1
  port map(
clk_10M   ,  
RST ,
 --out
 x0_out_img,x1_out_img,x2_out_img,x3_out_img,x4_out_img,x5_out_img,x6_out_img,x7_out_img,x8_out_img,x9_out_img,x10_out_img,x11_out_img,x12_out_img,x13_out_img,x14_out_img,x15_out_img,x16_out_img,x17_out_img,x18_out_img,x19_out_img,x20_out_img,x21_out_img,x22_out_img,x23_out_img,x24_out_img,x25_out_img,x26_out_img,x27_out_img,x28_out_img,x29_out_img,x30_out_img,x31_out_img ,
 --in
 x0_img,x1_img,x2_img,x3_img,x4_img,x5_img,x6_img,x7_img,x8_img,x9_img,x10_img,x11_img,x12_img,x13_img,x14_img,x15_img,x16_img,x17_img,x18_img,x19_img,x20_img,x21_img,x22_img,x23_img,x24_img,x25_img,x26_img,x27_img,x28_img,x29_img,x30_img,x31_img 
);
-----------------------------------------




col_1 : generic_col
port map( clk_50M , RST  ,EN1 , EN2 , EN3 , EN4 ,SEL ,
   	--------inputs for mux 1
   x0_out_re  , x1_out_re  , x4_out_re  , x5_out_re    ,	
   x0_out_img , x1_out_img , x4_out_img , x5_out_img   ,	
    -------inputs for mux 2
   x2_out_re  , x3_out_re  , x6_out_re  , x7_out_re    ,	
   x2_out_img , x3_out_img , x6_out_img , x7_out_img   ,
	--------inputs for mux 3   
   w0_r , w8_r , w0_r , w8_r	, --for weights
   w0_i , w8_i , w0_i , w8_i	,
   --------inputs for mux 4
   x8_out_re  , x9_out_re  , x12_out_re  , x13_out_re    ,	
   x8_out_img , x9_out_img , x12_out_img , x13_out_img   ,	
   --------inputs for mux 5
   x10_out_re  , x11_out_re  , x14_out_re  , x15_out_re    ,	
   x10_out_img , x11_out_img , x14_out_img , x15_out_img   ,
    --------inputs for mux 6   
   w0_r , w8_r , w0_r , w8_r	, --for weights
   w0_i , w8_i , w0_i , w8_i	,
   --------inputs for mux 7
   x16_out_re  , x17_out_re    , x20_out_re  , x21_out_re    ,	
   x16_out_img , x17_out_img   , x20_out_img , x21_out_img   ,	
   --------inputs for mux 8
   x18_out_re  , x19_out_re  , x22_out_re  , x23_out_re    ,	
   x18_out_img , x19_out_img , x22_out_img , x23_out_img   ,	
   --------inputs for mux 9
   w0_r , w8_r , w0_r , w8_r	, --for weights
   w0_i , w8_i , w0_i , w8_i	,
   x24_out_re   , x25_out_re   , x28_out_re     , x29_out_re    ,	
   x24_out_img  , x25_out_img  , x28_out_img    , x29_out_img   ,	
   x26_out_re  , x27_out_re  , x30_out_re  , x31_out_re    ,	
   x26_out_img , x27_out_img , x30_out_img , x31_out_img   ,
   w0_r , w8_r , w0_r , w8_r	, --for weights
   w0_i , w8_i , w0_i , w8_i	,
	--------output from latch 1 
   y0_re  , y1_re  , y4_re  , y5_re	    ,
   y0_img , y1_img , y4_img , y5_img	,
	--------output from latch 2 
   y2_re  , y3_re  , y6_re  , y7_re  	,
   y2_img , y3_img , y6_img , y7_img	,
   --------output from latch 3 
   y8_re  , y9_re  , y12_re  , y13_re	,
   y8_img , y9_img , y12_img , y13_img	,
	--------output from latch 4 
   y10_re  , y11_re  , y14_re  , y15_re	    ,
   y10_img , y11_img , y14_img , y15_img	,
   --------output from latch 5 
   y16_re  , y17_re  , y20_re  , y21_re	    ,
   y16_img , y17_img , y20_img , y21_img	,
	--------output from latch 6 
   y18_re  , y19_re  , y22_re  , y23_re	    ,
   y18_img , y19_img , y22_img , y23_img	,
   --------output from latch 7
   y24_re  , y25_re  , y28_re  , y29_re	    ,
   y24_img , y25_img , y28_img , y29_img	,
	--------output from latch 8
   y26_re  , y27_re  , y30_re  , y31_re	    ,
   y26_img , y27_img , y30_img , y31_img	
);


reg3: DFF --for real values stage 2
  port map(
clk_10M   ,  
RST ,
--out
 y0_out_re ,y1_out_re,y2_out_re,y3_out_re,y4_out_re,y5_out_re,y6_out_re,y7_out_re,y8_out_re,y9_out_re,y10_out_re,y11_out_re,y12_out_re,y13_out_re,y14_out_re,y15_out_re,y16_out_re,y17_out_re,y18_out_re,y19_out_re,y20_out_re,y21_out_re,y22_out_re,y23_out_re,y24_out_re,y25_out_re,y26_out_re,y27_out_re,y28_out_re,y29_out_re,y30_out_re,y31_out_re ,
--in
 y0_re ,y1_re,y2_re,y3_re,y4_re,y5_re,y6_re,y7_re,y8_re,y9_re,y10_re,y11_re,y12_re,y13_re,y14_re,y15_re,y16_re,y17_re,y18_re,y19_re,y20_re,y21_re,y22_re,y23_re,y24_re,y25_re,y26_re,y27_re,y28_re,y29_re,y30_re,y31_re 
);
------------------------------------------
reg4: DFF --for imag values stage 2
  port map( clk_10M   ,  RST ,
--out
 y0_out_img,y1_out_img,y2_out_img,y3_out_img,y4_out_img,y5_out_img,y6_out_img,y7_out_img,y8_out_img,y9_out_img,y10_out_img,y11_out_img,y12_out_img,y13_out_img,y14_out_img,y15_out_img,y16_out_img,y17_out_img,y18_out_img,y19_out_img,y20_out_img,y21_out_img,y22_out_img,y23_out_img,y24_out_img,y25_out_img,y26_out_img,y27_out_img,y28_out_img,y29_out_img,y30_out_img,y31_out_img ,
--in
 y0_img,y1_img,y2_img,y3_img,y4_img,y5_img,y6_img,y7_img,y8_img,y9_img,y10_img,y11_img,y12_img,y13_img,y14_img,y15_img,y16_img,y17_img,y18_img,y19_img,y20_img,y21_img,y22_img,y23_img,y24_img,y25_img,y26_img,y27_img,y28_img,y29_img,y30_img,y31_img
);
------------------------------------


col_2 : generic_col
port map( clk_50M , RST  ,EN1 , EN2 , EN3 , EN4 ,SEL ,
   y0_out_re  , y1_out_re  , y2_out_re  , y3_out_re	    ,
   y0_out_img , y1_out_img , y2_out_img , y3_out_img	,
   y4_out_re  , y5_out_re  , y6_out_re  , y7_out_re  	,
   y4_out_img , y5_out_img , y6_out_img , y7_out_img	,
   w0_r , w4_r , w8_r , w12_r	, --for weights
   w0_i , w4_i , w8_i , w12_i	,
   y8_out_re  , y9_out_re  , y10_out_re  , y11_out_re  	,
   y8_out_img , y9_out_img , y10_out_img , y11_out_img	,
   y12_out_re  , y13_out_re  , y14_out_re  , y15_out_re  	,
   y12_out_img , y13_out_img , y14_out_img , y15_out_img	,
   w0_r , w4_r , w8_r , w12_r	, --for weights
   w0_i , w4_i , w8_i , w12_i	,
   y16_out_re  , y17_out_re  , y18_out_re  , y19_out_re  	,
   y16_out_img , y17_out_img , y18_out_img , y19_out_img	,
   y20_out_re  , y21_out_re  , y22_out_re  , y23_out_re  	,
   y20_out_img , y21_out_img , y22_out_img , y23_out_img	,
   w0_r , w4_r , w8_r , w12_r	, --for weights
   w0_i , w4_i , w8_i , w12_i	,
   y24_out_re  , y25_out_re  , y26_out_re  , y27_out_re  	,
   y24_out_img , y25_out_img , y26_out_img , y27_out_img	,
   y28_out_re  , y29_out_re  , y30_out_re  , y31_out_re  	,
   y28_out_img , y29_out_img , y30_out_img , y31_out_img	,
   w0_r , w4_r , w8_r , w12_r	, --for weights
   w0_i , w4_i , w8_i , w12_i	,
	--------output from latch 1 
   z0_re  , z1_re  , z2_re  , z3_re	    ,
   z0_img , z1_img , z2_img , z3_img	,
	--------output from latch 2 
   z4_re  , z5_re  , z6_re  , z7_re  	,
   z4_img , z5_img , z6_img , z7_img	,  
   --------output from latch 3 
   z8_re  , z9_re  , z10_re  , z11_re	,
   z8_img , z9_img , z10_img , z11_img	,
	--------output from latch 4 
   z12_re  , z13_re  , z14_re  , z15_re	    ,
   z12_img , z13_img , z14_img , z15_img	,
   --------output from latch 5 
   z16_re  , z17_re  , z18_re  , z19_re	    ,
   z16_img , z17_img , z18_img , z19_img	,
	--------output from latch 6 
   z20_re  , z21_re  , z22_re  , z23_re	    ,
   z20_img , z21_img , z22_img , z23_img	,
   --------output from latch 7
   z24_re  , z25_re  , z26_re  , z27_re	    ,
   z24_img , z25_img , z26_img , z27_img	,
	--------output from latch 8
   z28_re  , z29_re  , z30_re  , z31_re	    ,
   z28_img , z29_img , z30_img , z31_img	
);


reg5: DFF --for real values stage 3
  port map( clk_10M   ,  RST ,
--out 
 z0_out_re ,z1_out_re,z2_out_re,z3_out_re,z4_out_re,z5_out_re,z6_out_re,z7_out_re,z8_out_re,z9_out_re,z10_out_re,z11_out_re,z12_out_re,z13_out_re,z14_out_re,z15_out_re,z16_out_re,z17_out_re,z18_out_re,z19_out_re,z20_out_re,z21_out_re,z22_out_re,z23_out_re,z24_out_re,z25_out_re,z26_out_re,z27_out_re,z28_out_re,z29_out_re,z30_out_re,z31_out_re ,
--in
 z0_re ,z1_re,z2_re,z3_re,z4_re,z5_re,z6_re,z7_re,z8_re,z9_re,z10_re,z11_re,z12_re,z13_re,z14_re,z15_re,z16_re,z17_re,z18_re,z19_re,z20_re,z21_re,z22_re,z23_re,z24_re,z25_re,z26_re,z27_re,z28_re,z29_re,z30_re,z31_re );
------------------------------------
reg6: DFF --for imag values stage 3
  port map( clk_10M   ,  RST ,
--out 
 z0_out_img,z1_out_img,z2_out_img,z3_out_img,z4_out_img,z5_out_img,z6_out_img,z7_out_img,z8_out_img,z9_out_img,z10_out_img,z11_out_img,z12_out_img,z13_out_img,z14_out_img,z15_out_img,z16_out_img,z17_out_img,z18_out_img,z19_out_img,z20_out_img,z21_out_img,z22_out_img,z23_out_img,z24_out_img,z25_out_img,z26_out_img,z27_out_img,z28_out_img,z29_out_img,z30_out_img,z31_out_img ,
--in
 z0_img,z1_img,z2_img,z3_img,z4_img,z5_img,z6_img,z7_img,z8_img,z9_img,z10_img,z11_img,z12_img,z13_img,z14_img,z15_img,z16_img,z17_img,z18_img,z19_img,z20_img,z21_img,z22_img,z23_img,z24_img,z25_img,z26_img,z27_img,z28_img,z29_img,z30_img,z31_img);
-------------------------------



col_3 : generic_col
port map( clk_50M , RST  ,EN1 , EN2 , EN3 , EN4 ,SEL ,
   z0_out_re  , z1_out_re , z2_out_re , z3_out_re           ,	
   z0_out_img , z1_out_img , z2_out_img , z3_out_img   , 
   z8_out_re  , z9_out_re , z10_out_re , z11_out_re        ,	
   z8_out_img , z9_out_img , z10_out_img , z11_out_img   , 
  w0_r , w2_r , w4_r , w6_r	, --for weights
  w0_i , w2_i , w4_i , w6_i	,
   z4_out_re  , z5_out_re , z6_out_re , z7_out_re         ,	
   z4_out_img , z5_out_img , z6_out_img , z7_out_img , 
   z12_out_re  , z13_out_re , z14_out_re , z15_out_re        ,	
   z12_out_img , z13_out_img , z14_out_img , z15_out_img       , 
  w8_r , w10_r , w12_r , w14_r	, --for weights
  w8_i , w10_i , w12_i , w14_i	,
   z16_out_re  , z17_out_re , z18_out_re , z19_out_re    ,	
   z16_out_img , z17_out_img , z18_out_img , z19_out_img   , 
   z24_out_re  , z25_out_re , z26_out_re , z27_out_re      ,	
   z24_out_img , z25_out_img , z26_out_img , z27_out_img     , 
  w0_r , w2_r , w4_r , w6_r	, --for weights
  w0_i , w2_i , w4_i , w6_i	,
   z20_out_re  , z21_out_re , z22_out_re , z23_out_re         ,	
   z20_out_img , z21_out_img , z22_out_img , z23_out_img , 
   z28_out_re  , z29_out_re , z30_out_re , z31_out_re          ,	
   z28_out_img , z29_out_img , z30_out_img , z31_out_img  , 
  w8_r , w10_r , w12_r , w14_r	, --for weights
  w8_i , w10_i , w12_i , w14_i	,
	--------output from latch 1 
 d0_re , d1_re , d2_re , d3_re           ,
 d0_img , d1_img , d2_img , d3_img ,
	--------output from latch 2 
 d8_re , d9_re , d10_re , d11_re           ,
 d8_img , d9_img , d10_img , d11_img ,
   --------output from latch 3 
 d4_re , d5_re , d6_re , d7_re           ,
 d4_img , d5_img , d6_img , d7_img ,
	--------output from latch 4 
 d12_re , d13_re , d14_re , d15_re           ,
 d12_img , d13_img , d14_img , d15_img ,
   --------output from latch 5 
 d16_re , d17_re , d18_re , d19_re           ,
 d16_img , d17_img , d18_img , d19_img ,
	--------output from latch 6 
 d24_re , d25_re , d26_re , d27_re           ,
 d24_img , d25_img , d26_img , d27_img ,
   --------output from latch 7
 d20_re , d21_re , d22_re , d23_re           ,
 d20_img , d21_img , d22_img , d23_img ,
	--------output from latch 8
 d28_re , d29_re , d30_re , d31_re           ,
 d28_img , d29_img , d30_img , d31_img 
);


reg7: DFF --for real values stage 4 (reg D)
  port map( clk_10M   ,  RST ,
--out
d0_out_re ,d1_out_re,d2_out_re,d3_out_re,d4_out_re,d5_out_re,d6_out_re,d7_out_re,d8_out_re,d9_out_re,d10_out_re,d11_out_re,d12_out_re,d13_out_re,d14_out_re,d15_out_re,d16_out_re,d17_out_re,d18_out_re,d19_out_re,d20_out_re,d21_out_re,d22_out_re,d23_out_re,d24_out_re,d25_out_re,d26_out_re,d27_out_re,d28_out_re,d29_out_re,d30_out_re,d31_out_re ,  
--in
 d0_re ,d1_re,d2_re,d3_re,d4_re,d5_re,d6_re,d7_re,d8_re,d9_re,d10_re,d11_re,d12_re,d13_re,d14_re,d15_re,d16_re,d17_re,d18_re,d19_re,d20_re,d21_re,d22_re,d23_re,d24_re,d25_re,d26_re,d27_re,d28_re,d29_re,d30_re,d31_re
);

reg8: DFF --for imag values stage 4 (reg D)
  port map(clk_10M   ,  RST ,
--out
d0_out_img,d1_out_img,d2_out_img,d3_out_img,d4_out_img,d5_out_img,d6_out_img,d7_out_img,d8_out_img,d9_out_img,d10_out_img,d11_out_img,d12_out_img,d13_out_img,d14_out_img,d15_out_img,d16_out_img,d17_out_img,d18_out_img,d19_out_img,d20_out_img,d21_out_img,d22_out_img,d23_out_img,d24_out_img,d25_out_img,d26_out_img,d27_out_img,d28_out_img,d29_out_img,d30_out_img,d31_out_img ,  
--in
 d0_img,d1_img,d2_img,d3_img,d4_img,d5_img,d6_img,d7_img,d8_img,d9_img,d10_img,d11_img,d12_img,d13_img,d14_img,d15_img,d16_img,d17_img,d18_img,d19_img,d20_img,d21_img,d22_img,d23_img,d24_img,d25_img,d26_img,d27_img,d28_img,d29_img,d30_img,d31_img
);



col_4 : generic_col
port map( clk_50M , RST  ,EN1 , EN2 , EN3 , EN4 ,SEL ,
d0_out_re , d1_out_re , d2_out_re , d3_out_re           ,
d0_out_img , d1_out_img , d2_out_img , d3_out_img ,
d16_out_re , d17_out_re , d18_out_re , d19_out_re           ,
d16_out_img , d17_out_img , d18_out_img , d19_out_img ,
   w0_r , w1_r , w2_r , w3_r	, --for weights
   w0_i , w1_i , w2_i , w3_i	,
d4_out_re , d5_out_re , d6_out_re , d7_out_re           ,
d4_out_img , d5_out_img , d6_out_img , d7_out_img ,
d20_out_re , d21_out_re , d22_out_re , d23_out_re           ,
d20_out_img , d21_out_img , d22_out_img , d23_out_img ,
    w4_r , w5_r , w6_r , w7_r	, --for weights
   w4_i , w5_i , w6_i , w7_i	,
d8_out_re , d9_out_re , d10_out_re , d11_out_re           ,
d8_out_img , d9_out_img , d10_out_img , d11_out_img ,
d24_out_re , d25_out_re , d26_out_re , d27_out_re           ,
d24_out_img , d25_out_img , d26_out_img , d27_out_img ,
   w8_r , w9_r , w10_r , w11_r	, --for weights
   w8_i , w9_i , w10_i , w11_i	,
d12_out_re , d13_out_re , d14_out_re , d15_out_re           ,
d12_out_img , d13_out_img , d14_out_img , d15_out_img ,
d28_out_re , d29_out_re , d30_out_re , d31_out_re           ,
d28_out_img , d29_out_img , d30_out_img , d31_out_img ,
   w12_r , w13_r , w14_r , w15_r	, --for weights
   w12_i , w13_i , w14_i , w15_i	,
	--------output from latch 1 
 q0_re , q1_re , q2_re , q3_re           ,
 q0_img , q1_img , q2_img , q3_img ,
	--------output from latch 2 
 q16_re , q17_re , q18_re , q19_re           ,
 q16_img , q17_img , q18_img , q19_img ,
   --------output from latch 3 
 q4_re , q5_re , q6_re , q7_re           ,
 q4_img , q5_img , q6_img , q7_img ,
	--------output from latch 4 
 q20_re , q21_re , q22_re , q23_re           ,
 q20_img , q21_img , q22_img , q23_img ,
   --------output from latch 5 
  q8_re , q9_re , q10_re , q11_re           ,
 q8_img , q9_img , q10_img , q11_img ,
	--------output from latch 6 
 q24_re , q25_re , q26_re , q27_re           ,
 q24_img , q25_img , q26_img , q27_img ,
   --------output from latch 7
 q12_re , q13_re , q14_re , q15_re           ,
 q12_img , q13_img , q14_img , q15_img ,
	--------output from latch 8
 q28_re , q29_re , q30_re , q31_re           ,
 q28_img , q29_img , q30_img , q31_img 
);

reg9: DFF --for real values stage 5 (reg Q)
  port map( 
clk_10M   ,  RST ,
--out
out0_re,out1_re,out2_re,out3_re,out4_re,out5_re,out6_re,out7_re,out8_re,out9_re,out10_re,out11_re,out12_re,out13_re,out14_re,out15_re,out16_re,out17_re,out18_re,out19_re,out20_re,out21_re,out22_re,out23_re,out24_re,out25_re,out26_re,out27_re,out28_re,out29_re,out30_re,out31_re,  
--in
 q0_re ,q1_re,q2_re,q3_re,q4_re,q5_re,q6_re,q7_re,q8_re,q9_re,q10_re,q11_re,q12_re,q13_re,q14_re,q15_re,q16_re,q17_re,q18_re,q19_re,q20_re,q21_re,q22_re,q23_re,q24_re,q25_re,q26_re,q27_re,q28_re,q29_re,q30_re,q31_re 
);

reg10: DFF  --for imag values stage 5

  port map(
clk_10M   ,  
RST ,
--out
out0_imag,out1_imag,out2_img,out3_img,out4_img,out5_img,out6_img,out7_img,out8_img,out9_img,out10_img,out11_img,out12_img,out13_img,out14_img,out15_img,out16_img,out17_img,out18_img,out19_img,out20_img,out21_img,out22_img,out23_img,out24_img,out25_img,out26_img,out27_img,out28_img,out29_img,out30_img,out31_img,
--input
q0_img,q1_img,q2_img,q3_img,q4_img,q5_img,q6_img,q7_img,q8_img,q9_img,q10_img,q11_img,q12_img,q13_img,q14_img,q15_img,q16_img,q17_img,q18_img,q19_img,q20_img,q21_img,q22_img,q23_img,q24_img,q25_img,q26_img,q27_img,q28_img,q29_img,q30_img,q31_img
);


end architecture;
