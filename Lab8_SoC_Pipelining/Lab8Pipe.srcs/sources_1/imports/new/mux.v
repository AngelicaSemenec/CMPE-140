module mux #(parameter W = 4)(
input [W-1:0] A, B, 
input sel,
output reg [W-1:0] OUT
    );

always @ (A, B, sel)
begin
    case (sel)
        1'b0: OUT = A;
        1'b1: OUT = B;
    endcase
end
    
endmodule