LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY memregister_tb IS
END memregister_tb;
ARCHITECTURE behavioral OF memregister_tb IS
 -- Component Declaration for the Unit Under Test (UUT)
 constant clk_period : time := 10 ns;
 
 COMPONENT memregister
 PORT(
	    rst_in  : in  std_logic;   --configuration reset aka power up reset
        clk     : in  std_logic;
        dataIn  : in  signed(15 downto 0);
        dataOut : out signed(15 downto 0)

 );
 
 END COMPONENT;
 --Inputs
 signal clk_s    : std_logic ;
 signal DataIn_s : signed(15 downto 0) ;
 signal rst_in_s : std_logic ;

 --Outputs
 signal DataOut_s : signed(15 downto 0) ;

BEGIN
-- Instantiate the Unit Under Test (UUT)
 uut: memregister PORT MAP (
 clk => clk_s,
 rst_in => rst_in_s,
 dataIn => DataIn_s,
 dataOut => DataOut_s
 );
 -- Stimulus process
 clock_process : process
 begin
 clk_s <= '0';
 wait for clk_period/2;
 clk_s <= '1';
 wait for clk_period/2;
 end process;
 
 stim_proc : process
begin
rst_in_s <= '1';
wait for 20 ns;
rst_in_s <= '0';
DataIn_s <= x"F1F1";
wait for 40 ns;
DataIn_s <= x"4DA1";
wait for 40 ns;
DataIn_s <= x"0DF2";
 wait for 40 ns;

 end process;
 END;