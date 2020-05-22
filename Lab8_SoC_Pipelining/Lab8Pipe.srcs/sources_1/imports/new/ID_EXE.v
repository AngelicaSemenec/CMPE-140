module ID_EXE(
    input wire clk,
    input wire [9:0] csD,
    input wire [31:0] rd1D,
    input wire [31:0] rd2D,
    input wire [4:0] shamtD,
    input wire [4:0] rsD,
    input wire [4:0] rtD,
    input wire [4:0] rdD,
    input wire [31:0] pc_plus4D,
    input wire [31:0] sext_immD,
    input wire flushE,
    output reg [9:0] csE,
    output reg [31:0] rd1E,
    output reg [31:0] rd2E,
    output reg [4:0] shamtE,
    output reg [4:0] rsE,
    output reg [4:0] rtE,
    output reg [4:0] rdE,
    output reg [31:0] pc_plus4E,
    output reg [31:0] sext_immE
    );
  
    always @ (posedge clk) begin
        if (flushE) begin
            csE = 0;
            rd1E = 0;
            rd2E = 0;
            shamtE = 0;
            rsE = 0;
            rtE = 0;
            rdE = 0;
            pc_plus4E = 0;
            sext_immE = 0;
        end
        else begin
            csE = csD;
            rd1E = rd1D;
            rd2E = rd2D;
            shamtE = shamtD;
            rsE = rsD;
            rtE = rtD;
            rdE = rdD;
            pc_plus4E = pc_plus4D;
            sext_immE = sext_immD;
        end
    end
    
endmodule