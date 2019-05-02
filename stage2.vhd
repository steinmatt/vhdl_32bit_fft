-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Matthew Stein
-- Date				: 2019-03-25
-- File				: Stage2.vhd
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


entity stage2_butterfly is
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
end stage2_butterfly;

architecture structure of stage2_butterfly is

begin

	g1: for i in 0 to 7 generate

		a1 : entity work.single_dft(structural) 
			generic map ( 
				tprop => 3 ns
			)
			port map (	
				
				real_in(0) <= real_in(i), 
				real_in(1) <= real_in(i+8), 
				imag_in(0) <= imag_in(i), 
				imag_in(1) <= imag_in(i+8), 
				tf_real()  <= tf_real(i), 
				tf_imag()  <= tf_imag(i+8), 
				real_out(0) <= real_out(i), 
				real_out(1) <= real_out(i+8), 
				imag_out(0) <= imag_out(i) 
				imag_out(1) <= imag_out(i+8) 
				-- Resets 
				rst <= rst
            );
            
    g2: for i in 8 to 15 generate

        a2 : entity work.single_dft(structural) 
            generic map ( 
                tprop => 3 ns
            )
            port map (	
                
				real_in(0) <= real_in(i), 
				real_in(1) <= real_in(i+8), 
				imag_in(0) <= imag_in(i), 
				imag_in(1) <= imag_in(i+8), 
				tf_real()  <= tf_real(i), 
				tf_imag()  <= tf_imag(i+8), 
				real_out(0) <= real_out(i), 
				real_out(1) <= real_out(i+8), 
				imag_out(0) <= imag_out(i) 
				imag_out(1) <= imag_out(i+8) s
				-- Resets 
				rst <= rst
            );
	
	end process
end;
