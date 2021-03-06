--------------------------------------------------------------------------------
-- Project			: ELEC562 32 BIT FFT 
-- Author			: Ethan Tsao 
-- Tested By        : Ethan Tsao
-- Date				: 2019-04-03
-- File				: single_dft.vhd
-- Description		: This entity is a single discrete butterfly operation, combining an
--                    adder, subtractor, and multiplier to perform a single stage 
--                    of butterfly operation
--------------------------------------------------------------------------------


library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
use ieee.std_logic_signed.all; 
use work.in_out_matrix.all; 
 
--------------------------------------------
-- Entity 
--------------------------------------------
entity single_dft is
    port (
        -- Input Ports 
        real_in                     : in in_array (0 to 1); 
        imag_in                     : in in_array (0 to 1);
        tf_real                     : in signed(15 downto 0); 
        tf_imag                     : in signed(15 downto 0); 
        real_out                    : out out_array (0 to 1); 
        imag_out                    : out out_array (0 to 1); 
        -- Resets 
        rst  			            : in std_logic; 
        clk                         : in std_logic         
        );
    end single_dft;
        
    architecture structural of single_dft is
 
        signal add_result_real        : signed(15 downto 0); 
        signal add_memory_real        : signed(15 downto 0); 
        signal add_result_imag        : signed(15 downto 0); 
        signal add_memory_imag        : signed(15 downto 0); 
        signal sub_result_real        : signed(15 downto 0); 
        signal sub_memory_real        : signed(15 downto 0); 
        signal mul_result_real        : signed(15 downto 0); 
       
        signal sub_result_imag        : signed(15 downto 0); 
        signal sub_memory_imag        : signed(15 downto 0); 
        signal mul_result_imag        : signed(15 downto 0);  

    begin
        -------------------------------------------------------
        -- ADDING STRUCTURE 

        add : entity work.adder(rtl)
        port map (
            real_a => real_in(0), 
            real_b => real_in(1), 
            img_a => imag_in(0), 
            img_b => imag_in(1), 
            out_real_a => add_result_real,
            out_img_a => add_result_imag, 
            -- Resets 
            rst_in => rst
        );

        add_mem1_real : entity work.memregister(rtl) 
        port map ( 
            rst_in  => rst,
            clk     => clk, 
            dataIn  => add_result_real,  
            dataOut => add_memory_real
        );

        add_mem1_imag : entity work.memregister(rtl) 
        port map ( 
            rst_in  => rst,
            clk     => clk, 
            dataIn  => add_result_imag,  
            dataOut => add_memory_imag
        );

        add_mem2_real : entity work.memregister(rtl) 
        port map ( 
            rst_in  => rst,
            clk     => clk, 
            dataIn  => add_memory_real,  
            dataOut => real_out(0)
        );

        add_mem2_imag : entity work.memregister(rtl) 
        port map ( 
            rst_in  => rst,
            clk     => clk, 
            dataIn  => add_memory_imag,  
            dataOut => imag_out(0)
        );

        -------------------------------------------------------
        -- SUBTRACTION AND MULTIPLICATION STRUCTURE 

        sub : entity work.subtractor(rtl) 
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
        port map ( 
            rst_in  => rst,
            clk     => clk, 
            dataIn  => sub_result_real,  
            dataOut => sub_memory_real
        );

        sub_mem1_imag : entity work.memregister(rtl) 
        port map ( 
            rst_in  => rst,
            clk     => clk, 
            dataIn  => sub_result_imag,  
            dataOut => sub_memory_imag
        );

        mult : entity work.multiplier(rtl) 
        port map (
            in_real => sub_memory_real, 
            w_real  => tf_real, 
            in_imag => sub_memory_imag, 
            w_imag  => tf_imag, 
            out_real => mul_result_real, 
            out_imag => mul_result_imag, 
            -- Resets 
            rst_in => rst
        );

        mult_mem2_real : entity work.memregister(rtl)
        port map ( 
            rst_in  => rst,
            clk     => clk, 
            dataIn  => mul_result_real,  
            dataOut => real_out(1)
        );

        mult_mem2_imag : entity work.memregister(rtl) 
        port map ( 
            rst_in  => rst,
            clk     => clk, 
            dataIn  => mul_result_imag,  
            dataOut => imag_out(1)
        );
                

    end structural ;