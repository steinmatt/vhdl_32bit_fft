-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Connor Cusi
-- Date				: 2019-03-25
-- File				: subtractor_tb.vhd
-- Description		: This entity is the testbench for subtractor  
-- 
-- Inputs			: input_real_32a, input_img_32a -- single bit data 
-- 					 
-- Outputs			: output_top16, output_ 
-- 					: out_img_a, out_img_b -- output img
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


entity subtractor_tb is
end subtractor_tb;
 
architecture test of subtractor_tb is 

 
  signal rstin_s          : std_logic;

  signal real_a_s         : signed(15 downto 0);
  signal real_b_s         : signed(15 downto 0);
  signal img_a_s          : signed(15 downto 0);
  signal img_b_s          : signed(15 downto 0);
  signal out_real_a_s     : signed(15 downto 0);
  signal out_img_a_s      : signed(15 downto 0);
  
begin
 
  -- instantiate the unit under test (uut)
   subtractor_tb: entity work.subtractor(rtl) 
   port map (
     real_a   => real_a_s,
     real_b   => real_b_s,
     img_a    => img_a_s,
     img_b    => img_b_s,
     out_real_a       => out_real_a_s,
     out_img_a     => out_img_a_s,
     rst_in       => rstin_s   
   );
   -- stimulus process
  stim_proc : process
  begin   
    rstin_s <= '1';
    wait for 10 ns;

    rstin_s <= '0';
  
	  wait for 5 ns;
	
    real_a_s     <= x"9B81";
    real_b_s     <= x"FACE";
	  img_a_s      <= x"CDEA";
    img_b_s      <= x"7FED";
   

    wait for 10 ns;

	
	
	  wait;
    end process;

    end test;	