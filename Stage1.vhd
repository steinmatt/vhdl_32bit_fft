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
	tf_real                     : in tf_array (7 downto 0); 
	tf_imag                     : in tf_array (7 downto 0); 
	real_out                    : out out_array (0 to 31); 
	imag_out                    : out out_array (0 to 31); 
	-- Resets 
	rst  			            : in std_logic  
)
end stage1_butterfly;

architecture structure of stage1_butterfly is

begin

	g1: for i in 0 to 16 generate

		a1 : entity work.single_dft(structural) 
			generic map ( 
				tprop => 3 ns
			)
			port map (
				real_in                     
       		    imag_in                     : in in_array (0 to 1);
                tf_real                     : in std_logic_vector (7 downto 0); 
                tf_imag                     : in std_logic_vector (7 downto 0); 
                real_out                    : out out_array (0 to 1); 
                imag_out                    : out out_array (0 to 1); 
        		-- Resets 
        		rst  			            : in std_logic 

				real_in(0) <= real_in(i), 
				real_in(1) <= real_in(i+16), 
				imag_in(0) <= imag_in(i), 
				imag_in(1) <= imag_in(i+16), 
				tf_real()  <= imag_in(i), 
				tf_imag()  <= imag_in(i+16), 
				real_out(0) <= real_out(i), 
				real_out(1) <= real_out(i+16), 
				imag_out(0) <= imag_out(i) 
				imag_out(1) <= imag_out(i+16) 
				-- Resets 
				rst <= rst
			);
				
				

	
	end process
end;
