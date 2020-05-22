
module count
#(parameter WIDTH = 4)(
input [WIDTH - 1:0] D, 
input load_cnt, en, clk,
output reg [WIDTH - 1:0] Q
);

always @ (posedge clk)
if (en == 1) begin
    if (load_cnt == 0) begin
        Q <= Q - 1;
    end 
    else begin
        Q <= D;
    end
end
else begin
    Q <= Q;
end
endmodule
