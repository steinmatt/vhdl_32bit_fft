-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Matthew Stein
-- Date				: 2019-04-08
-- File				: stage5.vhd
-- Description		: This entity is the overall crossing during stage two. 
-- 					  The top 16 inputs split with the bottom 16. 
--					  Of the top 16 inputs, the top 8 are crossed with the bottom 8
--					  The same occurs with the bottom 16 inputs
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use in_out_matrix.all; 


entity stage5_butterfly is
	port (
		-- Input Ports 
		real_in                     : in in_array (0 to 31); 
		imag_in                     : in in_array (0 to 31);
		tf_real                     : in tf_array (0 to 15); 
		tf_imag                     : in tf_array (0 to 15); 
		real_out                    : out out_array (0 to 31); 
		imag_out                    : out out_array (0 to 31); 
		-- Resets 
		rst  			            : in std_logic; 
		clk							: in std_logic 
	); 
end stage5_butterfly;

architecture structural of stage5_butterfly is

    begin

        a1 : entity work.single_dft(structural) 
            generic map ( 
                tprop => 3 ns
            )
            port map (	
                
                real_in(0) <= real_in(0), 
                real_in(1) <= real_in(1), 
                imag_in(0) <= imag_in(0), 
                imag_in(1) <= imag_in(1), 
                tf_real()  <= tf_real(), 
                tf_imag()  <= tf_imag(), 
                real_out(0) <= real_out(0), 
                real_out(1) <= real_out(1), 
                imag_out(0) <= imag_out(0),  
                imag_out(1) <= imag_out(1),  
                -- Resets 
                rst <= rst, 
                clk <= clk
            );


        a2 : entity work.single_dft(structural) 
            generic map ( 
                tprop => 3 ns
            )
            port map (	
                
                real_in(0) <= real_in(2), 
                real_in(1) <= real_in(3), 
                imag_in(0) <= imag_in(2), 
                imag_in(1) <= imag_in(3), 
                tf_real()  <= tf_real(2), 
                tf_imag()  <= tf_imag(3), 
                real_out(0) <= real_out(2), 
                real_out(1) <= real_out(3), 
                imag_out(0) <= imag_out(2),  
                imag_out(1) <= imag_out(3),  
                -- Resets 
                rst <= rst, 
                clk <= clk
            );

        a3 : entity work.single_dft(structural) 
            generic map ( 
                tprop => 3 ns
            )
            port map (	
                
                real_in(0) <= real_in(4), 
                real_in(1) <= real_in(5), 
                imag_in(0) <= imag_in(4), 
                imag_in(1) <= imag_in(5), 
                tf_real()  <= tf_real(), 
                tf_imag()  <= tf_imag(), 
                real_out(0) <= real_out(4), 
                real_out(1) <= real_out(5), 
                imag_out(0) <= imag_out(4),  
                imag_out(1) <= imag_out(5),  
                -- Resets 
                rst <= rst, 
                clk <= clk
            );

        a4 : entity work.single_dft(structural) 
            generic map ( 
                tprop => 3 ns
            )
            port map (	
                
                real_in(0) <= real_in(6), 
                real_in(1) <= real_in(7), 
                imag_in(0) <= imag_in(6), 
                imag_in(1) <= imag_in(7), 
                tf_real()  <= tf_real(), 
                tf_imag()  <= tf_imag(), 
                real_out(0) <= real_out(6), 
                real_out(1) <= real_out(7), 
                imag_out(0) <= imag_out(6),  
                imag_out(1) <= imag_out(7),  
                -- Resets 
                rst <= rst, 
                clk <= clk
            );

        a5 : entity work.single_dft(structural) 
            generic map ( 
                tprop => 3 ns
            )
            port map (	
                
                real_in(0) <= real_in(8), 
                real_in(1) <= real_in(9), 
                imag_in(0) <= imag_in(8), 
                imag_in(1) <= imag_in(9), 
                tf_real()  <= tf_real(), 
                tf_imag()  <= tf_imag(), 
                real_out(0) <= real_out(8), 
                real_out(1) <= real_out(9), 
                imag_out(0) <= imag_out(8),  
                imag_out(1) <= imag_out(9),  
                -- Resets 
                rst <= rst, 
                clk <= clk
            );

        a6 : entity work.single_dft(structural) 
            generic map ( 
                tprop => 3 ns
            )
            port map (	
                
                real_in(0) <= real_in(10), 
                real_in(1) <= real_in(11), 
                imag_in(0) <= imag_in(10), 
                imag_in(1) <= imag_in(11), 
                tf_real()  <= tf_real(), 
                tf_imag()  <= tf_imag(), 
                real_out(0) <= real_out(10), 
                real_out(1) <= real_out(11), 
                imag_out(0) <= imag_out(10),  
                imag_out(1) <= imag_out(11),  
                -- Resets 
                rst <= rst, 
                clk <= clk
            );

        a7 : entity work.single_dft(structural) 
            generic map ( 
                tprop => 3 ns
            )
            port map (	
                
                real_in(0) <= real_in(12), 
                real_in(1) <= real_in(13), 
                imag_in(0) <= imag_in(12), 
                imag_in(1) <= imag_in(13), 
                tf_real()  <= tf_real(), 
                tf_imag()  <= tf_imag(), 
                real_out(0) <= real_out(12), 
                real_out(1) <= real_out(13), 
                imag_out(0) <= imag_out(12),  
                imag_out(1) <= imag_out(13),  
                -- Resets 
                rst <= rst, 
                clk <= clk
            );

            a8 : entity work.single_dft(structural) 
            generic map ( 
                tprop => 3 ns
            )
            port map (	
                
                real_in(0) <= real_in(14), 
                real_in(1) <= real_in(15), 
                imag_in(0) <= imag_in(14), 
                imag_in(1) <= imag_in(15), 
                tf_real()  <= tf_real(14), 
                tf_imag()  <= tf_imag(), 
                real_out(0) <= real_out(14), 
                real_out(1) <= real_out(15), 
                imag_out(0) <= imag_out(14),  
                imag_out(1) <= imag_out(15),  
                -- Resets 
                rst <= rst, 
                clk <= clk
            );

            a9 : entity work.single_dft(structural) 
            generic map ( 
                tprop => 3 ns
            )
            port map (	
                
                real_in(0) <= real_in(16), 
                real_in(1) <= real_in(17), 
                imag_in(0) <= imag_in(16), 
                imag_in(1) <= imag_in(17), 
                tf_real()  <= tf_real(), 
                tf_imag()  <= tf_imag(), 
                real_out(0) <= real_out(16), 
                real_out(1) <= real_out(17), 
                imag_out(0) <= imag_out(16),  
                imag_out(1) <= imag_out(17),  
                -- Resets 
                rst <= rst, 
                clk <= clk
            );

            a10 : entity work.single_dft(structural) 
            generic map ( 
                tprop => 3 ns
            )
            port map (	
                
                real_in(0) <= real_in(18), 
                real_in(1) <= real_in(19), 
                imag_in(0) <= imag_in(18), 
                imag_in(1) <= imag_in(19), 
                tf_real()  <= tf_real(), 
                tf_imag()  <= tf_imag(), 
                real_out(0) <= real_out(18), 
                real_out(1) <= real_out(19), 
                imag_out(0) <= imag_out(18),  
                imag_out(1) <= imag_out(19),  
                -- Resets 
                rst <= rst, 
                clk <= clk
            );

            a11 : entity work.single_dft(structural) 
            generic map ( 
                tprop => 3 ns
            )
            port map (	
                
                real_in(0) <= real_in(20), 
                real_in(1) <= real_in(21), 
                imag_in(0) <= imag_in(20), 
                imag_in(1) <= imag_in(21), 
                tf_real()  <= tf_real(), 
                tf_imag()  <= tf_imag(), 
                real_out(0) <= real_out(20), 
                real_out(1) <= real_out(21), 
                imag_out(0) <= imag_out(20),  
                imag_out(1) <= imag_out(21),  
                -- Resets 
                rst <= rst, 
                clk <= clk
            );

            a12 : entity work.single_dft(structural) 
            generic map ( 
                tprop => 3 ns
            )
            port map (	
                
                real_in(0) <= real_in(22), 
                real_in(1) <= real_in(23), 
                imag_in(0) <= imag_in(22), 
                imag_in(1) <= imag_in(23), 
                tf_real()  <= tf_real(), 
                tf_imag()  <= tf_imag(), 
                real_out(0) <= real_out(22), 
                real_out(1) <= real_out(23), 
                imag_out(0) <= imag_out(22),  
                imag_out(1) <= imag_out(23),  
                -- Resets 
                rst <= rst, 
                clk <= clk
            );

            a13 : entity work.single_dft(structural) 
            generic map ( 
                tprop => 3 ns
            )
            port map (	
                
                real_in(0) <= real_in(24), 
                real_in(1) <= real_in(25), 
                imag_in(0) <= imag_in(24), 
                imag_in(1) <= imag_in(25), 
                tf_real()  <= tf_real(), 
                tf_imag()  <= tf_imag(), 
                real_out(0) <= real_out(24), 
                real_out(1) <= real_out(25), 
                imag_out(0) <= imag_out(24),  
                imag_out(1) <= imag_out(25),  
                -- Resets 
                rst <= rst, 
                clk <= clk
            );

            a14 : entity work.single_dft(structural) 
            generic map ( 
                tprop => 3 ns
            )
            port map (	
                
                real_in(0) <= real_in(26), 
                real_in(1) <= real_in(27), 
                imag_in(0) <= imag_in(26), 
                imag_in(1) <= imag_in(27), 
                tf_real()  <= tf_real(), 
                tf_imag()  <= tf_imag(), 
                real_out(0) <= real_out(26), 
                real_out(1) <= real_out(27), 
                imag_out(0) <= imag_out(26),  
                imag_out(1) <= imag_out(27),  
                -- Resets 
                rst <= rst, 
                clk <= clk
            );

            a15 : entity work.single_dft(structural) 
            generic map ( 
                tprop => 3 ns
            )
            port map (	
                
                real_in(0) <= real_in(28), 
                real_in(1) <= real_in(29), 
                imag_in(0) <= imag_in(28), 
                imag_in(1) <= imag_in(29), 
                tf_real()  <= tf_real(), 
                tf_imag()  <= tf_imag(), 
                real_out(0) <= real_out(28), 
                real_out(1) <= real_out(29), 
                imag_out(0) <= imag_out(28),  
                imag_out(1) <= imag_out(29),  
                -- Resets 
                rst <= rst, 
                clk <= clk
            );

            a16 : entity work.single_dft(structural) 
            generic map ( 
                tprop => 3 ns
            )
            port map (	
                
                real_in(0) <= real_in(30), 
                real_in(1) <= real_in(31), 
                imag_in(0) <= imag_in(30), 
                imag_in(1) <= imag_in(31), 
                tf_real()  <= tf_real(), 
                tf_imag()  <= tf_imag(), 
                real_out(0) <= real_out(30), 
                real_out(1) <= real_out(31), 
                imag_out(0) <= imag_out(30),  
                imag_out(1) <= imag_out(31),  
                -- Resets 
                rst <= rst, 
                clk <= clk
            );

end structural; 
