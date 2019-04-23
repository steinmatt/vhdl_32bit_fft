library ieee;
use ieee.std_logic_1164.all;

library gate_lib;
use gate_lib.resources.all;

entity FFTfullsubtractor_tb is
end FFTfullsubtractor_tb;
 
architecture test of FFTfullsubtractor_tb is 

 
  signal rstin_s          : std_logic;

  signal real_a_s         : unsigned(7 downto 0);
  signal real_b_s         : unsigned(7 downto 0);
  signal img_a_s          : unsigned(7 downto 0);
  signal img_b_s          : unsigned(7 downto 0);
  signal out_real_a_s     : unsigned(7 downto 0);
  signal out_img_a_s      : unsigned(7 downto 0);
  
begin
 
  -- instantiate the unit under test (uut)
   FFTfullsubtractor_tb: entity work.FFTfullsubtractor_tb(structural) 
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

    rstin_s <= '0';
  
	wait for 5 ns;
	
    real_a_s     <= x"04";
    real_b_s     <= x"3A";
	img_a_s      <= x"08";
    img_b_s      <= x"1B";
   

    wait for 10 ns;

	
	
	wait;
    end process;

    end test;	