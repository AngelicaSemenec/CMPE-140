
module compare
#(parameter WIDTH = 4)(
input [WIDTH - 1:0] A, B,
output reg GT
);

always @ (A or B) begin
if (A > B) begin
    GT = 1;
    end
else begin
    GT = 0;
end
end
endmodule
