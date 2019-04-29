-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Ethan Tsao
-- Date				: 2019-04-22
-- File				: swapper_tb.vhd
-- Description		: Test bench for swapper
-- 
--------------------------------------------
-- Version Control   
-- 1.0 - 2019-04-28 - Intial Version 
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity swapper_tb is
end swapper_tb;

architecture test of swapper_tb is 
    signal input_array_s         : in_array(0 to 31);
    signal out_array_s           : out_array(0 to 31);

    begin
        swapper_tb : entity work.swapper(datapath)
        port map(
            input_array  => input_array_s,
            output_array => output_array_s
        );
    
    stim_proc : process
        begin
            wait for 20 ns;
            

