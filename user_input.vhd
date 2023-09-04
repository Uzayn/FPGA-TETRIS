library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity user_input is
    Port (
        -- Inputs
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        buttons : in STD_LOGIC_VECTOR(2 downto 0); -- Left, Right, Rotate
        
        -- Outputs
        left : out STD_LOGIC;
        right : out STD_LOGIC;
        rotate : out STD_LOGIC;
        drop : out STD_LOGIC
    );
end user_input;

architecture Behavioral of user_input is
    -- Internal signals and variables
    signal left_button_pressed : STD_LOGIC := '0';
    signal right_button_pressed : STD_LOGIC := '0';
    signal rotate_button_pressed : STD_LOGIC := '0';
    signal drop_button_pressed : STD_LOGIC := '0';
    
begin
    process(clk, rst)
    begin
        if rst = '1' then
            -- Reset button states on reset
            left_button_pressed <= '0';
            right_button_pressed <= '0';
            rotate_button_pressed <= '0';
            drop_button_pressed <= '0';
        elsif rising_edge(clk) then
            -- Detect button presses and set corresponding signals
            if buttons(0) = '1' then
                left_button_pressed <= '1';
            else
                left_button_pressed <= '0';
            end if;
            
            if buttons(1) = '1' then
                right_button_pressed <= '1';
            else
                right_button_pressed <= '0';
            end if;
            
            if buttons(2) = '1' then
                rotate_button_pressed <= '1';
            else
                rotate_button_pressed <= '0';
            end if;
            
            -- Implement drop button logic (e.g., detect long press)
            -- Set drop_button_pressed when the drop action is triggered
            
            -- Implement debouncing logic if necessary
            
        end if;
    end process;
    
    -- Output control signals for tetromino movement
    left <= left_button_pressed;
    right <= right_button_pressed;
    rotate <= rotate_button_pressed;
    drop <= drop_button_pressed;

end Behavioral;
