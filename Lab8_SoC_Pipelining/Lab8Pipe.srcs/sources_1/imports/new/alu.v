
module alu (
        input  wire        clk,
        input  wire [3:0]  op,
        input  wire [31:0] a,
        input  wire [31:0] b,
        input  wire [4:0]  c, 
        output wire        zero,
        output reg  [31:0] y
    );

    reg [31:0] HI;
    reg [31:0] LO;
    reg [63:0] HILO;
    
    assign zero = (y == 0);
    
    always @ (posedge clk) begin
       case (op)
            4'b0011: begin 
                        HILO = a * b;
                     end
       endcase
    end

    always @ (op, a, b, c) begin
        case (op)
            4'b0000: y = a & b;
            4'b0001: y = a | b;
            4'b0010: y = a + b;
            4'b0100: y = HILO[63:32];
            4'b0101: y = HILO[31:0];
            4'b0110: y = a - b;
            4'b0111: y = (a < b) ? 1 : 0;
            4'b1000: y = a;
            4'b1001: y = b << c;
            4'b1010: y = b >> c;
        endcase
    end

endmodule