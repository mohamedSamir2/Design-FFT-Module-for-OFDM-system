library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity decoder2 is
 port(
 Counter_out : in STD_LOGIC_VECTOR(1 downto 0);
EN_0 : out STD_LOGIC;
EN_1 : out STD_LOGIC;
EN_2 : out STD_LOGIC;
EN_3 : out STD_LOGIC
 );
end decoder2;
architecture bhv of decoder2 is
begin
EN_0 <= not Counter_out(1) and not 	Counter_out(0);
EN_1 <= not Counter_out(1) and 		Counter_out(0);
EN_2 <= 	Counter_out(1) and not 	Counter_out(0);
EN_3 <= 	Counter_out(1) and 		Counter_out(0);
 
end bhv;