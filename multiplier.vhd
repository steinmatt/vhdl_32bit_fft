-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Ethan Tsao
-- Date				: 2019-04-08
-- File				: complex_mult.vhd
-- Description		: Multiplier used to multiply input stream with twiddle factor
-- 
-- Inputs			: sig_a -- single bit data 
-- 					  sig_b -- single bit data 
--					  in_real -- real part of the input stream
--					  in_real_carry -- carry from the real part of the input stream
--					  in_imag -- imaginary part of the input stream
--					  in_imag_carry -- carry from the imaginary part of the input stream
--					  w_real -- real component of the twiddle factor
--					  w_imag -- imaginary component of the twiddle factor
--
-- Outputs			: out_real -- real component of the output stream
--					  out_imag -- imaginary component of the output stream
--------------------------------------------
-- Version Control   
-- 1.0 - 2019-03-25 - Intial Version 
-- 1.1 - 2019-04-08 - vectors for input and output
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
<<<<<<< HEAD
=======
use.ieee.numeric_std.all;
use in_out_matrix.all; 
>>>>>>> 425820f5390c79a4cdc5f40d701f06c315ddaabf

entity multiplier is
	port (
		in_real			: in unsigned(7 downto 0);
		in_imag			: in unsigned(7 downto 0);
		w_real			: in unsigned(7 downto 0);
		w_imag			: in unsigned(7 downto 0);
		out_real		: out unsigned(15 downto 0);
		out_imag		: out unsigned(15 downto 0)
	);
end multiplier;

architecture rtl of multiplier is

signal real_real, imag_imag, real_imag, imag_real : unsigned(15 downto 0);

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
		out_real <= real_real - imag_imag;
		out_imag <= real_imag + imag_real;
	end process out_stream;
end;