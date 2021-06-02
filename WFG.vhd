library STD, IEEE;
use STD.textio.all;
use IEEE.std_logic_1164.all;
use WORK.complexpack.all;


Entity WFG is
Generic (SIZE : INTEGER := 16);
Port (
	SELC   : in std_logic_vector(3 downto 0) ;
	out_w  : out complex
	);
End WFG;

Architecture RTL of WFG is
Begin
PO : Process(SELC)
Begin
  Case SELC is
    	WHEN "0000" =>  out_w <= to_complex(1.0, 0.0) ; 	-- w0
	WHEN "0001" =>	out_w <= to_complex(0.9808 , 0.1951) ;  -- w1
	WHEN "0010" =>  out_w <= to_complex(0.9239 , 0.3827) ;  -- w2
	WHEN "0011" => 	out_w <= to_complex(0.8315 , 0.5556) ;  -- w3
	WHEN "0100" =>  out_w <= to_complex(0.7071 , 0.7071) ;  -- w4
	WHEN "0101" =>	out_w <= to_complex(0.5556 , 0.8315) ;  -- w5
	WHEN "0110" =>  out_w <= to_complex(0.3827 , 0.9239) ;  -- w6
	WHEN "0111" => 	out_w <= to_complex(0.1951 , 0.9808) ;  -- w7
	WHEN "1000" =>  out_w <= to_complex(0.0 , 1.0) ;        -- w8
	WHEN "1001" =>	out_w <= to_complex(-0.1951 , 0.9808);  -- w9
	WHEN "1010" =>  out_w <= to_complex(-0.3827 , 0.9239);  -- w10
	WHEN "1011" => 	out_w <= to_complex(-0.5556 , 0.8315);  -- w11
	WHEN "1100" =>  out_w <= to_complex(-0.7071 , 1.0) ;    -- w12
	WHEN "1101" =>	out_w <= to_complex(-0.8315 , 0.5556);  -- w13
	WHEN "1110" =>  out_w <= to_complex(-0.9239 , 0.3827);  -- w14
	WHEN "1111" => 	out_w <= to_complex(-0.9808 , 0.1951);  -- w15
	WHEN Others =>  out_w <= to_complex(0.0, 0.0) ;
End Case;
End Process PO;
end RTL ;


