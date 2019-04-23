--------------------------------------------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Matthew Stein
-- Date				: 2019-03-25
-- File				: adder.vhd
-- Description		: This entity is the integration of BFU, as a two 
-- 
-- Inputs			: real_a -- real part of input a  
-- 					  real_b -- real part of input b
--					  imag_a  -- img  part of input a 
--					  imag_b  -- img  part of input b 
-- Outputs			: out_real -- output of real   
-- 					: out_img  -- output of imaginary
--------------------------------------------------------------------------------
-- Version Control   
-- 1.0 - 2019-03-25 - Intial Version 
-- 1.1 - 2019-03-25 - Added a reset 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

--------------------------------------------
-- Entity 
--------------------------------------------
entity adder is
port (
	-- Input Ports 
	real_a, real_b  : in unsigned(7 downto 0);
	img_a, img_b  : in unsigned(7 downto 0);
	out_real_a        : out unsigned(7 downto 0); 
	out_img_a        : out unsigned(7 downto 0);
	-- Resets 
	rst_in  		: in std_logic 
	
	);
end adder;
	
architecture rtl of adder is

begin

process (real_a, real_b, img_a, img_b)

	begin
		if (rst_in = '0') then
			out_real_a <= unsigned(real_a) + unsigned(real_b) ; 
			out_img_a <= unsigned(img_a) + unsigned(img_b) ;
		elsif (rst_in = '1') then 
			out_real_a <= "00000000"; 
			out_img_a <= "00000000"; 
		end if; 
end process ;
end rtl ;