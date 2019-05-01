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
rst_in : in std_logic
);
end twiddle;

constant TWR0   : std_logic_vector(7 downto 0) := x"7fff";
constant TWR1   : std_logic_vector(7 downto 0) := x"7d8a";
constant TWR2   : std_logic_vector(7 downto 0) := x"7641";
constant TWR3   : std_logic_vector(7 downto 0) := x"6A6d";
constant TWR4   : std_logic_vector(7 downto 0) := x"5B82";
constant TWR5   : std_logic_vector(7 downto 0) := x"4721";
constant TWR6   : std_logic_vector(7 downto 0) := x"30FB";
constant TWR7   : std_logic_vector(7 downto 0) := x"18F9";
constant TWR8   : std_logic_vector(7 downto 0) := x"0000";
constant TWR9   : std_logic_vector(7 downto 0) := x"E707";
constant TWR10   : std_logic_vector(7 downto 0) := x"CF05";
constant TWR11   : std_logic_vector(7 downto 0) := x"B8E4";
constant TWR12   : std_logic_vector(7 downto 0) := x"A57E";
constant TWR13   : std_logic_vector(7 downto 0) := x"9593";
constant TWR14   : std_logic_vector(7 downto 0) := x"89BF";
constant TWR15   : std_logic_vector(7 downto 0) := x"8279";

constant TWI0   : std_logic_vector(7 downto 0) := x"0000";
constant TWI1   : std_logic_vector(7 downto 0) := x"18F9";
constant TWI2   : std_logic_vector(7 downto 0) := x"30FB";
constant TWI3   : std_logic_vector(7 downto 0) := x"471C";
constant TWI4   : std_logic_vector(7 downto 0) := x"5A82";
constant TWI5   : std_logic_vector(7 downto 0) := x"6A6D";
constant TWI6   : std_logic_vector(7 downto 0) := x"7641";
constant TWI7   : std_logic_vector(7 downto 0) := x"7D8A";
constant TWI8   : std_logic_vector(7 downto 0) := x"7FFF";
constant TWI9   : std_logic_vector(7 downto 0) := x"7D8A";
constant TWI10   : std_logic_vector(7 downto 0) := x"7641";
constant TWI11   : std_logic_vector(7 downto 0) := x"6A6D";
constant TWI12   : std_logic_vector(7 downto 0) := x"5A82";
constant TWI13   : std_logic_vector(7 downto 0) := x"471C";
constant TWI14   : std_logic_vector(7 downto 0) := x"30FB";
constant TWI15   : std_logic_vector(7 downto 0) := x"18F9";


artitechture rtl of twiddle is

begin

	process (real_a, real_b, img_a, img_b, rst_in )

		begin
			if (rst_in <= '0') then
			out_real_a <= signed(real_a) - signed(real_b);
			out_img_a  <= signed(img_a)  - signed(img_b);
			--rborrow_out <= ((not real_a) and ( real_b or rborrow_in)) or ( real_a and rborrow_in));
			--iborrow_out <= ((not img_a) and ( img_b or iborrow_in)) or ( img_a and iborrow_in));
			
				
				
				
				

		end; 
	end process;
end;
