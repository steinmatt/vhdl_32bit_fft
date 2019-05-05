library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

package in_out_matrix is
    
    TYPE in_array is ARRAY  (natural range <>) of signed(0 to 15);
    TYPE tf_array is ARRAY  (natural range <>) of signed(0 to 15);  
    TYPE out_array is ARRAY (natural range <>) of signed(0 to 15); 

end package; 