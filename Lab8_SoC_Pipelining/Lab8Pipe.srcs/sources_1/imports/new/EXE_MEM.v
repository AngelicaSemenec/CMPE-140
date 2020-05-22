module EXE_MEM(
    input wire clk,
    input wire [3:0] csE,
    input wire [31:0] alu_outE,
    input wire [31:0] wd_dmE,
    input wire [4:0] rf_waE,
    input wire [31:0] pc_plus4E,
    output reg [3:0] csM,
    output reg [31:0] alu_outM,
    output reg [31:0] wd_dmM,
    output reg [4:0] rf_waM,
    output reg [31:0] pc_plus4M
    );
    
    always @ (posedge clk) begin
        csM = csE;
        alu_outM = alu_outE;
        wd_dmM = wd_dmE;
        rf_waM = rf_waE;
        pc_plus4M = pc_plus4E;
    end
    
endmodule