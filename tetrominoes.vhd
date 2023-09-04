library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tetrominoes is
    Port (
        -- Inputs
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        rotate : in STD_LOGIC;
        
        -- Outputs
        tetromino_shape : out STD_LOGIC_VECTOR(3 downto 0)(3 downto 0)
    );
end tetrominoes;

architecture Behavioral of tetrominoes is
    -- Tetromino shapes (4x4 matrices)
    type tetromino_type is array(0 to 6) of STD_LOGIC_VECTOR(3 downto 0)(3 downto 0);
    constant tetromino_shapes : tetromino_type := (
        -- Square (O)
        "1111", "1111", "1111", "1111",
        -- Line (I)
        "0000", "1111", "0000", "0000",
        -- T
        "0100", "1110", "0000", "0000",
        -- L
        "1000", "1110", "0000", "0000",
        -- J
        "0010", "1110", "0000", "0000",
        -- Z
        "1100", "0110", "0000", "0000",
        -- S
        "0110", "1100", "0000", "0000"
    );
    
    -- Internal signals and variables
    signal current_shape_index : integer := 0;
    
begin
    process(clk, rst)
    begin
        if rst = '1' then
            -- Reset current shape on reset
            current_shape_index <= 0;
        elsif rising_edge(clk) then
            -- Rotate to the next shape on each rising edge of clk if rotate is '1'
            if rotate = '1' then
                current_shape_index <= (current_shape_index + 1) mod 7;
            end if;
        end if;
    end process;
    
    -- Output the current tetromino shape
    tetromino_shape <= tetromino_shapes(current_shape_index);
    
end Behavioral;
