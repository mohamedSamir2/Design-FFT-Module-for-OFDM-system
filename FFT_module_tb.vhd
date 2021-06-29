library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
  ENTITY testbench2 IS
  END testbench2;

  ARCHITECTURE behavior OF testbench2 IS
	  SIGNAL clk_10M,clk_50M,RST : std_logic:='0';
          SIGNAL in0_re,in1_re,in2_re,in3_re,in4_re,in5_re,in6_re,in7_re,in8_re,in9_re ,in10_re,in11_re,in12_re,in13_re,in14_re,in15_re,in16_re,in17_re,in18_re,in19_re,in20_re,in21_re,in22_re,in23_re,in24_re,in25_re,in26_re,in27_re,in28_re,in29_re,in30_re,in31_re:std_logic_vector(23 downto 0):="000000000000000000000000";
	  SIGNAL out0_re,out1_re,out2_re,out3_re,out4_re,out5_re,out6_re,out7_re,out8_re,out9_re,out10_re,out11_re,out12_re,out13_re,out14_re,out15_re,out16_re,out17_re,out18_re,out19_re,out20_re,out21_re,out22_re,out23_re,out24_re,out25_re,out26_re,out27_re,out28_re,out29_re,out30_re,out31_re:std_logic_vector(23 downto 0):="000000000000000000000000";
	  SIGNAL out0_imag,out1_imag,out2_img,out3_img,out4_img,out5_img,out6_img,out7_img,out8_img,out9_img,out10_img,out11_img,out12_img,out13_img,out14_img,out15_img,out16_img,out17_img,out18_img,out19_img,out20_img,out21_img,out22_img,out23_img,out24_img,out25_img,out26_img,out27_img,out28_img,out29_img,out30_img,out31_img:std_logic_vector(23 downto 0):="000000000000000000000000";
  BEGIN
    UUT : entity work.top_fft port map(clk_10M,clk_50M,RST,in0_re,in1_re,in2_re,in3_re,in4_re,in5_re,in6_re,in7_re,in8_re,in9_re ,in10_re,in11_re,in12_re,in13_re,in14_re,in15_re,in16_re,in17_re,in18_re,in19_re,in20_re,in21_re,in22_re,in23_re,in24_re,in25_re,in26_re,in27_re,in28_re,in29_re,in30_re,in31_re,
out0_re,out1_re,out2_re,out3_re,out4_re,out5_re,out6_re,out7_re,out8_re,out9_re,out10_re,out11_re,out12_re,out13_re,out14_re,out15_re,out16_re,out17_re,out18_re,out19_re,out20_re,out21_re,out22_re,out23_re,out24_re,out25_re,out26_re,out27_re,out28_re,out29_re,out30_re,out31_re,
out0_imag,out1_imag,out2_img,out3_img,out4_img,out5_img,out6_img,out7_img,out8_img,out9_img,out10_img,out11_img,out12_img,out13_img,out14_img,out15_img,out16_img,out17_img,out18_img,out19_img,out20_img,out21_img,out22_img,out23_img,out24_img,out25_img,out26_img,out27_img,out28_img,out29_img,out30_img,out31_img);

     testbench2 : PROCESS
     BEGIN
	in0_re<="000000010100000000000000"; --01010000 (80)
	in1_re<="000000011001110000000000"; --01100111 (103)
	in2_re<="100000010111110000000000"; --11011111 (-95)
	in3_re<="000000011010010000000000"; --01101001 (105)
	in4_re<="000000001000100000000000"; --00100010 (34)
	in5_re<="100000011001110000000000"; --11100111 (-103)
	in6_re<="100000001110000000000000"; --10111000 (-56)
	in7_re<="000000000011000000000000"; --00001100 (12)
	in8_re<="000000011101010000000000"; --01110101 (117)
	in9_re<="000000011101110000000000"; --01110111 (119)
	in10_re<="100000010101110000000000"; --11010111 (-87)
	in11_re<="000000011110000000000000"; --01111000 (120)
	in12_re<="000000011101010000000000"; --01110101 (117)
	in13_re<="100000000001000000000000"; --10000100 (-4)
	in14_re<="000000010011010000000000"; --01001101 (77)
	in15_re<="100000010110110000000000"; --11011011 (-91)
	in16_re<="100000000101000000000000"; --10010100 (-20)
	in17_re<="000000011010100000000000"; --01101010 (106)
	in18_re<="000000010010110000000000"; --01001011 (75)
	in19_re<="000000011101010000000000"; --01110101 (117)
	in20_re<="000000001010000000000000"; --00101000 (40)
	in21_re<="100000011101100000000000"; --11110110 (-118)
	in22_re<="000000010110010000000000"; --01011001 (89)
	in23_re<="000000011011110000000000"; --01101111 (111)
	in24_re<="000000001011100000000000"; --00101110 (46)
	in25_re<="000000010000100000000000"; --01000010 (66)
	in26_re<="000000001111100000000000"; --00111110 (62)
	in27_re<="100000000110110000000000"; --10011011 (-27)
	in28_re<="000000001010000000000000"; --00101000 (40)
	in29_re<="100000010101000000000000"; --11010100 (-84)
	in30_re<="000000001101010000000000"; --00110101 (53)
	in31_re<="100000011101110000000000"; --11110111 (-119)
	clk_10M<='1';
	clk_50M<='1';
        wait for 10 ns; --10n
	clk_10M<='1';
	clk_50M<='0';
	wait for 10 ns; --20n
	clk_10M<='1';
	clk_50M<='1';
	wait for 10 ns; --30n
	clk_10M<='1';
	clk_50M<='0';
	wait for 10 ns; --40n
	clk_10M<='1';
	clk_50M<='1';
	wait for 10 ns; --50n
	clk_10M<='0';
	clk_50M<='0';
	wait for 10 ns; --60n
	clk_10M<='0';
	clk_50M<='1';
	wait for 10 ns; --70n
	clk_10M<='0';
	clk_50M<='0';
	wait for 10 ns; --80n
	clk_10M<='0';
	clk_50M<='1';
	wait for 10 ns; --90n
	clk_10M<='0';
	clk_50M<='0';
	wait for 10 ns; --100n
            --more input combinations can be given here.
     END PROCESS testbench2;
  END;
