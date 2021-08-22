library verilog;
use verilog.vl_types.all;
entity WaveGenerator is
    generic(
        max_wave        : integer := 60;
        min_wave        : integer := 10;
        square_num_clks : integer := 50;
        num_clks_rectified: integer := 203
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        func            : in     vl_logic_vector(2 downto 0);
        wave            : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of max_wave : constant is 1;
    attribute mti_svvh_generic_type of min_wave : constant is 1;
    attribute mti_svvh_generic_type of square_num_clks : constant is 1;
    attribute mti_svvh_generic_type of num_clks_rectified : constant is 1;
end WaveGenerator;
