--------------------------------------------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: 
-- Date				: 2019-04-03
-- File				: single_dft.vhd
-- Description		: This entity is a single discrete operation, combining an
--                    adder, subtractor, and multiplier to perform a single stage 
--                    of butterfly operation
-- Inputs			: real_a   -- real a, 8 bit data 
-- 					  real_b   -- real b, 8 bit data 
--                    imag_a   -- imag a, 8 bit data 
--                    imag_b   -- imag b, 8 bit data 
--                    tf_real -- twiddle factor real input, 
--                    tf_imag -- twiddle factor imag input, 
-- Outputs			: out_c   -- real output, single bit data  
-- 					: out_d   -- imag output, single bit data 
--------------------------------------------------------------------------------
-- Version Control   
-- 1.0 - 2019-04-06 - Intial Version 
-- 1.1 - 2019-05-03 - Ready for testing
-- 1.2 - 2019-05-04 -  
--------------------------------------------------------------------------------

library ieee; 
use iee.std_logic_1164.all; 
use iee.std_logic_arith.all; 
use iee.std_logic_unsigned.all; 
use in_out_matrix.all; 
 
--------------------------------------------
-- Entity 
--------------------------------------------
entity single_dft is
    port (
        -- Input Ports 
        real_in                     : in in_array (0 to 1); 
        imag_in                     : in in_array (0 to 1);
        tf_real                     : in std_logic_vector (15 downto 0); 
        tf_imag                     : in std_logic_vector (15 downto 0); 
        real_out                    : out out_array (0 to 1); 
        imag_out                    : out out_array (0 to 1); 
        -- Resets 
        rst  			            : in std_logic; 
        clk                         : in std_logic         
        );
    end single_dft;
        
    architecture structural of single_dft is
 
        signal add_result_real        : std_logic_vector(15 downto 0); 
        signal add_memory_real        : std_logic_vector(15 downto 0); 
        signal add_result_imag        : std_logic_vector(15 downto 0); 
        signal add_memory_imag        : std_logic_vector(15 downto 0); 

        signal sub_result_real        : std_logic_vector(15 downto 0); 
        signal sub_memory_real        : std_logic_vector(15 downto 0); 
        signal mul_result_real        : std_logic_vector(15 downto 0); 
        
        signal sub_result_imag        : std_logic_vector(15 downto 0); 
        signal sub_memory_imag        : std_logic_vector(15 downto 0); 
        signal mul_result_imag        : std_logic_vector(15 downto 0);  

    begin
        -------------------------------------------------------
        -- ADDING STRUCTURE 

        add : entity work.adder(rtl) 
        generic map ( 
          tprop => 3 ns
        )
        port map (
            real_a => real_in(0), 
            real_b => real_in(1), 
            imag_a => imag_in(0), 
            imag_b => imag_in(1), 
            out_real_a => add_result_real,
            out_img_a => add_result_imag, 
            -- Resets 
            rst => rst
        );

        add_mem1_real : entity work.memregister(rtl) 
        generic map ( 
            tprop => 3 ns
        )
        port map ( 
            rst_in  => rst,
            clk     => clk, 
            dataIn  => add_result_real,  
            dataOut => add_memory_real
        );

        add_mem1_imag : entity work.memregister(rtl) 
        generic map ( 
            tprop => 3 ns
        )
        port map ( 
            rst_in  => rst,
            clk     => clk, 
            dataIn  => add_result_imag,  
            dataOut => add_memory_imag
        );

        add_mem2_real : entity work.memregister(rtl) 
        generic map ( 
            tprop => 3 ns
        )
        port map ( 
            rst_in  => rst,
            clk     => clk, 
            dataIn  => add_memory_real,  
            dataOut => real_out(0)
        );

        add_mem2_imag : entity work.memregister(rtl) 
        generic map ( 
            tprop => 3 ns
        )
        port map ( 
            rst_in  => rst,
            clk     => clk, 
            dataIn  => add_memory_imag,  
            dataOut => imag_out(0)
        );

        -------------------------------------------------------
        -- SUBTRACTION AND MULTIPLICATION STRUCTURE 

        sub : entity work.subtactor(rtl) 
        generic map ( 
          tprop => 3 ns
        )
        port map (
            real_a        => real_in(0),
            real_b        => real_in(1),
            img_a         => imag_in(0),
            img_b         => imag_in(1),
            out_real_a    => sub_result_real,
            out_img_a     => sub_result_imag,
            -- Resets
            rst_in        => rst  
        );

        sub_mem1_real : entity work.memregister(rtl) 
        generic map ( 
            tprop => 3 ns
        )
        port map ( 
            rst_in  => rst,
            clk     => clk, 
            dataIn  => sub_result_real,  
            dataOut => sub_memory_real
        );

        sub_mem1_imag : entity work.memregister(rtl) 
        generic map ( 
            tprop => 3 ns
        )
        port map ( 
            rst_in  => rst,
            clk     => clk, 
            dataIn  => sub_result_imag,  
            dataOut => sub_memory_imag
        );

        mult : entity work.multiplier(rtl) 
        generic map ( 
          tprop => 3 ns
        )
        port map (
            in_real => sub_memory_real, 
            w_real  => tf_real, 
            in_imag => sub_memory_imag, 
            w_imag  => tf_imag, 
            out_real => mul_result_real, 
            out_imag => mul_result_imag, 
            -- Resets 
            rst => rst
        );

        mult_mem2_real : entity work.memregister(rtl) 
        generic map ( 
            tprop => 3 ns
        )
        port map ( 
            rst_in  => rst,
            clk     => clk, 
            dataIn  => mul_result_real,  
            dataOut => real_out(1)
        );

        mult_mem2_imag : entity work.memregister(rtl) 
        generic map ( 
            tprop => 3 ns
        )
        port map ( 
            rst_in  => rst,
            clk     => clk, 
            dataIn  => mul_result_imag,  
            dataOut => imag_out(1)
        );
                

    end structural ;