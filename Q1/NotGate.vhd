-- Component: NOT Gate using structural modelling
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity NotGate is
  port (
    a : in std_logic;
    z : out std_logic
  );
end entity;

architecture struct of NotGate is
begin

  z <= not a;

end architecture;
