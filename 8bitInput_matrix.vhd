library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package in_out_matrix is
    
    TYPE in_array is ARRAY  (natural range <>) of unsigned(7 downto 0);
    TYPE tf_array is ARRAY  (natural range <>) of unsigned(7 downto 0);  
    TYPE out_array is ARRAY (natural range <>) of unsigned(7 downto 0); 

end package; 