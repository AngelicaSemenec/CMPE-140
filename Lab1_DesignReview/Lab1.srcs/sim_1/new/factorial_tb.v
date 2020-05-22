module factorial_tb();

reg [31:0] tb_in;
reg tb_clk, tb_go, tb_rst;
wire [31:0] tb_out;
wire tb_done, tb_error;

reg [31:0] exp_out;
reg exp_done;

integer i, count;

CU_DP DUT(.IN(tb_in), .GO(tb_go), .RST(tb_rst), .clk(tb_clk), 
    .OUT(tb_out), .done(tb_done), .error(tb_error));
    
initial begin
    tb_rst = 0;
    i = 0;
    while (i < 16) begin
        exp_out = 1;
        tb_in = i;
        tb_go = 1;
        tick;
        
        exp_done = 0;
        while (tb_done == 0) begin
            tick;
        end
        exp_done = 1;
        count = i;
        while (count > 1) begin
            exp_out = exp_out * count;
            count = count - 1;
        end
        tick;
        i = i + 1;
    end
    $finish;
end
    
task tick;
    begin
        tb_clk = 0; #5;
        tb_clk = 1; #5;
    end
endtask

endmodule
