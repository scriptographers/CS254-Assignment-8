-- Component: AND Gate using structural modelling
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity AndGate is
  port (
    a, b : in std_logic;
    z    : out std_logic
  );
end entity;

architecture struct of AndGate is
begin

  z <= (a and b);

end architecture;
