module mux4 #(parameter WIDTH = 8) (
        input  wire [1:0]       sel,
        input  wire [WIDTH-1:0] a, //00
        input  wire [WIDTH-1:0] b, //01
        input  wire [WIDTH-1:0] c, //10
        input  wire [WIDTH-1:0] d, //11
        output wire [WIDTH-1:0] y
    );

assign y = sel[1] ? (sel[0] ? d : c) : (sel[0] ? b : a); 

endmodule