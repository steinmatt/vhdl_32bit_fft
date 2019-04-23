--------------------------------------------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: 
-- Date				: 2019-04-03
-- File				: single_dft.vhd
-- Description		: This entity is a single discrete operation, combining an
--                    adder, subtractor, and multiplier to perform a single stage 
--                    of butterfly operation
-- Inputs			: real_a   -- real a, 8 bit data 
-- 					  real_b   -- real b, 8 bit data 
--                    imag_a   -- imag a, 8 bit data 
--                    imag_b   -- imag b, 8 bit data 
--                    tf_real -- twiddle factor real input, 
--                    tf_imag -- twiddle factor imag input, 
-- Outputs			: out_c   -- real output, single bit data  
-- 					: out_d   -- imag output, single bit data 
--------------------------------------------------------------------------------
-- Version Control   
-- 1.0 - 2019-04-06 - Intial Version 
-- 1.1 - 2019-04-07 - 
--------------------------------------------------------------------------------

library ieee; 
use iee.std_logic_1164.all; 
use iee.std_logic_arith.all; 
use iee.std_logic_unsiged.all; 
use in_out_matrix.all; 
 
--------------------------------------------
-- Entity 
--------------------------------------------
entity single_dft is
    port (
        -- Input Ports 
        real_in                     : in in_array (0 to 1); 
        imag_in                     : in in_array (0 to 1);
        tf_real                     : in in_array (0 to 1); 
        tf_imag                     : in in_array (0 to 1); 
        real_out                    : out out_array (0 to 3); 
        real_imag                   : out out_array (0 to 3); 
        -- Resets 
        rst  			            : in std_logic         
        );
    end single_dft;
        
    architecture structural of single_dft is
 
        signal sub_result_real        : std_logic_vector(7 downto 0); 
        signal sub_result_imag        : std_logic_vector(7 downto 0); 

    begin
    
        add : entity work.adder(rtl) 
        generic map ( 
          tprop => 3 ns
        )
        port map (
            real_a <= real_a, 
            real_b <= real_b, 
            imag_a <= imag_a, 
            imag_b <= imag_b, 
            out_real <= out_real_c, 
            out_imag <= out_imag_c, 
            -- Resets 
            rst <= rst
        );

        sub : entity work.subtactor(rtl) 
        generic map ( 
          tprop => 3 ns
        )
        port map (
            real_a <= real_a, 
            real_b <= real_b, 
            imag_a <= imag_a, 
            imag_b <= imag_b, 
            out_real <= sub_result_real, 
            out_imag <= sub_result_imag, 
            -- Resets 
            rst <= rst
        );

        sub : entity work.multiplier(rtl) 
        generic map ( 
          tprop => 3 ns
        )
        port map (
            real_a <= real_a, 
            real_b <= tf_real, 
            imag_a <= imag_a, 
            imag_b <= tf_imag, 
            out_real <= out_real_d, 
            out_imag <= out_imag_d, 
            -- Resets 
            rst <= rst
        );
                

    end structural ;