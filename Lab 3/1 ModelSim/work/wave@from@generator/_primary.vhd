library verilog;
use verilog.vl_types.all;
entity waveFromGenerator is
    port(
        out_psi         : out    vl_logic;
        FPGA_clk        : in     vl_logic;
        FPGA_rst        : in     vl_logic;
        SW              : in     vl_logic_vector(12 downto 0);
        oscillator_clk  : in     vl_logic;
        ld_counter      : in     vl_logic;
        out_adjustedDiv : out    vl_logic_vector(7 downto 0);
        out_duration    : out    vl_logic_vector(15 downto 0);
        waveForm        : out    vl_logic_vector(7 downto 0);
        generator_rst   : in     vl_logic
    );
end waveFromGenerator;
