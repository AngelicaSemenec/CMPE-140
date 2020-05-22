module IF_ID(
    input wire clk,
    input wire [31:0] instrF,
    input wire [31:0] pc_plus4F,
    input wire stallID,
    input wire flushID,
    output reg [31:0] instrD,
    output reg [31:0] pc_plus4D
    );
    
    initial begin
        instrD = 0;
        pc_plus4D = 0;
    end
    
    always @ (posedge clk) begin
        if (stallID == 0) begin
            instrD = instrF;
            pc_plus4D = pc_plus4F;
        end
        if (flushID == 1) begin
            instrD = 0;
        end
    end
    
endmodule