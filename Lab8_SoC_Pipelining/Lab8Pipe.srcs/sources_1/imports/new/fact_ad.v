module fact_ad(
    input   wire [1:0]  A,
    input   wire        WE,
    output  reg         WE1,
    output  reg         WE2,
    output  reg [1:0]  RdSel
    );
    
always @ (A or WE) begin
    case (A)
        2'b00: begin
            WE1 = WE;
            WE2 = 1'b0;
        end
        2'b01: begin
            WE1 = 1'b0;
            WE2 = WE;
        end
        2'b10: begin
            WE1 = 1'b0;
            WE2 = 1'b0;
        end
        2'b11: begin
            WE1 = 1'b0;
            WE2 = 1'b0;
        end
        
        default: begin
            WE1 = 1'b0;
            WE2 = 1'b0;
        end
        
     endcase
 RdSel = A;
end
      
endmodule
