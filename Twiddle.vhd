-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Connor Cusi
-- Date				: 2019-05-01
-- File				: Twiddle.vhd
-- Description		: This entity is for pushing the table of twiddle values for the system  
-- 
-- Outputs			: twiddle_real table for Real  
-- 					  twiddle_img table for Imaginary 

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
use work.in_out_matrix.all;

entity Twiddle is
port (
-- Inputs

-- Outputs
twiddle_real  :out tf_array(0 to 15);
twiddle_img   :out tf_array(0 to 15)


);
end Twiddle;




architecture datapath of Twiddle is

--constant TWR0   : signed(7 downto 0) := x"7fff";
--constant TWR1   : signed(7 downto 0) := x"7d8a";
--constant TWR2   : signed(7 downto 0) := x"7641";
--constant TWR3   : signed(7 downto 0) := x"6A6d";
--constant TWR4   : signed(7 downto 0) := x"5B82";
--constant TWR5   : signed(7 downto 0) := x"4721";
--constant TWR6   : signed(7 downto 0) := x"30FB";
--constant TWR7   : signed(7 downto 0) := x"18F9";
--constant TWR8   : signed(7 downto 0) := x"0000";
--constant TWR9   : signed(7 downto 0) := x"E707";
--constant TWR10   : signed(7 downto 0) := x"CF05";
--constant TWR11   : signed(7 downto 0) := x"B8E4";
--constant TWR12   : signed(7 downto 0) := x"A57E";
--constant TWR13   : signed(7 downto 0) := x"9593";
--constant TWR14   : signed(7 downto 0) := x"89BF";
--constant TWR15   : signed(7 downto 0) := x"8279";

--RESET constant
--constant MAL	 : signed(7 downto 0) := x"0000";

--Imaginary Twiddle factors
--constant TWI0   : signed(7 downto 0) := x"0000";
--constant TWI1   : signed(7 downto 0) := x"18F9";
--constant TWI2   : signed(7 downto 0) := x"30FB";
--constant TWI3   : signed(7 downto 0) := x"471C";
--constant TWI4   : signed(7 downto 0) := x"5A82";
--constant TWI5   : signed(7 downto 0) := x"6A6D";
--constant TWI6   : signed(7 downto 0) := x"7641";
--constant TWI7   : signed(7 downto 0) := x"7D8A";
--constant TWI8   : signed(7 downto 0) := x"7FFF";
--constant TWI9   : signed(7 downto 0) := x"7D8A";
--constant TWI10  : signed(7 downto 0) := x"7641";
--constant TWI11   : signed(7 downto 0) := x"6A6D";
--constant TWI12   : signed(7 downto 0) := x"5A82";
--constant TWI13   : signed(7 downto 0) := x"471C";
--constant TWI14   : signed(7 downto 0) := x"30FB";
--constant TWI15   : signed(7 downto 0) := x"18F9";




begin
				twiddle_real <= ( x"7fff", x"7d8a", x"7641", x"6A6d", x"5B82", x"4721", x"30FB", x"18F9", x"0000", x"E707", x"CF05", x"B8E4", x"A57E", x"9593", x"89BF", x"8279") ;
				twiddle_img  <= ( x"0000", x"18F9", x"30FB", x"471C", x"5A82", x"6A6D", x"7641", x"7D8A", x"7FFF", x"7D8A", x"7641", x"6A6D", x"5A82", x"471C", x"30FB", x"18F9") ;
				
end datapath;
