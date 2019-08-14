-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/05/2019 11:49:42"
                                                            
-- Vhdl Test Bench template for design  :  LEDMatrix
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;  
library work;
use work.machine_state_type.all;
use work.fonts.all; 

ENTITY max_TB IS
END max_TB;

ARCHITECTURE max_arch OF max_TB IS
	-- constants                                                 
	-- signals                                                   
	SIGNAL CLOCK_50 : STD_LOGIC;
	SIGNAL virt_clk : STD_LOGIC;
	SIGNAL LED_CLK : STD_LOGIC;
	SIGNAL LED_CS : STD_LOGIC;
	SIGNAL LED_DIN : STD_LOGIC;
	signal state	: machine_state_type;
	signal input           : STD_LOGIC_VECTOR(15 downto 0) := (1 =>'1', 2 => '1', 8 => '1', 9 => '1', 10 => '1', 11 => '1', others => '0');
	signal  run             : STD_LOGIC := '1';

	COMPONENT max is
		 PORT (
			  CLOCK_50        : IN STD_LOGIC;
			  input           : IN STD_LOGIC_VECTOR(15 downto 0);
			  run             : IN STD_LOGIC := '0';
			  state           : BUFFER machine_state_type := initialize;
			  virt_clk        : IN STD_LOGIC := '0';
			  CLK, DIN, CS    : OUT STD_LOGIC
		 );
	END COMPONENT;
	
	constant clk_period : time := 100 ns;
BEGIN
	vclock : entity work.virtual_clock PORT MAP (CLOCK_50 => CLOCK_50, virt_clk => virt_clk);
	
	
	i1 : max
	PORT MAP (
-- list connections between master ports and signals
		CLOCK_50 => CLOCK_50,
		input		=> input,
		run		=> run,
		virt_clk => virt_clk,
		state		=> state,
		CLK => LED_CLK,
		DIN => LED_DIN,
		CS =>  LED_CS
	);
	
	
	init : PROCESS                                               
	-- variable declarations                                    
	BEGIN                                                        
		CLOCK_50 <= '1';
			wait for clk_period/2;
		CLOCK_50 <= '0';
			wait for clk_period/2; -- code executes for every event on sensitivity list  

--		if rising_edge(virt_clk)then
--			
--		end if;
				
	END PROCESS init;  
	
	always : PROCESS                                              
	-- optional sensitivity list                                  
		-- (        )                                                 
		-- variable declarations                                      
		BEGIN                                                         
				 
		WAIT;                                                        
	END PROCESS always;                                          
END max_arch;
