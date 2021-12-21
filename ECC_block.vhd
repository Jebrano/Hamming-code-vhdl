library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity ECC_block is
port (test_message : in std_logic_vector (15 downto 0);
		output_message : out std_logic_vector (15 downto 0);
		error_message : out std_logic_vector (3 downto 0));
end ECC_block;

architecture behavioral of ECC_block is

signal p1 : std_logic;
signal p2 : std_logic;
signal p3 : std_logic;
signal p4 : std_logic;
signal double_error : std_logic;
signal error_status : std_logic_vector (3 downto 0);

begin
p1 <= test_message(1);
p2 <= test_message(2);
p3 <= test_message(4);
p4 <= test_message(8);

double_error_test:process(test_message)
	variable temp : std_logic_vector (15 downto 0);
	begin
		temp(0) := test_message(0);
		gen: for i in 1 to 15 loop
			temp(i) := temp(i-1) xor test_message(i);
			end loop;
		--for i in 1 to 15 loop
			--temp := temp xor test_message(i);
		--end loop;
		double_error <= temp(15);
	end process;

test:process(double_error, p1, p2, p3, p4, test_message, error_status)
begin

		error_status(0) <= p1 xor test_message(3) xor test_message(5) xor test_message(7) xor test_message(9) xor test_message(11) xor test_message(13) xor test_message(15);
		error_status(1) <= p2 xor test_message(3) xor test_message(6) xor test_message(7) xor test_message(10) xor test_message(11) xor test_message(14) xor test_message(15);
		error_status(2) <= p3 xor test_message(5) xor test_message(6) xor test_message(7) xor test_message(12) xor test_message(13) xor test_message(14) xor test_message(15);
		error_status(3) <= p4 xor test_message(9) xor test_message(10) xor test_message(11) xor test_message(12) xor test_message(13) xor test_message(14) xor test_message(15);


	if (double_error ='0' and error_status /= "0000") then
		error_status <= "ZZZZ";
		output_message <= x"ZZZZ";
		
	elsif (double_error = '1' and error_status /= "0000") then
		output_message(to_integer(unsigned (error_status))) <= not test_message(to_integer(unsigned (error_status)));
	else
		output_message <= test_message;
	end if;
	
	error_message <= error_status;
end process;

end behavioral;