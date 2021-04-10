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

	signal s, t, nots : std_logic_vector (2 downto 0);
	signal s00, s01, s10, s11, notg : std_logic;

	component DFlipFlop is
		port (
			clk, rst, d : in std_logic;
			q           : out std_logic);
	end component;

	component NotGate is
		port (
			a : in std_logic;
			z : out std_logic
		);
	end component;

	component AndGate is
		port (
			a, b : in std_logic;
			z    : out std_logic
		);
	end component;

	component OrGate is
		port (
			a, b : in std_logic;
			z    : out std_logic
		);
	end component;

	component XorGate is
		port (
			a, b : in std_logic;
			z    : out std_logic
		);
	end component;

begin

	-- Storage Element s1
	s1_storage : DFlipFlop
	port map(clk => clk, rst => rst, d => t(1), q => s(1));

	-- Storage Element s0
	s0_storage : DFlipFlop
	port map(clk => clk, rst => rst, d => t(0), q => s(0));

	-- Function delta1
	delta1 : XorGate
	port map(a => s(1), b => s(0), z => t(1));
	-- t(1) <= s(1) xor s(0);

	-- Function delta0
	delta0 : NotGate
	port map(a => s(0), z => t(0));
	-- t(0) <= not s(0);

	-- Sub-function 1
	sf1 : NotGate
	port map(a => g, z => notg);
	-- Sub-function 2
	sf2 : NotGate
	port map(a => s(1), z => nots(1));
	-- Sub-function 3
	sf3 : NotGate
	port map(a => s(0), z => nots(0));
	-- Sub-function 4
	sf4 : AndGate
	port map(a => s(1), b => s(0), z => s11);
	-- Sub-function 5
	sf5 : AndGate
	port map(a => s(1), b => nots(0), z => s10);
	-- Sub-function 6
	sf6 : AndGate
	port map(a => nots(1), b => s(0), z => s01);
	-- Sub-function 7
	sf7 : AndGate
	port map(a => nots(1), b => nots(0), z => s00);

	-- Function g3
	g3 : AndGate
	port map(a => g, b => s11, z => green(3));
	-- green(3) <= g and s(1) and s(0);

	-- Function g2
	g2 : AndGate
	port map(a => g, b => s10, z => green(2));
	-- green(2) <= g and s(1) and (not s(0));

	-- Function g1
	g1 : AndGate
	port map(a => g, b => s01, z => green(1));
	-- green(1) <= g and (not s(1)) and s(0);

	-- Function g0
	g0 : AndGate
	port map(a => g, b => s00, z => green(0));
	-- green(0) <= g and (not s(1)) and (not s(0));

	-- Function y3
	y3 : AndGate
	port map(a => notg, b => s11, z => yellow(3));
	-- yellow(3) <= (not g) and s(1) and s(0);

	-- Function y2
	y2 : AndGate
	port map(a => notg, b => s10, z => yellow(2));
	-- yellow(2) <= (not g) and s(1) and (not s(0));

	-- Function y1
	y1 : AndGate
	port map(a => notg, b => s01, z => yellow(1));
	-- yellow(1) <= (not g) and (not s(1)) and s(0);

	-- Function y0
	y0 : AndGate
	port map(a => notg, b => s00, z => yellow(0));
	-- yellow(0) <= (not g) and (not s(1)) and (not s(0));

	-- Function r3
	r3 : OrGate
	port map(a => nots(1), b => nots(0), z => red(3));
	-- red(3) <= (not s(1)) or (not s(0));

	-- Function r2
	r2 : OrGate
	port map(a => nots(1), b => s(0), z => red(2));
	-- red(2) <= (not s(1)) or s(0);

	-- Function r1
	r1 : OrGate
	port map(a => s(1), b => nots(0), z => red(1));
	-- red(1) <= s(1) or (not s(0));

	-- Function r0
	r0 : OrGate
	port map(a => s(1), b => s(0), z => red(0));
	-- red(0) <= s(1) or s(0);

end architecture;
