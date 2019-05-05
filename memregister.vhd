-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Connor Cusi
-- Date				: 2019-05-01
-- File				: memregister.vhd
-- Description		: This entity is for storing and sending inputs of data slowing clock  
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
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

entity memregister is
  
  port (rst_in  : in  std_logic;   --configuration reset aka power up reset
        clk     : in  std_logic;
        dataIn  : in  signed(15 downto 0);
        dataOut : out signed(15 downto 0)
		);  
  
end memregister;

architecture rtl of memregister is
begin

  
  process(rst_in,clk)
  begin
    
    if rst_in = '1' then
		  dataOut <= x"0000";
    elsif rising_edge(clk) then
        dataOut <= dataIn;
    end if;

  end process;
  
end rtl;