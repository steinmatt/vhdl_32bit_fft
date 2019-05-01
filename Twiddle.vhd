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
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use in_out_matrix.all;


entity twiddle is
port (
-- Inputs

-- Outputs
twiddle_real  :out tf_array(0 to 15);
twiddle_img   :out tf_array(0 to 15);

-- Reset
rst_in : in std_logic;
)
end twiddle;

constant TWR0   : signed(7 downto 0) := x"7fff";
constant TWR1   : signed(7 downto 0) := x"7d8a";
constant TWR2   : signed(7 downto 0) := x"7641";
constant TWR3   : signed(7 downto 0) := x"6A6d";
constant TWR4   : signed(7 downto 0) := x"5B82";
constant TWR5   : signed(7 downto 0) := x"4721";
constant TWR6   : signed(7 downto 0) := x"30FB";
constant TWR7   : signed(7 downto 0) := x"18F9";
constant TWR8   : signed(7 downto 0) := x"0000";
constant TWR9   : signed(7 downto 0) := x"E707";
constant TWR10   : signed(7 downto 0) := x"CF05";
constant TWR11   : signed(7 downto 0) := x"B8E4";
constant TWR12   : signed(7 downto 0) := x"A57E";
constant TWR13   : signed(7 downto 0) := x"9593";
constant TWR14   : signed(7 downto 0) := x"89BF";
constant TWR15   : signed(7 downto 0) := x"8279";

constant TWI0   : signed(7 downto 0) := x"0000";
constant TWI1   : signed(7 downto 0) := x"18F9";
constant TWI2   : signed(7 downto 0) := x"30FB";
constant TWI3   : signed(7 downto 0) := x"471C";
constant TWI4   : signed(7 downto 0) := x"5A82";
constant TWI5   : signed(7 downto 0) := x"6A6D";
constant TWI6   : signed(7 downto 0) := x"7641";
constant TWI7   : signed(7 downto 0) := x"7D8A";
constant TWI8   : signed(7 downto 0) := x"7FFF";
constant TWI9   : signed(7 downto 0) := x"7D8A";
constant TWI10   : signed(7 downto 0) := x"7641";
constant TWI11   : signed(7 downto 0) := x"6A6D";
constant TWI12   : signed(7 downto 0) := x"5A82";
constant TWI13   : signed(7 downto 0) := x"471C";
constant TWI14   : signed(7 downto 0) := x"30FB";
constant TWI15   : signed(7 downto 0) := x"18F9";


artitechture rtl of twiddle is

begin

	process (rst_in)

		begin
			if (rst_in <= '0') then
			out_real_a <= signed(real_a) - signed(real_b);
			out_img_a  <= signed(img_a)  - signed(img_b);
			--rborrow_out <= ((not real_a) and ( real_b or rborrow_in)) or ( real_a and rborrow_in));
			--iborrow_out <= ((not img_a) and ( img_b or iborrow_in)) or ( img_a and iborrow_in));
			
				
				
				
				

		end; 
	end;
end;
