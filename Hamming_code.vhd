library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Hamming_code is
port (message_in : in std_logic_vector (10 downto 0);
		message_out : out std_logic_vector (15 downto 0);
		err_ena : in std_logic;
		error_out : out  std_logic_vector (3 downto 0));
end Hamming_code;

architecture behavioral of Hamming_code is

component encoding is
port (Datain : in std_logic_vector (10 downto 0);
		coded_word : out std_logic_vector (15 downto 0));
end component;

component error_inducing is
port (message_recived : in std_logic_vector (15 downto 0);
		message_sent : out std_logic_vector (15 downto 0);
		error_block_en : in std_logic);
end component;

component ECC_block is
port (test_message : in std_logic_vector (15 downto 0);
		output_message : out std_logic_vector (15 downto 0);
		error_message : out std_logic_vector (3 downto 0));
end component;

signal coded_signal : std_logic_vector (15 downto 0);
signal error_signal : std_logic_vector (15 downto 0);
signal error_pos : std_logic_vector (3 downto 0);

begin 

encode : encoding port map (Datain => message_in, coded_word => coded_signal);
err : error_inducing port map (message_recived => coded_signal, message_sent => error_signal, error_block_en => err_ena);
ECC : ECC_block port map (test_message => error_signal, output_message => message_out, error_message => error_pos);

error_out <= error_pos;
end behavioral;