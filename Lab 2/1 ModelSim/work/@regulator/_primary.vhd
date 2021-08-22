library verilog;
use verilog.vl_types.all;
entity Regulator is
    port(
        outD_LSB        : out    vl_logic;
        FPGA_clk        : in     vl_logic;
        FPGA_rst        : in     vl_logic;
        ld_counter      : in     vl_logic;
        setPeriod       : in     vl_logic_vector(7 downto 0);
        oscillator_clk  : in     vl_logic;
        outC_LSB        : out    vl_logic;
        outB_LSB        : out    vl_logic;
        outA_LSB        : out    vl_logic;
        outD_MSB        : out    vl_logic;
        outC_MSB        : out    vl_logic;
        outB_MSB        : out    vl_logic;
        outA_MSB        : out    vl_logic;
        input_signal    : out    vl_logic;
        out_decrease    : out    vl_logic;
        out_increase    : out    vl_logic;
        out_adjustedDiv : out    vl_logic_vector(7 downto 0);
        out_duration    : out    vl_logic_vector(15 downto 0)
    );
end Regulator;
