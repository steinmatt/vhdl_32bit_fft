-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Connor Cusi
-- Date				: 2019-05-01
-- File				: Twiddle.vhd
-- Description		: testbench for Twiddle  
-- 
-- Reset			: Rst_in
--------------------------------------------
-- Version Control   
-- 1.0 - 2019-03-25 - Intial Version 
-- 1.1 
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Twiddle_tb is
end Twiddle_tb;
 
architecture test of Twiddle_tb is 
signal twiddle_real_s         : tf_array(0 to 31);
signal twiddle_img_s          : tf_array(0 to 31);
    
    begin
        multiplier_tb : entity work.multiplier(rtl) 
        port map (
            twiddle_real  => twiddle_real_s,
            twiddle_imag  => twiddle_imag_s,
           
        );
    
    stim_proc : process
        begin  
            wait for 20 ns;
        end process;
    end;

