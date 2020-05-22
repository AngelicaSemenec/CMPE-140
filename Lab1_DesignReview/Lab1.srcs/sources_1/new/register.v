
module register #(parameter W = 4)(
input [W-1:0] D, 
input clk, load_reg,
output reg [W-1:0] Q
    );
    
always @(posedge clk)
if (load_reg == 1) begin
    Q <= D;
end
endmodule
