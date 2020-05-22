module gpio_top(
    input   wire [1:0]  A,
    input   wire        WE,
    input   wire [31:0] gpI1,
    input   wire [31:0] gpI2,
    input   wire [31:0] WD,
    input   wire        clk,   
    output  wire [31:0] gpO1,
    output  wire [31:0] gpO2,
    output  wire [31:0] RD
);

    wire WE1, WE2;
    wire [1:0] RdSel;

    gpio_ad gpio_ad(.A(A), .WE(WE), .WE1(WE1), .WE2(WE2), .RdSel(RdSel));
    
    dFF_en gpO1_FF(.clk(clk), .en(WE1), .d(WD), .q(gpO1));
    dFF_en gpO2_FF(.clk(clk), .en(WE2), .d(WD), .q(gpO2));
    
    mux4 #(32) gpio_mux(.sel(RdSel), .a(gpI1), .b(gpI2), .c(gpO1), .d(gpO2), .y(RD));
    
endmodule