-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "12/24/2021 13:44:38"
                                                            
-- Vhdl Test Bench template for design  :  Hamming_code
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Hamming_code_vhd_tst IS
END Hamming_code_vhd_tst;
ARCHITECTURE Hamming_code_arch OF Hamming_code_vhd_tst IS
-- constants

   -- Clock period definitions
   constant clk_period : time := 10us;
	
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL encoder_reset : STD_LOGIC;
SIGNAL err_bit_pos : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL err_ena : STD_LOGIC;
SIGNAL error_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL message_in : STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL message_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL message_with_error : STD_LOGIC_VECTOR(15 DOWNTO 0);
COMPONENT Hamming_code
	PORT (
	clk : IN STD_LOGIC;
	encoder_reset : IN STD_LOGIC;
	err_bit_pos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	err_ena : IN STD_LOGIC;
	error_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	message_in : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
	message_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	message_with_error : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;
BEGIN
-- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	
	
	i1 : Hamming_code
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	encoder_reset => encoder_reset,
	err_bit_pos => err_bit_pos,
	err_ena => err_ena,
	error_out => error_out,
	message_in => message_in,
	message_out => message_out,
	message_with_error => message_with_error
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once
		  message_in <= "11001100101";
		  err_ena <= '1';
		  err_bit_pos <= "0001";
		  --encoder_reset <= '1';
		  wait for 10ns;
		  --	encoder_reset <= '0';
		  message_in <= "00001111001";
		  err_ena <= '1';
		  err_bit_pos <= "1100";
		  encoder_reset <= '1';
		  
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END Hamming_code_arch;
