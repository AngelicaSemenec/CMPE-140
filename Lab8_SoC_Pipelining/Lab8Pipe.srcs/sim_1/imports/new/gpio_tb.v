module gpio_tb(
    );
    
    reg [1:0]  A;
    reg        WE;
    reg [31:0]  WD;
    reg        rst;
    reg        clk;
    reg [31:0] gpI1, gpI2;
    wire [31:0] RD;
    wire [31:0] gpO1, gpO2;
    
    gpio_top DUT (
        .A (A),
        .WE (WE),
        .WD (WD),
        .gpI1 (gpI1),
        .gpI2 (gpI2),
        .clk (clk), 
        .RD (RD),
        .gpO1 (gpO1),
        .gpO2 (gpO2)
    );
    
    task tick; 
    begin 
        clk = 1'b0; #5;
        clk = 1'b1; #5;
    end
    endtask

    task reset;
    begin 
        rst = 1'b0; #5;
        rst = 1'b1; #5;
        rst = 1'b0;
    end
    endtask



    initial begin
        reset;
        gpI1 = 32'd6;
        A = 0;
        WD = 32'd65; 
        WE = 0;
        tick;
        WE = 1;
        A = 2;
        tick;
        WD = 32'd5;
        A = 3;
        tick;
    $finish;
    end
    
    
endmodule
