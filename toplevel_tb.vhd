library ieee;
use ieee.std_logic_1164.all;
---------------------------------------------------------------------
entity toplevel_tb is

	generic(
		DATA_WIDTH : natural := 8;
		ADDR_WIDTH : natural := 5
	);
end toplevel_tb;

architecture rtl of toplevel_tb is

	component toplevel is
	port(
		frq_in     		: in  std_logic;
		sig_b				: in std_logic;
		data_in			: in natural range 0 to 2**ADDR_WIDTH - 1;
		columps_out_t    : out std_logic_vector((DATA_WIDTH -1) downto 0);
		row_out_t      : out std_logic_vector(7 downto 0)
	);
	end component;
	signal frq_in     		:  std_logic;
	signal sig_b				: std_logic;
	signal data_in			: natural range 0 to 2**ADDR_WIDTH - 1;
	signal columps_out_t    : std_logic_vector((DATA_WIDTH -1) downto 0);
	signal row_out_t      : std_logic_vector(7 downto 0);

	begin
	IpsT1: toplevel port map (frq_in, sig_b, data_in, columps_out_t, row_out_t);                                                   
		process                                               
			 begin
			-- ТЕСТ 1
			sig_b <= '1';
			data_in <= 241;
			frq_in <= '0';
			wait for 50 ps; 			
			frq_in <= '1';
			wait for 50 ps;
			-- ТЕСТ 1
			sig_b <= '1';
			data_in <= 22;
			frq_in <= '0';
			wait for 50 ps; 			
			frq_in <= '1';
			wait for 50 ps;
		end process;
	end rtl;