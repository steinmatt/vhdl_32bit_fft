-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Connor Cusi
-- Date				: 2019-05-01
-- File				: Twiddle.vhd
-- Description		: This entity is for pushing the table of twiddle values for the system  
-------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use work.in_out_matrix.all;

entity Twiddle is
	port (
		
	-- Outputs
	twiddle_real  :out tf_array(15 downto 0);
	twiddle_img   :out tf_array(15 downto 0)


	);
end Twiddle;


architecture datapath of Twiddle is

	begin
		twiddle_real <= ( x"7fff", x"7d8a", x"7641", x"6A6d", x"5B82", x"4721", x"30FB", x"18F9", x"0000", x"E707", x"CF05", x"B8E4", x"A57E", x"9593", x"89BF", x"8279") ;
		twiddle_img  <= ( x"0000", x"18F9", x"30FB", x"471C", x"5A82", x"6A6D", x"7641", x"7D8A", x"7FFF", x"7D8A", x"7641", x"6A6D", x"5A82", x"471C", x"30FB", x"18F9") ;
				
end datapath;
