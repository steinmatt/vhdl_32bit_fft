-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			  : Matthew Stein
-- Tested By    : Ethan Tsao
-- Date				  : 2019-03-25
-- File			   	: adder_tb.vhd
-- Description  : This entity is the testbench for adder  
--------------------------------------------
-- Version Control   
-- 1.0 - 2019-03-25 - Intial Version 
-- 1.1 - 2019-05-04 - Tentative Final Version
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

entity adder_tb is
end adder_tb;
 
architecture test of adder_tb is 

 
  signal rstin_s        : std_logic;

  signal real_a_s       : signed(15 downto 0);
  signal real_b_s       : signed(15 downto 0);
  signal img_a_s        : signed(15 downto 0);
  signal img_b_s        : signed(15 downto 0);
  signal out_real_a_s   : signed(15 downto 0);
  signal out_img_a_s    : signed(15 downto 0);
  
begin
 
  -- instantiate the unit under test (uut)
   adder_tb: entity work.adder(rtl) 
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
	
    real_a_s     <= x"9001";
    real_b_s     <= x"FF0A";
	img_a_s      <= x"A811";
    img_b_s      <= x"1BFF";
   

    wait for 10 ns;

	
	
	  wait;
    end process;

    end test;	