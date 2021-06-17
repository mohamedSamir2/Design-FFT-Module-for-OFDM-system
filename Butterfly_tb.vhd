library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.STD_LOGIC_ARITH.all;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS
          SIGNAL a_real,b_real,c_real : std_logic_vector (23 downto 0):="000000000000000000000000";
	  SIGNAL a_imaj,b_imaj,c_imaj : std_logic_vector (23 downto 0):="000000000000000000000000";
	  SIGNAL output1_real,output1_imaj,output2_real,output2_imaj : std_logic_vector (23 downto 0):="000000000000000000000000";
  BEGIN
    UUT : entity work.Butterfly port map(a_real,b_real,c_real,a_imaj,b_imaj,c_imaj,output1_real,output1_imaj,output2_real,output2_imaj);

     testbench : PROCESS
     BEGIN
            a_real<="100000000000000011000000";
            b_real<="000000000000000000100000";
            c_real<="000000000000000001000000";
            a_imaj<="000000000000000001000000";
            b_imaj<="000000000000000000010000";
	    c_imaj<="100000000000000001000000";
            wait for 100 ns;
            a_real<="000000000000000001000000";
            b_real<="100000000000000000000101";
            c_real<="000000000000000010000000";
            a_imaj<="100000000000000001000000";
            b_imaj<="000000000000000000001000";
	    c_imaj<="000000000000000001000000";
            wait for 100 ns;
            --more input combinations can be given here.
     END PROCESS testbench;
  END;
