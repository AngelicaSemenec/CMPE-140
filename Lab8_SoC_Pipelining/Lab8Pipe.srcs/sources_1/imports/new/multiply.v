module multiply 
#(parameter WIDTH = 4)(
input [WIDTH - 1:0] X, Y,
output reg [WIDTH - 1:0] Z
);

always @ (X or Y) begin
Z = X * Y;
end
endmodule