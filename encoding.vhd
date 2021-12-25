library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity encoding is
port (Datain : in std_logic_vector (10 downto 0);
		coded_word : out std_logic_vector (15 downto 0);
		clk : in std_logic;
		encode_reset : in std_logic);
end encoding;

architecture behavioral of encoding is

signal p1 : std_logic;
signal p2 : std_logic;
signal p3 : std_logic;
signal p4 : std_logic;
signal p5 : std_logic;


begin
encode_process:process(Datain, clk, encode_reset)
begin
	if(encode_reset='1') then
		coded_word <= x"0000";
	elsif (encode_reset = '0') then
	
		p1 <= Datain(0) xor Datain(1) xor Datain(3) xor Datain(4) xor Datain(6) xor Datain(8) xor Datain(9);
		p2 <= Datain(0) xor Datain(2) xor Datain(3) xor Datain(5) xor Datain(6) xor Datain(9) xor Datain(10);
		p3 <= Datain(1) xor Datain(2) xor Datain(3) xor Datain(7) xor Datain(8) xor Datain(9) xor Datain(10);
		p4 <= Datain(4) xor Datain(5) xor Datain(6) xor Datain(7) xor Datain(8) xor Datain(9) xor Datain(10);
		p5 <= p1 xor p2 xor Datain(0) xor p3 xor Datain(1) xor Datain(2) xor Datain(3) xor p4 xor Datain(4) xor Datain(5) xor Datain(6) xor Datain(7) xor Datain(8) xor Datain(9) xor Datain(10);
		
		coded_word(0) <= p5;
		coded_word(1) <= p1;
		coded_word(2) <= p2;
		coded_word(3) <= Datain(0);
		coded_word(4) <= p3;
		coded_word(5) <= Datain(1);
		coded_word(6) <= Datain(2);
		coded_word(7) <= Datain(3);
		coded_word(8) <= p4;
		coded_word(9) <= Datain(4);
		coded_word(10) <= Datain(5);
		coded_word(11) <= Datain(6);
		coded_word(12) <= Datain(7);
		coded_word(13) <= Datain(8);
		coded_word(14) <= Datain(9);
		coded_word(15) <= Datain(10);
	end if;
end process;
	
end behavioral;
