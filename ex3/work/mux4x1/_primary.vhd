library verilog;
use verilog.vl_types.all;
entity mux4x1 is
    port(
        dout            : out    vl_logic;
        sel             : in     vl_logic_vector(1 downto 0);
        din             : in     vl_logic_vector(3 downto 0)
    );
end mux4x1;
