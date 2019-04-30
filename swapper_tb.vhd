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
            input_array_s <= (x"fe",x"ef",x"78",x"8e",x"35",x"17",x"ab",x"a1",x"57",x"22",x"31",
            x"c8",x"1f",x"3d",x"ff",x"fd",x"dc",x"d8",x"d4",x"4d",x"3d",x"89",x"46",x"a9",x"cf",
            x"d6",x"94",x"9c",x"4c",x"55",x"69",x"42",)
            wait for 20 ns;
        end process;
    end;


