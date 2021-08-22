library verilog;
use verilog.vl_types.all;
entity Part3_4 is
    port(
        outD_LSB        : out    vl_logic;
        ld              : in     vl_logic;
        D_MSB           : in     vl_logic;
        C_MSB           : in     vl_logic;
        B_MSB           : in     vl_logic;
        A_MSB           : in     vl_logic;
        DownUp          : in     vl_logic;
        en              : in     vl_logic;
        D_LSB           : in     vl_logic;
        C_LSB           : in     vl_logic;
        B_LSB           : in     vl_logic;
        A_LSB           : in     vl_logic;
        clk             : in     vl_logic;
        outC_LSB        : out    vl_logic;
        outB_LSB        : out    vl_logic;
        outA_LSB        : out    vl_logic;
        outD_MSB        : out    vl_logic;
        outC_MSB        : out    vl_logic;
        outB_MSB        : out    vl_logic;
        outA_MSB        : out    vl_logic;
        rippleClk_LSB   : out    vl_logic;
        outDuration     : out    vl_logic_vector(7 downto 0);
        rstDisplay      : in     vl_logic
    );
end Part3_4;
