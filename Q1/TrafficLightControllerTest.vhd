library ieee, std;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use ieee.numeric_std.all; -- for the signed, unsigned types and arithmetic ops

entity TrafficLightControllerTest is
end entity;

architecture tb of TrafficLightControllerTest is
	component TrafficLightController is
		port (
			clk, rst           : in std_logic;
			green, yellow, red : out std_logic_vector(3 downto 0)
		);
	end component;

	signal clk : std_logic := '1';
	signal rst : std_logic := '0';
	signal g, y, r : std_logic_vector(3 downto 0);

begin
	dut_instance : TrafficLightController
	port map(clk => clk, rst => rst, green => g, yellow => y, red => r);

	clk <= not clk after 2.5 sec;
	process
	begin
		rst <= '1';
		wait for 10 sec;

		rst <= '0';
		wait for 500 sec;

	end process;

end architecture;
