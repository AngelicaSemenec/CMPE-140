module CU_DP(
    input [31:0] IN,
    input GO, RST, clk,
    output [31:0] OUT,
    output done, error
);

wire GT1, GT12, en, load_reg, load_cnt, sel0, sel1;

CU control_unit(.GO(GO), .GT1(GT1), .GT12(GT12), .clk(clk), .rst(RST), 
    .en(en), .load_reg(load_reg), .load_cnt(load_cnt), .sel0(sel0), .sel1(sel1),
    .done(done), .error(error));
    
DP datapath(.IN(IN), .clk(clk), .EN(en), .load_cnt(load_cnt), .load_reg(load_reg),
    .sel0(sel0), .sel1(sel1), .OUT(OUT), .GT1(GT1), .GT12(GT12));
    
endmodule
