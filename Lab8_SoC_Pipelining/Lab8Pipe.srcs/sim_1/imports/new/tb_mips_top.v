module tb_mips_top;

    reg         clk;
    reg         rst;
    reg [31:0] gpI1;
    wire [31:0] pc_current;
    wire [31:0]  gpO1;
    wire [31:0]  gpO2;
    
    mips_top DUT (
            .clk                (clk),
            .rst                (rst),
            .gpI1               (gpI1),
            .gpI2               (gpO1),
            .pc_current         (pc_current),
            .gpO1               (gpO1),
            .gpO2               (gpO2)
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
    
    integer x = 5;
    initial begin
   // reset;
    while (x < 15) begin
    reset;
        gpI1 = x;
        while(pc_current != 32'h40) tick;
        x = x + 1;
        tick; tick; tick; tick; tick; tick; tick; tick; tick;
    end
    //tick; tick; tick; tick; tick; tick;
   $finish;
    end

endmodule