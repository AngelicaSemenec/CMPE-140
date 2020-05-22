module factorial_tb(
    );
    
    reg [1:0]  A;
    reg        WE;
    reg [3:0]  WD;
    reg        rst;
    reg        clk;
    wire [31:0] RD;
    
    fact_top DUT (
        .A (A),
        .WE (WE),
        .WD (WD),
        .rst (rst),
        .clk (clk), 
        .RD (RD)
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
    integer x = 12;
    initial begin
    while (x != 14) begin
        reset;
        A = 0;
        WD = x; 
        WE = 1;
        tick;
        A = 1;
        WD = 1;
        tick;
        A = 2;
        tick;
        while (RD != 1) begin tick; end
        A = 3;
        tick;
        x = x + 1;
    end
    $finish;
    end
    
    
endmodule
