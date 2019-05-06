-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Matthew Stein
-- Date				: 2019-04-08
-- File				: stage4.vhd
-- Description		: This entity is the overall crossing during stage two. 
-- 					  The top 16 inputs split with the bottom 16. 
--					  Of the top 16 inputs, the top 8 are crossed with the bottom 8
--					  The same occurs with the bottom 16 inputs
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use work.in_out_matrix.all; 


entity stage4 is
	port (
		-- Input Ports 
		real_in                     : in in_array (0 to 31); 
		imag_in                     : in in_array (0 to 31);
		tf_real                     : in tf_array (15 downto 0); 
		tf_imag                     : in tf_array (15 downto 0); 
		real_out                    : out out_array (0 to 31); 
		imag_out                    : out out_array (0 to 31); 
		-- Resets 
		rst  			            : in std_logic; 
		clk							: in std_logic 
	); 
end stage4;

architecture structural of stage4 is

begin

	g1: for i in 0 to 1 generate

		a1 : entity work.single_dft(structural) 
			port map (	
				real_in(0)  => real_in(i), 
				real_in(1)  => real_in(i+2), 
				imag_in(0)  => imag_in(i), 
				imag_in(1)  => imag_in(i+2), 
				tf_real     => tf_real(8*i), 
				tf_imag     => tf_imag(8*i), 
				real_out(0) => real_out(i), 
				real_out(1) => real_out(i+2), 
				imag_out(0) => imag_out(i),  
				imag_out(1) => imag_out(i+2),  
				-- Resets 
				rst => rst, 
				clk => clk
			);
	end generate g1; 
	
	g2: for i in 4 to 5 generate
		a2 : entity work.single_dft(structural) 

			port map (	
				
				real_in(0)  => real_in(i), 
				real_in(1)  => real_in(i+2), 
				imag_in(0)  => imag_in(i), 
				imag_in(1)  => imag_in(i+2), 
				tf_real     => tf_real( 8*(i-4) ), 
				tf_imag     => tf_imag( 8*(i-4) ), 
				real_out(0) => real_out(i), 
				real_out(1) => real_out(i+2), 
				imag_out(0) => imag_out(i), 
				imag_out(1) => imag_out(i+2), 
				-- Resets 
				rst => rst, 
				clk => clk
			);
	end generate g2; 
		
	g3: for i in 8 to 9 generate

		a3 : entity work.single_dft(structural) 
			port map (	
				real_in(0)  => real_in(i), 
				real_in(1)  => real_in(i+2), 
				imag_in(0)  => imag_in(i), 
				imag_in(1)  => imag_in(i+2), 
				tf_real     => tf_real( 8*(i-8) ), 
				tf_imag     => tf_imag( 8*(i-8) ), 
				real_out(0) => real_out(i), 
				real_out(1) => real_out(i+2), 
				imag_out(0) => imag_out(i),  
				imag_out(1) => imag_out(i+2),  
				-- Resets 
				rst => rst, 
				clk => clk
			);
	end generate g3; 

  g4: for i in 12 to 13 generate

		a4 : entity work.single_dft(structural) 
			port map (	
				real_in(0) => real_in(i), 
				real_in(1) => real_in(i+2), 
				imag_in(0) => imag_in(i), 
				imag_in(1) => imag_in(i+2), 
				tf_real     => tf_real( 8*(i-12) ), 
				tf_imag     => tf_imag( 8*(i-12) ), 
				real_out(0) => real_out(i), 
				real_out(1) => real_out(i+2), 
				imag_out(0) => imag_out(i),  
				imag_out(1) => imag_out(i+2),  
				-- Resets 
				rst => rst, 
				clk => clk
			);
  end generate g4; 
        
  g5: for i in 16 to 17 generate

		a5 : entity work.single_dft(structural) 
			port map (	
				real_in(0) => real_in(i), 
				real_in(1) => real_in(i+2), 
				imag_in(0) => imag_in(i), 
				imag_in(1) => imag_in(i+2), 
				tf_real     => tf_real( 8*(i-16) ), 
				tf_imag     => tf_imag( 8*(i-16) ), 
				real_out(0) => real_out(i), 
				real_out(1) => real_out(i+2), 
				imag_out(0) => imag_out(i),  
				imag_out(1) => imag_out(i+2),  
				-- Resets 
				rst => rst, 
				clk => clk
			);
  end generate g5; 
        
  g6: for i in 20 to 21 generate

		a6 : entity work.single_dft(structural) 
			port map (	
				
				real_in(0) => real_in(i), 
				real_in(1) => real_in(i+2), 
				imag_in(0) => imag_in(i), 
				imag_in(1) => imag_in(i+2), 
				tf_real     => tf_real( 8*(i-20) ), 
				tf_imag     => tf_imag( 8*(i-20)  ), 
				real_out(0) => real_out(i), 
				real_out(1) => real_out(i+2), 
				imag_out(0) => imag_out(i),  
				imag_out(1) => imag_out(i+2),  
				-- Resets 
				rst => rst, 
				clk => clk
			);
  end generate g6; 
        
  g7: for i in 24 to 25 generate

		a7 : entity work.single_dft(structural) 

			port map (	
				
				real_in(0) => real_in(i), 
				real_in(1) => real_in(i+2), 
				imag_in(0) => imag_in(i), 
				imag_in(1) => imag_in(i+2), 
				tf_real     => tf_real( 8*(i-24)  ), 
				tf_imag     => tf_imag( 8*(i-24) ), 
				real_out(0) => real_out(i), 
				real_out(1) => real_out(i+2), 
				imag_out(0) => imag_out(i),  
				imag_out(1) => imag_out(i+2),  
				-- Resets 
				rst => rst, 
				clk => clk
			);
  end generate g7; 
        
	g8: for i in 28 to 29 generate

		a8 : entity work.single_dft(structural) 
				port map (	
						
						real_in(0) => real_in(i), 
						real_in(1) => real_in(i+2), 
						imag_in(0) => imag_in(i), 
						imag_in(1) => imag_in(i+2), 
						tf_real     => tf_real( 8*(i-28) ), 
						tf_imag     => tf_imag( 8*(i-28) ), 
						real_out(0) => real_out(i), 
						real_out(1) => real_out(i+2), 
						imag_out(0) => imag_out(i),  
						imag_out(1) => imag_out(i+2),  
						-- Resets 
						rst => rst, 
						clk => clk
				);
  end generate g8; 
	
end structural; 
