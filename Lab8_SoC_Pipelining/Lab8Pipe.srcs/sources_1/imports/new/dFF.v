module dFF # (parameter WIDTH = 32) (
        input   wire            clk,   
        input   wire [WIDTH-1:0] d,
        output  reg  [WIDTH-1:0] q
    );
    
 always @(posedge clk) begin
    q <= d;
end
endmodule 