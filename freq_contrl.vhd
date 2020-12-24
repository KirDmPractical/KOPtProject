library ieee;
use ieee.std_logic_1164.all;

entity freq_contrl is

	generic
	(
		FREQ_IN 			: natural := 50_000_000;
		FREQ_OUT		 	: natural := 1_000_000
	);

	port(
		clk_in			: in  std_logic;
		clk_out_button : out std_logic;
		clk_out_main	: out std_logic;
		clk_out_buffer	: out std_logic;
		clk_out_rgb		: out std_logic
	);

end freq_contrl;

architecture rtl of freq_contrl is
	signal clk_reg : std_logic := '0';	
begin
	process(clk_in) is
		variable count : natural := 0;
	begin
		if (rising_edge(clk_in)) then
			if (count = ((FREQ_IN / 2) / FREQ_OUT) - 1) then
				clk_reg <= not clk_reg;
				count   := 0;
			else
				count := count + 1;
			end if;
		end if;
	end process;
	clk_out_button  <= clk_reg;
	clk_out_main	 <= clk_reg;
	clk_out_buffer	 <= clk_reg;
	clk_out_rgb		 <= clk_reg;
end rtl;