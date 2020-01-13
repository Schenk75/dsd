library verilog;
use verilog.vl_types.all;
entity mux2x1 is
    port(
        dout            : out    vl_logic;
        sel             : in     vl_logic;
        din             : in     vl_logic_vector(1 downto 0)
    );
end mux2x1;
