library verilog;
use verilog.vl_types.all;
entity Alternative is
    generic(
        Resistor1       : integer := 1;
        Resistor2       : integer := 50;
        capacitor       : integer := 10
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pulse           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Resistor1 : constant is 1;
    attribute mti_svvh_generic_type of Resistor2 : constant is 1;
    attribute mti_svvh_generic_type of capacitor : constant is 1;
end Alternative;
