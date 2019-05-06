-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Connor Cusi
-- Date				: 2019-03-25
-- File				: Subtractor.vhd
-- Description		: This entity is the memory storage for the  
-------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;


entity subtractor is
port (
	-- Inputs
	real_a, real_b : in signed(15 downto 0);
	img_a, img_b   : in signed(15 downto 0);
	-- Outputs
	out_real_a     : out signed(15 downto 0);
	out_img_a      : out signed(15 downto 0);
	-- Reset
	rst_in : in std_logic
);

end subtractor;

architecture rtl of subtractor is

begin

process (real_a, real_b, img_a, img_b, rst_in )

	begin
		if (rst_in <= '0') then
			out_real_a <= signed(real_a) - signed(real_b);
			out_img_a  <= signed(img_a) - signed(img_b);
		elsif (rst_in = '1') then 
			out_real_a <= "0000000000000000"; 
			out_img_a  <= "0000000000000000"; 
		end if; 
	
 
end process;
end rtl;

