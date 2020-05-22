module ad_dec_tb(
    );
    
    reg [27:0]  A;
    reg        WE;
    reg        rst;
    reg        clk;
    wire WE1, WE2, WEM;
    wire [1:0] RdSel;
    
    system_ad DUT (
        .A (A),
        .WE (WE), 
        .RdSel (RdSel),
        .WE1   (WE1),
        .WE2 (WE2),
        .WEM (WEM)
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
        A = 28'h0; 
        WE = 1;
        tick;
        WE = 1;
        A = 28'h80;
        tick;
        A = 28'h90;
        tick;
    $finish;
    end

endmodule