module MEM_WB(
    input wire clk,
    input wire [1:0] csM,
    input wire [31:0] wa_dmM,
    input wire [31:0] rd_dmM,
    input wire [4:0] rf_waM,
    output reg [1:0] csW,
    output reg [31:0] wa_dmW,
    output reg [31:0] rd_dmW,
    output reg [4:0] rf_waW
    );
    
    always @ (posedge clk) begin
        csW = csM;
        wa_dmW = wa_dmM;
        rd_dmW = rd_dmM;
        rf_waW = rf_waM;
    end
    
endmodule
