-- Component: OR Gate using structural modelling
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity OrGate is
  port (
    a, b : in std_logic;
    z    : out std_logic
  );
end entity;

architecture struct of OrGate is
begin

  z <= (a or b);

end architecture;
