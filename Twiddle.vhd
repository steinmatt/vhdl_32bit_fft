-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Connor Cusi
-- Date				: 2019-03-25
-- File				: Twiddle.vhd
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


entity twiddle is
port (
-- Inputs
real_a, real_b, : in std_logic_vector(7 downto 0);
img_a, img_b, : in std_logic_vector(7 downto 0);

-- Outputs
twiddle_real_a  :out std_logic_vector(7 downto 0);
twiddle_img_a   :out std_logic_vector(7 downto 0);

-- Reset
rst_in : in std_logic;
)
end twiddle;

constant TWR0   : integer := x"7fff";
constant TWR1   : integer := x"7d89";
constant TWR2   : integer := x"7641";
constant TWR3   : integer := x"6a6d";
constant TWR4   : integer := x"5a82";
constant TWR5   : integer := x"471c";
constant TWR6   : integer := x"30fb";
constant TWR7   : integer := x"18f9";
constant TWR8   : integer := x"0000";
constant TWR9   : integer := x"e707";
constant TWR10   : integer := x"cf05";
constant TWR11   : integer := x"b8e4";
constant TWR12   : integer := x"a57e";
constant TWR13   : integer := x"9593";
constant TWR14   : integer := x"89bf";
constant TWR15   : integer := x"8277";

constant TWI0   : integer := x"0000";
constant TWI1   : integer := x"1859";
constant TWI2   : integer := x"30fb";
constant TWI3   : integer := x"471c";
constant TWI4   : integer := x"5a82";
constant TWI5   : integer := x"6a6d";
constant TWI6   : integer := x"7641";
constant TWI7   : integer := x"7d89";
constant TWI2   : integer := x"7fff";
constant TWI2   : integer := x"7d89";
constant TWI2   : integer := x"7641";
artitechture rtl of twiddle is

begin

	process (real_a, real_b, img_a, img_b, rst_in )

		begin
			if (rst_in <= '0') then
			out_real_a <= unsigned(real_a) - unsigned(real_b);
			out_img_a  <= unsigned(img_a)  - unsigned(img_b);
			--rborrow_out <= ((not real_a) and ( real_b or rborrow_in)) or ( real_a and rborrow_in));
			--iborrow_out <= ((not img_a) and ( img_b or iborrow_in)) or ( img_a and iborrow_in));
			
				
				
				
				

		end; 
	end;
end;
