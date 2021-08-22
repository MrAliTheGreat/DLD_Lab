library verilog;
use verilog.vl_types.all;
entity Counter10 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        out_count       : out    vl_logic_vector(9 downto 0)
    );
end Counter10;
