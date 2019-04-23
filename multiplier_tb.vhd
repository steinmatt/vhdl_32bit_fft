-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Ethan Tsao
-- Date				: 2019-04-22
-- File				: multiplier_tb.vhd
-- Description		: Test bench for multiplier
-- 
--------------------------------------------
-- Version Control   
-- 1.0 - 2019-04-22 - Intial Version 
--------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity multiplier_tb is
end multiplier_tb;
 
architecture test of multiplier_tb is 
    signal in_real			: in std_logic_vector(7 downto 0);
    signal in_imag			: in std_logic_vector(7 downto 0);
    signal w_real			: in std_logic_vector(7 downto 0);
    signal w_imag			: in std_logic_vector(7 downto 0);
    signal out_real		    : out std_logic_vector(15 downto 0);
    signal out_imag		    : out std_logic_vector(15 downto 0)

    begin
        multiplier_tb : entity work.multiplier(rtl) 
        port map (
            in_real  => in_real_s,
            in_imag  => in_imag_s,
            w_real   => w_real_s,
            w_imag   => w_imag_s,
            out_real => out_real_s,
            out_imag => out_iamge_s
        );
    
    stim_proc : process
        begin  
            in_real_s       <= x"7E";
            in_imag_s       <= x"35";
            w_real_s        <= x"A1";
            w_imag          <= x"57";
            wait;
        end;
    end;
end;

