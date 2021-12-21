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
-- Generated on "12/21/2021 00:29:47"
                                                            
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
-- signals                                                   
SIGNAL err_ena : STD_LOGIC;
SIGNAL error_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL message_in : STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL message_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
COMPONENT Hamming_code
	PORT (
	err_ena : IN STD_LOGIC;
	error_out : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	message_in : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
	message_out : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Hamming_code
	PORT MAP (
-- list connections between master ports and signals
	err_ena => err_ena,
	error_out => error_out,
	message_in => message_in,
	message_out => message_out
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
		  message_in <= "11001100101";
		  err_ena <= '1';
		  wait for 10 ns;
		  
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
--()                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END Hamming_code_arch;
