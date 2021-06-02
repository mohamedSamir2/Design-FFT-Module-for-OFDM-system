library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use WORK.complexpack.all;

entity register_file is
	Generic (sel_size : INTEGER := 5 );
  port(
	out1	, out2	, out3	, out4	, out5	, out6	, out7	, out8	, out9	, out10	,
 	out11	, out12	, out13	, out14	, out15	, out16 : out complex ;
	-----------------------------------------------
	in1	, in2	, in3	, in4	, in5	, in6	, in7	, in8	
	: in complex ;
	-----------------------------------------------
    	addr_out1,   addr_out2	,   addr_out3	,   addr_out4	,   addr_out5	,   addr_out6	,
  	addr_out7,   addr_out8	,   addr_out9	,   addr_out10	,   addr_out11	,   addr_out12	,
   	addr_out13,   addr_out14	,   addr_out15	,   addr_out16 
	: in  std_logic_vector(sel_size-1 downto 0);
	-----------------------------------------------
   	addr_in1	, addr_in2	, addr_in3	, addr_in4	, addr_in5	, addr_in6	,
 	addr_in7	, addr_in8	
	: in  std_logic_vector(sel_size-1 downto 0);
	-----------------------------------------------
   	clk         : in  std_logic
  	  );
end register_file;


architecture behavioral of register_file is
  type registerFile is array(0 to (2**sel_size)-1) of complex ; 
  signal registers : registerFile;
begin
  regFile : process (clk) is
  begin
    if rising_edge(clk) then
     	out1 <= registers(to_integer(unsigned(addr_out1)));
      	out2 <= registers(to_integer(unsigned(addr_out2)));
	out3 <= registers(to_integer(unsigned(addr_out3)));
	out4 <= registers(to_integer(unsigned(addr_out4)));
	out5 <= registers(to_integer(unsigned(addr_out5)));
	out6 <= registers(to_integer(unsigned(addr_out6)));
	out7 <= registers(to_integer(unsigned(addr_out7)));
	out8 <= registers(to_integer(unsigned(addr_out8)));
	out9 <= registers(to_integer(unsigned(addr_out9)));
	out10 <= registers(to_integer(unsigned(addr_out10)));
	out11 <= registers(to_integer(unsigned(addr_out11)));
	out12 <= registers(to_integer(unsigned(addr_out12)));
	out13 <= registers(to_integer(unsigned(addr_out13)));
	out14 <= registers(to_integer(unsigned(addr_out14)));
	out15 <= registers(to_integer(unsigned(addr_out15)));
	out16 <= registers(to_integer(unsigned(addr_out16)));
	registers(to_integer(unsigned(addr_in1))) <= in1 ;
	registers(to_integer(unsigned(addr_in2))) <= in2 ;
	registers(to_integer(unsigned(addr_in3))) <= in3 ;
	registers(to_integer(unsigned(addr_in4))) <= in4 ;
	registers(to_integer(unsigned(addr_in5))) <= in5 ;
	registers(to_integer(unsigned(addr_in6))) <= in6 ;
	registers(to_integer(unsigned(addr_in7))) <= in7 ;
	registers(to_integer(unsigned(addr_in8))) <= in8 ;
    end if;
  end process;
end behavioral;
