-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Matthew Stein
-- Date				: 2019-04-26
-- File				: full_fft_tb.vhd
-- Description		: Test bench for full_fft.  
-- 
-------------------------------------------



library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
use ieee.std_logic_signed.all; 
use work.in_out_matrix.all; 

entity full_fft_tb is
end full_fft_tb;

architecture test of full_fft_tb is 
  
    signal real_in_s                : out_array(0 to 31); 
    signal imag_in_s                : out_array(0 to 31); 
    signal real_out_s               : out_array(0 to 31); 
    signal imag_out_s               : out_array(0 to 31); 
    signal rst_s                    : std_logic; 
    -- Clocks 
    signal clk_s                    : std_logic; 
    constant clock_period           : time := 10 ns; 

    begin
        full_fft_tb : entity work.full_fft(structural)
        port map(
            real_in => real_in_s, 
            imag_in => imag_in_s, 
            real_out => real_out_s, 
            imag_out => imag_out_s, 
            rst => rst_s, 
            clk => clk_s
        );

    clock_process : process
        begin
            clk_s <= '0';
            wait for clock_period/2;
            clk_s <= '1';
            wait for clock_period/2;
        end process;
    
    -- Note: One clock cycle is set to 10s, and each Single DFT block takes 2 clock cycles.
    -- Recall: Inputs must be constrained to a value only using 11 bits of the input (for growth) 
            -- Thus Inputs must be less than or equal to x"07ff" 
    stim_proc : process
        begin
            rst_s <= '0'; 

            ------------------------------------------------------------------------------------------
            real_in_s <= (x"0000",x"0001",x"0002",x"0003",x"0000",x"0001",x"0002",x"0003",
            x"0000",x"0001",x"0002",x"0003",x"0000",x"0001",x"0002",x"0003",
            x"0000",x"0001",x"0002",x"0003",x"0000",x"0001",x"0002",x"0003",
            x"0000",x"0001",x"0002",x"0003",x"0000",x"0001",x"0002",x"0003");

            imag_in_s <= (x"0000",x"0001",x"0002",x"0003",x"0000",x"0001",x"0002",x"0003",
            x"0000",x"0001",x"0002",x"0003",x"0000",x"0001",x"0002",x"0003",
            x"0000",x"0001",x"0002",x"0003",x"0000",x"0001",x"0002",x"0003",
            x"0000",x"0001",x"0002",x"0003",x"0000",x"0001",x"0002",x"0003");

            wait for 200 ns;
            
            real_in_s <= (x"0000",x"0001",x"0000",x"0001",x"0000",x"0001",x"0000",x"0001",
            x"0000",x"0001",x"0000",x"0001", x"0000",x"0001",x"0000",x"0001",
            x"0000",x"0001",x"0000",x"0001", x"0000",x"0001",x"0000",x"0001",
            x"0000",x"0001",x"0000",x"0001", x"0000",x"0001",x"0000",x"0001");

            imag_in_s <= (x"0000",x"0001",x"0000",x"0001",x"0000",x"0001",x"0000",x"0001",
            x"0000",x"0001",x"0000",x"0001", x"0000",x"0001",x"0000",x"0001",
            x"0000",x"0001",x"0000",x"0001", x"0000",x"0001",x"0000",x"0001",
            x"0000",x"0001",x"0000",x"0001", x"0000",x"0001",x"0000",x"0001");
            
            wait for 200 ns;
            rst_s <= '1'; 
            wait for 200 ns; 

            real_in_s <= (x"07ff",x"07ff",x"07ff",x"07ff",x"07ff",x"07ff",x"07ff",x"07ff",
            x"07ff",x"07ff",x"07ff",x"07ff", x"07ff",x"07ff",x"07ff",x"07ff",
            x"07ff",x"07ff",x"07ff",x"07ff", x"07ff",x"07ff",x"07ff",x"07ff",
            x"07ff",x"07ff",x"07ff",x"07ff", x"07ff",x"07ff",x"07ff",x"07ff");

            imag_in_s <= (x"07ff",x"07ff",x"07ff",x"07ff",x"07ff",x"07ff",x"07ff",x"07ff",
            x"07ff",x"07ff",x"07ff",x"07ff", x"07ff",x"07ff",x"07ff",x"07ff",
            x"07ff",x"07ff",x"07ff",x"07ff", x"07ff",x"07ff",x"07ff",x"07ff",
            x"07ff",x"07ff",x"07ff",x"07ff", x"07ff",x"07ff",x"07ff",x"07ff");
            wait for 200 ns; 
            rst_s <= '0'; 
            wait for 200 ns; 

        end process;


    end test;


