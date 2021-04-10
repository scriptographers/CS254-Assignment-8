-- Component: State Machine 1
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity SM1 is
	port (
		clk, rst        : in std_logic;
		lane_clk, green : out std_logic
	);
end entity;

architecture struct of SM1 is

	component DFlipFlop is
		port (
			clk, rst, d : in std_logic;
			q           : out std_logic);
	end component;

begin
end architecture;
