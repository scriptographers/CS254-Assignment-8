-- Component: XOR Gate using structural modelling
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity XorGate is
  port (
    a, b : in std_logic;
    z    : out std_logic
  );
end entity;

architecture struct of XorGate is
begin

  z <= (a xor b);

end architecture;
