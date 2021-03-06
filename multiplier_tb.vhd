-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Ethan Tsao
-- Date				: 2019-04-22
-- File				: multiplier_tb.vhd
-- Description		: Test bench for multiplier
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity multiplier_tb is
end multiplier_tb;
 
architecture test of multiplier_tb is 
    signal in_real_s			: signed(15 downto 0);
    signal in_imag_s			: signed(15 downto 0);
    signal w_real_s		    	: signed(15 downto 0);
    signal w_imag_s			    : signed(15 downto 0);
    signal out_real_s		    : signed(15 downto 0);
    signal out_imag_s		    : signed(15 downto 0);
    signal rst                  : std_logic; 

    begin
        multiplier_tb : entity work.multiplier(rtl) 
        port map (
            in_real  => in_real_s,
            in_imag  => in_imag_s,
            w_real   => w_real_s,
            w_imag   => w_imag_s,
            out_real => out_real_s,
            out_imag => out_imag_s,
            rst_in   => rst
        );
    
    stim_proc : process
        begin  
            wait for 20 ns;
            in_real_s       <= x"f000";
            in_imag_s       <= x"3582";
            w_real_s        <= x"A111";
            w_imag_s        <= x"57FA";
            wait for 20 ns;
        end process;
    end;

