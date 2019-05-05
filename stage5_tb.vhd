-------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Matthew Stein
-- Date				: 2019-04-22
-- File				: stage5_tb.vhd
-- Description		: Test bench for stage5. 
--                    Twiddle factors are assuemd to be accurate and included as inputs. 
-- 
-------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.in_out_matrix.all;

entity stage5_tb is
end stage5_tb;

architecture test of stage5_tb is 
  
    signal real_in_s                : in_array(0 to 31); 
    signal imag_in_s                : in_array(0 to 31); 
    signal tf_real                  : tf_array(0 to 31); 
    signal tf_imag                  : tf_array(0 to 31); 
    signal real_out                 : out_array(0 to 31); 
    signal imag_out                 : out_array(0 to 31); 
    signal rst_s                    : std_logic; 
    -- Clocks 
    signal clk_s                    : std_logic; 
    constant clock_period           : time := 10 ns; 

    begin
        stage5_tb : entity work.stage5(structural)
        port map(
            real_in => real_in_s, 
            imag_in => imag_in_s, 
            tf_real => imag_in_s, 
            tf_imag => tf_imag_s, 
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
            wait for 20 ns;
            rst_s <= '1'; 
            wait for 20 ns; 
            rst_s <= '0'; 
            wait for 20 ns; 

            -------------------------------------------------------------------------------------------
            -- NOTE TWIDDLE FACTOR INPUTS MUST REMAIN CONSTANT // THESE ARE CORRECT TWIDDLE FACTORS USED IN OPERATION 
            tf_real_s <=  ( x"7fff", x"7d8a", x"7641", x"6A6d", x"5B82", x"4721", x"30FB",
             x"18F9", x"0000", x"E707", x"CF05", x"B8E4", x"A57E", x"9593", x"89BF", x"8279");
            tf_imag_s <= ( x"0000", x"18F9", x"30FB", x"471C", x"5A82", x"6A6D", x"7641",
             x"7D8A", x"7FFF", x"7D8A", x"7641", x"6A6D", x"5A82", x"471C", x"30FB", x"18F9");
            ------------------------------------------------------------------------------------------
            real_in_s <= (x"0000",x"0001",x"0002",x"0003",x"0000",x"0001",x"0002",x"0003",
            x"0000",x"0001",x"0002",x"0003",x"0000",x"0001",x"0002",x"0003",
            x"0000",x"0001",x"0002",x"0003",x"0000",x"0001",x"0002",x"0003",
            x"0000",x"0001",x"0002",x"0003",x"0000",x"0001",x"0002",x"0003");

            imag_in_s <= (x"0000",x"0001",x"0002",x"0003",x"0000",x"0001",x"0002",x"0003",
            x"0000",x"0001",x"0002",x"0003",x"0000",x"0001",x"0002",x"0003",
            x"0000",x"0001",x"0002",x"0003",x"0000",x"0001",x"0002",x"0003",
            x"0000",x"0001",x"0002",x"0003",x"0000",x"0001",x"0002",x"0003");

            wait for 20 ns;
            
            real_in_s <= (x"0000",x"0001",x"0000",x"0001",x"0000",x"0001",x"0000",x"0001",
            x"0000",x"0001",x"0000",x"0001", x"0000",x"0001",x"0000",x"0001",
            x"0000",x"0001",x"0000",x"0001", x"0000",x"0001",x"0000",x"0001",
            x"0000",x"0001",x"0000",x"0001", x"0000",x"0001",x"0000",x"0001");

            imag_in_s <= (x"0000",x"0001",x"0000",x"0001",x"0000",x"0001",x"0000",x"0001",
            x"0000",x"0001",x"0000",x"0001", x"0000",x"0001",x"0000",x"0001",
            x"0000",x"0001",x"0000",x"0001", x"0000",x"0001",x"0000",x"0001",
            x"0000",x"0001",x"0000",x"0001", x"0000",x"0001",x"0000",x"0001");
            
            wait for 20 ns;
            rst_s <= '1'; 
            wait for 20 ns; 

            real_in_s <= (x"07ff",x"07ff",x"07ff",x"07ff",x"07ff",x"07ff",x"07ff",x"07ff",
            x"07ff",x"07ff",x"07ff",x"07ff", x"07ff",x"07ff",x"07ff",x"07ff",
            x"07ff",x"07ff",x"07ff",x"07ff", x"07ff",x"07ff",x"07ff",x"07ff",
            x"07ff",x"07ff",x"07ff",x"07ff", x"07ff",x"07ff",x"07ff",x"07ff");

            imag_in_s <= (x"07ff",x"07ff",x"07ff",x"07ff",x"07ff",x"07ff",x"07ff",x"07ff",
            x"07ff",x"07ff",x"07ff",x"07ff", x"07ff",x"07ff",x"07ff",x"07ff",
            x"07ff",x"07ff",x"07ff",x"07ff", x"07ff",x"07ff",x"07ff",x"07ff",
            x"07ff",x"07ff",x"07ff",x"07ff", x"07ff",x"07ff",x"07ff",x"07ff");
            wait for 20 ns; 
            rst_s <= '0'; 
            wait for 20 ns; 
            

        end process;


    end test;


