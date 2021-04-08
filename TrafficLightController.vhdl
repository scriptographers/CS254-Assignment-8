-- TOP MODULE : TrafficLightController
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;


entity TrafficLightController is
	port(
		clk, rst : in std_logic;
		green, yellow, red: out std_logic_vector(3 downto 0)
	);
end entity;


architecture struct of TrafficLightController is

	-- 
	
begin

	-- 

end architecture;
