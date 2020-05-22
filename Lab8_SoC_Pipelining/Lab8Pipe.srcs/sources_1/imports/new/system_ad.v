module system_ad(
    input   wire [27:0]  A,
    input   wire        WE,
    output  reg         WE1,
    output  reg         WE2,
    output  reg         WEM,
    output  reg [1:0]   RdSel
    );
    
always @ (*) begin
    case (A)
        //Factorial
        28'h80: begin
            WEM = 1'b0;
            WE1 = WE;
            WE2 = 1'b0;
            RdSel = 2'b10;
        end
        //GPIO
        28'h90: begin
            WEM = 1'b0;
            WE1 = 1'b0;
            WE2 = WE;
            RdSel = 2'b11;
        end
        //DMem
        default: begin
            WEM = WE;
            WE1 = 1'b0;
            WE2 = 1'b0;
            RdSel = 2'b00;
        end
        
     endcase
end
    
endmodule
