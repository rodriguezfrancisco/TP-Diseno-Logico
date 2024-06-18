library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decode is
    Port ( 
        input : in  STD_LOGIC_VECTOR (7 downto 0);
        out_we : out STD_LOGIC;
        regs_we : out STD_LOGIC;
        alu_op : out STD_LOGIC_VECTOR (2 downto 0);
        reg_a_we : out STD_LOGIC;
        bus_sel : out STD_LOGIC_VECTOR (1 downto 0));
end decode;

architecture Behavioral of decode is
begin
    out_we <= '1' when input = x"02" else
            '0';
    regs_we <= '1' when input = x"01" or
                        input = x"03" or
                        input = x"10" or
                        input = x"11" or
                        input = x"20" or
                        input = x"21" or
                        input = x"12" or
                        input = x"13" or
                        input = x"14" else
            '0';

    alu_op <= "010" when input = x"10" else
            "011" when input = x"11" else
            "100" when input = x"20" else
            "101" when input = x"21" else
            "110" when input = x"12" else
            "001" when input = x"13" else
            "111" when input = x"14" else 
            "000";
    
    reg_a_we <= '1' when input = x"04" or
                         input = x"05" else
            '0';
        
    bus_sel <= "10" when input = x"01" else
            "01" when input = x"05" else
            "00";
end Behavioral;
