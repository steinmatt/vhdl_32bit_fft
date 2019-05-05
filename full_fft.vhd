-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Matthew Stein 
-- Date				: 2019-03-25
-- File				: full_fft.vhd
-- Description		: This entity is the overall crossing during stage one. 
-- 					  The top 16 inputs are crossed with the bottom 16. 
--------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use in_out_matrix.all; 


entity full_fft is
	port (
		-- Input Ports 
		real_in                     : in in_array (0 to 31); 
		imag_in                     : in in_array (0 to 31);
		real_out                    : out out_array (0 to 31); 
		imag_out                    : out out_array (0 to 31); 
		-- Resets 
		rst  			            : in std_logic;  
		clk							: in std_logic 
	);
	end full_fft;

architecture structural of full_fft is

	signal tf_real 					: tf_array(0 to 15); 
	signal tf_imag 					: tf_array(0 to 15);

begin

	t1 : entity work.twiddle(datapath)
		
		port map ( 
			twiddle_real => tf_real, 
			twiddle_iamg => tf_imag 
		);

	a1 : entity work.stage1(structural) 
		
		port map (	
			real_in  => real_in, 
			imag_in  => imag_in, 
			tf_real  => tf_real, 
			tf_imag  => tf_imag, 
			real_out => real_out, 
			imag_out => imag_out, 
			-- Resets 
			rst => rst, 
			clk => clk
		);


end structural;
