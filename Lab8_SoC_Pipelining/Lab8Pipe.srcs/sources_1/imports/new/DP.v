module DP(
input wire [31:0] IN,
input wire clk, EN, load_cnt, load_reg, sel0, sel1,
output wire [31:0] OUT,
output wire GT1, GT12
);

wire [31:0] Q_count, Q_reg, Q_mux, Q_mul;

compare #(32) compare_1(.A(Q_count), .B(32'd1), .GT(GT1));
count #(32) counter(.D(IN), .load_cnt(load_cnt), .en(EN), .clk(clk), .Q(Q_count));
mux #(32) reg_mux(.A(1), .B(Q_mul), .sel(sel0), .OUT(Q_mux));
multiply #(32) multiplier(.X(Q_reg), .Y(Q_count), .Z(Q_mul));
register #(32) register0(.D(Q_mux), .clk(clk), .load_reg(load_reg), .Q(Q_reg));
buffer #(32) buff(.A(0), .B(Q_reg), .sel(sel1), .OUT(OUT));
compare #(32) compare_12(.A(IN), .B(32'd12), .GT(GT12));

endmodule
