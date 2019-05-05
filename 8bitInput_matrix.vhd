library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

package in_out_matrix is
    
    TYPE in_array is ARRAY  (natural range <>) of signed(15 downto 0);
    TYPE tf_array is ARRAY  (natural range <>) of signed(15 downto 0);  
    TYPE out_array is ARRAY (natural range <>) of signed(15 downto 0); 

end package; 