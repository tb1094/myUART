----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/17/2025 08:56:44 AM
-- Design Name: 
-- Module Name: SIPO - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SIPO is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           SE : in STD_LOGIC;
           SERIAL_IN : in STD_LOGIC;
           PARALLEL_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end SIPO;

architecture Behavioral of SIPO is

    signal q: STD_LOGIC_VECTOR(7 downto 0);

begin

    PARALLEL_OUT <= q;

    process (CLK)
    begin
        if rising_edge(CLK) then
            if RST = '1' then
                q <= (others => '0');
            elsif SE = '1' then
                q <= SERIAL_IN & q(7 downto 1);
            end if;
        end if;
    end process;

end Behavioral;
