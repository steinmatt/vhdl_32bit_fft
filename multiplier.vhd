-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Ethan Tsao
-- Date				: 2019-04-08
-- File				: complex_mult.vhd
-- Description		: Multiplier used to multiply input stream with twiddle factor
-- 
-- Inputs			: in_real -- real component of the input
--  				  in_imag -- imaginary component of the input
--					  w_real  -- real component of the twiddle factor
--					  w_imag  -- imaginary component of the twiddle factor
--
-- Outputs			: out_real -- real component of the output
--					  out_imag -- imaginary component of the output
--------------------------------------------
-- Version Control   
-- 1.0 - 2019-03-25 - Intial Version 
-- 1.1 - 2019-04-08 - vectors for input and output
-- 2.0 - 2019-04-22 - Multiplier Tentative Final
-- 1.1 - 2019-04-29 - Changed data types to signed
-- 1.2 - 2019-05-04 - Successfully Tested 
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

entity multiplier is
	port (
		in_real			: in signed(15 downto 0);
		in_imag			: in signed(15 downto 0);
		w_real			: in signed(15 downto 0);
		w_imag			: in signed(15 downto 0);
		out_real		: out signed(15 downto 0);
		out_imag		: out signed(15 downto 0);
		rst_in  		: in std_logic
	);
end multiplier;

architecture rtl of multiplier is

signal real_real, imag_imag, real_imag, imag_real : signed(31 downto 0);
signal temp_real, temp_imag 					  : signed(31 downto 0); 

begin
	
	mult : process(in_real, w_real, in_imag, w_imag)
	begin
		real_real <= in_real * w_real;
		imag_imag <= in_imag * w_imag;
		real_imag <= in_real * w_imag;
		imag_real <= in_imag * w_real;
	end process mult;
	
	out_stream : process(real_real, imag_imag, real_imag, imag_real)
	begin
		temp_real <= real_real - imag_imag;
		temp_imag <= real_imag + imag_real;
	end process out_stream;

	out_real <= temp_real(30 downto 15); 
	out_imag <= temp_imag(30 downto 15); 
end;