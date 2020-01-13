library verilog;
use verilog.vl_types.all;
entity Encoder8x3 is
    port(
        code            : out    vl_logic_vector(2 downto 0);
        data            : in     vl_logic_vector(7 downto 0)
    );
end Encoder8x3;
