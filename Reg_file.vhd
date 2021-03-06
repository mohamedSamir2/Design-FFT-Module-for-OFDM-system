library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DFF is
   port(
CLK :in std_logic;     
RESET :in std_logic;  
Q1 : out std_logic_vector(23 downto 0);
Q2 : out std_logic_vector(23 downto 0);
Q3 : out std_logic_vector(23 downto 0);
Q4 : out std_logic_vector(23 downto 0); 
Q5 : out std_logic_vector(23 downto 0);
Q6 : out std_logic_vector(23 downto 0); 
Q7 : out std_logic_vector(23 downto 0);
Q8 : out std_logic_vector(23 downto 0); 
Q9 : out std_logic_vector(23 downto 0);
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
end DFF;
architecture Behavioral of DFF is  
begin 
process(CLK, RESET)
begin
if RESET ='1' then
Q1 <= (others => '0');
Q2 <= (others => '0');
Q3 <= (others => '0');
Q4 <= (others => '0');
Q5 <= (others => '0');
Q6 <= (others => '0');
Q7 <= (others => '0');
Q8 <= (others => '0');
Q9 <= (others => '0');
Q10 <= (others => '0');
Q11 <= (others => '0');
Q12 <= (others => '0');
Q13 <= (others => '0');
Q14 <= (others => '0');
Q15 <= (others => '0');
Q16 <= (others => '0');
Q17 <= (others => '0');
Q18 <= (others => '0');
Q19 <= (others => '0');
Q20 <= (others => '0');
Q21 <= (others => '0');
Q22 <= (others => '0');
Q23 <= (others => '0');
Q24 <= (others => '0');
Q25 <= (others => '0');
Q26 <= (others => '0');
Q27 <= (others => '0');
Q28 <= (others => '0');
Q29 <= (others => '0');
Q30 <= (others => '0');
Q31 <= (others => '0');
Q32 <= (others => '0');
else if ( rising_edge(CLK) ) then
Q1 <= D1;
Q2 <= D2;
Q3 <= D3;
Q4 <= D4;
Q5 <= D5;
Q6 <= D6;
Q7 <= D7;
Q8 <= D8;
Q9 <= D9;
Q10 <= D10;
Q11 <= D11;
Q12 <= D12;
Q13 <= D13;
Q14 <= D14;
Q15 <= D15;
Q16 <= D16;
Q17 <= D17;
Q18 <= D18;
Q19 <= D19;
Q20 <= D20;
Q21 <= D21;
Q22 <= D22;
Q23 <= D23;
Q24 <= D24;
Q25 <= D25;
Q26 <= D26;
Q27 <= D27;
Q28 <= D28;
Q29 <= D29;
Q30 <= D30;
Q31 <= D31;
Q32 <= D32;
end if;
end if; 
end process;  
end Behavioral;
