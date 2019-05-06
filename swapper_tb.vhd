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
-- 1.1 - 2019-04-29 - Tentative Final Version
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.in_out_matrix.all;

entity swapper_tb is
end swapper_tb;

architecture test of swapper_tb is 
    signal input_array_s         : out_array(0 to 31);
    signal out_array_s           : out_array(0 to 31);

    begin
        swapper_tb : entity work.swapper(datapath)
        port map(
            input_array  => input_array_s,
            out_array => out_array_s
        );
    
    
    stim_proc : process
        begin
            wait for 20 ns;
            input_array_s <= (x"fe73",x"ef12",x"7832",x"8e11",x"3500",x"17ff",x"abfe",x"a1bc",x"57de",x"22aa",x"31bb",
            x"c8b9",x"1f0b",x"3db7",x"fbf2",x"fd1e",x"dc99",x"d877",x"d466",x"4d43",x"3d11",x"8119",x"4116",x"a339",x"cfcc",
            x"d625",x"947c",x"9c2b",x"4ca3",x"55aa",x"6932",x"42be");
            wait for 20 ns;
        end process;
    end test;


