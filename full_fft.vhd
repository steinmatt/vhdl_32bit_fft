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

	signal stage1_real_out			: in_array(0 to 31); 
	signal stage1_imag_out			: in_array(0 to 31); 

	signal stage2_real_out			: in_array(0 to 31); 
	signal stage2_imag_out			: in_array(0 to 31); 

	signal stage3_real_out			: in_array(0 to 31); 
	signal stage3_imag_out			: in_array(0 to 31); 

	signal stage4_real_out			: in_array(0 to 31); 
	signal stage4_imag_out			: in_array(0 to 31); 

	signal stage5_real_out			: in_array(0 to 31); 
	signal stage5_imag_out			: in_array(0 to 31); 


begin

	t1 : entity work.twiddle(datapath)
		port map ( 
			twiddle_real => tf_real, 
			twiddle_iamg => tf_imag 
		);

	s1 : entity work.stage1(structural) 
		port map (	
			real_in  => real_in, 
			imag_in  => imag_in, 
			tf_real  => tf_real, 
			tf_imag  => tf_imag, 
			real_out => stage1_real_out, 
			imag_out => stage1_imag_out, 
			-- Resets 
			rst => rst, 
			clk => clk
		);

	s2 : entity work.stage2(structural) 
	port map (	
		real_in  => stage1_real_out, 
		imag_in  => stage1_imag_out, 
		tf_real  => tf_real, 
		tf_imag  => tf_imag, 
		real_out => stage2_real_out, 
		imag_out => stage2_imag_out, 
		-- Resets 
		rst => rst, 
		clk => clk
	);

	s3 : entity work.stage3(structural) 
		port map (	
			real_in  => stage2_real_out, 
			imag_in  => stage2_imag_out, 
			tf_real  => tf_real, 
			tf_imag  => tf_imag, 
			real_out => stage3_real_out, 
			imag_out => stage3_imag_out, 
			-- Resets 
			rst => rst, 
			clk => clk
		);

	s4 : entity work.stage4(structural) 
	port map (	
		real_in  => stage3_real_out, 
		imag_in  => stage3_imag_out, 
		tf_real  => tf_real, 
		tf_imag  => tf_imag, 
		real_out => stage4_real_out, 
		imag_out => stage4_imag_out, 
		-- Resets 
		rst => rst, 
		clk => clk
	);

	s5 : entity work.stage5(structural) 
	port map (	
		real_in  => stage4_real_out, 
		imag_in  => stage4_imag_out, 
		tf_real  => tf_real, 
		tf_imag  => tf_imag, 
		real_out => stage5_real_out, 
		imag_out => stage5_imag_out, 
		-- Resets 
		rst => rst, 
		clk => clk
	);

	sw1 : entity work.swapper(structural) 
	port map (	
		real_in  => stage5_real_out, 
		imag_in  => stage5_imag_out, 
		real_out => real_out, 
		imag_out => imag_out, 
		-- Resets 
		rst => rst, 
		clk => clk
	);

end structural;