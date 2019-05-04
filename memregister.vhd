library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memregister is
  
  port (rst_in  : in  std_logic;   --configuration reset aka power up reset
        clk     : in  std_logic;
        dataIn  : in  std_logic_vector (15 downto 0);
        dataOut : out std_logic_vector (15 downto 0)
		);  
  
end memregister;

architecture rtl of memregister is
begin

  
  process(rst_in,clk)
  begin
    
    if rst_in = '1' then
		  dataOut <= x"0000";
    elsif rising_edge(clk) then
        dataOut <= dataIn;
    end if;

  end process;
  
end rtl;