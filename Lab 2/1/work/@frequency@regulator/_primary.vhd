library verilog;
use verilog.vl_types.all;
entity FrequencyRegulator is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        psi             : in     vl_logic;
        setPeriod       : in     vl_logic_vector(7 downto 0);
        adjustedDiv     : out    vl_logic_vector(7 downto 0);
        out_duration    : out    vl_logic_vector(15 downto 0);
        out_increase    : out    vl_logic;
        out_decrease    : out    vl_logic
    );
end FrequencyRegulator;
