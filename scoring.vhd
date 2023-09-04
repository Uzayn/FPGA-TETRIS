library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity scoring is
    Port (
        -- Inputs
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        line_cleared : in STD_LOGIC;
        
        -- Outputs
        score : out STD_LOGIC_VECTOR(15 downto 0)
    );
end scoring;

architecture Behavioral of scoring is
    -- Internal signals and variables
    signal game_score : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
    
    -- Scoring constants (customize as needed)
    constant single_line_score : STD_LOGIC_VECTOR(15 downto 0) := "0000000000001000";
    constant double_line_score : STD_LOGIC_VECTOR(15 downto 0) := "0000000000010000";
    constant triple_line_score : STD_LOGIC_VECTOR(15 downto 0) := "0000000000100000";
    constant tetris_score : STD_LOGIC_VECTOR(15 downto 0) := "0000000001000000";
    
begin
    process(clk, rst)
    begin
        if rst = '1' then
            -- Reset game score on reset
            game_score <= "0000000000000000";
        elsif rising_edge(clk) then
            -- Update game score based on line clears
            if line_cleared = '1' then
                case line_cleared_count is
                    when "00" => game_score <= game_score + single_line_score;
                    when "01" => game_score <= game_score + double_line_score;
                    when "10" => game_score <= game_score + triple_line_score;
                    when "11" => game_score <= game_score + tetris_score;
                    when others => null;
                end case;
            end if;
        end if;
    end process;
    
    -- Output the game score
    score <= game_score;

end Behavioral;
