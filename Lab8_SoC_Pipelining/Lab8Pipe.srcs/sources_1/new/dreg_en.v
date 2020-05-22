module dreg_en # (parameter WIDTH = 32) (
        input  wire             clk,
        input  wire             rst,
        input  wire             stallIF,
        input  wire [WIDTH-1:0] d,
        output reg  [WIDTH-1:0] q
    );
    
    

    always @ (posedge clk, posedge rst) begin
        if (rst) q = 0;
        else if (stallIF == 0) begin
            q = d;
        end
    end
endmodule