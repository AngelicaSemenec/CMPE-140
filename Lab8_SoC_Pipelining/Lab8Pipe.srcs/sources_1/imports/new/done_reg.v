module done_reg(
    input clk, rst, Done, GoPulseCmb,
    output reg ResDone
);

always @ (posedge clk, posedge rst) begin
    if (rst) ResDone <= 1'b0;
    else ResDone <= (~GoPulseCmb) & (Done | ResDone);
end

endmodule