-- Component: State Machine 2
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity SM2 is
	port (
		clk, rst, g        : in std_logic;
		green, yellow, red : out std_logic_vector(3 downto 0)
	);
end entity;

architecture struct of SM2 is

	signal s, t : std_logic_vector (2 downto 0);

	component DFlipFlop is
		port (
			clk, rst, d : in std_logic;
			q           : out std_logic);
	end component;

begin
end architecture;
