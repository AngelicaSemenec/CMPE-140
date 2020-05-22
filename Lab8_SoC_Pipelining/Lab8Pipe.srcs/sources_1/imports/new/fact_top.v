module fact_top(
    input   wire [1:0]  A,
    input   wire        WE,
    input   wire [3:0]  WD,
    input   wire        rst,
    input   wire        clk,
    output  wire [31:0] RD
    );
    
    wire WE1, WE2, go_bit, GoPulseCmb, go_pulse, done, error, ResDone, ResErr;
    wire [1:0] RdSel;
    wire [3:0] n;
    wire [31:0] N, nf, result, a, b, c, d;
    
    assign GoPulseCmb = WD[0] & WE2;
    assign N = {28'b0, n};
    assign a = {28'b0, n};
    assign b = {31'b0, go_bit};
    assign c = {30'b0, ResErr, ResDone};
    assign d = result;
    
    fact_ad fact_ad(.A(A), .WE(WE), .WE1(WE1), .WE2(WE2), .RdSel(RdSel));

    fact_reg #(4) fact_reg(.Clk(clk), .Rst(rst), .D(WD), .Load_Reg(WE1), .Q(n));
    fact_reg #1 go_reg(.Clk(clk), .Rst(rst), .D(WD[0]), .Load_Reg(WE2), .Q(go_bit));
    dFF #(1) go_pulse_FF(.clk(clk), .d(GoPulseCmb), .q(go_pulse));
    
    factorial factorial(.IN(N), .GO(go_pulse), .RST(rst), .clk(clk), .OUT(nf), .done(done), .error(error));
    
    done_reg done_reg(.clk(clk), .rst(rst), .GoPulseCmb(GoPulseCmb), .Done(done), .ResDone(ResDone));
    error_reg error_reg(.clk(clk), .rst(rst), .GoPulseCmb(GoPulseCmb), .Err(error), .ResErr(ResErr));
    fact_reg result_reg(.Clk(clk), .Rst(rst), .D(nf), .Load_Reg(done), .Q(result));
    
    mux4 #(32) rd_mux (.sel(RdSel), .a(a), .b(b), .c(c), .d(d), .y(RD));
    
endmodule
