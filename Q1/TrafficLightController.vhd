-- TOP MODULE : TrafficLightController
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity TrafficLightController is
	port (
		clk, rst           : in std_logic;
		green, yellow, red : out std_logic_vector(3 downto 0)
	);
end entity;

architecture struct of TrafficLightController is

	signal lane_clk : std_logic := '0';
	signal g : std_logic := '1';

	component SM1 is
		port (
			clk, rst        : in std_logic;
			lane_clk, green : out std_logic
		);
	end component;

	component SM2 is
		port (
			clk, rst, g        : in std_logic;
			green, yellow, red : out std_logic_vector(3 downto 0)
		);
	end component;

begin

	Machine1 : SM1
	port map(clk => clk, rst => rst, lane_clk => lane_clk, green => g);

	Machine2 : SM2
	port map(clk => lane_clk, rst => rst, g => g, green => green, yellow => yellow, red => red);
	
end architecture;
