-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Connor Cusi
-- Date				: 2019-03-25
-- File				: Stage1.vhd
-- Description		: This entity is the memory storage for the  
-- 
-- Inputs			: input_real_32a, input_img_32a -- single bit data 
-- 					 
-- Outputs			: output_top16, output_ 
-- 					: out_img_a, out_img_b -- output img
-- Reset			: Rst_in
--------------------------------------------
-- Version Control   
-- 1.0 - 2019-03-25 - Intial Version 
-- 1.1 
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use in_out_matrix.all; 


entity stage1_butterfly is
port (
	-- Input Ports 
	real_in                     : in in_array (0 to 31); 
	imag_in                     : in in_array (0 to 31);
	tf_real                     : in std_logic_vector (7 downto 0); 
	tf_imag                     : in std_logic_vector (7 downto 0); 
	real_out                    : out out_array (0 to 31); 
	imag_out                    : out out_array (0 to 31); 
	-- Resets 
	rst  			            : in std_logic  
)
end stage1_butterfly;

architecture structure of stage1_butterfly is

begin

	process (real_a, real_b, img_a, img_b, rst_in )

		begin
				
				
				
				

	
	end process
end;
