library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Latchs_4by2 is
 generic(bus_width : integer := 24);
port(
CLK , RST   				: in  std_logic ;
D_real , D_imaj 		     	: in  std_logic_vector (bus_width-1 downto 0) ;
Q1_real , Q2_real , Q3_real , Q4_real	: out std_logic_vector (bus_width-1 downto 0) ;
Q1_imaj , Q2_imaj , Q3_imaj , Q4_imaj	: out std_logic_vector (bus_width-1 downto 0) ;
EN1 , EN2 , EN3 , EN4   		: in  std_logic
);
end entity;
architecture structural of Latchs_4by2 is
begin
process(CLK, RST)
Begin
  if (RST ='1') then
	Q1_real <= (others =>'0');
	Q1_imaj <= (others =>'0');
	Q2_real <= (others =>'0');
	Q2_imaj <= (others =>'0');
	Q3_real <= (others =>'0');
	Q3_imaj <= (others =>'0');
	Q4_real <= (others =>'0');
	Q4_imaj <= (others =>'0');
  elsif CLK' event and CLK ='1' then
 	 if 	(EN1 ='1') then
	  Q1_real <= D_real ;
	  Q1_imaj <= D_imaj ;
 	 elsif (EN2 ='1') then
	  Q2_real <= D_real ;
	  Q2_imaj <= D_imaj ;
	 elsif (EN3 ='1') then
	  Q3_real <= D_real ;
	  Q3_imaj <= D_imaj ;
  	 else  
	  Q4_real <= D_real ;
	  Q4_imaj <= D_imaj ;
	end if ;
 end if;
end process;

end architecture;
