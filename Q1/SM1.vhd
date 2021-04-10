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

	signal s, t : std_logic_vector (3 downto 0) := "0000";

	component DFlipFlop is
		port (
			clk, rst, d : in std_logic;
			q           : out std_logic);
	end component;

begin

	-- Storage Element s2
	s2_storage : DFlipFlop
	port map(clk => clk, rst => rst, d => t(2), q => s(2));

	-- Storage Element s1
	s1_storage : DFlipFlop
	port map(clk => clk, rst => rst, d => t(1), q => s(1));

	-- Storage Element s0
	s0_storage : DFlipFlop
	port map(clk => clk, rst => rst, d => t(0), q => s(0));

	-- Function delta2
	t(2) <= (s(1) and s(0)) or (s(2) and not s(1));

	-- Function delta1
	t(1) <= (not s(1) and s(0)) or (not s(2) and s(1) and not s(0));

	-- Function delta0
	t(0) <= (not s(1) and not s(0)) or (not s(2) and not s(0));

	-- Function lambda1
	lane_clk <= s(2) and s(1);

	-- Function lambda2
	green <= not s(2) or not s(0);
	
end architecture;
