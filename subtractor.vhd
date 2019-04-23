-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Connor Cusi
-- Date				: 2019-03-25
-- File				: Subtractor.vhd
-- Description		: This entity is the memory storage for the  
-- 
-- Inputs			: real_a, real_b -- single bit data 
-- 					  img_a, img_b   -- single bit data 
-- Outputs			: out_real_a, out_real_b -- output real 
-- 					: out_img_a, out_img_b -- output img
-- Reset			: Rst_in
--------------------------------------------
-- Version Control   
-- 1.0 - 2019-03-25 - Intial Version 
-- 1.1 
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity subtractor is
port (
	-- Inputs
	real_a, real_b : in unsigned(7 downto 0);
	imag_a, img_b  : in unsigned(7 downto 0);
	-- Outputs
	out_real_a  : out unsigned(7 downto 0);
	out_img_a   : out unsigned(7 downto 0);
	-- Reset
	rst_in : in std_logic
);

end subtractor;

architecture rtl of subtractor is

begin

process (real_a, real_b, img_a, img_b, rst_in )

	begin
		if (rst_in <= '0') then
			out_real_a <= unsigned(real_a) - unsigned(real_b);
			out_img_a  <= unsigned(img_a) - unsigned(img_b);
		elsif (rst = '1') then 
			out_real <= "00000000"; 
			out_imag <= "00000000"; 
		end if; 
	end; 
 
end process;

