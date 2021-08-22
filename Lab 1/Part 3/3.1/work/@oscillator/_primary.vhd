library verilog;
use verilog.vl_types.all;
entity Oscillator is
    generic(
        num_invs        : integer := 3;
        inv_delay       : real    := 35.800000
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pulse           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of num_invs : constant is 1;
    attribute mti_svvh_generic_type of inv_delay : constant is 1;
end Oscillator;
