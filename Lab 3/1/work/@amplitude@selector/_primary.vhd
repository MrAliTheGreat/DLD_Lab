library verilog;
use verilog.vl_types.all;
entity AmplitudeSelector is
    port(
        sel             : in     vl_logic_vector(1 downto 0);
        wave            : in     vl_logic_vector(7 downto 0);
        final_wave      : out    vl_logic_vector(7 downto 0)
    );
end AmplitudeSelector;
