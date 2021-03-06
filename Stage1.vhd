-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Matthew Stein 
-- Date				: 2019-03-25
-- File				: stage1.vhd
-- Description		: This entity is the overall crossing during stage one. 
-- 					  The top 16 inputs are crossed with the bottom 16. 
--------------------------------------------


library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
use ieee.std_logic_signed.all; 
use work.in_out_matrix.all; 


entity stage1 is
	port (
		-- Input Ports 
		real_in                     : in out_array (0 to 31); 
		imag_in                     : in out_array (0 to 31);
		tf_real                     : in tf_array (15 downto 0); 
		tf_imag                     : in tf_array (15 downto 0); 
		real_out                    : out out_array (0 to 31); 
		imag_out                    : out out_array (0 to 31); 
		-- Resets 
		rst  			            : in std_logic; 
		clk							: in std_logic 
	); 
end stage1;


architecture structural of stage1 is

begin

	g1: for i in 0 to 15 generate

		a1 : entity work.single_dft(structural) 
		
			port map (	
				
				real_in(0)  => real_in(i), 
				real_in(1)  => real_in(i+16), 
				imag_in(0)  => imag_in(i), 
				imag_in(1)  => imag_in(i+16), 
				tf_real     => tf_real(i), 				-- DOUBLE CHECK ORGANIZATION OF TF INPUTS 
				tf_imag     => tf_imag(i), 			-- DOUBLE CHECK ORGANIZATION OF TF INPUTS
				real_out(0) => real_out(i), 
				real_out(1) => real_out(i+16), 
				imag_out(0) => imag_out(i), 
				imag_out(1) => imag_out(i+16), 
				-- Resets 
				rst => rst, 
				clk => clk
			);
	
	end generate g1; 
end structural;
