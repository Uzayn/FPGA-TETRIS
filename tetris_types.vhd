-- tetris_types.vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package tetris_types is
    type tetromino_shape_type is array(3 downto 0, 3 downto 0) of STD_LOGIC;
end package;
