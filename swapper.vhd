-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Ethan Tsao
-- Date				: 2019-04-15
-- File				: swapper.vhd
-- Description		: Swapper used to reorder the output data stream at the end of the transform
-- 
-- Inputs			: input_array -- input array
--
-- Outputs			: output_array -- reordered output array
-- 
--------------------------------------------
-- Version Control   
-- 1.0 - 2019-04-15 - Initial version
-- 1.1 - 2019-04-22 - added array package
-- 1.2 - 2019-04-29 - Tentative Final Version
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.in_out_matrix.all;

entity swapper is 
    port(
        input_array      : in in_array(0 to 31);
        out_array        : out out_array(0 to 31)
        );
    end swapper;

architecture datapath of swapper is
    begin
        out_array(0) <= input_array(0);
        out_array(1) <= input_array(16);
        out_array(2) <= input_array(8);
        out_array(3) <= input_array(24);
        out_array(4) <= input_array(4);
        out_array(5) <= input_array(20);
        out_array(6) <= input_array(12);
        out_array(7) <= input_array(28);
        out_array(8) <= input_array(2);
        out_array(9) <= input_array(18);
        out_array(10) <= input_array(10);
        out_array(11) <= input_array(26);
        out_array(12) <= input_array(6);
        out_array(13) <= input_array(22);
        out_array(14) <= input_array(14);
        out_array(15) <= input_array(30);
        out_array(16) <= input_array(1);
        out_array(17) <= input_array(17);
        out_array(18) <= input_array(9);
        out_array(19) <= input_array(25);
        out_array(20) <= input_array(5);
        out_array(21) <= input_array(21);
        out_array(22) <= input_array(13);
        out_array(23) <= input_array(29);
        out_array(24) <= input_array(3);
        out_array(25) <= input_array(19);
        out_array(26) <= input_array(11);
        out_array(27) <= input_array(27);
        out_array(28) <= input_array(7);
        out_array(29) <= input_array(23);
        out_array(30) <= input_array(15);
        out_array(31) <= input_array(31);
end datapath;

