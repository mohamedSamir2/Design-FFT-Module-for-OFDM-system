library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity mux_2_4by1 is
 generic(bus_width : integer := 24);
 port(
     sel 			 : in  std_logic_vector (1 downto 0) ;
     A_real,B_real,C_real,D_real : in  std_logic_vector (bus_width-1 downto 0) ;
     A_imaj,B_imaj,C_imaj,D_imaj : in  std_logic_vector (bus_width-1 downto 0) ;
     Z_real , Z_imaj 		 : out std_logic_vector (bus_width-1 downto 0) 
  );
end entity;
 
architecture bhv of mux_2_4by1 is
begin
process (A_real,B_real,C_real,D_real,A_imaj,B_imaj,C_imaj,D_imaj,sel) is
begin
	 case sel is
      when "00"   =>  Z_real <= A_real ;
		      Z_imaj <= A_imaj ;
      when "01"   =>  Z_real <= B_real ;
		      Z_imaj <= B_imaj ;
      when "10"   =>  Z_real <= C_real ;
		      Z_imaj <= C_imaj ;
      when others =>  Z_real <= D_real ;
		      Z_imaj <= D_imaj ;
    end case;
 
end process;
end bhv;
