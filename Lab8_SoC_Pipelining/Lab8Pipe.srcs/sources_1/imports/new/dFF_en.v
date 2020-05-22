module dFF_en # (parameter WIDTH = 32) (
        input   wire            clk,
        input   wire            en,    
        input   wire [WIDTH-1:0] d,
        output  reg  [WIDTH-1:0] q
    );
 
 initial begin
 q = 0;
 end
 
 always @(posedge clk) begin
    if (en) q <= d;
    else    q <= q;
end
endmodule 