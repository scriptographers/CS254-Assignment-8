-- TOP MODULE : TrafficLightController
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- for the signed, unsigned types and arithmetic ops

entity TrafficLightController is
	port (
		clk, rst           : in std_logic;
		green, yellow, red : out std_logic_vector(3 downto 0)
	);
end entity;

architecture struct of TrafficLightController is

	signal s : integer := 0;
	signal i : integer := 1;

begin
	update_output : process (s)
	begin

		green <= "0000";
		red <= "1111";
		yellow <= "0000";

		case s is

				-- Lane 0
			when 0 =>
				green(0) <= '1';
				red(0) <= '0';

			when 1 =>
				yellow(0) <= '1';
				red(0) <= '0';

				-- Lane 1
			when 2 =>
				green(1) <= '1';
				red(1) <= '0';

			when 3 =>
				yellow(1) <= '1';
				red(1) <= '0';

				-- Lane 2
			when 4 =>
				green(2) <= '1';
				red(2) <= '0';

			when 5 =>
				yellow(2) <= '1';
				red(2) <= '0';
				-- Lane 3
			when 6 =>
				green(3) <= '1';
				red(3) <= '0';

			when 7 =>
				yellow(3) <= '1';
				red(3) <= '0';

			when others =>
				green <= "0000";
				red <= "1111";
				yellow <= "0000";

		end case;

	end process;

	main_process : process (clk)
	begin
		if (rising_edge(clk)) then

			case i is

				when 30 =>
					s <= (s + 1) mod 8;
					i <= i + 1;
				when 35 =>
					s <= (s + 1) mod 8;
					i <= 1; -- reset after 35
				when others =>
					i <= i + 1;

			end case;

		end if;
	end process;

end architecture;
