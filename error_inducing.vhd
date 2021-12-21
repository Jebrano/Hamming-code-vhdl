library IEEE;
use IEEE.std_logic_1164.all;

entity error_inducing is
port (message_recived : in std_logic_vector (15 downto 0);
		message_sent : out std_logic_vector (15 downto 0);
		error_block_en : in std_logic);
end error_inducing;

architecture behavioral of error_inducing is

signal force_error : std_logic_vector (15 downto 0):= message_recived;

begin
err_poc :process(error_block_en, message_recived, force_error)
	begin
		force_error <= message_recived;
		if (error_block_en ='1') then
			force_error(0) <= not message_recived(0);
			--force_error(1) <= not message_recived(1);
			--force_error(2) <= not message_recived(2);
			--force_error(3) <= not message_recived(3);
			--force_error(4) <= not message_recived(4);
			--force_error(5) <= not message_recived(5);
			--force_error(6) <= not message_recived(6);
			--force_error(7) <= not message_recived(7);
			force_error(8) <= not message_recived(8);
			--force_error(9) <= not message_recived(9);
			--force_error(10) <= not message_recived(10);
			--force_error(11) <= not message_recived(11);
			--force_error(12) <= not message_recived(12);
			--force_error(13) <= not message_recived(13);
			--force_error(14) <= not message_recived(14);
			--force_error(15) <= not message_recived(15);
			message_sent <= force_error;
		else
			message_sent <= message_recived;
		end if;
	end process;

end behavioral;
