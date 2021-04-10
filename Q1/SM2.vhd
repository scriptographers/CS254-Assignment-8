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

	-- Storage Element s1
	s1_storage : DFlipFlop
	port map(clk => clk, rst => rst, d => t(1), q => s(1));

	-- Storage Element s0
	s0_storage : DFlipFlop
	port map(clk => clk, rst => rst, d => t(0), q => s(0));

	-- Function delta1
	t(1) <= s(1) xor s(0);

	-- Function delta0
	t(0) <= not s(0);

	-- Function g3
	green(3) <= g and s(1) and s(0);

	-- Function g2
	green(2) <= g and s(1) and (not s(0));

	-- Function g1
	green(1) <= g and (not s(1)) and s(0);

	-- Function g0
	green(0) <= g and (not s(1)) and (not s(0));

	-- Function y3
	yellow(3) <= (not g) and s(1) and s(0);

	-- Function y2
	yellow(2) <= (not g) and s(1) and (not s(0));

	-- Function y1
	yellow(1) <= (not g) and (not s(1)) and s(0);

	-- Function y0
	yellow(0) <= (not g) and (not s(1)) and (not s(0));

	-- Function r3
	red(3) <= (not s(1)) or (not s(0));

	-- Function r2
	red(2) <= (not s(1)) or s(0);

	-- Function r1
	red(1) <= s(1) or (not s(0));

	-- Function r0
	red(0) <= s(1) or s(0);

end architecture;
